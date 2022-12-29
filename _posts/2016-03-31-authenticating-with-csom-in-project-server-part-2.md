---
title: Authenticating with CSOM in Project Server (Part 2)
date: 2016-03-31T03:42:46-04:00
author: jonashendrickx
category: programming
---
Little more than a month ago, I wrote about the <a href="http://www.jonashendrickx.com/2016/02/28/authentication-with-csom-in-project-server/" target="_blank">different authentication used in Project Server & SharePoint for on-premises and SharePoint Online & Project Server</a>.

The on-premises SharePoint Server and Project Server can be hosted without authentication. Both can make use of the example method below which only uses the PWA URL as the parameter. The other one still requires a username and password. However, SharePoint Server Online and Project Server Online depend on the **Microsoft.SharePoint.Client.SharePointOnlineCredentials class** for authentication, whereas the on-premises variants depend on **System.Net.NetworkCredential class**.

Detecting whether you are using the on-premises or online version, you can just check if the URL contains &#8216;**sharepoint.com**&#8216;. This greatly simplifies my code.

{% highlight csharp %}
public static class PsConnection
{
  public static ProjectContext GetProjectContext(string pwaUrl)
  {
    return new ProjectContext(pwaUrl);
  }

  public static ProjectContext GetProjectContext(string pwaUrl, string username, string password)
  {
    if (username == null || password == null)
      throw new InvalidEnumArgumentException();
    var projContext = new ProjectContext(pwaUrl);

    if (pwaUrl.Contains("sharepoint.com"))
    {
      var secPassword = new SecureString();
      foreach (var c in password)
      {
        secPassword.AppendChar(c);
      }
      projContext.Credentials = new SharePointOnlineCredentials(username, secPassword);
    }
    else
    {
      projContext.Credentials = new NetworkCredential(username, password);
    }
    return projContext;
  }
}
{% endhighlight %}