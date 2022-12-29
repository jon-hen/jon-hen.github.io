---
author: jonashendrickx
date: 2014-08-28 13:58:51+00:00
slug: how-to-enable-f8-key-to-go-into-safe-mode-upon-boot-for-windows-8-and-later
title: How to enable F8 key to go into safe mode upon boot for Windows 8 and later.
category: tech
---
Many of you remember that we used to press F8 upon boot to go into safe mode. With Windows 8 and later this is disabled by default to reduce boot times.

To enable this again to allow pressing F8 upon boot:



  1. Left-click the bottom left of your screen where the start orb is or used to be.

  2. Open **'Command Prompt'** as administrator.

  3. Type _'bcdedit /set {default} bootmenupolicy legacy'_

  4. Reboot.


To undo this:

  1. Left-click the bottom left of your screen where the start orb is or used to be.

  2. Open **'Command Prompt'** as administrator.

  3. Type _'bcdedit /set {default} bootmenupolicy standard'_

  4. Reboot.


Now your computer will boot slightly slower, but you will be able to access safe mode and other legacy boot options faster if you need it.
