---
author: jinli
date: 2012-12-24 17:22:00+00:00
slug: raid-in-thinkpad-w530
title: RAID in ThinkPad W530
category: lenovo
tags:
- Lenovo ThinkPad
---
I recently acquired a ThinkPad W530 with the following specification.



  * i7-3720QM

  * 8 gigs of RAM (2 gigs x 4 slots)

  * 500 gigs Toshiba 7200 RPM 2.5 inch (9.5 mm)

  * 32 gigs of mSATA

  * Nvidia Quadro K2000m 2 gigs of VRAM

  * Serial Ultrabay Enhanced Optical Drive

  * 1920x1080 FHD LCD

  * SmartCard Reader

  * 9 cells battery

  * 2 x USB 3.0

  * 1 x USB 2.0 Always On

  * 1 x USB 2.0

  * 1 x mini Displayport

  * ExpressCard 34 Port

  * SD Card Reader

  * Gigabit Ethernet

  * 1 x VGA

  * 1 x FireWire port (which is a surprise)

  * 170 watts adapter (3 prongs)

  * Windows 8 Pro 64 bit


From the above list, you can see that i did not have the RAID option shipped from the factory.

<!-- more -->

[![ThinkPad W530 RAID option](http://farm9.staticflickr.com/8492/8301894527_410aa0a51c_z.jpg)](http://www.flickr.com/photos/lead_org/8301894527/)

So if you did not order the RAID option when you buy the ThinkPad W530 from Lenovo, can you still enable it aftermarket when you insert a new hdd drive the ultrabay caddy? The answer is NO. It seems Lenovo have two different motherboard (or at least two BIOS image) for RAID and non-RAID enabled ThinkPad W530 (like the W520).

In non-RAID enabled W530, there is no choice for RAID modes under the BIOS under configs -> SATA, you would only get either ACHI or Compatibility. While in RAID enabled W530, you get the choices of Compatibility, ACHI and RAID.

[![ThinkPad W530 without RAID](http://farm9.staticflickr.com/8214/8303066654_7555382208_z.jpg)](http://www.flickr.com/photos/lead_org/8303066654/) **ThinkPad W530 SATA option on non-RAID enabled machines**

[![ThinkPad with RAID option](http://farm9.staticflickr.com/8502/8303068634_b7d4758565_z.jpg)](http://www.flickr.com/photos/lead_org/8303068634/) **ThinkPad with factory enabled RAID option**


## Conclusion


If you need a W530 with RAID make sure you order the machine with the RAID option when you make the online order, it is not an option you can enable aftermarket.
