---
author: jonashendrickx
date: 2015-08-28 15:15:21+00:00
slug: cannot-establish-remote-desktop-connection
title: Cannot establish remote desktop connection
category: tech
---
If you have already connected with the server or remote desktop endpoint you are trying to connect to. You might find it quite troublesome to try to connect to the server or remote desktop again. Because 'Remote Desktop Connections' doesn't allow you to delete an existing connection or saved connection using the user interface or 'Remote Desktop Connections' application.

What we need to do is follow the tutorial described [here](https://support.microsoft.com/en-us/kb/312169). Or follow the tutorial below:

The list of all destination connections (including previous connections) are stored in an MRUnumber value in the following registry key:

    
    HKEY_CURRENT_USERSoftwareMicrosoftTerminal Server ClientDefault


Every new connection is given the value of MRU0, and the other values are then sequentially moved down in number. The MRU value can contain a Fully Qualified Domain Name or an IP address of the computer to which you connect.

For example:

    
    MRU0 REG_SZ 192.168.16.60
    MRU1 REG_SZ computer.domain.com


Delete the key for the computer that you are failing to connect to.

Then in the registry, also find the folder named after the IP or Fully Qualified Domain Name at this location:

    
    HKEY_CURRENT_USERSoftwareMicrosoftTerminal Server ClientServers


Delete the folder named after the IP or Fully Qualified Domain Name, for example:

    
    192.168.16.60


Then open the 'Remote Desktop Connections' application again and re-enter all your login information and it should work again.
