---
title: How to setup next-i18next for next.js?
date: 2020-05-06T03:53:51-04:00
author: jonashendrickx
category: programming
---
## Setting up your next.js project

First, visit the <a rel="noreferrer noopener" href="https://nextjs.org/docs/getting-started#setup" target="_blank">next.js website</a> to setup your project, scroll down to the setup section. If you have installed node, you should be able to execute the command below immediately as described on the next.js website.

{% highlight shell %}
npm init next-app
{% endhighlight %}

## Installing next-i18next and its dependencies

You may have to install several dependencies:

  * express
  * i18next
  * next-i18next

## Integrating next-i18next

Make sure you have the necessary dependencies as shown below with the correct scripts configured in &#8216;packages.json&#8217;.

https://gist.github.com/jonashendrickx/c37e4d3ff1b411e4318ad66f7e357313#file-packages-json

You can modify any settings for next-i18next in your &#8216;next.config.js&#8217;. Make sure you define and export it as shown below.

https://gist.github.com/jonashendrickx/c37e4d3ff1b411e4318ad66f7e357313#file-next-config-js