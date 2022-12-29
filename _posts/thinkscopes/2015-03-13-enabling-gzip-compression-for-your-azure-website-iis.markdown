---
author: jonashendrickx
date: 2015-03-13 15:13:29+00:00
slug: enabling-gzip-compression-for-your-azure-website-iis
title: Enabling GZIP compression for your Azure website (IIS)
category: programming
---
Enabling GZIP compression for your website is important. Because it reduces the network bandwidth required to display a page. Your readers will thank you for not wasting any bytes in their data plan. In addition to that, pages will also load faster as a result, specially if you are using a slower connection.

Anyway some of you are already thinking of creating a '.htaccess' file, because that is what you used to do before you started using Azure right? '.htaccess' files are only found on Apache servers. Azure uses something different, called a **'web.config'** file.

# Requirements

  * Basic or Standard pricing plan: does not work on the 'Free' and 'Shared' hosting options.

# Instructions

  1. To find the **'web.config'** file, log in to your FTP server on Azure using FileZilla (or something similar).
  2. To find your login credentials for the FTP server, open [Azure Portal](https://manage.windowsazure.com/).
  3. At the Azure Portal, scroll down. You will find the login credentials there (with the exception of the password.
[![azure-compress-4](](/assets/img/posts/thinkscopes/2015/03/azure-compress-4.jpg)](](/assets/img/posts/thinkscopes/2015/03/azure-compress-4.jpg)
[![azure-compress-5](](/assets/img/posts/thinkscopes/2015/03/azure-compress-5.jpg)](](/assets/img/posts/thinkscopes/2015/03/azure-compress-5.jpg)
  4. Navigate to **'/site/wwwroot'**, there you will find the 'web.config' file & download it.
![azure-compress-3](](/assets/img/posts/thinkscopes/2015/03/azure-compress-3-1024x560.jpg) Click the image to enlarge it.
  5. To enable GZIP compression you need to add the lines marked below to your 'web.config' file. Then upload it back to to the FTP server using FileZilla.
![azure-compress-2](](/assets/img/posts/thinkscopes/2015/03/azure-compress-2.jpg)

# Notes

  * You cannot enable GZIP compression if you are using a 'FREE' or 'SHARED' plan to host your website on Azure. You need at least a 'BASIC' or 'STANDARD' plan.

And you have to admit, that **'web.config'** file looks way prettier than that messy **'.htaccess'** file you used to have with Apache!