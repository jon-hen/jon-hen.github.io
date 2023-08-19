---
author: jinli
date: 2013-04-17 16:51:32+00:00
slug: thinkpad-w530-cpugpu-stress-test-result
title: ThinkPad W530 CPU/GPU stress test result
category: lenovo
tags:
- Lenovo ThinkPad
---
I have done some CPU and GPU stress tests on my ThinkPad W530 to test how well the thermal management system removes the heat, when the CPU and GPU are both under 100% load for a prolonged period of time. The thermal management stress tests that i did were conducted using Prime95 and Furmark on all three graphics mode:



  * Nvidia Optimus (Intel HD 4000 + Nvidia K2000m)

  * Nvidia Discrete (Nvidia K2000m)

  * Intel Integrated (Intel HD 4000)


The specifications of my ThinkPad W530 are as:



  * i7 Quad Core 3720qm

  * 8 gigs of ram (across four dimm slots)

  * 120 gigs of SanDisk Extreme SATAIII

  * FHD AUO Panel

  * 9 Cells battery

  * 170 watts power adapter


In addition, as part of the thermal management test i also recorded and graphed the fan behaviour (fan speed) of the W530 under various scenarios

## Test 1. CPU and GPU stress test on ThinkPad W530 with Nvidia Optimus

![ThinkPad W530 Thermal Management System Benchmark Result](http://farm9.staticflickr.com/8528/8636456815_b476a02b19_z.jpg) **Graph 1. ThinkPad W530 CPU and GPU thermal load stress test (Nvidia Optimus)**

In Test 1, i put my ThinkPad W530 in high performance mode under the ThinkVantage Power Manager, and i switched from the intel integrated graphics mode to the Nvidia Optimus within the BIOS menu ([Tutorial here shows you how to do it](h/blog/2012/12/24/how-to-switch-gpu-graphics-mode-in-the-thinkpad-w530-and-w520/)). I then proceeded to record the sensor outputs with the HWinfo64 program and save it as a CSV file. The procedure for the first test were as follows:



  * Let the ThinkPad idle for a few minutes to record the sensors parameter of the W530 when the laptop is under minimal workload.

  * Then start Prime95 and let it run for a few minutes to see how much CPU heats up when there is 100% workload across the 4 cores with HT on.

  * After Prime95 were started for a few minutes, i started the 15 minutes Furmark benchmark (FHD resolution NO AA).

  * When the Furmark benchmark is completed, i let the Prime95 run for a few minutes more.

  * At the end of the thermal management stress test, i let the machine idles a few more minutes before i stop recording the sensor output.


After i got all the sensor values in the CSV files, i graphed the CPU, GPU and fan speed, as shown in graph 1. In graph 1, it shows the following behaviour



  * During idling, the CPU temperature is averaging about 45 degrees Celsius (with periodic temperature spikes), while the Nvidia GPU averaged around 35 degrees Celsius, the Intel GPU temperature is not shown on graph 1, but on average it is within 2 to 4 degrees of the CPU temperature. The Intel GPU temperature is directly related to the CPU temperature, as both of them exists on the same silicon die. So even if the Intel GPU is not working much, the heat transfer that occurs between CPU and Integrated GPU would cause a relative equilibrium of temperature between them (with Delta T within few degrees Celsius). The fan is ON and quite audiable even when the CPU and GPU is idling at around 2700 RPM.



  * When the Prime95 stress test is started, the temperature of the CPU shot up to nearly 90 degrees Celsius (average at around 87 degrees Celsius) as seen on graph 1, at time = 7 minutes to 16 minutes. The temperature of the CPU was steadily increasing during the Prime95 stress test, and it was only plateauing to around 87 degrees Celsius mark at around 12 minutes mark. As the CPU temperature increased, the GPU temperature also increased even though the Prime95 is a CPU based stress test. This phenomena maybe explained by heat transfer between high temperature source and lower temperature sink. While the thermal energy that needs to be dissipated from the CPU and GPU is carried by their individual heat pipes, the CPU and GPU shares the same heatsink and fan. As such, when the CPU is stressed at 100% work load, the temperature of the common heatsink at the fan end maybe at higher temperature than the heatsink at the GPU end, which causes the waste heat energy to move towards the Nvidia GPU, thus causing the GPU to heat up even when there little workload placed on it. Both of the CPU and GPU temperature curves are similar in shape, which further proves the validity of the hypothesis. The fan was running at around 3450 RPM during the Prime95 stress test.



  * After Furmark GPU stress test is added on top of the Prime95 CPU stress test, the CPU temperature shot up to around 100 degrees Celsius, while the Nvidia GPU temperature also increased to around 78 degrees Celsius. The temperature differential (Delta T) between the CPU and Nvidia GPU narrowed as the result of the Furmark GPU stress test, when compared to the Prime95 CPU stress test alone. The fan speed of the W530 increased to about 4000 RPM when both the CPU and GPU stress test.



  * After the 15 minutes Furmark test was completed, i left the Prime95 test to run for another few minutes. When the Furmark was completed, the temperature of the CPU dropped back to 90 degrees Celsius, while the GPU temperature decreased and stayed at around 52 degrees Celsius. The fan speed also decreased to 3400 RPM from 4000 RPM.



  * When the Prime95 test was shut off at around 46 minutes mark, temperature of the CPU and GPU also decreased back to the initial idle level.


 


## Test 2. CPU and GPU stress test on ThinkPad W530 with Discrete Nvidia GPU (Optimus Off)


In test 1, i had the Nvidia Optimus mode which allows the ThinkPad to switch between the Intel integrated and Nvidia Discrete GPU when needed. In the second test, i changed the display option in the BIOS menu to discrete Nvidia GPU, which means that only the Nvidia GPU is operating for all graphics output.

![ThinkPad W530 CPU and GPU stress test (Nvidia Discrete GPU)](http://farm9.staticflickr.com/8523/8652136424_846db6f01b_z.jpg) **Graph 2. ThinkPad W530 CPU and GPU thermal load stress test (Nvidia Discrete/Optimus Off)**

In test 2, i followed the test 1 procedure, so i would just jump straight to explaining the test 2 graph result:



  * During idling the CPU temperature averaged at about 40 degrees Celsius, whilst the Nvidia GPU temperature was around 27 to 28 degrees Celsius. The fan speed was around 2700 RPM. Both the Nvidia GPU and CPU temperature in this test was lower than test 1 with the Nvidia Optimus on. This could be due to that the Intel GPU was not operating, which resides on the same silicon die as the CPU, as such there were less heat energy generated and lead to a lower CPU temperature. 

  * When the Prime95 test was started the temperature of the CPU and GPU shot up simultaneously, with the CPU reaching a temperature of around 80 degrees, with the GPU reaching a temperature of around 50 degrees Celsius. The fan speed hovered between 3000 to 3500 RPM.

  * When the Furmark stress test was started, the temperature of the CPU and GPU rapidly increased and plateaued to around 93 degrees Celsius (CPU) and 72 degrees Celsius (Nvidia GPU), and the fan was running at the speed of around 3900 RPM.

  * After the Furmark stress test was completed, with the Prime95 test continued to run, the CPU and GPU temperature decreased. The CPU temperature plateaued to around 84 degrees Celsius, while the Nvidia GPU decreased and flattened to around 51 degrees Celsius. The fan speed remained at around 3500 RPM during this period.

  * Upon completion of the Prime95 test, and the ThinkPad W530 was allowed to idle, the temperature of the CPU decreased towards 42 degrees Celsius (average), whilst the Nvidia GPU decreased towards 30 degrees Celsius. The fan speed during idling was around 2700 RPM with minor fluctuation at the initial idling period.


In test 2, i have noticed that the CPU and GPU were running cooler than test 1, which has the Nvidia Optimus on. This is slightly counterintitutive, since Nvidia Optimus was designed to minimize power use and therefore thermal energy output.

 


## Test 3. CPU and GPU stress test on ThinkPad W530 with Intel HD 4000 (Integrated GPU only)


![ThinkPad W530 CPU and GPU stress test (intel integrated GPU)](http://farm9.staticflickr.com/8397/8651039295_fd12a7ba95_z.jpg) **Graph 3. ThinkPad W530 CPU and GPU thermal load stress test (Intel Integrated GPU only).**

In test 3, i switched the ThinkPad W530 graphics mode to integrated only, which in effect switched the Nvidia GPU off. I graphed the CSV from the test as shown in graph 3.



  * At initial idling the CPU and GPU temperature was very similar, with average at around 40 degrees Celsius. Fan speed was around 2700 RPM.

  * When the Prime95 test was started the CPU and GPU temperature shot up and reached around 82 degrees. The GPU temperature increase can be explained by the fact that the CPU and Intel GPU lives on the same silicon die, and heat transfer caused the Intel GPU temperature to equilibrate with that of the CPU. Fan speed was around 3450 RPM (average).

  * After the Furmark stress test began, the CPU and GPU temperature experienced a sudden drop, with the CPU temperature averaged at around 75 degrees Celsius, while the GPU temperature dropped and remained at around 70 degrees Celsius. The fan speed was around 3450 RPM.

  * When the Furmark stress test was completed, the temperature of CPU and GPU shot up and averaged at around 82 degrees Celsius. The fan speed was around 3450 RPM average.

  * After the Prime95 test was completed, the CPU and GPU temperature dropped to average of 50 degrees Celsius. The fan speed was around 2900 RPM.


The sudden drop of the CPU and GPU speed when both the Prime95 and Furmark test were ran, could be explained by throttling the CPU, which also decreased the heat output  and thus the temperature also dropped accordingly, as shown in Graph 4 below.

![ThinkPad W530 CPU and GPU stress test (intel integrated GPU 2 - CPU throttling)](http://farm9.staticflickr.com/8397/8651039049_31bc50f5bc_z.jpg) **Graph 4. CPU throttling behaviour**

From these stress tests, it showed that the ThinkPad W530 thermal management was capable of keeping the W530 cool, even when both the CPU and Nvidia GPU was working at their maximum heat load. However, for peak performance and longevity sake, it is best that you clean the fan and heatsink regularly to keep the collected dusts to a minimal level, to ensure optimal performance. 
