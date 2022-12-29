---
title: How to freeze rows or columns in SSRS?
date: 2017-09-21T06:45:16-04:00
author: jonashendrickx
category: programming
---
Freezing a row or column is something you may already be familiar with if you worked with Excel sheets in the past.

When you have your &#8216;**Design**&#8216; view open of your report. You can right-click the tablix and choose &#8216;**Tablix Properties**&#8216;.

![](/assets/img/posts/2017/09/ssrs_freeze_1.jpg){:class="img-fluid"}

The options you want to use are:

  * &#8216;**Repeat header rows on each page**&#8216;: This will display the header on every page.
  * &#8216;**Keep header visible while scrolling**&#8216;
  * &#8216;**Repeat header columns on each page**&#8216;: This will display the header on every page.
  * &#8216;**Keep header visible while scrolling**&#8216;

![](/assets/img/posts/2017/09/ssrs_freeze_2.jpg){:class="img-fluid"}

These options can also be found in the &#8216;Properties&#8217; pane on the bottom right in Visual studio when the tablix (matrix/table) is selected.

General:

  * &#8216;**FixedColumnHeaders**&#8216;: Related to scrolling
  * &#8216;**FixedRowHeaders**&#8216;: Related to scrolling
  * &#8216;**RepeatColumnHeaders**&#8216;: Related to pages
  * &#8216;**RepeatRowHeaders**&#8216;: Related to pages

![](/assets/img/posts/2017/09/ssrs_freeze_3.jpg){:class="img-fluid"}