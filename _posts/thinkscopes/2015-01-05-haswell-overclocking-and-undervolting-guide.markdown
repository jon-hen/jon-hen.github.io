---
author: jonashendrickx
date: 2015-01-05 14:50:59+00:00
slug: haswell-overclocking-and-undervolting-guide
title: Haswell overclocking and undervolting guide
category: tech
---
This guide will show you how to overclock your Haswell CPU using Intel Extreme Tuning Utility or also known as Intel XTU.
 
 Note that overclocking is probably limited to 200MHz unless you use an unlocked processor.
 
 Use undervolting and overclocking with caution. Changing the voltage to be too low can cause problems and instability.
 
 Overvolting is very dangerous and not recommended. Note that Haswell is very sensitive to increasing voltages. This will greatly increase temperatures of the processor.
 
 Undervolting your processor can give you very satisfying results. First of all, power consumption and temperatures will be reduced. Now in addition to that, we all know processors have a TDP cap.
 
 The i7-4710MQ for example has a TDP cap of 47W. Now this limits our actual CPU performance. But this is more noticeable with Haswell-U processors that have a TDP cap of 15W. But as we know, undervolting reduces power, which in turn frees up a little bit of TDP headroom which might mean a slight increase of the processor multiplier or frequency in case the processor is being throttled by the TDP or firmware based TDP throttling.
 
 Let's get started.
 

# Creating a new overclock & saving to a profile


 


 	
  1.  Now go to 'Manual Tuning' on the left.
 [![oc_uv10](](/assets/img/posts/thinkscopes/2015/01/oc_uv10.jpg)](](/assets/img/posts/thinkscopes/2015/01/oc_uv10.jpg)

 	
  2. Now when increasing the CPU multipliers, also increase the processor cache ratio.

 	
  3. [![oc_uv11](](/assets/img/posts/thinkscopes/2015/01/oc_uv11.jpg)](](/assets/img/posts/thinkscopes/2015/01/oc_uv11.jpg)Now click **'Apply'**.

 	
  4. On the right, click **'Save'**.

 	
  5. [![oc_uv12](](/assets/img/posts/thinkscopes/2015/01/oc_uv12.jpg)](](/assets/img/posts/thinkscopes/2015/01/oc_uv12.jpg)Enter a name for your profile. In my example **'OC'**.

 	
  6. [![oc_uv13](](/assets/img/posts/thinkscopes/2015/01/oc_uv13.jpg)](](/assets/img/posts/thinkscopes/2015/01/oc_uv13.jpg)Now more to the next part of this guide to use this profile.

 
 

# How to make the settings stick upon reboot


 There are generally two ways to do this. The recommended way is to use 'App-profile pairing' using Intel XTU.
 

## Using Intel XTU


 I noticed it is not possible to keep a permanent profile active. Intel XTU only applies a profile, if the application is running in the foreground. Which means the profile is only applied if the application is the active window on your screen.
 
 In the example below, if I run ArmA 3 and I am playing, the profile will be applied. But as soon as I minimize or alt-tab out of the game, the profile will be released and is reset to default settings.
 
 Now let's apply an overclocking profile on ArmA 3.
 


 	
  1. Using the created profiles from previous part of this guide, we are now going to apply them. Choose **'App-profile pairing'**.

 	
  2. Click **'Turn on'** so it looks like the screenshot below. Doing this will enable app profile pairing.
 [![oc_uv8](](/assets/img/posts/thinkscopes/2015/01/oc_uv8.jpg)](](/assets/img/posts/thinkscopes/2015/01/oc_uv8.jpg)

 	
  3. Now in the first column we choose an application again. Use the **'Browse...'** button to browse for ArmA 3 or your preferred application or game.

 	
  4. Then click **'Save'** again in the file selection dialog when you are done.

 	
  5. At **'Choose Profile in AC Power mode'**, select your overclocking profile, in my case 'OC'.

 	
  6. At **'Choose Profile in Battery mode'** select 'No profile pairing'.

 	
  7. Click **'Pair'**.
 [![oc_uv6](](/assets/img/posts/thinkscopes/2015/01/oc_uv6-1024x530.jpg)](](/assets/img/posts/thinkscopes/2015/01/oc_uv6.jpg)

 
 Now it should look like this:
 
 [![oc_uv7](](/assets/img/posts/thinkscopes/2015/01/oc_uv7-1024x530.jpg)](](/assets/img/posts/thinkscopes/2015/01/oc_uv7.jpg)
 

## Using Windows 8.x


 Not that your settings can still be lost upon reboot, which clears the hibernation file. Windows fast startup is actually just Windows hibernating (saving everything into a hibernation file) and then just restoring it upon starting your computer. Restarting it resets everything.
 
 But this part allows you to apply a profile which sticks upon reboot, although it is not guaranteed to always work.
 
 With Windows 8 and Windows 8.1 you can use fast start up which you can find in two ways:
 


 	
  1. Right-click the start orb in the bottom left corner.

 	
  2. Choose **'Power Options'**.

 	
  3. Now click **'Choose what the power buttons do'** at the new window.

 
 or
 
 	
  1. Right-click the battery icon in the system tray.

 	
  2. Choose 'Power Options'.

 	
  3. Now click **'Choose what the power buttons do'** at the new window.

 
 [![oc_uv1](](/assets/img/posts/thinkscopes/2015/01/oc_uv1-943x1024.jpg)](](/assets/img/posts/thinkscopes/2015/01/oc_uv1.jpg)
 
 Click **'Save changes'** when you are done.
 

# Supported processors


 

## Overclocking


 Processors that do not support Intel Turbo Boost are not supported.
 


 	
  * Haswell:
 
 	
    * Intel Core i5

 	
    * Intel Core i7

 
 

 
 

## Undervolting


 


 	
  * Haswell

 
