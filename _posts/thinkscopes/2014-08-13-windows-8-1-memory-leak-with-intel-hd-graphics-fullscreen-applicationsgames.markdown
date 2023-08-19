---
author: jonashendrickx
date: 2014-08-13 19:03:17+00:00
slug: windows-8-1-memory-leak-with-intel-hd-graphics-fullscreen-applicationsgames
title: Windows 8.1 Memory leak with Intel HD Graphics & fullscreen applications/games
category: tech
tags:
- Windows
- Intel
---
### 1. Description

Recently Intel & Microsoft acknowledged a memory leak when playing fullscreen games or using a fullscreen application using a different display resolution and/or refresh rate than your desktop's display resolution. As shown in the screenshot below, you can see that the 'pagefile usage' gradually increases untill you get a dialog saying "Low on memory", prompting to close your game / 3D application.

To know if you are affected you can use 'System Explorer', and monitor the swap file usage. A smaller page file is more likely to trigger the 'low on memory' message faster. Do not increase the page file to a very high capacity. It will not help.

In the screenshot below you can see that the bug was triggered while a affected game or 3D application was active in fullscreen with a different display resolution than the desktop was running at in Windows 8.1.  
Suddently the pagefile usage decreases, this happens when alt-tabbing out the game or 3D application.

[![windows81_memoryleak_intel_msiafterburner](](/assets/img/posts/thinkscopes/2014/08/windows81_memoryleak_intel_msiafterburner.jpg)](](/assets/img/posts/thinkscopes/2014/08/windows81_memoryleak_intel_msiafterburner.jpg)

 

### Requirements

These are the hardware requirements and operatings affected by the bug. You must meet one of the hardware configurations mentioned in #1.2 and the operating system(s) mentioned in #1.2.

####  

#### 2.1. Hardware configuration

Nvidia Optimus (with Intel CPU)  
Intel HD Graphics  
AMD Dynamic Switchable Graphics (with Intel CPU)

####  

#### 2.2. Operating systems

Windows 8.1

 

### 3. Solution

1. Righ-click the start orb, and open **'Control Panel'**.  
2. Open **'Windows Update'** and check for new 'Windows Updates'.  
3. If there are no new 'Windows Updates', verify that **['August 2014 update rollup for Windows RT 8.1, Windows 8.1, and Windows Server 2012 R2 (KB2975719)'](http://support.microsoft.com/kb/2976943/en-us)** is installed by clicking on **'View Update History'**.

The actual Windows Update or hotfix that fixes this bug is [KB](http://support.microsoft.com/kb/2976943/en-us)[2976943](http://support.microsoft.com/kb/2976943/en-us).

### 4. Sources

Intel: [https://communities.intel.com/thread/49139](https://communities.intel.com/thread/49139)

Microsoft: [http://answers.microsoft.com/en-us/windows/forum/windows8_1-gaming/windows-81-x64-low-memory-while-playing-full/e4602805-a1e1-4704-b006-92f43247b9e8](http://answers.microsoft.com/en-us/windows/forum/windows8_1-gaming/windows-81-x64-low-memory-while-playing-full/e4602805-a1e1-4704-b006-92f43247b9e8)
