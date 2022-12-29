---
title: Cannot open SSRS/SSIS projects with VS2017
date: 2017-06-26T07:26:44-04:00
author: jonashendrickx
category: programming
---
When you&#8217;re trying to open your SSIS or SSRS solution, you will get a message that the migration has failed or **&#8216;The application which this project type is based on was not found.**&#8216;

![](/assets/img/posts/2017/06/ssrs-ssis-vs2017-unsupported.jpg){:class="img-fluid"}

## Method 1

  1. Open &#8216;**Microsoft Visual Studio 2017**&#8216;.
  2. In the menu bar, expand &#8216;**Tools**&#8216;, then choose &#8216;**Extensions & Updates**&#8216;. to install an extension.
  3. Search for &#8216;**Microsoft Reporting Services Projects**&#8216;, and install this extension.
  4. To complete the installation, shut down all windows and instances of Microsoft Visual Studio 2017. Then the installer will start.
  5. Try to open your solution or projects (***.rptproj**) again.

## Method 2

  1. Close all windows and instances of &#8216;**Microsoft Visual Studio 2017**&#8216;.
  2. Download &#8216;[Microsoft Reporting Services Projects](https://marketplace.visualstudio.com/items?itemName=ProBITools.MicrosoftReportProjectsforVisualStudio)&#8216; from the Visual Studio marketplace.
  3. Open your solution or project.