---
title: Authentication with CSOM in Project Server
date: 2016-02-28T09:00:50-05:00
author: jonashendrickx
category: programming
---
As you might now, Microsoft recently started promoting Project Server Online. Previously, it was required to host Project Server on your own on-premise systems or in the cloud on Microsoft Azure. Now since both use a slightly different authentication method. I will cover them in this article.

## No authentication

If you were to use no authentication with your Project Server installation it would just simply look like this:

{% highlight csharp %}
var projContext = new ProjectContext(url);
{% endhighlight %}

## Project Server on-premises installation

{% highlight csharp %}
var projContext = new ProjectContext(url);
projContext.Credentials = new NetworkCredential(username, password);
{% endhighlight %}    

## Project Server Online

{% highlight csharp %}
var projContext = new ProjectContext(url);
    
// SecureString is required by constructor of SharePointOnlineCredentials
var secPass = new SecureString();
foreach (var c in password)
{
    secPass.AppendChar(c);
}
projContext.Credentials = new SharePointOnlineCredentials(username, secPass);
{% endhighlight %}

## Optimization

Because ProjectContext inherits from Microsoft.SharePoint.Client.ClientContext, it also implements IDisposable, which means you should be using it in a &#8216;using-clause&#8217; as below so resources are released afterwards.

{% highlight csharp %}
using (var projContext = new ProjectContext(url))
{
   // do your work here
   // additional authentication can go here too
}
{% endhighlight %}