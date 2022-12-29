---
title: How to improve reliability when updating multiple calendar exceptions?
date: 2016-04-01T03:47:56-04:00
author: jonashendrickx
category: programming
---
It took me several weeks to figure this out. When updating a project, you would usually check it out manually and then check it back in and publish when you are done. Then you wait for the PWA job queue to finish the job you submitted. This is quite easy to write in C#.

Things become more complicated however if you are inserting a large amount of calendar exceptions into Project Server for a specific resource. You will get strange errors like PJClientCallableException for no apparent reason, as you would assume the resource is automatically checked out and then checked back in for you.

So what I am trying to achieve in CSOM is:

{% highlight csharp %}
// just imagine this list has public holidays in it.
List<PublicHoliday> holidays = new List<PublicHoliday>();

// log in
var projContext = new ProjectContext("http://mypwa.com/pwa/");
projContext.ExecuteQuery();

// load resources
var resources = projContext.EnterpriseResources;
projContext.Load(resources);
projContext.ExecuteQuery();

// select resource
var resource = resources.First(r => r.Name.Equals("Jonas Hendrickx"));
projContext.Load(resource);
projContext.ExecuteQuery();

// check if user is active and not checked out
if (!resource.IsActive || resource.IsCheckedOut)
    return;

// load calendar exceptions
var exceptions = resource.ResourceCalendarExceptions;
projContext.Load(exceptions);
projContext.ExecuteQuery();

// process your holidays
foreach (var holiday in holidays)
{
    var ex = new CalendarExceptionCreationInformation()
    {
        Name = holiday.Name,
        Start = holiday.Start,
        Finish = holiday.Finish
    };
    exceptions.Add(ex);

    // PROCESSING, checking for overlaps, splitting overlaps, etc

    // Process the addition
    resources.Update();
    projContext.ExecuteQuery(); // CRASH 2nd attempt
}
{% endhighlight %}


Now the problem with the code above is that I am trying to insert two public holidays or just generic exceptions. Let&#8217;s assume we have two public holidays in the example above that are on the same day. (For example two countries have a different public holiday on the same day). After inserting the first public holiday, the PROCESSING part will not detect an overlap, because it is still being processed by Project Server. Eventually it will crash while submitting the second public holiday on the last line where I execute the query (submitting it to the queue). This is quite annoying. but can easily be solved.

In the code sample below, we will refresh the contents of the resource and its calendar exceptions we are processing to prevent the crash upon the submission of the next calendar exception.

{% highlight csharp %}
// just imagine this list has public holidays in it.
List<PublicHoliday> holidays = new List<PublicHoliday>();

// log in
var projContext = new ProjectContext("http://mypwa.com/pwa/");
projContext.ExecuteQuery();

// load resources
var resources = projContext.EnterpriseResources;
projContext.Load(resources);
projContext.ExecuteQuery();

// select resource
var resource = resources.First(r => r.Name.Equals("Jonas Hendrickx"));
projContext.Load(resource);
projContext.ExecuteQuery();

// check if user is active and not checked out
if (!resource.IsActive || resource.IsCheckedOut)
    return;

// load calendar exceptions
var exceptions = resource.ResourceCalendarExceptions;
projContext.Load(exceptions);
projContext.ExecuteQuery();

// process your holidays
foreach (var holiday in holidays)
{
    var ex = new CalendarExceptionCreationInformation()
    {
        Name = holiday.Name,
        Start = holiday.Start,
        Finish = holiday.Finish
    };
    exceptions.Add(ex);

    // PROCESSING, checking for overlaps, splitting overlaps, etc

    // Process the addition
    resources.Update();
    projContext.ExecuteQuery(); // CRASH PREVENTED

    // tell the queue to refresh the current resource and its calendar exceptions
    //to prevent the crash when submitting the next request
    projContext.Load(resource);
    projContext.ExecuteQuery();
    projContext.Load(exceptions);
    projContext.ExecuteQuery();
}
{% endhighlight %}