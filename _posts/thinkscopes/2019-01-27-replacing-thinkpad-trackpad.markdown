---
author: jonashendrickx
date: 2019-01-27 04:26:35+00:00
slug: replacing-thinkpad-trackpad
title: Replacing the Haswell ThinkPad TrackPad
category: lenovo
tags:
- Lenovo ThinkPad
---
The Haswell generation of ThinkPads had the worst TrackPads you can imagine. Lenovo decided to remove the dedicated TrackPad buttons, also known as dedicated TrackPoint buttons. In this article, we will explain how you can replace the TrackPad with a TrackPad that has 3 dedicated buttons.

## Getting the hardware maintenance manual

Before you start, it is recommended to check out the hardware maintenance manual first, so you can purchase the tools required to perform the job.

For the models below, the hardware maintenance manual (abbreviated HMM) is linked, so you have the official documentation available to replace the TrackPad.

Models:

  * ThinkPad T440: [HMM](https://download.lenovo.com/ibmdl/pub/pc/pccbbs/mobiles_pdf/t440_hmm_en_sp40a26000_01.pdf)
  * ThinkPad T440s: [HMM](https://download.lenovo.com/ibmdl/pub/pc/pccbbs/mobiles_pdf/t440s_hmm_en_sp40a25360_01.pdf)
  * ThinkPad T440p: [HMM](https://download.lenovo.com/ibmdl/pub/pc/pccbbs/mobiles_pdf/t440p_hmm_en_sp40a25467_01.pdf)
  * ThinkPad T540p: [HMM](https://download.lenovo.com/ibmdl/pub/pc/pccbbs/mobiles_pdf/t540p_w540_hmm_en_sp40a26003_01.pdf)
  * ThinkPad W540: [HMM](https://download.lenovo.com/ibmdl/pub/pc/pccbbs/mobiles_pdf/t540p_w540_w541_hmm_en_sp40a26003_02.pdf)
  * ThinkPad X1 Carbon Gen 2: [HMM](https://download.lenovo.com/pccbbs/mobiles_pdf/x1carbon_2_hmm_sp40a26110.pdf)

## Replacing the TrackPad

Open the hardware maintenance manual (HMM) you downloaded earlier. Look for the section that tells you how to remove the 'keyboard bezel assembly', 'palm rest' or 'keyboard assembly'.

The manual will mention the dependencies and screws that you will need to remove in order to remove the palm rest or keyboard assembly.

We did not mention the ThinkPad X240 as it is slightly different. It uses glue to keep the TrackPad in place. It will need to be carefully pried off its location.

## Installing the drivers

### Windows 10

Getting the new touchpad to work on Windows 10 can be a little bit problematic. Be aware that disabling 'digital driver signature enforcement' does come with some security risks. Below, we have mentioned that Ubuntu will work out of the box.

  1. Uninstall the existing Synaptics drivers.
  2. In the Cortana search bar, type '**Device Installation Settings**' and click at the search result that seems right to you.![Searching for Windows 10 'Device Installation Settings'.](/assets/img/posts/thinkscopes/2019/01/windows-10-device-installation-settings-search.jpg)
  3. In the dialog that appears select: '**No (your device may not work as expected)**' and click '**Save**'.![Windows 10: Device Installation Settings Dialog](/assets/img/posts/thinkscopes/2019/01/windows-10-device-installation-settings-modal.jpg)
  4. Download the latest T450 or W550 Synaptics driver from Lenovo [here](https://www.support.lenovo.com/).
  5. Execute the downloaded file to unpack the installation files. Make sure you click 'Finish' to prevent auto installation after it has finished unpacking.
  6. Edit the x64 synpd.inf file in notepad.
  7. Remove all lines that contain 'LEN0036'. (Shortcut Ctrl+F)
  8. Replace all instances of 'LEN200E' with "LEN0036'. (Shortcut Ctrl+H)
  9. Save the modified file.
  10. Restart Windows 10 into troubleshooting mode and select option 7 to disable driver digital signature enforcement.
You can also execute '**bcdedit.exe /set nointegritychecks on**' to disable it permanently.
  11. Reboot and run the Synaptics installer
  12. Ignore any warnings about digital signature verification and click '**Install anyway**'

### Ubuntu

On Ubuntu, it will work out of the box. No additional work is required.