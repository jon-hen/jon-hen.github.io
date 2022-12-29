---
title: Print list of assigned licenses in Office 365 with Powershell
date: 2016-03-17T03:39:36-04:00
author: jonashendrickx
category: programming
---
A client of mine regularly wanted to see a report of all users and the licenses that are assigned to them. I decided to write a script to save me and my client time. Feel free to re-use, modify and share my script and guide.

  1. We need to allow our scripts to run on our machine first. Open a &#8216;Powershell Terminal&#8217; as administrator.
  2. This code will allow all Powershell scripts to run, even unsigned ones.  
    [code lang=&#8221;powershell&#8221;]Set-ExecutionPolicy Unrestricted[/code] 
  3. Download and install &#8216;<a href="https://www.microsoft.com/en-us/download/details.aspx?id=41950" target="_blank">Microsoft Online Services Sign-In Assistant</a>&#8216;.
  4. Download and install &#8216;<a href="http://go.microsoft.com/fwlink/p/?linkid=236297" target="_blank">Windows Azure Active Directory Module for Windows Powershell</a>&#8216;.
  5. The code below will save a different file per license and list all the users for that license. Save it as a Powershell script file (*.ps1 extension). Easiest is to copy the code, paste it in Notepad and then save it with the &#8216;.ps1&#8217; extension.  

  {% highlight csharp %}
  # requirements:  
  \# &#8211; https://mymicrosoftexchange.wordpress.com/2015/03/23/office-365-script-to-get-detailed-report-of-assigned-licenses/  
  \# &#8211; https://msdn.microsoft.com/en-us/library/azure/jj151815.aspx?tduid=(9269d7f0b13d3d4d833ba311fb827e91)(256380)(2459594)(TnL5HPStwNw-zZf.McskA8f.V84Ln4LbOw)()#BKMK_connect# The Output will be written to this file in the current working directory  
  $LogFile = &#8220;Office\_365\_Licenses.csv&#8221;</p> 
  \# Connect to Microsoft Online  
  Import-Module MSOnline  
  $Office365credentials = get-credential  
  Connect-MsolService -Credential $Office365credentials

  write-host &#8220;Connecting to Office 365&#8230;&#8221;

  \# Get a list of all licences that exist within the tenant  
  $licensetype = Get-MsolAccountSku | Where {$_.ConsumedUnits -ge 1}

  \# Loop through all licence types found in the tenant  
  foreach ($license in $licensetype)  
  {  
  write-host(&#8220;Reading license: &#8221; + $license.SkuPartNumber)  
  $LogFile = $license.SkuPartNumber + &#8220;.csv&#8221;

  \# Gather users for this particular AccountSku  
  $users = Get-MsolUser -all | where {$\_.isLicensed -eq &#8220;True&#8221; -and $\_.licenses[0].accountskuid.tostring() -eq $license.accountskuid}

  \# Loop through all users and write them to the CSV file  
  foreach ($user in $users) {  
  write-host (&#8220;Processing &#8221; + $user.displayname)  
  $datastring = ($user.userprincipalname + &#8220;,&#8221; + $user.FirstName + &#8221; &#8221; + $user.LastName)

  #write to working directory  
  Out-File -FilePath $LogFile -InputObject $datastring -Encoding UTF8 -append  
  }  
  }

  write-host (&#8220;Script Completed. Results available in &#8221; + $LogFile)
  {% endhighlight %}
    
    6. Now run the script file in Powershell.