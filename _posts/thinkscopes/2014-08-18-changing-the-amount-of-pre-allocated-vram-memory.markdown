---
author: jinli
date: 2014-08-18 18:57:08+00:00
slug: changing-the-amount-of-pre-allocated-vram-memory
title: Changing the amount of pre-allocated vram memory
category: lenovo
tags:
- Lenovo ThinkPad
- Intel
---
If you have an integrated Intel GPU on the ThinkPad T440/T440p/T440s/X240/X1 Carbon/ThinkPad Yoga, etc (anything with Haswell CPU), you have the option to change the pre-allocated memory for your video card.

Unlike the dynamic video memory, where your graphics card dynamically allocate and deallocate the system ram for graphics use depending on the situation. The pre-allocated vram memory is locked memory, where your system will lock the amount memory allocated regardless of the tasks. So if you don't have much RAM (i.e. only 4 GB) installed in the system, it is best that you reduce the amount of pre-allocated VRAM from 512 MB to 256 MB.

You can do this through the BIOS menu, where you are given two choices for VRAM pre-allocation, 256 MB or 512 MB.




