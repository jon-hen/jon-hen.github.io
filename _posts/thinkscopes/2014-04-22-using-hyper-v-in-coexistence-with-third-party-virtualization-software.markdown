---
author: jonashendrickx
date: 2014-04-22 16:47:13+00:00
slug: using-hyper-v-in-coexistence-with-third-party-virtualization-software
title: Using Hyper-V in coexistence with third-party virtualization software
category: tech
---
Hyper-V may be preferred to run Windows virtual machines due to its excellent 2D graphics performance and disk performance. Hyper-V is also necessary to develop Windows Phone applications. When I first tried Hyper-V, I decided I wanted to keep using it because it was so easy and straightforward to use.




# Problem




When having Hyper-V installed on your computer, you might run into a few issues. Below I have given a few examples.






  * Slow games or 3D applications when Hyper-V is installed.


  * VMWare Workstation and VMWare Player refuse to install when Hyper-V is installed.


  * Dual boot is not an efficient solution. (Waste of disk space)


  * Intel Hardware Accelerated Execution Manager refuses to install.


  * VT-X is unavailable or 'appears' to be disabled while it is not.




# Requirements






  * Windows 8/8.1 (for this guide)


  * Hyper-V installed




# Solution









  1. Install Hyper-V.


  2. Go to 'Control Panel'.


  3. Select 'Programs & Features'.


  4. Now choose 'Turn Windows features on or off'.  
[![hyperv_win81_1](](/assets/img/posts/thinkscopes/2014/04/hyperv_win81_1.jpg)](](/assets/img/posts/thinkscopes/2014/04/hyperv_win81_1.jpg)


  5. Open 'Command Prompt' as an administrator by right-clicking the start orb or the bottom left corner of your screen.  
[![hyperv_win81_2](](/assets/img/posts/thinkscopes/2014/04/hyperv_win81_2.jpg)](](/assets/img/posts/thinkscopes/2014/04/hyperv_win81_2.jpg)


  6. _bcdedit /copy {current} /d "Windows 8.1 (No Hyper-V)"_  
[![hyperv_win81_3](](/assets/img/posts/thinkscopes/2014/04/hyperv_win81_3.jpg)](](/assets/img/posts/thinkscopes/2014/04/hyperv_win81_3.jpg)The above command will copy your current boot entry into a new one using the name entered after the _'/d'_ option. You can change that to something else if you want.


  7. Restart your computer.


  8. Make sure to start your computer using the boot entry you just added in 'Step 6'.


  9. Open 'Command Prompt' again as an administrator as described in 'Step 5'. Enter the command below to disable 'Hyper-V' for that boot entry:  
_bcdedit /set {current} hypervisorlaunchtype off_


  10. Restart your computer, and start the new boot entry again you created in 'Step 6'. We will verify in the next step that Hyper-V is disabled for the new boot entry.


  11. Open 'Command Prompt' as an administrator again, and enter _'bcdedit'_ (without quotes). Find the entry where the identifier says '{current}'. Verify 'hypervisorlaunchtype' is set to 'off' for that entry.  
[![hyperv_win81_4](](/assets/img/posts/thinkscopes/2014/04/hyperv_win81_4.jpg)](](/assets/img/posts/thinkscopes/2014/04/hyperv_win81_4.jpg)




You can now attempt to start or install alternative virtualization software on the new boot entry we have just created. If you want to use Hyper-V you can always use the other boot entry.




You should now have two entries:






  * Windows 8.1 Developer: use this for Hyper-V (Should have hypervisorlaunchtype on 'auto')


  * Windows 8.1 Developer (No Hyper-V): use this if you don't need to use Hyper-V. (This one has hypervisorlaunchtype set to 'off')



