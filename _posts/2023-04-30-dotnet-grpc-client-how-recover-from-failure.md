---
title: DotNet GRPC clients - How to recover from failure?
date: 2023-04-30T10:20:00+02:00
author: jonashendrickx
category: programming
thumbnail: /assets/img/posts/csharp.png
---
## Introduction

For the article we will be using the following '.proto' file to create our GRPC client. There are several ways you can recover from failure when a call to a third-party API fails, one of them being using Polly. But in this article, we will be talking about how we will be using Redis.

As the '.proto' file shows, we have some considerations to make. We will always be returning the same type 'responseModel'. But the parameters will vary. However all of request objects will inherit from the interface 'IMessage'.

{% highlight proto %}
syntax = "proto3";
import "google/protobuf/any.proto";

option csharp_namespace = "ProtoDefinitions";

package movies;

service MoviesApi {
  // Sends the show by id
  rpc GetById (IdRequest) returns (responseModel);
  // Search in the title and fullTitle of the shows
  rpc Search (SearchRequest) returns (responseModel);
  // Get all the shows in the db
  rpc GetAll (Empty) returns (responseModel);

}

message Empty {

}

// The request message containing the id of the show.
message IdRequest {
  string Id = 1;
}

// The request message containing the search text for the show.
message SearchRequest {
  string text = 1;
}


// Exception model
message moviesApiException {
  string Message = 1;
  int32 StatusCode = 2;
}

// Response model
message responseModel {
  bool success = 1;
  google.protobuf.Any data  = 2;
  repeated moviesApiException exceptions = 3;
}

// Response model for a show
message showResponse {
  string id  = 1;
  string rank  = 2;
  string title  = 3;
  string fullTitle  = 4;
  string year  = 5;
  string image  = 6;
  string crew  = 7;
  string imDbRating  = 8;
  string imDbRatingCount  = 9;
}

// Response model for a list of shows
message showListResponse {
  repeated showResponse shows = 1;
}
{% endhighlight %}

We could either choose to write our caching logic in our client class implementing the GRPC client. Or we can make our code more flexible and use 'Interceptor'. With 'Interceptor' we can quickly try swap different solutions of trying to solve our problem without sacrificing platform stability.

We will be serializing the method name and then the parameter request object to a string and concatenate them together for our interceptor.

We will need our configuration class which we will inject using the options pattern.

{% highlight csharp %}
public class ProvidedApiConfiguration
    {
        public const string Root = "Providedapi";

        public string ApiKey { get; set; } = string.Empty;
        public string BaseUrl { get; set; } = string.Empty;
    }
{% endhighlight %}

Our interface for our GRPC client.

{% highlight csharp %}
using System.Threading.Tasks;
using ProtoDefinitions;

namespace ApiApplication.ProvidedApiClient
{
    public interface IApiClientGrpc
    {
        Task<showListResponse> GetAll();
        showResponse GetById(string id);
    }
}
{% endhighlight %}

And its implementation. Note how light this code is.

{% highlight csharp %}
using System;
using System.Threading.Tasks;
using ProtoDefinitions;

namespace ApiApplication.ProvidedApiClient
{
    public class ApiClientGrpc : IApiClientGrpc
    {
        private readonly MoviesApi.MoviesApiClient _apiClient;

        public ApiClientGrpc(MoviesApi.MoviesApiClient apiClient)
        {
            _apiClient = apiClient ?? throw new ArgumentNullException(nameof(apiClient));
        }
        
        public async Task<showListResponse> GetAll()
        {
            var all = await _apiClient.GetAllAsync(new Empty());
            all.Data.TryUnpack<showListResponse>(out var data);
            return data;
        }
        
        public showResponse GetById(string id)
        {
            var all = _apiClient.GetById(new IdRequest{Id = id});
            all.Data.TryUnpack<showResponse>(out var data);
            return data;
        }
    }
}
{% endhighlight %}

Now that we have our implementation. Let's go bootstrap this into our dependency injection container. Generally, I like to split this in a separate class or extension method. So it's easier to identify what belongs together and swap in or out with something else. Otherwise your 'Program.cs' or 'Startup.cs' could become a nightmare to manage.

We are adding all our services as a singleton, because they don't really need to maintain relevant a state. If you want to know more about the IHttpClientFactory pattern, check the Microsoft documentation. We are similarly wiring up our GrpcClient using the 'named' strategy.

You always want to set the base url here too, to avoid having to copy paste it all over your client implementation.

In the 'AddCallCredentials' extension method, you can see an example how we're injecting an API key from our options pattern.

And last but not least, we're adding our 'ResiliencyInterceptor', note that you'll also need to set a scope in the 'IServiceCollection'.

{% highlight csharp %}
using System;
using System.Net.Http;
using System.Threading.Tasks;
using Grpc.Net.Client;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using ProtoDefinitions;

namespace ApiApplication.ProvidedApiClient
{
    public static class ProvidedApiClientBootstrap
    {
        public static void AddProvidedApiClient(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddSingleton<IApiClientGrpc, ApiClientGrpc>();
            services.AddSingleton<ResiliencyInterceptor>();
            var providedApiConfiguration = configuration.GetSection(ProvidedApiConfiguration.Root);
            services.Configure<ProvidedApiConfiguration>(providedApiConfiguration);
            services.AddGrpcClient<MoviesApi.MoviesApiClient>("MoviesApi", o =>
                {
                    var sp = services.BuildServiceProvider();
                    var cfg = sp.GetRequiredService<IOptionsMonitor<ProvidedApiConfiguration>>();
                    o.Address = new Uri(cfg.CurrentValue.BaseUrl);
                })
                .ConfigurePrimaryHttpMessageHandler(() =>
                {
                    var handler = new HttpClientHandler();
                    handler.ServerCertificateCustomValidationCallback =
                        HttpClientHandler.DangerousAcceptAnyServerCertificateValidator;
                    return handler;
                })
                .AddCallCredentials((context, metadata) =>
                {
                    var sp = services.BuildServiceProvider();
                    var cfg = sp.GetRequiredService<IOptionsMonitor<ProvidedApiConfiguration>>();
                    if (!string.IsNullOrEmpty(cfg.CurrentValue.ApiKey))
                    {
                        metadata.Add("X-ApiKey", cfg.CurrentValue.ApiKey);
                    }

                    return Task.CompletedTask;
                })
                .AddInterceptor<ResiliencyInterceptor>();
        }
    }
}
{% endhighlight %}

If you take a peek back at our GRPC client we've written, you'll notice quickly how 'GetAllAsync' is actually async, while 'GetById' is synchronous. 'GetAllAsync' will hit the 'AsyncUnaryCall' method in our interceptor. While 'GetById' will hit the 'BlockingUnaryCall' method in our interceptor.

All the rest, should be quite self-explanatory.

{% highlight csharp %}
using System;
using System.Diagnostics;
using System.Threading.Tasks;
using ApiApplication.Cache;
using Google.Protobuf;
using Grpc.Core;
using Grpc.Core.Interceptors;
using ProtoDefinitions;

namespace ApiApplication.ProvidedApiClient;

public class ResiliencyInterceptor : Interceptor
{
    private readonly ICacheClient _cache;
        
    public ResiliencyInterceptor(ICacheClient cache)
    {
        _cache = cache ?? throw new ArgumentNullException(nameof(cache));
    }
    
    public override AsyncUnaryCall<TResponse> AsyncUnaryCall<TRequest, TResponse>(
        TRequest request,
        ClientInterceptorContext<TRequest, TResponse> context,
        AsyncUnaryCallContinuation<TRequest, TResponse> continuation)
    {
        var response = continuation(request, context);
        var task = CallHandlerAsync(request, context, response);
        return new AsyncUnaryCall<TResponse>(task, response.ResponseHeadersAsync, response.GetStatus, response.GetTrailers, response.Dispose);
    }

    public override TResponse BlockingUnaryCall<TRequest, TResponse>(
        TRequest request,
        ClientInterceptorContext<TRequest, TResponse> context,
        BlockingUnaryCallContinuation<TRequest, TResponse> continuation)
        where TRequest : class
        where TResponse : class
    {
        var cacheKey = $"{context.Method.Name}{((IMessage)request).ToByteString().ToBase64()}";
        
        TResponse response;
        try
        {
            response = continuation.Invoke(request, context);
        }
        catch (RpcException)
        {
            var cached = _cache.Get(cacheKey);
            if (cached == null)
            {
                throw;
            }
            return cached as TResponse;
        }
        if (response is responseModel)
        {
            var c = response as responseModel;
            if (c.Success)
            {
                _cache.Set(cacheKey, c, TimeSpan.FromMinutes(5));
                return response;
            }

            var cached = _cache.Get(cacheKey);
            if (cached == null)
            {
                return response;
            }
            return cached as TResponse;
        }
        return response;
    }

    private async Task<TResponse> CallHandlerAsync<TResponse, TRequest>(
        TRequest request,
        ClientInterceptorContext<TRequest, TResponse> context,
        AsyncUnaryCall<TResponse> continuation) where TResponse : class where TRequest : class
    {
        var cacheKey = $"{context.Method.Name}{((IMessage)request).ToByteString().ToBase64()}";
        
        TResponse response;
        try
        {
            response = await continuation;
        }
        catch (RpcException)
        {
            var cached = await _cache.GetAsync(cacheKey);
            if (cached == null)
            {
                throw;
            }
            return cached as TResponse;
        }
        if (response is responseModel)
        {
            var c = response as responseModel;
            if (c.Success)
            {
                await _cache.SetAsync(cacheKey, c, TimeSpan.FromMinutes(5));
                return response;
            }

            var cached = await _cache.GetAsync(cacheKey);
            if (cached == null)
            {
                return response;
            }
            return cached as TResponse;
        }
        return response;
    }
}
{% endhighlight %}

We are concatenating the method name with the base64 representation of our request object. This bit adds 4ms.
{% highlight csharp %}
var cacheKey = $"{context.Method.Name}{((IMessage)request).ToByteString().ToBase64()}";
{% endhighlight %}