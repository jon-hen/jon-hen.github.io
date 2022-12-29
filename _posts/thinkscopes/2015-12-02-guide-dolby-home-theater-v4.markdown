---
author: 600x
date: 2015-12-02 10:00:35+00:00
slug: guide-dolby-home-theater-v4
title: 'Guide: Dolby Home Theater v4'
category: lenovo
---
### **Introduction**


This guide will show you how to install, set up and configure Dolby Home Theater v4. Before getting into all of that, let's take a look at what Dolby Home Theater is in the first place.


### **What is Dolby Home Theater v4?**


Most people will be vaguely familiar with the term Dolby. “Dolby Labs is an American company specializing in audio noise reduction and audio encoding/compression”. (Wikipedia, 2015)

Dolby Home Theater is simply a sound processing software developed by Dolby. It is designed to provide real time sound processing via the integrated soundcard of your computer. The software first appeared in 2010 in partnership with Acer notebooks and has since been featured on a variety of notebooks, including ThinkPads. A number of different versions have been released but this article will only focus on the unlocked version of the fully-fledged Dolby Home Theater v4.

The compatibility of this software stretches beyond the officially supported machines. From what I can deduce, it is dependent primarily on the soundcard, although this is yet to be proven. The earliest models that support this software are those that follow the _AC'99_ standard, making the T60 the first ThinkPad that will support it. The latest ThinkPads capable of running DHT v4 are the Ivy Bridge models such as the T430. On Haswell ThinkPads, Dolby does not function properly anymore.

Some of the key features (according to Dolby's own webpage) include:



 	
  * Authentic Dolby Surround Sound

 	
  * Simplified Home Theater Connections

 	
  * Consistent Volume Levels

 	
  * Increased Dialogue Clarity

 	
  * Distortion-Free Performance

 	
  * Total Audio Control


These are obviously rather vague terms that merely serve advertising purposes. Explaining how DHT works in depth would be too extensive, so I will focus on the more tangible main features. If you require more information, Dolby does provide very detailed explanations of their software in two pdf files on their [website](http://www.dolby.com/us/en/technologies/dolby-home-theater-v4.html). Click on the _Documents_ tab to access them. It's worth checking out their video as well, even though it is quite superficial.

At the heart of DHT lie several high quality software filters. These range from the _Audio Regulator_, to the _Optimizer_, to a regular _Equalizer_ and _Virtual Surround_ effects to name a few. There is a high level of compression involved with using DHT, so it only makes sense to activate it on internal speakers. The high levels of compression and audio regulation aid in eliminating distortions on internal speakers, regardless of the volume level, by analyzing the source material and taking care of any potential 'threats' (usually spikes).

Furthermore, an incredibly powerful 30 band equalizer called the _Optimizer_ will alter the tinny audio characteristics in favor of a warmer sound profile by emphasizing low and high frequencies while softening mid range frequencies. The _Audio Regulator_ and _Optimizer_ is where most of the magic happens. If you only use these core aspects of DHT, then compression levels will stay within a reasonable level.

However, you can go even further by activating an adaptive equalization profile, sound leveller and virtual surround as well as setting up a second 10 band equalizer in addition to the Optimizer. To retain some dynamic in music, I advise against this and will also provide a profile with a basic, non-intrusive setup later on.


### **Installation Preparations
**


First you will need to determine which group your ThinkPad belongs to. Use the following table as guidance. It is obviously not possible to include every single model in the grid, but I have tried to group as many similar products together by generation as possible.

[table id=2 /]

Afterwards you need to consider your operating system.

[table id=3 /]

Now you can determine your installation process.


### **Generation Instructions**





 	
  * On _**IBM Generation**_ ThinkPads, you need to install the standard audio driver from the Lenovo driver matrix before proceeding with the regular Dolby installation.

 	
  * On _**Lenovo Generation**_ machines, you need to uninstall the standard audio driver that was provided by Lenovo before proceeding with the regular Dolby installation.

 	
  * For machines with _**limited support**_, I recommend uninstalling the standard audio driver before installing DHT.

 	
  * For **_unknown_**_** machines**_, I also recommend uninstalling the standard audio driver before installing DHT.

 	
  * As for _**non-ThinkPads**_, I recommend installing the standard audio driver before installing DHT.

 	
  * ThinkPads that already come pre-installed with a stripped down version of DHT, such as the T420s and X1, definitely need to have their audio drivers completely removed.




### **Operating System Instructions**





 	
  * On Windows 7, proceed with the regular installation of Dolby.

 	
  * On Windows 8, you need to disable the forced driver signature prior to installing Dolby. To achieve this, hold down the shift key while clicking “restart”. While restarting you will be presented with several options. Press F7 to boot into a session that does not require driver signatures. Furthermore, make sure that you do not install Update KB2779768.




### **Dolby Installation Instructions**


1. You can download the 32-bit application [here](https://www.mediafire.com/?3otu3jqco2zzlne) and the 64-bit version [here](https://www.mediafire.com/?uyc3rpu6khjdl35).

Please choose the appropriate version for your OS. At this point I would also like to credit _PeterTWJ_ from the Lenovo forums. He provided us with the unlocked version of Dolby Home Theater v4. You can find his original thread [here](https://forums.lenovo.com/t5/General-Discussion/Dolby-Home-Theater-v4-for-most-Lenovo-Laptops/td-p/620229).

2. Extract the archive and run _DTPC.msi_. You will need administrator rights to do so.

[![0](/assets/img/posts/thinkscopes/2015/12/0.png)](/assets/img/posts/thinkscopes/2015/12/0.png)

3. Afterwards, follow the installation process as you normally would, making sure that you tick all the right boxes.

[![1](/assets/img/posts/thinkscopes/2015/12/1.png)](/assets/img/posts/thinkscopes/2015/12/1.png)

[![2](/assets/img/posts/thinkscopes/2015/12/2.png)](/assets/img/posts/thinkscopes/2015/12/2.png)

[![3](/assets/img/posts/thinkscopes/2015/12/3.png)](/assets/img/posts/thinkscopes/2015/12/3.png)

4. Once DHT has successfully completed the installation, click on the small icon in your task bar.

[![4](/assets/img/posts/thinkscopes/2015/12/4.png)](/assets/img/posts/thinkscopes/2015/12/4.png)

5. Click on settings.

[![5](/assets/img/posts/thinkscopes/2015/12/5.png)](/assets/img/posts/thinkscopes/2015/12/5.png)

6. Click _Import_ and navigate to the files you extracted from your archive and import the _Default.inx_ file; it contains the basic settings to get you started.

[![6](/assets/img/posts/thinkscopes/2015/12/6.png)](/assets/img/posts/thinkscopes/2015/12/6.png)

7. Finally, restart your system, then open DHT again and click on the _Profile_s tab and select _Default_.

[![7](/assets/img/posts/thinkscopes/2015/12/7.png)](/assets/img/posts/thinkscopes/2015/12/7.png)

Feel free to play around with the settings and create your own profiles. To reset everything simply import the _Default.inx_ file again. Leave any comments or questions you have below.


### **Bibliography**


Wikipedia, (2015). _Dolby Laboratories._ https://en.wikipedia.org/wiki/Dolby_Laboratories Accessed 1st December 2015.
