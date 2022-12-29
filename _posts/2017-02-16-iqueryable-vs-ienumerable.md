---
title: IQueryable vs IEnumerable
date: 2017-02-16T08:19:24-05:00
author: jonashendrickx
category: programming
---
I had this question turn up during a job interview, and I thought it might be a good idea to write an article for this.

{% highlight csharp %}
IQueryable<Rental> rentals1 = from r in db.Rentals where r.City == "Tampa"    
IEnumerable<Rental> rentals = from r in db.Rentals where r.City == "Tampa"
{% endhighlight %}

The difference here is that IQueryable<T> allows LINQ-To-SQL. The LINQ query you write in C# will be executed by the database if possible. IEnumerable<T> however, will be LINQ-To-Object, meaning everything will be loaded into the memory. Now I don&#8217;t have to explain the impact on the performance this can have.

Let&#8217;s move on to the next part and assume we want to filter the above results by setting a maximum price of 1000 dollars.

{% highlight csharp %}
var filteredRentals1 = rentals.Where(r => r.Price < 1000);
var filteredRentals2 = rentals.Where(r => r.Price < 1000);
{% endhighlight %} 

Now here is where it gets even more clear. In the variable &#8216;filteredRentals1&#8217; which uses the IQueryable<T> interface, we won&#8217;t have wasted any resources. But with IEnumerable<T> we will be going through every object that is already in the memory, filter what we need, and then create a new object in memory with the filtered rentals. That is a lot of wasted memory right there.

It now becomes abundantly clear that using IQueryable<T> can in many cases save you from fetching too many rows from the database. You can also page your results easily with IQueryable using the Take and Skip methods.