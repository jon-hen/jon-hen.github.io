---
author: jonashendrickx
date: 2015-01-05 14:51:44+00:00
slug: how-to-fix-intel-centrino-7260-wireless-ac-latency-spikes-lag
title: How to fix Intel Centrino 7260 Wireless-AC latency spikes, lag
category: tech
---
If you have a WLAN adapter that supports U-APSD, you may have noticed you are having performance issues or latency spikes when playing games or pinging IP-addresses.
 
 Now I confirmed these latency spikes by pinging my access point or gateway 100 times (see screenshot in red).
 
 [![w540-wifi](](/assets/img/posts/thinkscopes/2015/01/w540-wifi-793x1024.jpg)](](/assets/img/posts/thinkscopes/2015/01/w540-wifi.jpg)
 
 Now you can fix this by:
 


 	
  1. Right-click the start orb in the bottom left corner.

 	
  2. Open **'Device Manager'**.

 	
  3. Right-click the **'Intel Dual Band Wireles-AC 7260'**.

 	
  4. Choose **'Properties'**.

 	
  5. Disable **'U-APSD'**.

 	
  6. And click **'Ok'**.

 
 After that you can test again in command prompt if this worked by typing:
 
 **'ping -n 100 192.168.1.1'**
 
 Or ping the IP from Google:
 
 **'ping -n 100 8.8.8.8'**
 
  
 
 The most important thing is that your ping shouldn't fluctuate as shown in red in the screenshot above. It should be more stable as shown in blue.
 
 Affected WLAN adapters:
 


 	
  * Intel Dual Band Wireless-AC 7260

 	
  * Intel Dual Band Wireless-AC 7265

 	
  * Intel Dual Band Wireless-N 7260

 
 Other WLAN adapters that have U-APSD enabled by default may be affected as well.
