---
title: The unexpected behavior of DI scopes in IHttpClientFactory message handlers
date: 2023-08-20T17:00:00+02:00
author: jonashendrickx
category: programming
thumbnail: /assets/img/posts/csharp.png
---

Somewhere during the development on Passwordless.dev, I was working on the AdminConsole, and stumbled upon an interesting discovery. Whenever we make a request, or visit a new page we store the application we're currently viewing in a scoped object that inherits from `ICurrentContext`.

This object would then hold for the scoped lifetime duration things such as the application identifier, API keys, API secrets and so on.

But then in the IHttpClientFactory integration using `PasswordlessManagementClient` we weren't leveraging the power of dependency injection, basically manually adding the API secret into the header every time.

I decided to write a `HttpMessageHandler` for it, given that decoupling it from our main code would make everything more readable and maintainable down the line.

{% highlight csharp %}
using Microsoft.Extensions.Options;
using Passwordless.Net;

namespace Passwordless.AdminConsole.Services.PasswordlessClient;

public class ScopedApiSecretHttpMessageHandler : DelegatingHandler
{
    private readonly ICurrentContext _context_;
    private readonly IOptionsMonitor<PasswordlessOptions> _optionsMonitor;

    public ScopedApiSecretHttpMessageHandler(ICurrentContext context, IOptionsMonitor<PasswordlessOptions> optionsMonitor)
    {
        _context_ = context;
        _optionsMonitor = optionsMonitor;
    }

    protected override async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
    {
        // Here is where it gets fun
        if (_context.InAppContext)
        {
            request.Headers.Add("ApiSecret", _context.ApiSecret);
        }
        else
        {
            var options = _optionsMonitor.CurrentValue;
            request.Headers.Add("ApiSecret", options.ApiSecret);
        }
        var response = await base.SendAsync(request, cancellationToken);
        return response;
    }
}
{% endhighlight %}

To my surprise, we would never be inside an application context. So I was constantly getting unauthorized responses back from the back-end. It was when I started to debug, that I realized the object was basically just containing default values, and didn't appear to be set.

Eventually, I pinpointed the problem down to just where we started to use our `PasswordlessManagementClient` that everything was working fine.

## Why does this matter?

For most people, this likely does not matter. If you're using stateless DelegateHandlers, you'll never encounter any problems or notice that different instances of scoped serviced are being used.

If you want to share a state between a scoped service from ASP.NET's request scope and your HttpMessageHandlers that's when the surprises start bubbling up.

## Warming up

ASP.NET allows you to register services with the dependency injection (DI) container using three different lifetimes:

- Singleton: The service has only one instance throughout the application’s lifetime. The same instance is returned for every service request.
- Scoped: The service has one instance per defined “scope”. Service requests within the same scope get the same instance. Service requests from different scopes get different instances.
- Transient: The service has a new instance for every service request. No two service requests get the same instance.

When are those scopes created for scoped lifetimes? In ASP.NET, a new scope is created for each request. So each request uses a different instance of a scoped service.

## Finding out what's going on

Lets imagine you have a scoped service which stores an instance id. We would expect every instance to return the same instance identifier for a given request scope in ASP.NET.

{% highlight csharp %}
public class ScopedContext
{
    public Guid InstanceId { get; } = Guid.NewGuid();
}
{% endhighlight %}

{% highlight csharp %}
public class ScopedMessageHandler: DelegatingHandler
{
    private readonly ScopedContext _context;
    private readonly ILogger<ScopedMessageHandler> _logger;

    public ScopedMessageHander(
        ScopedContext context,
        ILogger<ScopedMessageHander> logger)
    {
        _context = context;
        _logger = logger;
    }

    protected override Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
    {
        var instanceId = _context.InstanceId;
        _logger.LogInformation($"HttpMessageHandler: {instanceId:N}");

        return base.SendAsync(request, cancellationToken);
    }
}
{% endhighlight %}

Now let's configure our dependency injection.

{% highlight csharp %}
builder.services.AddScoped<ScopedContext>();
builder.Services.AddHttpClient("test", client =>
{
    client.BaseAddress = new Uri("https://v4.passwordless.dev");
}).AddHttpMessageHandler<ScopedMessageHandler>();

builder.Services.AddTransient<ScopedMessageHandler>();
{% endhighlight %}

If you inject now `ScopedContext` in a controller log the `InstanceId` property, you should be able to verify that the instance id are not the same as the one in the `ScopedMessageHandler`.

```
info: Passwordless.Controllers.TestController[0]
      Controller: da5c6faf6af7474da5d9bfe7d63c38ff
info: Passwordless.ScopedMessageHandler[0]
      HttpMessageHandler: 7119d057a7ae437283384249ee232499
```

## The solution

To use the IHttpContextAccessor, you'll need to register this typically in your `Startup.cs` or `Program.cs` with the `IServiceCollection`.

{% highlight csharp %}
services.AddHttpContextAccessor();
{% endhighlight %}

Or if you're using `WebApplicationBuilder`:

{% highlight csharp %}
builder.Services.AddHttpContextAccessor();
{% endhighlight %}

Then finally you inject `IHttpContextAccessor` in your HttpMessageHandler.

{% highlight csharp %}
using Microsoft.Extensions.Options;
using Passwordless.Net;

namespace Passwordless.AdminConsole.Services.PasswordlessClient;

public class ScopedApiSecretHttpMessageHandler : DelegatingHandler
{
    private readonly IHttpContextAccessor _accessor;
    private readonly IOptionsMonitor<PasswordlessOptions> _optionsMonitor;

    public ScopedApiSecretHttpMessageHandler(IHttpContextAccessor accessor, IOptionsMonitor<PasswordlessOptions> optionsMonitor)
    {
        _accessor = accessor;
        _optionsMonitor = optionsMonitor;
    }

    protected override async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
    {
        // We won't be able to access the request scope.
        var context = _accessor.HttpContext.RequestServices.GetRequiredService<ICurrentContext>();
        if (context.InAppContext)
        {
            request.Headers.Add("ApiSecret", context.ApiSecret);
        }
        else
        {
            var options = _optionsMonitor.CurrentValue;
            request.Headers.Add("ApiSecret", options.ApiSecret);
        }
        var response = await base.SendAsync(request, cancellationToken);
        return response;
    }
}
{% endhighlight%}

## References
- [Access HttpContext in ASP.NET Core - Microsoft](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/http-context)
- [Make HTTP requests using IHttpClientFactory in ASP.NET Core - Microsoft](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/http-requests)