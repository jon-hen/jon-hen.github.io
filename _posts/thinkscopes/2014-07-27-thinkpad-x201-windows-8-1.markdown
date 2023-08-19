---
author: jinli
date: 2014-07-27 15:43:47+00:00
slug: thinkpad-x201-windows-8-1
title: ThinkPad X201 & Windows 8.1
category: lenovo
tags:
- Lenovo ThinkPad
---
Got my first classic ThinkPad, and decided to use it only for Linux at first. But then I got tempted to install Windows 8.1 on it. What's a very portable laptop without Windows 8 or 8.1? It feels considerably faster than Windows 7 and easy to use on the go.


### Installation


I didn't run into any particular issues here. One screen was particularly messed up where the layout didn't really work well. Maybe this is due to the low display resolution of my ThinkPad X201 (1280x800) or maybe a graphics driver related issue. But I was still able to click my way out of the messed up screen and finding what I needed.


### Post-installation (drivers & software)


1. Wi-Fi drivers: these are the most important drivers for me. I went to [http://www.intel.com/](http://www.intel.com/) and downloaded the latest Intel ProSet drivers (16.11 at time of writing) and installed it.

2. ThinkVantage System Update: let it install at least:
- 'Intel Rapid Storage AHCI Driver'
- 'ThinkVantage Active Protection System' (if you have a HDD)
- 'ThinkVantage Fingerprint Software' (if you have a fingerprint reader)
- 'Lenovo Power Management Driver'

Then you should be good to go!

**NOTE:** If you experience 1 beep upon boot, shutdown, sleep, or waking up from sleep, you need to enter the BIOS, go to 'Config > Beep and alarm' and disable 'Power Control Beep' (Credits go to Jin Li for pointing me in this direction.)
