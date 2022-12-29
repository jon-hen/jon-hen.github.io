---
author: jonashendrickx
date: 2014-12-13 10:25:35+00:00
slug: getting-mobile-broadband-working-in-the-x1-carbon-2nd-gen
title: Getting mobile broadband working in the X1 Carbon 2nd gen
category: lenovo
---
I was having issues getting mobile broadband working on my ThinkPad X1 Carbon Gen 2. My mobile data provider is Mobistar in Belgium.

When my secondary SIM-card (data SIM) was in the X1 Carbon, I would be stuck at the PIN-code entering stage, and then it would eventually fail network authentication. Then all I was left with, was an error message saying that I couldn't be authenticated by the network.

Eventually Windows 8.1 would ask me to "Insert a SIM / No Service". Because apparently after entering my PIN-code it would fail to detect the inserted SIM-card, unless I completely shutdown my X1 Carbon and then restart it again.

I had two SIM cards at first:



  * Primary SIM-card: Is a Micro-SIM I manually cut to a nano SIM to get it to fit in my Nokia Lumia 930. With Dolphin 15.

  * Secondary SIM-card: Nano-SIM with Internet Everywhere 2GB.


These are the SIM-card formats for my devices:

  * Nokia Lumia 930: Nano-SIM

  * ThinkPad X1 Carbon: Micro-SIM


These were the combinations I tried:
<table >
<tbody >
<tr >

<td >Micro-SIM cut to Nano-SIM size with Micro-SIM frame
</td>

<td >ThinkPad X1 Carbon
</td>

<td >Works
</td>
</tr>
<tr >

<td >Micro-SIM cut to Nano-SIM size - Nokia Lumia 930
</td>

<td >Nokia Lumia 930
</td>

<td >Works
</td>
</tr>
<tr >

<td >Native Nano-SIM with Micro-SIM frame
</td>

<td >ThinkPad X1 Carbon
</td>

<td >Fail
</td>
</tr>
<tr >

<td >Native Nano-SIM
</td>

<td >Nokia Lumia 930
</td>

<td >Works
</td>
</tr>
</tbody>
</table>
**The solution?**

Get a native micro-SIM if you are having problems. Nano-SIMs are only 0.67mm thick, while micro-SIMs are 0.76mm thick. Then there are also differences in the SIM-card chip itself as you can see in the picture below. The black lines are different, and the micro-SIM chip is slightly larger as well. Getting a nano-SIM with plenty of adapters won't save your day or is not an all-round solution you can use because it appears to be conventient or simple.

[![X1C2-SIM-2](](/assets/img/posts/thinkscopes/2014/12/X1C2-SIM-2.jpg)](/assets/img/posts/thinkscopes/2014/12/X1C2-SIM-2.jpg) New native micro-SIM which I received.

[![X1C2-SIM-1](](/assets/img/posts/thinkscopes/2014/12/X1C2-SIM-1.jpg)](/assets/img/posts/thinkscopes/2014/12/X1C2-SIM-1.jpg) Old non-working nano-SIM with micro-SIM adapter frame.

[![X1C2-SIM-3](](/assets/img/posts/thinkscopes/2014/12/X1C2-SIM-3.jpg)](/assets/img/posts/thinkscopes/2014/12/X1C2-SIM-3.jpg) Notice how the chip of the micro-SIM is slightly larger compared to the nano-SIM. Also the black lines are slightly different. New micro-SIM on left and the old non-working nano-SIM with micro-SIM frame on the right.
