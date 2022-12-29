---
title: How install Spain's digital certificate on Arch-based Linux distributions?
date: 2021-10-16T09:15:56-04:00
author: jonashendrickx
category: spain
thumbnail: /assets/img/posts/spain.jpg
---
 

## Requirements

Execute the code below. &#8216;**base-devel**&#8216; is a package group that includes tools needed for building (compiling and linking). It is not necessary for a basic install, and many users don&#8217;t need to install it. If you find it useful, you can either install it as part of your basic install, or later.

{% highlight shell %}
sudo pacman -S --needed-base-devel
{% endhighlight %}

## ConfiguradorFNMT

{% highlight shell %}
git clone https://aur.archlinux.org/configuradorfnmt.git
cd configuradorfnmt
makepkg -si
{% endhighlight %}

## AutoFirma

{% highlight shell %}
git clone https://aur.archlinux.org/autofirma.git
cd autofirma
makepkg -si
{% endhighlight %}

## Installing the certificate in Mozilla FireFox

  1. Open &#8216;**Settings**&#8216;.
  2. Search for &#8216;Certificates&#8217;.
  3. Click &#8216;View Certificates&#8217;.
  4. Open tab &#8216;**Your certificates**&#8216;.
  5. Click &#8216;**Import**&#8216;.
  6. Select your digital certificate and enter the password.