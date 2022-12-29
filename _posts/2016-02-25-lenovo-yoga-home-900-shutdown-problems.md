---
title: Lenovo Yoga Home 900 shutdown problems
date: 2016-02-25T09:00:02-05:00
author: jonashendrickx
category: lenovo
---
The Lenovo Yoga Home 900 I received from the Lenovo forums has been having shutdown problems. If you shut down the Yoga Home 900, the fan will keep spinning and the power LED will stay lit.

It appears that there is a power management problem with Intel Management Engine Interface.

Follow these steps to get rid of this problem:

  1. Right-click the start orb in the left hand corner in Windows 10
  2. Click **Device Manager**
  3. Expand section **System Devices**
  4. Right-click **Intel Management Engine Interface**
  5. Open the **Power Management** tab
  6. Uncheck **Allow the operating system to turn off this device to save power**
  7. Reboot