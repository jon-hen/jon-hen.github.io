---
title: How to unit test DelegatingHandlers in .NET?
date: 2024-01-29T11:18:00+02:00
author: jonashendrickx
category: programming
thumbnail: /assets/img/posts/csharp.png
---

When using the HttpClient in .NET, you might want to add a DelegatingHandler to it. This is useful for adding headers, adding authentication or modifying behavior. Or maybe you want to act on whether or not the response was successful.

Using the 'arrange-act-assert' pattern, you cannot call `SendAsync` with the method being protected. Assuming you have a class `CacheHandler` which calls a third-party web service, we might want to cache the response as a file when successful, or use the cached file when not successful.

{% highlight csharp %}
public sealed class CacheHandler : DelegatingHandler
{
public const string Path = ".cache/response.json";

    private readonly ILogger<CacheHandler> _logger;

    public CacheHandler(ILogger<CacheHandler> logger)
    {
        _logger = logger;
    }

    public CacheHandler(HttpMessageHandler httpMessageHandler, ILogger<CacheHandler> logger) : base(httpMessageHandler)
    {
        _logger = logger;
    }

    protected override async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
    {
        _logger.LogInformation("[CacheHandler] Attempting to synchronize with the latest content.");
        var response = await base.SendAsync(request, cancellationToken);
        if (response.IsSuccessStatusCode)
        {
            var content = await response.Content.ReadAsStringAsync(cancellationToken);
            using (var cache = File.CreateText(Path))
            {
                await cache.WriteAsync(content);
            }
            _logger.LogInformation("[CacheHandler] Successfully downloaded the latest content.");
        }
        else
        {

            var content = await File.ReadAllTextAsync(Path, cancellationToken);
            response.Content = new StringContent(content);
            response.StatusCode = HttpStatusCode.OK;
            _logger.LogWarning("[CacheHandler] Downloading the latest content failed..");
        }
        return response;
    }
}
{% endhighlight %}

As explained by [this article](https://learn.microsoft.com/en-us/aspnet/web-api/overview/advanced/httpclient-message-handlers), you can chain multiple DelegatingHandler or HttpMessageHandler. We will leverage this to create our unit tests.

First you want to create two HttpMessageHandlers, which will intercept our requests and return a response we've specified. So we also don't make an unnecessary call to the third-party web service. As that would be called end-to-end tests or integration tests.

{% highlight csharp %}
private class NotFoundResponseHandler : HttpMessageHandler
{
    protected override Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
    {
        var response = new HttpResponseMessage(HttpStatusCode.NotFound);
        return Task.FromResult(response);
    }
}

private class OkResponseHandler : HttpMessageHandler
{
    protected override Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
    {
        var stringContent = new StringContent(Guid.NewGuid().ToString(), Encoding.UTF8);
        var response = new HttpResponseMessage(HttpStatusCode.OK) { Content = stringContent };
        return Task.FromResult(response);
    }
}
{% endhighlight %}

For our first test, we will test what happens when the call was unsuccessful, and whether or not the cache was used.

In the code below, you can see we set the `NonFoundResponseHandler` as the inner handler. This means our request will hit the CacheHandler first, and then attempt to call the third-party web service. As we've set the inner handler to the `NotFoundResponseHandler`, it will return a `NotFound` response instead rather than calling the third-party web service.

{% highlight csharp %}
[Fact]
public async Task CacheHandler_Returns_ContentFromFile_WhenReceivingUnsuccessfulStatusCode()
{
    // arrange
    var httpClient = new HttpClient(new CacheHandler(new NotFoundResponseHandler(), _loggerMock.Object))
    {
        BaseAddress = new Uri("http://localhost:5001")
    };

    using (var file = File.CreateText(".cache/response.json"))
    {
        await file.WriteAsync("test");
    }

    // act
    var actual = await httpClient.GetAsync("/hello-world");

    // assert
    Assert.Equal(HttpStatusCode.OK, actual.StatusCode);
    Assert.Equal("test", await actual.Content.ReadAsStringAsync());
}
{% endhighlight %}

For our second test, we will test what happens when the call was successful, and whether the cache was updated.

First, we're storing the originally cached file, so we can compare it later. Then we're setting the `OkResponseHandler` as the inner handler. This means our request will hit the CacheHandler first, and then attempt to call the third-party web service. As we've set the inner handler to the `OkResponseHandler`, it will return a `Ok` response rather than calling the third-party web service.

During the assertion, we first verify we're receiving a unique GUID back as the response. Then we verify the cache was updated by comparing the original content with the new content.

{% highlight csharp %}
[Fact]
public async Task CacheHandler_Returns_ContentFromFile_WhenReceivingUnsuccessfulStatusCode()
{
    // arrange
    string? originalContent;
    try
    {
        originalContent = await File.ReadAllTextAsync(CacheHandler.Path);
    }
    catch (FileNotFoundException)
    {
        originalContent = null;
    }

    var httpClient = new HttpClient(new CacheHandler(new OkResponseHandler(), _loggerMock.Object))
    {
        BaseAddress = new Uri("http://localhost:5001")
    };

    // act
    var actual = await httpClient.GetAsync("/hello-world");

    // assert
    Assert.Equal(HttpStatusCode.OK, actual.StatusCode);

    var actualContent = await actual.Content.ReadAsStringAsync();
    Assert.NotEqual(originalContent, actualContent);
    Assert.Equal(actualContent, await File.ReadAllTextAsync(CacheHandler.Path));
}
{% endhighlight %}