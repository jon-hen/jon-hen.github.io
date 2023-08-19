---
author: jonashendrickx
date: 2014-08-05 16:45:51+00:00
slug: windows-cannot-find-drivers-for-your-windows-phone-on-n-kn-editions-of-windows
title: Windows cannot find drivers for your Windows Phone on N & KN editions of Windows
category: tech
tags:
- Windows
- Windows Phone
---
Windows Phones, for example Nokia Lumia's work out of the box and do not require extra drivers as far as I know, unlike Android smartphones.

But on N and KN editions of Windows, when you connect your smartphone to the computer, you notice that your phone is not visible in 'Explorer' or 'My Computer'. But if you look a little further in 'Device Manager', you will see that Windows was not able to assign drivers. So you cannot transfer files by using your USB cable.


### Windows N & KN editions


If you are using a N or KN edition of Windows, you need to install the 'Media Feature Pack':

- Windows 7 SP1: [Media Feature Pack for Windows 7 N with Service Pack 1 and Windows 7 KN with Service Pack 1 (KB968211)](http://www.microsoft.com/en-us/download/details.aspx?id=16546)
- Windows 8: [Media Feature Pack for N and KN versions of Windows 8](http://www.microsoft.com/en-us/download/details.aspx?id=30685)
- Windows 8.1: [Media Feature Pack for N and KN versions of Windows 8.1](http://www.microsoft.com/en-us/download/details.aspx?id=42503)

**Note:** If you do not have a N or KN edition of Windows, make sure the checkbox is ticked of _'Media Features'_. To do this, open _'Control Panel > Programs and Features > Windows Features'_. Also make sure to check [Microsoft's article (KB2749484)](Microsoft's article KB2749484) for other solutions.

[![mediafeatures](](/assets/img/posts/thinkscopes/2014/08/mediafeatures.jpg)](](/assets/img/posts/thinkscopes/2014/08/mediafeatures.jpg)
