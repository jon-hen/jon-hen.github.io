---
title: Non-work tasks creating unwanted calendar exceptions
date: 2016-06-06T07:33:01-04:00
author: jonashendrickx
category: programming
![](/assets/img/posts/2016/06/msproject_administrativenonworking.jpg){:class="img-fluid"}

Today I discovered one of the clients I was working for was not using Project Server correctly. They created a non-billable administrative task and marked it as &#8216;Non Work&#8217; in Project Server. The downside to this is that a calendar exception is generated on the calendar of the resource that booked on this task, note that these calendar exceptions cannot be deleted manually or with CSOM, PSI, &#8230; In CSOM, an exception &#8216;PJClientCallableException&#8217; will be thrown with &#8216;13020&#8217; as error code.

This calendar exception will have the name &#8220;**Exception &#8216;Resource Non-Working&#8217; on calendar**&#8221; as you can see in the screenshot on the left on May 17th 2016. In the list of the &#8216;Exceptions&#8217; and &#8216;Work Weeks&#8217; tab, you won&#8217;t find this exception. When we check the base calendar, we can also verify no calendar exceptions were present on that day defined by the base calendar.

This brings us to checking the timesheet of the resource of the working week starting at Monday 16th of May 2016 till Friday 20th of May 2016. You can create and use a delegate for this or use any other method preferred.

In the timesheet below we can see that 8 hours were booked on an administrative task &#8216;XXX &#8211; Non-billable Internal&#8217;. Now what you need to do is the following:

  1. Go to &#8216;Server Settings&#8217;.
  2. In the section &#8216;Time and Task Management&#8217;, click &#8216;Administrative Time&#8217;.
  3. Find the task in the list.
  4. If the task is of work type &#8216;**Non Work**&#8216;, then change it to work type &#8216;**Working**&#8216;.

**Note:** Due to a bug in Project Server 2013, the calendar exceptions will still be there after changing the work type to &#8216;Working&#8217;. You can recall every timesheet, edit the timesheet line, and then resubmit the timesheet. Then check the calendar again for your resource.

![](/assets/img/posts/2016/06/msproject_administrativenonworking_timesheet.jpg){:class="img-fluid"}

In the scenario above we can conclude that the working type &#8216;Non Work&#8217; was not used correctly and a different solution should be used.