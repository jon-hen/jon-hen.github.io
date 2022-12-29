---
title: Downloading files from SharePoint with Graph SDK
date: 2020-02-03T16:30:00-05:00
author: jonashendrickx
category: programming
---
This tutorial was written with Microsoft SharePoint Online in mind. If you&#8217;re using on-premises, things may not work out as expected.

There are several other ways you can go about this, for example using client id and client secret or a certificate. We will use a service account in our example.

## Requesting our service account

In our case, we wanted to expose certain document libraries to the public. We will not require users to authenticate with our API. I went with a service account because it was straight forward and convenient coming from CSOM which only seems to work with .NET Framework at this time and not .NET Core.

  1. Visit the &#8216;**Microsoft Office 365 Admin Center**&#8216;.
  2. Create a new user, and save the credentials. Disable any 2FA authentication if enabled. At the first sign in, sometimes you may have to link an e-mail or telephone number for a back-up.
  3. Assign the required license.
  4. Assign &#8216;User&#8217; role, or more if necessary.

Now the user is setup, we will create our enterprise application.

  1. In the menu, open &#8216;**Azure AD**&#8216; or &#8216;Azure Active Directory&#8217;, this will bring you to the &#8216;**Azure Active Directory admin center**&#8216;.
  2. You will see &#8216;**Enterprise Applications**&#8216; in the menu, open it and proceed to create a new application.
  3. You&#8217;re now asked to select the appropriate application type, we will use &#8216;**application you&#8217;re developing**&#8216; for our demo. Our demo will be a standalone ASP.NET Core API or Azure Function.
  4. Now click &#8216;**Ok, take me to App Registrations to register my new application.**&#8216; to proceed to &#8216;**App Registrations**&#8216;.
  5. Click &#8216;**New Registration**&#8216; at the top.
  6. Give it a meaningful name.
  7. To keep our sanity, we will only use users in our active directory so for &#8216;**Supported Account Types**&#8216; we choose &#8216;**Accounts in this organizational directory only (Single tenant)**&#8216;.
  8. Click &#8216;Register&#8217;. ![SharePoint Graph SDK Tutorial](/assets/img/posts/2020/03/sharepoint-graph-sdk-tutorial.jpg){:class="img-fluid"}
  9. Take a note of the &#8216;**Application Id**&#8216; (&#8216;Client Id&#8217;) and &#8216;Directory Id&#8217; (&#8216;**Tenant Id**&#8216;).
 1.  In &#8216;**Authentication**&#8216;, set &#8216;**Treat application as a public client.**&#8216; to &#8216;**Yes**&#8216; and click &#8216;Save&#8217;.
 2.  Now go to &#8216;**API Permissions**&#8216;.
 3.  Click &#8216;**Add a permission**&#8216;.
 4.  Find and click the &#8216;**SharePoint**&#8216; tile.
 5.  Give it all the &#8216;**Delegated**&#8216; &#8216;**Read**&#8216; permissions so you have: &#8216;AllSites.Read&#8217;, &#8216;TermStore.Read.All&#8217;, &#8216;User.Read.All&#8217;
 6.  Then click the button &#8216;**Grant admin consent for %username%**&#8216;.

The changes could take a few minutes to propagate. Don&#8217;t panic if it doesn&#8217;t work immediately.

## Code

### Sample

<https://github.com/jonashendrickx/microsoft-graphsdk/>

### Prerequisites

You can get started by installing the required NuGet packages described at <a rel="noreferrer noopener" aria-label="this page (opens in a new tab)" href="https://docs.microsoft.com/en-us/graph/sdks/sdk-installation" target="_blank">this page</a> or below:

  * Microsoft.Graph
  * Microsoft.Graph.Auth
  * Microsoft.Graph.Core
  * (optional) System.Configuration.ConfigurationManager

### Setting up Graph SDK

Follow all the instructions on <a rel="noreferrer noopener" href="https://docs.microsoft.com/en-us/graph/sdks/sdks-overview" target="_blank">this page</a> to setup the Graph SDK. The required roles are <a rel="noreferrer noopener" href="https://docs.microsoft.com/en-us/graph/api/driveitem-get-content?view=graph-rest-1.0&tabs=http" target="_blank">mentioned next to the API calls</a>. You will have to assign these roles as mentioned above and then also add them to the Graph SDK client. You can check the sample for more details on how to do this. If your roles or permissions don&#8217;t seem to be working immediately, it&#8217;s because they might take a few minutes to take effect.

The REST call &#8216;**GET /sites/{siteId}/drive/items/{item-id}/content**&#8216; would translate in C# as

{% highlight csharp %}
await _client.Sites[siteId].Drives[docLibId].Items[driveItemId].Content.Request().GetAsync();
{% endhighlight %}

Hopefully this is enough to get you guys started! Have fun!