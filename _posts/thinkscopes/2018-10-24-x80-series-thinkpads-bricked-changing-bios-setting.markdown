---
author: jonashendrickx
date: 2018-10-24 10:22:01+00:00
slug: x80-series-thinkpads-bricked-changing-bios-setting
title: x80-series ThinkPads bricked by changing a BIOS setting
category: lenovo
---
After installing Ubuntu could brick ThinkPads, it looks like we are getting another round of UEFI/BIOS issues on ThinkPads. Several models in the current ThinkPad lineup can be bricked by enabling the BIOS setting '**BIOS Support for Thunderbolt**' or '**Thunderbolt BIOS Assist**'. After changing this setting, there is a huge chance the machine will hang upon rebooting.

Affected machines will only display a black or blank screen, meaning the UEFI firmware is corrupted and no compatible UEFI drivers can be loaded.

Based on user reports, we found that the following ThinkPads are affected:



 	
  * ThinkPad P1

 	
  * ThinkPad P52

 	
  * ThinkPad P52s

 	
  * ThinkPad P72

 	
  * ThinkPad X1 Yoga (2018)


Possibly AMD-based ThinkPads are not affected, but not ruled out.

Please note that Lenovo is aware of the issue and is currently working on a solution. It is advisable to not touch this setting until a BIOS update is available.


## References





 	
  * https://forums.lenovo.com/t5/ThinkPad-X-Series-Laptops/Thinkpad-X1-Yoga-3rd-Gen-Stuck-at-Black-Screen-After-Enabling/td-p/4106952

 	
  * https://forums.lenovo.com/t5/ThinkPad-P-and-W-Series-Mobile/Lenovo-P52-bricked-by-selecting-BIOS-thunderbolt-support-for/td-p/4207538


https://www.reddit.com/r/thinkpad/comments/9nb3zo/new_thinkpad_p72_biosuefi_corrupted_just_black/

https://www.reddit.com/r/thinkpad/comments/9qmqd2/thinkpad_p1_serious_issue_with_bricked_bios/
