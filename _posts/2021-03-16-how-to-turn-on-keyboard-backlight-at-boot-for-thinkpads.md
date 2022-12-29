---
title: How to turn on keyboard backlight at boot for ThinkPads?
date: 2021-03-16T08:18:19-04:00
author: jonashendrickx
category: [lenovo, programming]
---
If you&#8217;re reading this article, you&#8217;re most likely interested in trying to enable your keyboard backlight at boot for your Lenovo laptop or ThinkPad. By design, Lenovo has disabled this.

Before continuing, you have to know that you risk burning out the keyboard backlight LEDs by having them lit 24/7.

## Installing the dependencies

The solution discussed in this article depends on having <a href="https://support.lenovo.com/es/es/downloads/ds105970-lenovo-system-interface-foundation-for-windows-10-32-bit-64-bit-thinkpad-thinkcentre-ideapad-ideacentre-thinkstation" target="_blank" rel="noopener">Lenovo System Interface Foundation Driver</a> installed. If you are using Lenovo Vantage or Lenovo Commercial Vantage, chances are you may already have it installed. If you don&#8217;t know how to check whether Lenovo System Interface Foundation Driver is installed, read <a href="https://support.microsoft.com/en-us/windows/how-to-check-if-an-app-or-program-is-installed-in-windows-10-5af73cea-f875-dfa0-4cd1-72a02aa06436" target="_blank" rel="noopener">this guide</a> by Microsoft.

## Research

### Interacting with the keyboard

We know the majority of plug-ins for Lenovo System Interface Foundation Driver are installed in &#8216;**C:\ProgramData\Lenovo\ImController\Plugins**&#8216;.

We are most interested in the &#8216;**ThinkKeyboardPlugin**&#8216; folder. With a .NET decompiler, we can see the source code of some of these files. We&#8217;re going to open:

  * Contract\_Keyboard.dll (dependency of Keyboard\_Core.dll)
  * Keyboard_Core.dll

As we suspected &#8216;Keyboard\_Core.dll&#8217; contains a class &#8216;KeyboardControl&#8217; in the &#8216;Keyboard\_Core&#8217; namespace. Here we find a method &#8216;**<span class="pl-smi">SetKeyboardBackLightStatus</span>(param1<span class="pl-k">,</span> param2);**&#8216;.

If you have an older version of the driver installed, you&#8217;ll see this method with only 1 parameter, in which case you will not have to pass &#8216;null&#8217; invoking this function.

In the references, note there&#8217;s a dependency of &#8216;Contract_Keyboard.dll&#8217;.

Take a note of the fact that both are in the x86 folder, so they&#8217;re 32-bit libraries.

### Where do we hook this?

Ok we&#8217;re definitely going to want to execute a script upon starting our ThinkPad, right? But what happens if our machine goes to sleep or goes into hibernation?

By right-clicking the start menu button in Windows 10, we can open &#8216;**Event Viewer**&#8216;. Expand &#8216;**Windows Logs**&#8216; in the left hand pane and open &#8216;**System**&#8216;.

Now we need to find the &#8216;Source&#8217; or the event publisher&#8217;s name. Put your computer to sleep and hibernation, and find an event that looks like it&#8217;s being published every time your ThinkPad wakes up.

There is one indeed, the &#8216;**Source**&#8216; is &#8216;**Power-Troubleshooter**&#8216; which published an event with &#8216;**EventId**&#8216; being &#8216;**1**&#8216;.

To keep things easy, we&#8217;re going to use Powershell, something changes the way these libraries work, we can quickly re-write our script. We will have to use a 32-bit Powershell as we&#8217;re going to invoke 64-bit libraries. The 32-bit Powershell is found in the directory &#8216;**C:\Windows\syswow64\WindowsPowerShell\v1.0\powershell.exe**&#8216;.

## Writing the script

{% highlight powershell %}
# Settings
[string]$path = 'C:\ProgramData\Lenovo\ImController\Plugins\ThinkKeyboardPlugin\x86\';
[int]$level = 2; # Backlight level: 0 - Off, 1 - Dim, 2 - On

# Don't modify below
[string]$core = $path + 'Keyboard_Core.dll';
[string]$contract = $path + 'Contract_Keyboard.dll';

Add-Type -Path $core;
Add-Type -Path $contract;

[Keyboard_Core.KeyboardControl]$control =  New-Object -TypeName  'Keyboard_Core.KeyboardControl';

$control.SetKeyboardBackLightStatus($level, $null);
{% endhighlight %}

[lenovo-powershell/auto-keyboard-backlight.ps1 at main · jonashendrickx/lenovo-powershell · GitHub](https://github.com/jonashendrickx/lenovo-powershell/blob/main/auto-keyboard-backlight/auto-keyboard-backlight.ps1)

Scott Hanselman has written a <a href="https://www.hanselman.com/blog/signing-powershell-scripts" target="_blank" rel="noopener">good article on signing Powershell scripts</a>. You&#8217;ll want to do this if you don&#8217;t want to set the Powershell execution policy to unrestricted or something else. We&#8217;ll want to sign the Powershell script.

### Installation of the script

If you want to schedule the script, we&#8217;ll need to do this with task scheduler. This will cover:

  * Boot
  * Sleep & wakeup
  * Hibernation & wakeup

To schedule with Task Scheduler:

  1. Click &#8216;**Create Task**&#8216;.
  2. Choose &#8216;**Run whether user is logged in or not**&#8216;. (Make use sure user that executes script has permissions to run on this machine.)
  3. Add a trigger &#8216;**At startup**&#8216;.
  4. Add a trigger &#8216;**On an event**&#8216; if you want to support sleep and hibernation. You&#8217;ll need to find the EventID in Windows Event Manager. 
      1. Log: &#8216;System&#8217;
      2. Source: &#8216;Power-Troubleshooter&#8217;
      3. EventID: 1
  5. Add an action with &#8216;**Program/script**&#8216; location set to &#8216;**C:\Windows\syswow64\WindowsPowerShell\v1.0\powershell.exe**&#8216; and parameters &#8216;**-File &#8220;path\to\script\auto-keyboard-backlight.ps1&#8221;**&#8216;