---
author: fbohnacker
date: 2014-11-14 22:56:17+00:00
slug: mobile-pwn2own-2014-is-windows-phone-more-secure-than-ios-or-android
title: 'Mobile Pwn2Own 2014: Is Windows Phone more secure than iOS or Android?'
category: tech
tags:
- Android
- Exploit
- Fire Phone
- Galaxy S5
- HP
- iOS
- Lumia 1520
- Nexus 5
- NFC
- Windows Phone
---
Hewlett Packard recently organized its yearly [Pwn2Own](http://www.pwn2own.com/) contest, where they reward security researchers for the discovery of security problems and possible exploits on mobile operating systems and platforms.

Nico Joly from [VUPEN Security](http://www.vupen.com/english/) was able to read out the cookie database on a Lumia 1520, but fortunately he failed to gain full control of the operating system because, [according to HP](http://h30499.www3.hp.com/t5/HP-Security-Research-Blog/Mobile-Pwn2Own-2014-The-day-two-recap/ba-p/6670234#.VGaCdMlyat8), the sandbox of Internet Explorer withstood the attack.

In contrast to the quite positive result for Windows Phone, there are **bad news** for **Android** and **iOS** Users:

Adam Laurie from Aperture Labs succeeded with his attack based on an exploit of two NFC-related bugs on a Google Nexus 5: according to [a blog entry](http://h30499.www3.hp.com/t5/HP-Security-Research-Blog/Mobile-Pwn2Own-2014-The-day-one-recap/ba-p/6669592#.VGaFDclyat8), he was able to force bluetooth pairing between two devices. Do you remember the TV show "Person of Interest"? ;)

Neither the Samsung Galaxy S5 nor the poorly-selling Amazon Fire Phone did withstand the attacks from other security researchers.

If you think Android is insecure, you'll laugh if I'll tell you that South Corean experts were able to execute a full Safari sandbox escape on an **iPhone 5S** - this means you'd be able to run any kind of malicious code.

But don't panic: as already practiced the years ago, all exploits are immediately disclosed to the affected companies, so you might see patches soon.

What do you think about mobile device security, especially when it comes to enterprise use? Please feel free to comment below.
