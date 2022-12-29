---
author: jinli
date: 2012-12-24 17:20:38+00:00
slug: how-to-switch-gpu-graphics-mode-in-the-thinkpad-w530-and-w520
title: How to switch GPU (graphics) mode in the ThinkPad W530 and W520
category: lenovo
---
The easiest way to force ThinkPad W520 and ThinkPad W530 to run with only Nividia discrete or Intel integrated GPU, is to do it through the laptop's BIOS menu. ThinkPad W520 and W530 BIOS menu allows the user to switch between Nvidia Optimus, Integrated Graphics, and Discrete Graphics.

[![ThinkPad W530 display option](http://farm9.staticflickr.com/8084/8304636720_34ce1a3c6a_z.jpg)](http://www.flickr.com/photos/lead_org/8304636720/) **ThinkPad W530 BIOS display devices option**



You can access the Display Options by:

1. Pressing F1 (if you are running windows 7  in legacy boot mode) or Enter (if you are running in UEFI mode and then F1 when options menu pops up).

2. Select Config option tab

3. Select Display option

4. OS Detection for Nvidia Optimus select 'Disabled' 

5. In the Graphics Device, select your choice of GPU.



  * Integrated Graphics -> Intel HD 3000 (ThinkPad W520 with Sandy Bridge Processor) or Intel HD 4000 (ThinkPad W530 with Ivy Bridge Processor).

  * Discrete GPU -> Nvidia Quadro GPU

  * Nvidia Optimus -> Computer will switch automatically between Intel integrated GPU and Nvidia Discrete GPU depending on need.


6. Press F10 to save and exit. 
