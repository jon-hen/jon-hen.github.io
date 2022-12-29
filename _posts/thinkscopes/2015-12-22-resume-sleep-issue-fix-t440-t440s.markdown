---
author: fbohnacker
date: 2015-12-22 20:21:42+00:00
slug: resume-sleep-issue-fix-t440-t440s
title: Fix for an issue at the resume from sleep for T440(s)
category: lenovo
---
Some time ago, I wrote about [an UEFI update for multiple ThinkPads (T440 and T440s, for example) that addressed incursion vulnerabilities that allowed breaking into System Management Mode (SMM)](/blog/2015/10/17/fix-smm-incursion-attack-released-lenovo-laptops/).

Unfortunately, this update for T440 and T440s (version number 2.35) caused an issue where four cycles of 4 beeps occurred at the resume from standby mode if the security chip was enabled. While it was possible to solve the problem by disabling the security chip, it wasn't possible to perform a rollback to a previous UEFI version "for security improvement".

Lenovo pulled the update from their website after they noticed that the issue exists, but if you installed the update anyway, you had a problem until recently.

Some days ago, Lenovo released another UEFI update (version 2.36) that fixed the above-named issue.

You can download the BIOS update below:

  * [UEFI update utility](http://support.lenovo.com/us/en/products/Laptops-and-netbooks/ThinkPad-T-Series-laptops/ThinkPad-T440/downloads/DS035965)

  * [UEFI update bootable CD](http://support.lenovo.com/us/en/products/Laptops-and-netbooks/ThinkPad-T-Series-laptops/ThinkPad-T440/downloads/DS035967)

## Safety notes

  * If you are using the [UEFI update utility](http://support.lenovo.com/us/en/products/Laptops-and-netbooks/ThinkPad-T-Series-laptops/ThinkPad-T440/downloads/DS035965), do not turn off or suspend the computer until the update has been completed. IF YOU DO THAT WHILE THE UPDATE IS STILL IN PROGRESS, THE SYSTEM BOARD MAY HAVE TO BE REPLACED.
  * If you are using the [UEFI update bootable CD](http://support.lenovo.com/us/en/products/Laptops-and-netbooks/ThinkPad-T-Series-laptops/ThinkPad-T440/downloads/DS035967), do not turn off, suspend the computer or remove the UEFI UPDATE CD until the update has been completed. IF YOU DO THAT WHILE THE UPDATE IS STILL IN PROGRESS, THE SYSTEM BOARD MAY HAVE TO BE REPLACED.
  * Have a look at the [README](https://download.lenovo.com/pccbbs/mobiles/gjuj23us.txt) before flashing the UEFI!