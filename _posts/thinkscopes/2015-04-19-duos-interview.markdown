---
author: jonashendrickx
date: 2015-04-19 14:11:38+00:00
slug: duos-interview
title: DuOS Interview
category: tech
---
On the 17th of April 2015, I had an interview with the team behind the best Android emulator to date. With many alternatives on the market like BlueStacks, Android x86, GenyMotion and possibly others it always came down to mostly the same missing feature multi-touch support.

Over the years, I have been looking for the perfect Android emulator. I first started with BlueStacks, because it was also the only one available at that time. But it was fairly slow and there was no multi-touch support. Which is still the case at this very moment.

After that I went with GenyMotion, which was faster, but less user friendly because you had to start the virtual machine every time manually. It wasn't for everyone. In addition to that it is also aimed at developers, so it is definately not made for the general user. It also relies on Virtualbox, which creates quite some overhead.

Finally I ended up installing DuOS, which is easy to use and built upon custom virtualization software built by AMI. DuOS can run in fullscreen, has 3D acceleration and has multi-touch support, making it the best emulator right now on the market. Also its one time low price tag of 9.99 USD is almost nothing compared to what you would pay for GenyMotion at 25 USD per month. For indie developers this is about 8-9 USD per month. Which is still a lot of money not everyone can spend.
<table >
<tbody >
<tr >

DuOS
GenyMotion
GenyMotion Business
BlueStacks
</tr>
<tr >
Price
9.99 USD
Free
24.99 USD / month
Free
</tr>
<tr >
Total money spent 1 year of use
9.99 USD
Free
299.88 USD
Free
</tr>
<tr >
3D acceleration

<td >Yes
</td>

<td >Yes
</td>

<td >Yes
</td>

<td >Yes
</td>
</tr>
<tr >
Market

<td >End-users
</td>

<td >Developers
</td>

<td >Developers
</td>

<td >End-users
</td>
</tr>
<tr >
Virtualization

<td >Custom
</td>

<td >Virtualbox
</td>

<td >Virtualbox
</td>

<td >Custom
</td>
</tr>
<tr >
Multi-touch

<td >Yes
</td>

<td >No
</td>

<td >Yes
</td>

<td >No
</td>
</tr>
<tr >
Multicore

<td >Yes
</td>

<td >Yes
</td>

<td >Yes
</td>

<td >No
</td>
</tr>
<tr >
Google Apps

<td >Easy (Official manual)
</td>

<td >Difficult (Community)
</td>

<td >Difficult (Community)
</td>

<td >Yes
</td>
</tr>
<tr >
User Experience Rating

<td >Very good
</td>

<td >Low
</td>

<td >Low
</td>

<td >Good
</td>
</tr>
</tbody>
</table>


# Interview


**How was DuOS founded? Where did the original idea come from to create another Android emulator?**

We have been working on this for quite some time. Where the original idea came from, it was based on requirement. We knew that Android was getting popular at that time, and we knew that there were a lot of people using Android that would love to use the same apps they run on Android on Windows as well.

First we had something, it was called InstantOn, which was essentially a dual boot Android setup. So DuOS was derived from that product, because users wanted to switch faster between Windows and Android. People actually wanted to run both at the same time.

**Yes I remember InstantOn from a few years ago.**

Yes initially, because of our position with the BIOS, we had a system to switch between Android and Windows. So InstantOn was our original product. But when saw people wanted more, we changed the product.

**Are there specific types of computers you are targetting? Or just tablets and convertibles?**

Our target was convertibles, all-in-one pc's. These were the primary target systems we are interested in. But of course it works on a regular desktop computer or laptop too.

**What type of users are you looking for with DuOS? The general Android app user or those who mostly play games on Android?**

We are aiming for the Windows user who feels he is losing to an Android user. That is our focus. For example let's say I am buying a Windows tablet. One thing of preventing me to make that decision is the lack apps in the Windows Store. Something that is available on the Google Play store for free would require me to pay in the Windows Store. And maybe there are people who play games on their Android smartphones. But maybe they also want to play the same games on their Windows computer, tablet or convertible.

**Are there specific hardware requirements for DuOS to work well? One of the things required is Intel Virtualization Technology or the AMD equivalent.**

Yes that is correct, that is the only real requirement. Otherwise there will be a greater performance overhead. And we support AMD processors as well!

**Is there much performance overhead? For example when comparing running Android on BayTrail or running it as DuOS on a BayTrail CPU?**

There will also be a little bit performance overhead. But this is very small. Because there is a little bit of emulation going on. We have done some things internally to keep the overhead as small as possible or reduce it as much possible. So this is why you see our performance is a bit better than our competition.

Also some of the Android apps use native code to run. And the ARMv7 code needs to be translated. That will be a little bit expensive on the CPU.

**But this is also the same case as running Android on a BayTrail SoC from Intel, which is based on the x86 architecture rather than ARM. **

Yes that is correct.

**Do you create a virtual graphics card adapter or is it just simply 3D accelerated?**

Yes we create a virtual graphics card, this is what gives us the excellent 3D performance.

**Is DuOS also capable of accessing the GPS in WWAN cards or other GPS modules?**

Yes. Most GPS modules work fine, but some GPS modules require special access and don't work well. We placed an emulation layer on top of Windows Location Provider, which means most GPS modules will work fine.

**Is there something I might have missed or might have forgotten to ask?**

One is of course that we are working on Android Lollipop, a beta release will be available quite soon. DuOS is currently using Android Jellybean. So Android Lollipop is going to be quite polished!

And even for desktop users we have an input mapper, which means you can use keyboards or keyboard shortcuts for gestures in the games. And this is configurable on a game to game basis. And if you load a particular game, your shortcuts get automatically loaded. This also means that you will be able to play some of your games faster than without those shortcuts. And this may gives you an advantage over the touchscreen. So people who use a keyboard will benefit from these.

**This is also what I like about the idea of something like DuOS, you are able to plug-in any hardware you want. Because you are basically running Windows, which has a much greater hardware compatibility list than for example than having an Android tablet which is very limited in the amount of peripherals you can use.**

I don't know if you have tried this, but you can share your files and pictures between Windows and DuOS using copy and paste. You really have to try this.

**I did not know this at all! I will try this out!**


# Benchmarks


[![antutu](](/assets/img/posts/thinkscopes/2015/04/antutu.jpg)](](/assets/img/posts/thinkscopes/2015/04/antutu.jpg)

BlueStacks was one of the first Android emulators on the market that was very user friendly at the same time. But over the years, it hasn't really improved at all. There is still no multi core support or multi-touch support to be seen. BlueStacks may have performed well here with 3D graphics, but the truth is, when you are playing an actual game, you should consider a high CPU load as well. Since BlueStacks is performing very bad in this area, you could just as well forget about BlueStacks entirely, because it will simple cripple in a real world scenario.

With GenyMotion we clearly see an improvement going from Android 4.2.2 to Android 5.1.0, so it is very possible that DuOS with Android 5.x will perform even better. GenyMotion performs slightly worse than DuOS.

If you don't want to rely on third-party dependencies like Virtualbox, decent performance and want a great user experience, then DuOS is obviously the better choice.
