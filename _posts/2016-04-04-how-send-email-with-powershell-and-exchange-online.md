---
title: How to send an e-mail with Powershell and Exchange Online (Office 365)
date: 2016-04-04T09:00:13-04:00
author: jonashendrickx
category: programming
---
It took me some time to figure out. But I finally managed to get the right things together. Some sources stated that it is impossible to do this with Powershell, because it supposedly doesn&#8217;t support TLS. Apparently, the current Powershell version supports SSL/TLS. There were various templates on the internet that saved the encrypted password in a file. Which is a safer method than storing the password in the Powershell script file. I wanted to show you how to do this without much hassle.

{% highlight powershell %}
# Encrypt the password
$encryptedPassword = ConvertTo-SecureString “MyUnencryptedPassword” -AsPlainText -Force

# Create a credentials object with the e-mail and password
$mycreds = New-Object System.Management.Automation.PSCredential (“yourlogin@mydomain.onmicrosoft.com”, $encryptedPassword)

# Send the e-mail (should take less than 5 seconds)
Send-MailMessage -To "receiver@domainname.com" -SmtpServer "smtp.office365.com" -Credential $mycreds -UseSsl "Hello World" -Port "587" -Body "Hello World,<br/>This is your first e-mail<br/>Kind regards,<br/><br/>Your Support Bot" -From "yourlogin@mydomain.onmicrosoft.com" -BodyAsHtml
{% endhighlight %}

Your login or e-mail can also be replaced by the actual e-mail of the company, which would have been in my case <firstname.lastname@domain.com>. You don&#8217;t need to necessarily include the &#8216;onmicrosoft.com&#8217; part.