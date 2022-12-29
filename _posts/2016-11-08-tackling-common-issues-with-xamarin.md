---
title: Tackling common issues with Xamarin
date: 2016-11-08T20:33:56-05:00
author: jonashendrickx
category: programming
---
## Could not connect to the debugger

When you click the play-button to deploy your app and debug it, the Android app starts and immediately closes. In the console you can read that the debugging was stopped. If this is the case, the workaround is simple:

  1. Start **&#8216;Hyper-V Manager&#8217;**.
  2. Select the emulator you are trying to use.
  3. Right-click the selected emulator, and click **&#8216;Settings&#8217;**.
  4. Expand the **&#8216;Hardware&#8217;** section.
  5. Click the plus-icon in front of **&#8216;Processor&#8217;** to expand.
  6. Click **&#8216;Compatibility&#8217;**.
  7. Uncheck **&#8216;Migrate to a physical computer with a different processor version&#8217;**.

## libaot-mscorlib.dll.so not found

  1. Open your solution in Visual Studio 2015.
  2. Right-click the Android project.
  3. Click **&#8216;Properties&#8217;**.
  4. In the &#8216;Android Options&#8217; section, uncheck **&#8216;Use Fast Deployment (debug mode only)&#8217;**.

&nbsp;