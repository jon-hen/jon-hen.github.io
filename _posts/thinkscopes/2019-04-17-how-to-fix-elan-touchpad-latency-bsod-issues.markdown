---
author: jonashendrickx
date: 2019-04-17 13:56:08+00:00
slug: how-to-fix-elan-touchpad-latency-bsod-issues
title: How to fix ELAN Touchpad latency & BSOD issues
category: lenovo
tags:
- Lenovo ThinkPad
---
This article will help owners with an ELAN touchpad solve their touchpad latency and BSOD issues. The symptoms are that you will notice the mouse pointer moving with a 100ms or larger delay when using the touchpad. Occasionally, you may see a bluescreen or BSOD with error code '**DRIVER_IRQL_NOT_LESS_OR_EQUAL**'. Minidumps will point to '**ETD.sys**', which is the ELAN touchpad driver.

In addition, you may notice that any gestures or tapping to click, may be executed with a delay.

## Requirements

  * Models: ThinkPad P52
  * Operating system: Windows 10

## What's happening?

Based on the logs sent in by Lenovo ThinkPad P52 owners, we have found that the touchpad enters '**noise mode**'.

The driver enters 'noise mode' when interference is being detected. When this happens, a filter is being added to reduce the interference, which can increase the latency.

## Solution

We are currently waiting for the solution. A beta driver will be published to fix the bluescreen issue.

Check [Lenovo Support](https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-p-series-laptops/thinkpad-p52-type-20m9-20ma/downloads) for a newer driver version.

## Source

  * [Lenovo Forums](https://forums.lenovo.com/t5/ThinkPad-P-and-W-Series-Mobile/P52-ELAN-Touchpad-driver-ETD-sys-issues-latency-spikes-BSoD/td-p/4260487)