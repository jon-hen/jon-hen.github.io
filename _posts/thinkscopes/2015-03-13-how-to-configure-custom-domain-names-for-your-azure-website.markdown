---
author: jonashendrickx
date: 2015-03-13 15:12:58+00:00
slug: how-to-configure-custom-domain-names-for-your-azure-website
title: How to configure custom domain names for your Azure website
category: programming
---
In this tutorial, we are going to show you how to use a domain name you have with an external provider with your website hosted on Azure.
 
 I have reserved a domain name 'www.thinkscopes.com' with 1&1. But I want to use this domain name with my website hosted on Azure. How do I do this? Well let me tell you!
  	
  1. First of all log in to the [Azure Portal](https://manage.windowsazure.com/).
 ![azure-external-domain-1](/assets/img/posts/thinkscopes/2015/03/azure-external-domain-1.jpg)

  2. In the left menu pane, select **'Websites'**.
 [![azure-external-domain-2](/assets/img/posts/thinkscopes/2015/03/azure-external-domain-2.jpg)

  3. In my example, I will edit the ThinkScopes websites, because I moved it to Azure earlier today. Select the website you want to point your domain name to.
 	
  4. Select the **'Configure'** tab.
 [![azure-external-domain-3](/assets/img/posts/thinkscopes/2015/03/azure-external-domain-3.jpg)

  5. Scroll down until you see the **'domain names'** section & click **'manage domains'**.[![azure-external-domain-4](/assets/img/posts/thinkscopes/2015/03/azure-external-domain-4.jpg)](/assets/img/posts/thinkscopes/2015/03/azure-external-domain-4.jpg)

  6. Reading the large block of text, we understand we just need to create a CNAME record with our domain name provider pointing to the URL of our website hosted on Azure. In my case I am writing down: "thinkscopes.azurewebsites.com"[![azure-external-domain-5](/assets/img/posts/thinkscopes/2015/03/azure-external-domain-5.jpg)](/assets/img/posts/thinkscopes/uploads/2015/03/azure-external-domain-5.jpg)
 	
  7. Creating a CNAME record with my domain name provider http://www.1and1.com/, your mileage may vary depending on the choice of your domain name provider. You may need more steps or less steps. Or it can take more time for the changes to take effect.
 [![azure-external-domain-6](](/assets/img/posts/thinkscopes/2015/03/azure-external-domain-6-1024x498.jpg)
 ](](/assets/img/posts/thinkscopes/2015/03/azure-external-domain-6.jpg)[
 ](/assets/img/posts/thinkscopes/2015/03/azure-external-domain-6.jpg)
 	
  8. Now go back to Azure where we were in **'Step 6'**. Enter the new domain name you are going to point it to. In my case, **'www.thinkscopes.com'**, which is the domain name I reserved with 1&1. Then the result should look like this:
 [![azure-external-domain-7](](/assets/img/posts/thinkscopes/2015/03/azure-external-domain-7-1024x229.jpg)](](/assets/img/posts/thinkscopes/2015/03/azure-external-domain-7.jpg)

  9. Now it may take some time before the changes become active. If it still doesn't work after several hours, contact your domain name provider.