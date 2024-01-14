---
title: Blazor cache busting using asp-append-version
date: 2024-01-14T08:26:00+02:00
author: jonashendrickx
category: programming
thumbnail: /assets/img/posts/csharp.png
---

With the release of .NET 8, Blazor Static SSR (Server Side Rendering) was introduced. Giving us finally the opportunity to migrate from Razor Pages to Blazor Static SSR.

While some things were more polished every possible way, we were getting other challenges. Cache busting was one of them. In Razor Pages, we could use the `asp-append-version` attribute to make sure that the browser would always request the latest version of the file.

But in Blazor, this attribute is not supported. So we had to find another way to make sure that the browser would always request the latest version of the file.

We went to reverse engineer the `asp-append-version` attribute on the `LinkTagHelper`.

{% highlight csharp %}
bool? appendVersion = this.AppendVersion;
bool flag = true;
if (appendVersion.GetValueOrDefault() == flag & appendVersion.HasValue)
{
    this.EnsureFileVersionProvider();
    if (this.Href != null)
    {
        int index = output.Attributes.IndexOfName("href");
        TagHelperAttribute attribute = output.Attributes[index];
        output.Attributes[index] = new TagHelperAttribute(attribute.Name, (object) this.FileVersionProvider.AddFileVersionToPath(this.ViewContext.HttpContext.Request.PathBase, this.Href), attribute.ValueStyle);
    }
}
{% endhighlight %}

Everything seems to point towards the `FileVersionProvider` in the `Microsoft.AspNetCore.Mvc.ViewFeatures` namespace for us to investigate.

So we injected it into our `_Imports.razor` file

{% highlight csharp %}
@using Microsoft.AspNetCore.Mvc.ViewFeatures
@inject IFileVersionProvider FileVersionProvider
{% endhighlight %}

We could now attempt to use it into our Razor components or rather Blazor components, given the confusing name.

{% highlight csharp %}
public static class FileVersionProviderExtensions
{
    public static string Get(this IFileVersionProvider provider, string path) =>
        provider.AddFileVersionToPath("", path);

    public static string Get(this IFileVersionProvider provider, IHttpContextAccessor accessor, string path) =>
        provider.AddFileVersionToPath(accessor.HttpContext!.Request.PathBase, path);
}
{% endhighlight %}

We could now use it in our Blazor components.

{% highlight csharp %}
@inject IFileVersionProvider Version

<link rel="stylesheet" href="@Version.Get("css/site.css")" />
{% endhighlight %}

Except this looks kind of dirty to do everywhere. So we created a component `BlazorLink.razor` that would do this for us.

{% highlight csharp %}
inject IFileVersionProvider Version

<link rel="stylesheet" href="@Href" />

@code {
    /// <summary>
    /// Specifies the URL of the linked resource.
    /// </summary>
    [Parameter]
    public required string Href { get; set; }

    protected override void OnInitialized()
    {
        var href = Version.Get(Href);
        if (href == Href)
        {
            throw new ArgumentException("Stylesheet does not exist.", nameof(Href));
        }
        Href = href;
    }
}
{% endhighlight %}

Now just use it and just add attributes and parameters as required.

{% highlight html %}
<BlazorLink Href="site.css"></BlazorLink>
{% endhighlight %}

In your rendered HTML, it should render as follows:

{% highlight html %}
<link rel="stylesheet" href="site.css?v=123" />
{% endhighlight %}

If the resource was not found, it would throw an ArgumentException. This is useful for debugging purposes.