---
title: How to publish NuGet packages to Azure Artifacts
date: 2021-03-17T12:00:00-04:00
author: jonashendrickx
category: programming
---
## Installing the credentials provider

You&#8217;ll need to install credentials provider for the interactive authentication. This can be downloaded <a href="https://github.com/microsoft/artifacts-credprovider" target="_blank" rel="noreferrer noopener">here</a>. I&#8217;d recommend using the Powershell script which can be downloaded from the Github repository. You may require to allow execution of this Powershell script as shown below, don&#8217;t forget to revert it to whatever you were using previously.

{% highlight powershell %}
Set-ExecutionPolicy Unrestricted
{% endhighlight %}

The default execution policy is &#8216;Undefined&#8217;.

## Generating a Personal Access Token (PAT)

Read the documentation below to generate a personal access token.

<https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=preview-page>

## Building the package

First we&#8217;ll have to set a version or increment the version of the assembly. To do this, open &#8216;Visual Studio&#8217;, and in &#8216;**Solution Explorer**&#8216;, right-click your project and choose &#8216;**Properties**&#8216;. Then navigate to the &#8216;**Package**&#8216; tab where you can set the &#8216;**Package version**&#8216;.

In &#8216;Visual Studio&#8217;, and make sure &#8216;**Solution Explorer**&#8216; is open. Then just right-click your project and choose &#8216;**Pack**&#8216;.

## Publishing the package

[Publish a NuGet package using the command line &#8211; Azure Artifacts | Microsoft Docs](https://docs.microsoft.com/en-us/azure/devops/artifacts/nuget/publish?view=azure-devops)

You&#8217;ll have to put a &#8216;nuget.config&#8217; file with the feed&#8217;s name in your project directory.

{% highlight powershell %}
dotnet nuget push --source "MyFeed" --api-key yourkeygoeshere .\bin\Release\My.First.NuGet.1.0.0.nupkg --interactive
{% endhighlight %}

The &#8216;&#8211;interactive&#8217; flag might only be required the first time.

## Note

Ideally you want a GitFlow-like way of working and create a release pipeline for publishing the package from your main branch. This avoids that developers are publishing a NuGet package before their code is actually approved and merged into the main branch for use by other team members.