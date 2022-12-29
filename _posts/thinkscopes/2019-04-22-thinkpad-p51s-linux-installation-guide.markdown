---
author: jonashendrickx
date: 2019-04-22 14:16:11+00:00
slug: thinkpad-p51s-linux-installation-guide
title: ThinkPad P51s Linux Installation Guide
category: lenovo
tags:
- fedora
- linux
- ThinkPad P51s
---
## 1 Fedora 29

### 1.1 Requirements

  * UEFI/Legacy: UEFI
  * Secure Boot (optional): It is recommended to disable 'Secure Boot' if you plan on using Nvidia Primus or akmod. For the 'nouveau' driver, you can leave 'Secure Boot' enabled.

### 1.2 Partitioning

<table >
<tbody >
<tr >
Type
Mount Point
</tr>
<tr >

<td >efi
</td>

<td >/boot/efi
</td>
</tr>
<tr >

<td >ext4
</td>

<td >/
</td>
</tr>
<tr >

<td >swap
</td>

<td >
</td>
</tr>
</tbody>
</table>

### 1.3 Installation

After installation, open the terminal and update all packages:

{% highlight shell %}
sudo dnf update
{% endhighlight %}

#### 1.3.1 Enabling advanced power saving features

We will be using TLP for this.

{% highlight shell %}
sudo dnf install tlp tlp-rdw
{% endhighlight %}

Now we'll want TLP to run at startup, so enter:

{% highlight shell %}
systemctl enable tlp.service
systemctl enable tlp-sleep.service
{% endhighlight %}

#### 1.3.2 Nvidia Optimus

Although the open-source nouveau driver generally works fine. You can get extra performance by installing the proprietary drivers following [this official guide](https://docs.fedoraproject.org/en-US/quick-docs/bumblebee/).

The HDMI-port will work out of the box with external monitors with either drivers and will not require extra configuration.