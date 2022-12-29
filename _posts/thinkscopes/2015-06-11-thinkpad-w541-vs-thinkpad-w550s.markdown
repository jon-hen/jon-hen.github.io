---
author: jonashendrickx
date: 2015-06-11 11:36:59+00:00
slug: thinkpad-w541-vs-thinkpad-w550s
title: ThinkPad W541 vs ThinkPad W550s
category: lenovo
---
If you are reading this, you are probably trying to choose between the ThinkPad w541 which is capable of using quad core Haswell processors or the ThinkPad W550s which uses low voltage dual core processors from Intel with a newer Maxwell graphics card, the Quadro K620M.

The Lenovo ThinkPad W541 is a rebranded ThinkPad W540. The ThinkPad W541 is for 99% identical to the ThinkPad W540 parts wise and also uses the same BIOS.


# Processors


At the time there were no plans for mobile Broadwell-H. So Lenovo released a new ThinkPad W541 with dedicated mouse buttons instead of using the ClickPad the community wanted to have.

The Lenovo ThinkPad W541 can handle mobile Haswell quad core processors up to the i7-4940MX. This makes the ThinkPad W541 suitable for heavy workloads on the CPU.

Note that the CPU in the ThinkPad W541 is also confirmed to be overclockable by 200MHz for the locked processors using Intel Extreme Utility. You also have control over undervolting the processor. Read [this article](/blog/2015/01/haswell-overclocking-and-undervolting-guide/) for more information.

The ThinkPad W550s however, comes with Broadwell-U processors with a maximum TDP of 15W. This makes the W550s less suitable for heavy workloads. Also Broadwell-U processors are all dual core processors as opposed to quad core processor found in the ThinkPad W541.

**Here is a table with some benchmarks (http://www.cpubenchmark.net):**
<table >
<tbody >
<tr >
Intel Core i7-4710MQ

<td >ThinkPad W541
</td>

<td >7996
</td>
</tr>
<tr >
Intel Core i7-4810MQ

<td >ThinkPad W541
</td>

<td >8745
</td>
</tr>
<tr >
Intel Core i7-4910MQ

<td >ThinkPad W541
</td>

<td >9747
</td>
</tr>
<tr >
Intel Core i7-4940MX

<td >ThinkPad W541
</td>

<td >**9920**
</td>
</tr>
<tr >
Intel Core i7-5500U

<td >ThinkPad W550s
</td>

<td >3968
</td>
</tr>
<tr >
Intel Core i7-5600U

<td >ThinkPad W550s
</td>

<td >4413
</td>
</tr>
</tbody>
</table>
Because of the lower TDP, the ThinkPad W541 might be a better choice for multithreaded scenario's where CPU is of importance. Note that the single core performance of the Intel Core i7-5600U is almost on par with the Intel Core i7-4710MQ and is only slightly slower.

**Power consumption:**
<table >
<tbody >
<tr >
Intel Core i7-4710MQ

<td >ThinkPad W541
</td>

<td >38.19W
</td>
</tr>
<tr >
Intel Core i7-4810MQ

<td >ThinkPad W541
</td>

<td >38.19W
</td>
</tr>
<tr >
Intel Core i7-4910MQ

<td >ThinkPad W541
</td>

<td >38.19W
</td>
</tr>
<tr >
Intel Core i7-4940MX

<td >ThinkPad W541
</td>

<td >46.31W
</td>
</tr>
<tr >
Intel Core i7-5500U

<td >ThinkPad W550s
</td>

<td >12.19W
</td>
</tr>
<tr >
Intel Core i7-5600U

<td >ThinkPad W550s
</td>

<td >12.19W
</td>
</tr>
</tbody>
</table>
**Performance per watt:**
<table >
<tbody >
<tr >
Intel Core i7-4710MQ

<td >ThinkPad W541
</td>

<td >209.37 pt/W
</td>
</tr>
<tr >
Intel Core i7-4810MQ

<td >ThinkPad W541
</td>

<td >228.99 pt/W
</td>
</tr>
<tr >
Intel Core i7-4910MQ

<td >ThinkPad W541
</td>

<td >255.223 pt/W
</td>
</tr>
<tr >
Intel Core i7-4940MX

<td >ThinkPad W541
</td>

<td >214.21 pt/W
</td>
</tr>
<tr >
Intel Core i7-5500U

<td >ThinkPad W550s
</td>

<td >325.51 pt/W
</td>
</tr>
<tr >
Intel Core i7-5600U

<td >ThinkPad W550s
</td>

<td >**362.02 pt/W**
</td>
</tr>
</tbody>
</table>


# Graphics


The ThinkPad W541 uses the older Kepler based Quadro graphics cards. You will find the Quadro K1100M and the Quadro K2100M.

The ThinkPad W550s uses a Quadro K620M which should perform similarly to the Quadro K1100M in the W540 and W541.

In most of the results, the Quadro K620M in the W550s outperforms the Quadro K1100M found in the W541.

**Benchmark: Cinebench R15 - OpenGL 64-bit**
<table >
<tbody >
<tr >

<td >Nvidia Quadro K620M
</td>

<td >ThinkPad W550s
</td>

<td >60.6
</td>
</tr>
<tr >

<td >Nvidia Quadro K1100M
</td>

<td >ThinkPad W541
</td>

<td >51.1
</td>
</tr>
<tr >

<td >Nvidia Quadro K2100M
</td>

<td >ThinkPad W541
</td>

<td >67.8
</td>
</tr>
</tbody>
</table>
**Benchmark: SPECviewperf 12 - Siemens NX (snx-02)**
<table >
<tbody >
<tr >

<td >Nvidia Quadro K620M
</td>

<td >ThinkPad W550s
</td>

<td >60.6
</td>
</tr>
<tr >

<td >Nvidia Quadro K1100M
</td>

<td >ThinkPad W541
</td>

<td >15.4
</td>
</tr>
<tr >

<td >Nvidia Quadro K2100M
</td>

<td >ThinkPad W541
</td>

<td >17.1
</td>
</tr>
</tbody>
</table>
**Benchmark: SPECviewperf 12 - Solidworks (sw-03)**
<table >
<tbody >
<tr >

<td >Nvidia Quadro K620M
</td>

<td >ThinkPad W550s
</td>

<td >33
</td>
</tr>
<tr >

<td >Nvidia Quadro K1100M
</td>

<td >ThinkPad W541
</td>

<td >28.8
</td>
</tr>
<tr >

<td >Nvidia Quadro K2100M
</td>

<td >ThinkPad W541
</td>

<td >27.2
</td>
</tr>
</tbody>
</table>
**Benchmark: 3D Mark - Performance (1280x720)**
<table >
<tbody >
<tr >

<td >Nvidia Quadro K620M
</td>

<td >ThinkPad W550s
</td>

<td >33
</td>
</tr>
<tr >

<td >Nvidia Quadro K1100M
</td>

<td >ThinkPad W541
</td>

<td >28.8
</td>
</tr>
<tr >

<td >Nvidia Quadro K2100M
</td>

<td >ThinkPad W541
</td>

<td >27.2
</td>
</tr>
</tbody>
</table>


# Ports


The amount of ports is more or less the same with some minor differences like Thunderbolt availability or the amount of USB ports and their version.
<table >
<tbody >
<tr >

ThinkPad W550s
ThinkPad W541
</tr>
<tr >
VGA

<td >Yes
</td>

<td >Yes
</td>
</tr>
<tr >
mDP

<td >v1.2
</td>

<td >v1.2
</td>
</tr>
<tr >
Thunderbolt 2.0

<td >No
</td>

<td >**Yes**
</td>
</tr>
<tr >
USB3.0

<td >**3 (1 Always On Charging)**
</td>

<td >2
</td>
</tr>
<tr >
USB2.0

<td >0
</td>

<td >**2 (1 Always On Charging)**
</td>
</tr>
<tr >
Mic / Headphone Combo Jack

<td >Yes
</td>

<td > Yes
</td>
</tr>
<tr >
RJ45 (Ethernet)

<td >Yes
</td>

<td >Yes
</td>
</tr>
<tr >
Docking connector

<td >Yes
</td>

<td >Yes
</td>
</tr>
<tr >
Smart Card Reader

<td >Optional
</td>

<td >Optional
</td>
</tr>
<tr >
Media Card Reader

<td >4-in-1 SD card reader (SD, SD-HC, SDXC, MMC)
</td>

<td >4-in-1 SD card reader (SD, SD-HC, SDXC, MMC)
</td>
</tr>
</tbody>
</table>


# Battery


From my personal experience with the W540 which is very similar to the **ThinkPad W541**. I am able to get between 5-7 hours of battery life with a external 9-cell 99.9Wh battery which is marketed to have **11.1 hours of battery life**. There is no 3-cell internal battery.

The ThinkPad W550s has a non-removeable 3-cell internal battery (Well it is removeable, just not meant to for the end-user) and a up to 6-cell 72Wh external battery. **The ThinkPad W550s is marketed to have up to 21.8 hours of battery life.** However, note that if you remove the external battery when it is empty and replace it with a charged external battery, you can keep running a lot longer on battery compared to the ThinkPad W541.


# Accessories


The AC adapter of the W550s is a 65W adapter which will be noticeably lighter than the bulky 135W or 170W adapter we have in the ThinkPad W541.


# Build Quality


Both ThinkPads use the same material glass fiber reinforced plastic.

But if you opt for the multi-touch model of the ThinkPad W550s, then the display cover is made of the more **expensive and stronger carbon-fiber reinforced plastic**.


# Weight


<table >
<tbody >
<tr >

<td >
</td>

<td >ThinkPad W541
</td>

<td >ThinkPad W550s
</td>
</tr>
<tr >

<td >Minimum
</td>

<td >5.57 lb / 2.53 kg
</td>

<td >5.01 lb / 2.27 kg
</td>
</tr>
<tr >

<td >Maximum
</td>

<td >5.95 lb / 2.7 kg
</td>

<td >5.43 lb / 2.46 kg
</td>
</tr>
</tbody>
</table>


# Display


Both the ThinkPad W541 and W550s use the same display panels, the ThinkPad W550s has something little more extra to choose from. You can equip it with a **multi-touch** 3K panel for a more enjoyable Windows 8.1 experience.


# Storage


The ThinkPad W541 supports **RAID0 and RAID1**, but you have to choose this functionality or feature when you buy your ThinkPad W541. You cannot change this later because you will need a different motherboard. Plan wisely in advance.

Personally I do not like RAID0, because you are doubling your chance of losing all your data with a hardware failure, it also doubles the energy consumption with HDD or SSD activity obviously at the same time.

But if you need RAID0 for extra performance or RAID1 for mirroring your data to a second drive, then the ThinkPad W541 is an excellent choice. Just back-up your data regularly.

If you do not need RAID0 or RAID5, you can always buy an **ultrabay adapter** to install a second HDD or SSD in the W541.

The ThinkPad W550s does not support any of the above mentioned features or ultrabay adapter. But it supports two M.2 SSDs compared to the W541 which only has 1 M.2 slot. Note that you can only add two M.2 SSDs to the W550s if you do not opt for a WWAN adapter, otherwise, you only can add one while the W541 with WWAN has no free M.2 slot at all.


# Verdict


I think you can't go wrong with either of them, it is just a matter of picking the right workstation for your needs. However I do have to make a summary of everything I wrote above to make the decision easier for you.
<table >
<tbody >
<tr >
ThinkPad W541
ThinkPad W550s
</tr>
<tr >

<td >



  * 4 USB ports: 2x 2.0 & 2x 3.0

  * RAID0 & RAID1

  * Thunderbolt 2.0

  * 32GB RAM (Unofficially W550s supports 32GB RAM as well)

  * Faster processor (quad core)

  * Faster graphics card (Quadro K2100M)



</td>

<td >



  * More USB3.0 ports

  * Lighter

  * Thinner

  * Energy efficient

  * Battery life (up to 17h)

  * Ethernet chip consumes less power when disconnected or idle

  * Battery bridge (Swap batteries without turning off PC)

  * Multi-touch



</td>
</tr>
</tbody>
</table>
