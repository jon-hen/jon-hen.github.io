---
title: Reading certificates in Powershell
date: 2020-02-10T06:48:42-05:00
author: jonashendrickx
category: programming
---
While I was doing research on how to read certificates in Powershell. I was mostly finding the same solutions over and over again.

## Reading from multiple servers

I needed a script that was able to retrieve information of certificates of a couple of servers on the domain. &#8216;Invoke-Command&#8217; seemed a little bit insecure. And you needed to allow running remote commands on every server you wanted to run your script.

**Create a Powershell module called &#8216;Certificates.psm1&#8217;.** You&#8217;ll be able to re-use and import the code below assuming you want to run some scripts with a different frequency.

The code is pretty much self-explanatory.

{% highlight powershell %}
[string[]]$servers = &#8220;WEB01&#8221;, &#8220;WEB02&#8221;;  
[string[]]$storeLocations = &#8220;CurrentUser&#8221;, &#8220;LocalMachine&#8221;;  
[string[]]$storeNames = &#8220;AddressBook&#8221;, &#8220;AuthRoot&#8221;, &#8220;CertificateAuthority&#8221;, &#8220;Disallowed&#8221;, &#8220;My&#8221;, &#8220;Root&#8221;, &#8220;TrustedPeople&#8221;, &#8220;TrustedPublisher&#8221;;  
  
function Get-Certificates() {  
[System.Security.Cryptography.X509Certificates[]] $certificates = @();  
  
foreach ($server in $servers) {  
foreach ($storeLocation in $storeLocations) {  
foreach ($storeName in $storeNames) {  
$store = New-Object -TypeName System.Security.Cryptography.X509Certificates.X509Store(&#8220;\\$($server)\$($storeName)&#8221;, $storeLocation);  
try {  
$store.Open(0);  
$certificates += $store.Certificates;  
} catch {  
Write-Output &#8220;Error opening certificate store $($server) $($storeLocation) $($storeName)&#8221;;  
continue;  
} finally {  
$store.Close();  
}  
}  
}  
}  
return $certificates;  
}  
  
Export-ModuleMember -Function Get-Certificates  
{% endhighlight %}

## Retrieve certificates about to expire

{% highlight powershell %}
param(  
[string]$Days = 90  
);  
  
Import-Module ./Certificates.psm1;  
  
$certificates = Get-Certificates;  
  
$expiringCertificates = $certificates | Where-Object {$\_.NotAfter -gt (Get-Date) -and $\_.NotAfter -lt (Get-Date).AddDays($Days)}  
  
if ($expiringCertificates.Count -gt 0) {  
  
$formattedOutputString = $expiringCertificates | Format-Table Thumbprint, Subject | Out-String;  
  
}
{% endhighlight %}

## Retrieve certificates that are not SHA-256

You may want to find if there are less secure certificates on your server.

{% highlight powershell %}
Import-Module ./Certificates.psm1;  
  
$certificates = Get-Certificates;  
  
$insecureCertificates = $certificates |  
Where-Object {$\_.SignatureAlgorithm.FriendlyName -and $\_.SignatureAlgorithm.FriendlyName -ne &#8216;sha256RSA&#8217;} |  
Select-Object -Property &#8216;DnsNameList&#8217;, &#8216;Subject&#8217;, @{  
Name = &#8220;Algorithm&#8221;  
Expression = {$_.SignatureAlgorithm.FriendlyName}  
}, @{  
Name = &#8220;KeyLength&#8221;,  
Expression = {$_.PublicKey.Key.KeySize}  
}, &#8220;NotAfter&#8221;, &#8220;NotBefore&#8221;;  
  
if ($insecureCertificates.Count -gt 0) {  
&#8230;  
}  
{% endhighlight %}

## Scheduling your Powershell script

You can schedule your Powershell script with &#8216;Task Scheduler&#8217;. It&#8217;s good practice to run the script under a service account. When using a service account, you should make sure the account has &#8216;Logon as a batch&#8217; permissions granted on the server where the Powershell script is scheduled. If you happen to forget this step, you&#8217;ll be reminded.