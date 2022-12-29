---
author: jonashendrickx
date: 2015-01-22 15:05:20+00:00
slug: how-to-update-firmware-of-sierra-wireless-7345-4g-lte
title: How to update firmware of Sierra Wireless 7345 4G LTE
category: tech
---
If you have been trying to update the firmware of the Sierra Wireless 7345 4G LTE without any luck or you couldn't find a *.flz firmware file. You are probably wondering how it is possible how to flash new firmware.

My firmware version of my Sierra Wireless 7345 4G LTE was **FIH7160_v1.1_modem_01.1349.12**.

However this version has a few bugs with the following symptoms:



  * Sierra Wireless 7345 4G LTE is disappearing and reappearing again in 'Device Manager' when connected to a network with the WWAN card. This does not happen when you are not connected to a cellular network.

  * Sierra Wireless 7345 4G LTE is frequently disconnecting or you are experiencing connection dropouts.

  * The symptoms above occur in both Linux and Windows.


Now let's get started.

  1. Start M.2 WWAN Firmware updater.

  2. Write down your **'Home Provider ID'**. If this is empty, you need to insert a SIM card, and enter a PIN code to connect to a cellular network. Then take a note of the 'Home Provider ID' before the connection is lost and the network adapter is removed.
[![sierrawireless7345_1](](/assets/img/posts/thinkscopes/2015/01/sierrawireless7345_1.jpg)](](/assets/img/posts/thinkscopes/2015/01/sierrawireless7345_1.jpg)

  3. Your **'Home Provider ID'** may consist of either 5 or 6 digits. If it is 5 digits long, split the ID in 3 and 2 digits. If it is 6 digits long, split it in 3 and 3 digits. The first 3 digits is what we call the MCC, the last 2 or 3 digits is called the MNC.In my case, my Home Provider ID is 20610, which becomes MCC = 206 and MNC = 10.

  4. Now open **'Windows Explorer'** and navigate to the directory where the Sierra Wireless software is installed:

    * For 64-bit Windows: **_"C:Program Files (x86)Sierra Wireless IncMBIM ToolkitDPINSTx64"_**

    * For 32-bit Windows: ...




  5. Open the file **'FLSInformation.xml'**. It will look like in the screenshot below:
[![sierrawireless7345_2](](/assets/img/posts/thinkscopes/2015/01/sierrawireless7345_2.jpg)](](/assets/img/posts/thinkscopes/2015/01/sierrawireless7345_2.jpg)

  6. Now we need to add our Home Provider ID (MCC and MNC) to this list. Add the following near the end of the file. Replace the MCC code and MNC code in bold with those from your provider:


<blockquote><FLSImage name="FIH7160_V1.2_WW_01.1415.07_NAND.fls"> <MCC>**206**</MCC> <MNC>**10**</MNC> </FLSImage></blockquote>


[![sierrawireless7345_3](](/assets/img/posts/thinkscopes/2015/01/sierrawireless7345_3.jpg)](](/assets/img/posts/thinkscopes/2015/01/sierrawireless7345_3.jpg)

  7. Save your changes and reboot.

  8. The firmware will be flashed automatically in the background next time you start Windows. Then if done correctly, **'M.2 WWAN Firmware Updater'** will show the new firmware version from your entry in** 'FLSInformation.xml'**.


