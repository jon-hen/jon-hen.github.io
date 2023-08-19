---
author: jinli
date: 2012-12-27 17:16:04+00:00
slug: thinkpad-w530-lcd-support-on-nvidia-quadro-k2000m-2100m
title: ThinkPad W530 LCD support on Nvidia Quadro K2000m (2100m)
category: lenovo
tags:
- Lenovo ThinkPad
---
So i have been testing the LCD support on my new ThinkPad W530 with Nvidia Quadro K2000m, and see how many external LCDs it can support concurrently.

According to Lenovo tabook:

[![ThinkPad W530 external LCD support](http://farm9.staticflickr.com/8494/8312685190_59311a202b_z.jpg)](http://www.flickr.com/photos/lead_org/8312685190/)

The ThinkPad W530 supports 3 LCD with maximum resolution of 3840x2160 on the Displayport Connection, 1920x1200 on the DVI-D connection of the Series 3 Plus Mini Dock, and 2048x1536 with VGA.

If you run the ThinkPad W530 with integrated GPU, then the laptop can support only the internal LCD, the external video connectors on the laptop and the dock do not work.

If you run the ThinkPad W530 on discrete GPU (Nvidia Quadro K1000m or K2000m), then you can do the following.



  * RUN 2 external LCD and 1 internal LCD from the W530 itself; one internal LCD at 1920x1080 (or HD/HD+ depending on configuration); one external LCD through the laptop's VGA port (2048x1536); one from the Displayport at 3840x1200)

  * Using a Series 3 Plus Mini Dock; one internal LCD at 1920x1080; 1 external LCD from the laptop's own miniDP port; 2 external LCD from the dock's Displayport.

  * All of the LCD are driven by the Nvidia Quadro GPU.


[![ThinkPad W530 supports 4 screen layout](http://farm9.staticflickr.com/8074/8309939699_a83557cf0e.jpg)](http://www.flickr.com/photos/lead_org/8309939699/)

If you run the ThinkPad W530 on Nvidia Optimus mode, then you can do the following.



  * RUN 2 external LCD and 1 internal LCD from the W530 itself; one internal LCD at 1920x1080 (or HD/HD+ depending on configuration); one external LCD through the laptop's VGA port (2048x1536); one from the Displayport at 3840x1200)

  * Using a Series 3 Plus Mini Dock; one internal LCD at 1920x1080; 1 external LCD from the laptop's own miniDP port; 2 external LCD from the dock's Displayport.

  * the internal LCD would be supported through the Intel HD 4000 GPU, and the 3 external LCD would be supported through the Quadro Nvidia GPU.


[![ThinkPad W530 screen support using optimus and dock connector layout](http://farm9.staticflickr.com/8079/8309940065_2215cc5941.jpg)](http://www.flickr.com/photos/lead_org/8309940065/)
