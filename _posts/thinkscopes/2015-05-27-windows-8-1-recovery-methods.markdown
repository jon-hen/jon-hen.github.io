---
author: jonashendrickx
date: 2015-05-27 18:27:13+00:00
slug: windows-8-1-recovery-methods
title: Windows 8.1 - Recovery Methods
category: tech
---
I thought it was about time listing all possible ways to recover or reinstall Windows. This guide will get you going.


# Method 1




## Restoring




### Restoring from recovery partition


You may want to use this restoring method by default, because it is the easiest way to do so if your recovery partition is still intact. If not, look at the other recovery methods to see which suits you best. This is usually the way you reset or refresh your Windows installation if you purchase a computer from a brand like Lenovo instead of building one yourself



  1. Press the **Windows-key + C** to open the charms bar or swipe in from the right.

  2. Click **Settings**.

  3. Click **Change PC Settings**.

  4. Click **Update & Recovery** in the menu on the left.

  5. Click **Recovery**.

  6. If all your documents are safe and sound in your user folder, you can use **Refresh your PC without affecting files**.
However I still recommend taking a back-up... If you want to do a complete reinstallation of Windows and also clean your user folder in the process then choose **Remove everything and reinstall Windows**.
[![2_001](](/assets/img/posts/thinkscopes/2015/05/2_001.jpg)](/assets/img/posts/thinkscopes/2015/05/2_001.jpg)

  7. If you chose Remove everything and reinstall Windows, then you will be prompted to either **Fully clean the drive** which you only use if you are selling the computer or giving it to someone else you do not trust OR you can just use the other method which just deleted the files. Fully cleaning the drive may take several hours to complete, if you are choosing the option to keep your PC, then it will take about 15-45 minutes depending on the performance of your computer.




# Method 2 (Safe)




## Creating recovery media


You must always create recovery media when you start your computer for the first time. If you do not do so, you will end up buying recovery media and paying for it. Now in worst case scenario, you can still grab a Windows 8.1 ISO from Microsoft and then install all the drivers yourself afterwards. But this is not recommended for the average person in the world, find a geek nearby who can help you with method 4 if you have trouble.


### Creating recovery media from recovery partition





  1. Right-click the bottom left corner (start orb)
[![1_001](](/assets/img/posts/thinkscopes/2015/05/1_001.jpg)](/assets/img/posts/thinkscopes/2015/05/1_001.jpg)

  2. Click **Control Panel**.

  3. In the address bar of the Control Panel window, click the last arrow, and select **All control panel items** and then click** Recovery** or search for** Recovery** in the search bar.

  4. Now click **Create a recovery drive**.
[![1_004](/assets/img/posts/thinkscopes/2015/05/1_004.jpg)](/assets/img/posts/thinkscopes/2015/05/1_004.jpg)

  5. Insert a flash USB pendrive of 16GB or greater.

  6. Now check **Copy the recovery partition from the PC to the recovery drive**.

  7. You now have the option to delete the recovery partition. Know that if your USB flashdrive dies or doesn't work, then you are on your own buying recovery media or finding a way to install Windows (which might be covered in this guide if you read well, but this is for advanced people.)




### Creating recovery media from current Windows installation





  1. Right-click the bottom left corner (start orb)

  2. Click **Control Panel**.

  3. In the address bar of the Control Panel window, click the last arrow, and select **All control panel items** and then click** Recovery** or search for** Recovery** in the search bar.

  4. Now click **Create a recovery drive**.

  5. Insert a flash USB pendrive of 16GB or greater.

  6. Now uncheck **Copy the recovery partition from the PC to the recovery drive** in case it is checked.




## Restoring





  1. Plug in the USB pendrive in a USB-port (by preference USB2.0 with older computers purchased around 2010 - 2012)

  2. 

    1. Method 1: Shut down your computer.Start your computer and quickly start tapping **F12** to open the **boot menu**. Sometimes you might boot straight to Windows again if you don't tap F12 fast enough. (Tip: switch from quick boot to diagnostic boot if you have problems and miss it too often, you can do this in the BIOS.)

    2. Method 2:

      1. Press **Windows-key + C** or swipe in from the right to open the charms bar.

      2. Then click **Settings**,

      3. Click **Change PC settings**,

      4. Click **Update & Recovery**,

      5. Click **Recovery**.
[![2_001](](/assets/img/posts/thinkscopes/2015/05/2_001.jpg)](/assets/img/posts/thinkscopes/2015/05/2_001.jpg)

      6. Now under **Advanced startup**, click **Restart now**.

      7. Now you will arrive on a blue screen asking you to choose an option, you choose **Use a device**, and then select your USB flashdrive with the recovery media.




    3. Method 3: Sometimes during startup you may also see a message **Press enter to interrupt startup**, and then press F12 when the dialog shows up to bring up the boot menu. And then of course select your USB flash drive with the recovery media.




  3. If the USB flash drive is healthy, you may be asked to select a keyboard layout.

  4. Click **Troubleshoot**.

  5. Now choose either **Refresh your PC** (to keep your files, make sure to back them up though) or **Reset your PC** (delete your files, start clean).
I usually choose 'Reset your PC' and backup my files on an external drive and put them back manually.
You do not want to gamble with precious files in case something goes wrong. Select the operating system you want to refresh or reset.
On most computers there is only one to choose from.

  6. Now follow instructions.

  7. In case you chose 'Reset your PC', you may be prompted to **Yes, partition the drives** or **No, keep the existing partitions**.
If you are unsure, select 'No, keep the existing partitions'.

  8. In case you chose 'Reset your PC', you may be prompted to remove the files from all drives or not in case there are multiple drives detected.
You can choose between **Only the drive where Windows is installed** or **All drives**.
If you are in doubt, select 'Only the drive where Windows is installed'.

  9. In case you chose 'Reset your PC', you may be prompted tofully clean the drive or just remove your files. If you are selling your computer or giving it away select **Fully clean the drive**. If you are keeping your computer select **Just remove my files**.

  10. All ready to go, click **Reset** to start or **Cancel** if you start to panic.




# Method 3 (Advanced)


This method is for advanced people. Here I will explain how to use the commandline tools available to create recovery media from an existing Windows installation on another partition on your hard drive and set it as default for Windows to use to refresh or reset Windows.


## Creating recovery media




### Creating recovery media from current Windows installation





  1. Create a new empty partition around 10GB - 20GB.

  2. Open Command Prompt.

  3. Enter '**recimg /createimage <directory>**' where you replace <directory> with the drive letter of the new partition you created, for example 'D:' so it becomes 'recimg /createimage D:'

  4. Now that we have created the recovery image, let's register it with Windows so we can use it to recover later: 'recimg /setcurrent <directory>' where <directory> is the directory you just saved the recovery image.

  5. To verify the recovery image is set correctly: 'recimg /showcurrent' or to deregister the recovery image 'recimg /deregister'




## Restoring


See method 1.


# Method 4 (Using ISO)





  1. Download the iso file [here](http://windows.microsoft.com/en-us/windows-8/create-reset-refresh-media).

  2. Right-click the downloaded iso file, and click mount. Or double click to open it.

  3. Then run **setup.exe**.

  4. Follow on-screen instructions.

1x300


# Method 5 (DVD)


Use a Windows installation disk, has to be purchased in stores or you have to burn a ISO file to a DVD. Then just run **setup.exe** on the DVD and follow on-screen instructions.
