---
author: jonashendrickx
date: 2019-02-16 23:01:17+00:00
slug: remapping-the-thinkvantage-key
title: Remapping the ThinkVantage key
category: lenovo
---
In this article, we will explain to you how you can remap the ThinkVantage key without having the original software installed. Without the ThinkVantage software, the button would otherwise be useless.

## Before Windows 10

  1. Open the '**Registry Editor**' as an administrator.
  2. Navigate to '**Computer\HKEY_LOCAL_MACHINE\SOFTWARE\IBM\TPHOTKEY\8001**'. 	
  3. Edit the String Value named '**File**'.
Make sure the path name uses double back slashes as indicated below:
For example: 'C:\\Program Files\\Google\\Chrome\\chrome.exe'

## Windows 10

  1. Open the '**Registry Editor**' as an admininistrator.
  2. Navigate to '**Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Lenovo\ShortcutKey\AppLaunch**' (if the directory doesn't exist install Lenovo drivers)
  3. In AppLaunch directory create a new Key called '**Ex_17**'
  4. In the directory 'Ex_17' create a new Key called '**Desktop**'
  5. In the directory 'Desktop' create a new String value named '**File**'.
  6. Right click on the newly created String Value named 'File' and click '**Modify**'.
  7. In the input field, enter the path of the application you want to launch. Make sure to use double back slashes instead of one.
For example: 'C:\\Program Files\\Google\\Chrome\\chrome.exe'
  8. Save the changes you have made.
  9. If done correctly, the ThinkVantage button should now launch the chosen app.