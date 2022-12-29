---
author: jonashendrickx
date: 2014-10-05 12:21:50+00:00
slug: why-microsoft-skipped-windows-9-and-chose-windows-10-for-its-next-os
title: Why Microsoft skipped Windows 9, and chose Windows 10 for its next OS.
category: tech
tags:
- Microsoft
- Windows 10
- Windows 9
---
If we start counting Microsoft's past Windows operating systems, then we already have 9 generations. Many people seem to forget that Windows 8.1 should be considered to be an independent operating system. I am not going to start a discussion here about leaving out MS-DOS versions. Let us just focus on Windows right now.




But let's just put Windows 7 & Windows Server 2008 R2 as the 7th Windows generation. And start counting down, it all makes sense as we find our way down to Windows 3.1 being the 1st Windows generation, right? Let's start counting up and we find Windows 8  & Windows Server 2012 as the 8th Windows generation, followed by Windows 8.1 & Windows Server 2012 R2, offered as a free update to Windows 8 users.




# Why is Windows 8.1 to be considered Windows 9?




Windows 8.1 is actually a free Windows upgrade to Windows 8 users, because many of the Windows 8 users were not happy with the new user experience of Windows 8. But Microsoft decided to name it Windows 8.1, probably because they wanted their customers to know they were going to improve the user experience of Windows 8, trying to make it better, fixing the holes in the roof. So the unhappy Windows 8 users still had a warm home.




But Windows 8.1 requires a complete upgrade to be installed on a Windows 8 computer, and is not to be considered a simple small update. So technically Windows 8.1 is Windows 9. If you feel this is not true, feel happy to correct my point of view. Technically this makes it an independent operating system version as it does not rely on Windows 8.




# Microsoft's advantage




But the advantage to Microsoft as acknowledging Windows 8.1 as their 9th Windows operating system is that they skipped one version number by naming their next Windows operating system Windows 10.




Everyone and the media decides to start making free jokes about it, that Microsoft makes no sense at all. But in fact Microsoft does make sense here.




Now they enjoy extra media attention they much deserved. They worked really hard trying to keep the good things that were introduced with Windows 8 alive, and they may have finally perfected the design with Windows 10. You can download the Windows 10 Preview as a [Windows Insider](https://insider.windows.com/). And decide for yourself.




Do you think it's still weird? Microsoft made a good move by naming their next operating system Windows 10, kudos to the person who came up with the idea (if this theory is correct).




There are a lot of different theories out there on the internet, what do you think about this one? Have you tried out Windows 10 on your Lenovo machine? What are your first impressions?






  * Windows 3.1


  * Windows 95


  * Windows 98


  * Windows ME


  * Windows XP


  * Windows Vista - Windows Server 2008


  * Windows 7 - Windows Server 2008 R2


  * Windows 8 - Windows Server 2012


  * Windows 8.1 - Windows Server 2012 R2


  * Windows 10




# The coding problem theory




[![Capture](](/assets/img/posts/thinkscopes/2014/10/Capture.jpg)](](/assets/img/posts/thinkscopes/2014/10/Capture.jpg)







The coding problem theory well, the above screenshot will tell you everything you need to know. I think even a regular person can understand what is written there. Technically the code is checking if the operating system's name starts with _Windows 9_ to check if it's running Windows 95 or Windows 98. Do we have to blame lazy (Java) programmers that don't know how to use [regular expressions](http://docs.oracle.com/javase/tutorial/essential/regex/)? Why didn't those Java programmers use _System.getProperty("os.version");_ instead? Which returns the kernel version of the operating system:






  * Windows XP: 5.1


  * Windows Vista: 6.0


  * Windows 7: 6.1


  * Windows 8: 6.2


  * Windows 8.1: 6.3




_os.version_ is always unique... So dear programmers, when you want to check which operating system you are running, keep this in mind.
