---
author: jonashendrickx
date: 2019-01-09 11:56:01+00:00
slug: hscrollfun-exe-crashing-with-visual-studio
title: ThinkPad Compact Keyboard driver HScrollFun.exe crashing with Visual Studio
category: lenovo
---
When plugging in a ThinkPad Compact Keyboard while Visual Studio is running, you may find that the middle TrackPoint (<del>mouse</del>) button scroll stops working with a small delay. The scrolling will continue to work fine however, as long as you don't open Visual Studio.

I discovered in the Windows Event Viewer, that a few errors were being thrown.

  1. Open 'Windows Event Viewer'.
  2. Expand the 'Windows Logs' folder in the navigation pane.
  3. Open 'Application'. 	
  4. Look for the error around the time the scrolling functionality stopped working.

You will find something like this:
    
    Faulting application name: HScrollFun.exe, version: 1.3.0.0, time stamp: 0x58ec7b76
    Faulting module name: HScrollFun.exe, version: 1.3.0.0, time stamp: 0x58ec7b76
    Exception code: 0xc0000409
    Fault offset: 0x00005caa
    Faulting process id: 0x2e50
    Faulting application start time: 0x01d4a7edba25b0ad
    Faulting application path: C:\Program Files (x86)\Lenovo\ThinkPad Compact Keyboard with TrackPoint driver\HScrollFun.exe
    Faulting module path: C:\Program Files (x86)\Lenovo\ThinkPad Compact Keyboard with TrackPoint driver\HScrollFun.exe
    Report Id: 6e0117e8-327d-41c7-bb7c-0c07a80ff0db
    Faulting package full name: 
    Faulting package-relative application ID: 
    
Now we know what is going on. But we still don't know what is causing it. So I turned to Google, what any nerd would do. With the right keywords, you can do anything.

Eventually I figured out the solution:

  1. Open the '**Mouse Properties**' window.
  2. Navigate to the '**External Keyboard**' tab.
  3. Uncheck '**ThinkPad Preferred Scrolling**'. 	
  4. Hit '**Apply**'.

![](/assets/img/posts/thinkscopes/2019/01/mouseproperties_thinkpadpreferredscrolling-385x512.jpg)