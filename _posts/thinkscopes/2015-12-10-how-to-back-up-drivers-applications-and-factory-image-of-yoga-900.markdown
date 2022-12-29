---
author: jonashendrickx
date: 2015-12-10 22:53:55+00:00
slug: how-to-back-up-drivers-applications-and-factory-image-of-yoga-900
title: How to back-up drivers, applications and factory image of Yoga 900?
category: lenovo
---
With this article, we will help you backing up and restoring drivers, applications, wallpapers and the factory OEM image that came with your Yoga 900.


# Backing up drivers & applications


The drivers and applications are stored on the 4th partition of the SSD. The partition is about 25GB in size on the 256GB SSD model.

What we first need to do is map the recovery partition to a drive letter. After that we can open it in Windows Explorer to copy the files to an external hard drive.



  1. Right-click the '**Start**' orb on your taskbar in the bottom left corner.

  2. Choose '**Command Prompt (Admin)**'.

  3. Type: '**diskpart**'.

  4. Select the primary disk by typing: '**select disk 0**'. (You can list the available disks by typing 'list disk').

  5. Select the 4th partition by typing: '**select part 4**'. (You can list the available partitions by typing 'list part').

  6. Now enter '**assign**' to assign a drive letter to the partition and mount it.

  7. Open '**Windows Explorer**' and look for the mounted partition.

  8. Copy all drivers and applications to an external hard drive.




# Backing up the factory image


Now we will learn how to back-up the install.wim file of the Yoga 900, and learn how to use it to restore from it later in time.



  1. Right-click the '**Start**' orb on your taskbar in the bottom left corner.

  2. Choose '**Command Prompt (Admin)**'.

  3. Type: '**diskpart**'.

  4. Select the primary disk by typing: '**select disk 0**'. (You can list the available disks by typing 'list disk').

  5. Select the 4th partition by typing: '**select part 6**'. (You can list the available partitions by typing 'list part').

  6. Now enter '**assign**' to assign a drive letter to the partition and mount it.

  7. Open '**Windows Explorer**' and look for the mounted partition.


Restoring the factory image is different. 'recimg.exe' is gone in Windows 10, it was replaced by 'reagentc.exe'.

  1. Right-click the '**Start**' orb on your taskbar in the bottom left corner.

  2. Choose '**Command Prompt (Admin)**'.

  3. Now type: '**reagentc /setosimage /path "location\install.wim" /index 0**', replace location by the absolute location of the 'install.wim' recovery image.




# Backing up the original Lenovo wallpapers





  1. Open '**Windows Explorer**'.

  2. Navigate to '**C:\Windows\Web\Wallpaper**'

  3. Back-up the '**Lenovo**' folder to a location of your choosing.


