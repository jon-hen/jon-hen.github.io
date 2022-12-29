---
title: 'Can&#8217;t import CSV in Excel with Sophos installed'
date: 2017-08-30T17:00:20-04:00
author: jonashendrickx
category: tech
---
When Sophos is installed as an antivirus, you may run into issues when importing *.csv (comma separated values) files in Microsoft Excel.

  1. Enable ‘Legacy Text Import’ via &#8216;**File > Options > Data**&#8216;
  2. Check &#8216;**From Text (Legacy)**&#8216;.
  ![](/assets/img/posts/2017/08/sophos1.jpg){:class="img-fluid"}
  3. Next, use the legacy wizard which is accessible from the ribbon &#8216;**Data > Get Data > Legacy Wizards > From Text (Legacy)**&#8216;
    ![](/assets/img/posts/2017/08/sophos2.jpg){:class="img-fluid"}

**Note:** This is a workaround you&#8217;ll have to do every time you want to import a *.csv as it&#8217;s on a per Excel file setting.