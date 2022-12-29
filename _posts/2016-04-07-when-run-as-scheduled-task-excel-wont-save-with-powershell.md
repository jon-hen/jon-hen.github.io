---
title: 'When run as scheduled task, Excel won&#8217;t save with Powershell'
date: 2016-04-07T01:50:03-04:00
author: jonashendrickx
category: programming
---
I created a Powershell script to generate an Excel report for a client which is run by the task scheduler on Windows Server 2012 R2. When I executed the Powershell script manually the Excel file would save successfully and the Excel process exits. When the same script is ran using the task scheduler, the Excel process opens, Powershell script finishes, and the Excel process remains open forever and it will never save the file.

Below, you can find the code required to save an empty Excel sheet. Save it to any location you like and modify the path where the Excel file is saved if desired.

{% highlight powershell %}
# Create the Excel object
$excel = New-Object -ComObject excel.application

# Add a workbook (required)
$workbook = $excel.Workbooks.Add()

# Save it
$workbook.SaveAs("C:\Users\<youruserhere>\Desktop\myexcel.xlsx")

# Quit
$excel.Quit()

# Release the COM object
[System.Runtime.InteropServices.Marshal]::ReleaseComObject([System.__ComObject]$excel) | Out-Null
{% endhighlight %}


Now let&#8217;s schedule the script.

  1. Open the Task Scheduler in Windows or Windows Server.
  2. Right-click &#8216;Task Scheduler (local)&#8217; in the left pane.
  3. Select &#8216;Create Task&#8217;
  4. Give it a meaningful name.
  5. Select a user, preferably one that has permissions to save the Excel file to the path you entered in the script.
  6. Tick the radio button &#8216;Run whether the user is logged in or not&#8217;.
  7. In the &#8216;Triggers&#8217; tab, enter the desired trigger.
  8. In the &#8216;Actions&#8217; tab, make sure &#8216;Start a program&#8217; is selected in the &#8216;Action&#8217; combobox.
  9. Click the &#8216;Browse&#8217; button and select the Powershell executable: 
        C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe

 1.  Then in the &#8216;Add arguments&#8217; text box enter: 
        -file "C:\path\to\your\script\myscript.ps1"

Now this is probably what you have done so far right? Now the last missing bit is to create these missing directories:

  * On a 32-bit and 64-bit operating system: 
        C:\Windows\System32\config\systemprofile\Desktop

  * On a 64-bit operating system: 
        C:\Windows\SysWOW64\config\systemprofile\Desktop