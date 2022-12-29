---
author: jinli
date: 2012-12-04 17:24:29+00:00
slug: switching-thinkpad-graphics-card-in-bios-menu
title: Switching ThinkPad graphics card in BIOS menu
category: lenovo
---
So someone sent me an email asking me how to switch the graphics card in the ThinkPad T430u equipped with the Nvidia GPU (the principle is the same for other ThinkPad with switchable graphics card).

For those whom do not know how to do it, follow these simple steps.

1. Boot up the laptop, and immediately press F1 rapidly for couple of times. If you are successful, you will be presented with the BIOS menu. If not, shut the laptop down and repeat the steps again.

[![ThinkPad T430u BIOS menu-1](http://farm9.staticflickr.com/8480/8243224771_d5cf189865_m.jpg)](http://www.flickr.com/photos/lead_org/8243224771/)

2. Now there is a tab of options on the top of the BIOS menu, press the left and right to move through the options. The tab options you want to select is 'Config', select it and then press Enter key.

[![ThinkPad T430u BIOS menu-2](http://farm9.staticflickr.com/8343/8243223887_f393d985b9_m.jpg)](http://www.flickr.com/photos/lead_org/8243223887/)

3. Once you are in 'Config', select the 'Display' options and press Enter.

[![ThinkPad T430u BIOS menu-3](http://farm9.staticflickr.com/8350/8244290666_d6dbb3067f_m.jpg)](http://www.flickr.com/photos/lead_org/8244290666/)

4.Now you are in the Display property menu, you should select Graphics Device option, and press Enter. This will cause the drop down menu to pop out, which has integrated graphics and Nvidia Optimus options, make sure you select Integrated Graphics and then press Enter.

[![ThinkPad T430u BIOS menu-3](http://farm9.staticflickr.com/8350/8244290666_d6dbb3067f_m.jpg)](http://www.flickr.com/photos/lead_org/8244290666/)

5.There is another option you need to change, which is the 'OS Detection For Nvidia Optimus', make sure it is in Disabled mode. Otherwise the Windows OS will change the graphics to Nvidia Optimus everytime you restart the OS.

[![ThinkPad T430u BIOS menu 4](http://farm9.staticflickr.com/8341/8244294060_e465ce783a_m.jpg)](http://www.flickr.com/photos/lead_org/8244294060/)

6. Finally press 'Save and Exit'.
