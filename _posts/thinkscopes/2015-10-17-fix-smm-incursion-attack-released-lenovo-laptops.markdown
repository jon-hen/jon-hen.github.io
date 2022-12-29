---
author: fbohnacker
date: 2015-10-17 17:27:50+00:00
slug: fix-smm-incursion-attack-released-lenovo-laptops
title: Fix for SMM "Incursion" attack for some Lenovo laptops
category: lenovo
---
Some Lenovo machines contained incursion vulnerabilities that allow breaking into System Management Mode (SMM). While most recent ThinkPads are affected, there are also some affected consumer machines.

Lenovo describes the vulnerabilities as follows:


<blockquote>Some BIOS implementations permit unsafe System Management Mode (SMM) function calls to memory locations outside of System Management RAM (SMRAM). An attacker can exploit these calls to bypass Secure Boot, read/write system memory, or overwrite, modify, or corrupt the BIOS.</blockquote>


Luckily, Lenovo released new UEFI versions addressing that vulnerability for some machines while they plan to release patches for other affected machines in the near future.

**Almost all Ivy Bridge, Haswell and Broadwell ThinkPads as well as some AMD-based ThinkPads are affected.**

For a full list of the affected machines and a link to the respective UEFI update for your machine, please have a look at https://support.lenovo.com/de/de/product_security/smm_attack.

**Please keep in mind:**



  * If you are using the UEFI update utility, do not turn off or suspend the computer until the update has been completed.  IF YOU DO THAT WHILE THE UPDATE IS STILL IN PROGRESS, THE SYSTEM BOARD MAY  HAVE TO BE REPLACED.

  * If you are using the UEFI update bootable CD, do not turn off, suspend the computer or remove the UEFI UPDATE CD until  the update has been completed. IF YOU DO THAT WHILE THE UPDATE IS STILL  IN PROGRESS, THE SYSTEM BOARD MAY HAVE TO BE REPLACED.

  * Have a look at the README before flashing the UEFI!


If you want to know more about the vulnerability, please have a look at this presentation: http://www.legbacore.com/Research_files/HowManyMillionBIOSWouldYouLikeToInfect_Full2.pdf
