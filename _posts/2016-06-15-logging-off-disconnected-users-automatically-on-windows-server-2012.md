---
title: Logging off disconnected users automatically on Windows Server 2012 R2
date: 2016-06-15T05:27:17-04:00
author: jonashendrickx
category: tech
---
The purpose of this article is to show you how to log off users automatically after being disconnected for a certain amount of time. Sometimes users or employees in your company may forget to log off from the server, and their user account remains logged in consuming precious CPU cycles and memory. For example a server with 4GB of RAM would have a memory usage of 89% with 2 disconnected users and 1 logged in user compared to 59% memory usage with just 1 user logged in. This will significantly affect system performance because the page file will be used more actively starting at 75% memory usage.

Rule of the thumb, if your memory usage is frequently too close to 75% all the time, I suggest upgrading your server. The instructions below should work for Windows Server 2008 R2 and later being:

  * Windows Server 2008 R2
  * Windows Server 2012
  * Windows Server 2012 R2

# Instructions

  1. Open the &#8216;**Group Policy Editor**&#8216; for your server.
  2. Navigate to: 
    <pre>Local Computer Policy / Computer Configuration / Administrative Templates / Windows Components / Remote Desktop Services / Remote Desktop Session Host / Session Time Limits</pre>

  3. Find the key &#8216;**Set time limit for disconnected sessions**&#8216;.
  4. By default it will have the value &#8216;Not configured&#8217;, change it to &#8216;**Enabled**&#8216;.
  5. Once the setting is set to &#8216;Enabled&#8217;, another field will become available in the lower left half of the window. Set &#8216;**End a disconnected session**&#8216; to the value you prefer. In my case I have set this to 8 hours, so a disconnected user is logged off after 8 hours.

**Note:** Setting the &#8216;End a disconnected session&#8217; time value too low, may cause your work to be lost if your network connection drops. So definitely don&#8217;t set this to &#8216;1 minute&#8217; or &#8216;5 minutes&#8217;.

&nbsp;