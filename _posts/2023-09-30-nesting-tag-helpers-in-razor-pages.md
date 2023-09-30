---
title: Nesting TagHelper in Razor Pages.
date: 2023-09-30T11:00:00+02:00
author: jonashendrickx
category: programming
thumbnail: /assets/img/posts/csharp.png
---

If you're using Razor Pages, you might have noticed that you can't nest TagHelpers. This is because Razor Pages are not using the same TagHelper infrastructure as Razor Views.

I recently stumbled upon this problem when I was trying to nest a TagHelper inside another TagHelper. I refactored and svg icon behind a TagHelper, and wanted to use it inside another TagHelper which I was using to display alerts similar to what we know as alerts in Twitter Bootstrap.


In my Razor Page, I had the following code initially:

{% highlight html %}
<div id="webauthn-unsupported-alert" class="hidden">
    <div class="rounded-md p-4 my-3 bg-red-50">
        <div class="flex">
            <div class="flex-shrink-0">
                <svg class="h-5 w-5 fill-red-400" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.28 7.22a.75.75 0 00-1.06 1.06L8.94 10l-1.72 1.72a.75.75 0 101.06 1.06L10 11.06l1.72 1.72a.75.75 0 101.06-1.06L11.06 10l1.72-1.72a.75.75 0 00-1.06-1.06L10 8.94 8.28 7.22z" clip-rule="evenodd"></path>
                </svg>
            </div>
            <div class="ml-3 text-red-800 flex justify-between">
                <p class="text-sm font-medium">WebAuthn is not supported in this browser.</p>
            </div>
        </div>
    </div>
</div>
{% endhighlight %}

How I wanted my front-end code to look like:

{% highlight html %}
...
<div id="webauthn-unsupported-alert" class="hidden">
    <danger-alert-box
        message="WebAuthn is not supported in this browser">
    </danger-alert-box>
</div>
...
{% endhighlight %}

I figured, we might wanted to use the svg icon in other places as well, so I decided to extract it into a TagHelper.

The **BaseAlertIcon** would essentially serve to toggle the styling of the svg icon based on the **ColorVariant** enum with values we know as:
- Primary
- Secondary
- Success
- Danger
- Warning
- Info

{% highlight csharp %}
public abstract class BaseAlertIcon : TagHelper
{
    private readonly string _baseClass = "h-5 w-5";

    public ColorVariant? Variant { get; set; }

    private string GetClass()
    {
        if (!Variant.HasValue)
        {
            return _baseClass;
        }

        string colorClass = Variant switch
        {
            ColorVariant.Danger => "fill-red-400",
            ColorVariant.Info => "fill-blue-400",
            ColorVariant.Success => "fill-green-400",
            _ => null
        } ?? string.Empty;

        return string.Join(' ', _baseClass, colorClass);
    }


    public override void Process(TagHelperContext context, TagHelperOutput output)
    {
        output.TagName = "svg";
        output.Attributes.SetAttribute("class", GetClass());
        output.Attributes.SetAttribute("fill", "currentColor");
        output.Attributes.SetAttribute("viewBox", "0 0 20 20");
        output.Attributes.SetAttribute("aria-hidden", "true");
    }
}
{% endhighlight %}

The **DangerAlertIcon** would inherit from the **BaseAlertIcon** and would set the **Variant** property to **ColorVariant.Danger** by default. Now for normal icons, we wouldn't want to set it here, but that's an entirely different debate.

In our **BaseAlertIcon**, we've specified we wanted to create a custom HTML tag for an SVG icon. Now inside our implementation below, we will have to append the content to set the content of the SVG icon.

{% highlight csharp %}
[HtmlTargetElement(HtmlTag)]
public sealed class DangerAlertIcon : BaseAlertIcon
{
    public const string HtmlTag = "danger-alert-icon";

    public DangerAlertIcon()
    {
        Variant = ColorVariant.Danger;
    }

    public override void Process(TagHelperContext context, TagHelperOutput output)
    {
        base.Process(context, output);
        output.Content.AppendHtml(@"<path fill-rule=""evenodd"" d=""M10 18a8 8 0 100-16 8 8 0 000 16zM8.28 7.22a.75.75 0 00-1.06 1.06L8.94 10l-1.72 1.72a.75.75 0 101.06 1.06L10 11.06l1.72 1.72a.75.75 0 101.06-1.06L11.06 10l1.72-1.72a.75.75 0 00-1.06-1.06L10 8.94 8.28 7.22z"" clip-rule=""evenodd""></path>");
    }
}
{% endhighlight %}

Now we can use our **DangerAlertIcon** inside our **DangerAlertBox**. We will have to use the **HtmlTargetElement** attribute to specify the HTML tag we want to use for our **DangerAlertBox**.

So below, we'll folow again a similar approach defining **BaseAlertBox** which will serve as a base class for our **DangerAlertBox**. We will define a **Variant** property which will be of type **ColorVariant**. We will also define a **Message** property which will be of type **string**. We will also define a **Class** property which will be of type **string**. This will allow us to add custom classes to our **DangerAlertBox**.

{% highlight csharp %}
public abstract class BaseAlertBox : TagHelper
{
    private readonly string _baseClass = "rounded-md p-4 my-3";

    public ColorVariant? Variant { get; set; }

    public string? IconTag { get; set; }

    public string? Class { get; set; }

    public string Message { get; set; }

    public override async Task ProcessAsync(TagHelperContext context, TagHelperOutput output)
    {
        output.TagName = "div";
        output.Attributes.SetAttribute("class", GetClass());

        // take note of what's happening inside here, because we will have to render our icon before rendering our alert box. As otherwise our alert box' tag helper won't be able to resolve our custom HTML tag.
        var icon = RenderIcon(context);

        var iconContainer = icon == null ? string.Empty : $"<div class=\"flex-shrink-0\">{icon}</div>";

        output.Content.AppendHtml($"""
                                   <div class="flex">
                                       {iconContainer}
                                       <div class="ml-3 {GetTextColorClass()} flex justify-between">
                                           <p class="text-sm font-medium">{Message}</p>
                                       </div>
                                   </div>
                                   """);
    }
    
    private string? RenderIcon(TagHelperContext context)
    {
        BaseAlertIcon? icon = Variant switch
        {
            ColorVariant.Danger => new DangerAlertIcon(),
            ColorVariant.Info => new InfoAlertIcon(),
            ColorVariant.Success => new SuccessAlertIcon(),
            _ => null
        };

        // We've defined an extension method for our BaseIcon tag helper which will allow us to render our icon.
        return icon == null ? null : icon.RenderHtml(context);
    }

    private string GetClass()
    {
        var classes = new List<string>();
        classes.Add(_baseClass);

        if (Variant.HasValue)
        {
            string colorClass = Variant switch
            {
                ColorVariant.Danger => "bg-red-50",
                ColorVariant.Info => "bg-blue-50",
                ColorVariant.Success => "bg-green-50",
                _ => string.Empty
            };
            classes.Add(colorClass);
        }

        if (!string.IsNullOrWhiteSpace(Class))
        {
            classes.Add(Class);
        }

        return string.Join(' ', classes);
    }

    private string GetTextColorClass()
    {
        if (!Variant.HasValue)
        {
            return _baseClass;
        }

        string colorClass = Variant switch
        {
            ColorVariant.Danger => "text-red-800",
            ColorVariant.Info => "text-blue-800",
            ColorVariant.Success => "text-green-800",
            _ => string.Empty
        };

        return colorClass;
    }
}
{% endhighlight %}

We need to use a new TagHelperOutput instance to render our icon.

{% highlight csharp %}
public static string RenderHtml(this TagHelper tagHelper, TagHelperContext context)
{
    if (context == null) throw new ArgumentNullException(nameof(context));

    var output = new TagHelperOutput(
        string.Empty,
        new TagHelperAttributeList(),
        (useCachedResult, encoder) =>
            Task.Factory.StartNew<TagHelperContent>(
                () => new DefaultTagHelperContent()
            ));

    // We will process the tag helper and render the output.
    tagHelper.Process(context, output);

    // Help us render the TagHelperOutput into a string
    return output.RenderHtml();
}

public static string RenderHtml(this TagHelperOutput output)
{
    if (output == null)
    {
        throw new ArgumentNullException(nameof(output));
    }

    // rendering our TagHelperOutput into a string
    return $"<{output.TagName} {output.Attributes.ToHtmlOutput()}>{output.Content.GetContent()}</{output.TagName}>";
}

public static string ToHtmlOutput(this TagHelperAttributeList attributes)
{
    // Create a string builder to build the attribute string
    var list = new List<string>(attributes.Count);

    foreach (var attribute in attributes)
    {
        var item = new StringBuilder();
        item.Append($"{attribute.Name}");
        if (!string.IsNullOrEmpty(attribute.Value?.ToString()))
        {
            item.Append($"=\"{attribute.Value}\"");
        }
        list.Add(item.ToString());
    }

    // Convert the attribute string to a single string
    string attributesHtml = string.Join(' ', list);

    return attributesHtml;
}
{% endhighlight %}

And that's it, we can now use our **DangerAlertBox** inside our Razor Page, which is directly using our **DangerAlertIcon**.

Now the code for **DangerAlertBox** is fairly straightforward. I always define a constant for each tag helper, so I can easily reference to it in my Razor Page or my other tag helpers, as we're seeing below:

{% highlight csharp %}
[HtmlTargetElement("danger-alert-box")]
public sealed class DangerAlertBox : BaseAlertBox
{
    public DangerAlertBox()
    {
        Variant = ColorVariant.Danger;
        IconTag = DangerAlertIcon.HtmlTag;
    }
}
{% endhighlight %}