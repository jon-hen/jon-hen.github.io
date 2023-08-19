---
author: jonashendrickx
date: 2019-01-30 16:48:01+00:00
slug: black-screen-thinkvision-lt1423p-windows-10
title: Black screen using ThinkVision LT1423p on Windows 10
category: lenovo
tags:
- Lenovo ThinkVision
---
The ThinkVision LT1423p is a USB3.0 powered portable monitor by Lenovo. It is older than Windows 10, so while setting it up for the first time, we can expect things may not go smoothly. We plugged in the [ThinkVision LT1423p](/blog/2015/08/22/thinkvision-lt1423p-review/), and after the driver was done installing, all my screens were black.

We verified that this was occurring with both Windows 10 1803 and Windows 10 1809 (October Update). It is very likely that all other Windows 10 versions are affected as well.

## What is causing the black screen?

Windows 10 is automatically installing an outdated pre-production driver that was meant for Windows XP and Windows Visa with version number 7.6 or 7.8. Unfortunately, the WDDM (Windows Display Driver Model) has been updated several times already in the past decade, rendering outdated drivers useless.

![ThinkVision LT1423p Installation Wizard Windows 10](/assets/img/posts/thinkscopes/2019/01/thinkvision-lt1423p-installationwizard.jpg)

Since the introduction of Windows 10 in October 2015, the WDDM is being updated at an accelerated pace. You can read more about the Windows Display Driver Model on [Wikipedia](https://en.wikipedia.org/wiki/Windows_Display_Driver_Model) for a quick reference.

The WDDM:

  * WDDM 1.0: Windows Visa
  * WDDM 1.1: Windows 7
  * WDDM 1.2: Windows 8
  * WDDM 1.3: Windows 8.1
  * WDDM 2.0: Windows 10	
  * WDDM 2.1: Windows 10 1607 (Anniversary Update)
  * WDDM 2.2: Windows 10 1703 (Creators Update)
  * WDDM 2.3: Windows 10 1709 (Fall Creators Update)
  * WDDM 2.4: Windows 10 1803 	
  * WDDM 2.5: Windows 10 1809 (October Update)

## Reverting the old drivers

While your screens are black, hold the power buttons to force your computer to shutdown. Before starting your computer again, you may want to make sure the ThinkVision LT1423p is unplugged, otherwise Windows 10 will immediately start automatically installing and configuring the drivers for it again.

Verify in '**Programs & Features**' or '**Apps & Features**' that you have DisplayLink with version 7.6-7.8 installed. If that is the case, proceed. Otherwise you may be having a different issue. You can still continue with the instructions below, but it is not guaranteed it will solve your black screen or blank screen issues.

You are not required to uninstall the DisplayLink driver manually, instead move on, and install the latest DisplayLink driver. The older DisplayLink driver will be overwritten.

## Installing the correct drivers

Once you have made it back to Windows 10 perform the steps below to get your beloved external monitor working again:

  1. Visit the [DisplayLink website](https://www.displaylink.com/downloads).
  2. Download the latest Windows 10 driver or the appropriate driver for your Windows version.
  3. When the installation wizard is completed, verify the correct DisplayLink driver is installed in '**Programs & Features**' or '**Apps & Features**'.
  4. Plug in the ThinkVision LT1423p, and wait a few seconds to a minute for it to be configured for the first time.

If everything went well, you should not have a blank screen, nor should you be required to reboot your computer for it to work.

## Drive

The ThinkVision LT1423p also comes with 4 GB of on-board storage. You can replace the setup.exe file on the drive with the newer version.

Make sure the filenames match if you want the 'autorun.inf' to work correctly.