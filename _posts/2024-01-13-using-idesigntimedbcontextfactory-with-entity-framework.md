---
title: Using IDesignTimeDbContextFactory with Entity Framework
date: 2024-01-13T09:35:00+02:00
author: jonashendrickx
category: programming
thumbnail: /assets/img/posts/csharp.png
---

While working on Passwordless.dev, we wanted to support multiple databases. At the time of writing this article, we were
supporting Microsoft SQL Server and Sqlite.

One of the issues we ran into adding migrations using .NET migrations was that, when we were using Sqlite on
our developer machines, we would require to modify the appsettings.json to have the connection string for Microsoft SQL
Server set.

This is not ideal, as we would have to modify the appsettings.json file every time we wanted to add a migration.

Essentially, if no IDesignTimeDbContextFactory is found, will use the application's service provider to create
instances. This means that the application must be running in order to create the DbContext instances and register them
with the service provider.

## IDesignTimeDbContextFactory

The solution to this problem is to use the IDesignTimeDbContextFactory interface. This interface is used by the .NET
CLI to create a DbContext instance at design-time. This is useful when you want to use Entity Framework Core
commands to create migrations.

The interface is defined as follows:

{% highlight csharp %}
public interface IDesignTimeDbContextFactory<out TContext> where TContext : DbContext
{
TContext CreateDbContext(string[] args);
}
{% endhighlight %}

The CreateDbContext method is called by the .NET CLI when it needs to create a DbContext instance. The args parameter
contains the command line arguments passed to the .NET CLI.

## Implementing IDesignTimeDbContextFactory

To implement the IDesignTimeDbContextFactory interface, we need to create a class that implements the interface.
You will have to do this for each database you want to support.

{% highlight csharp %}
// ReSharper disable UnusedType.Global

using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace Passwordless.AdminConsole.Db;

/// <summary>
/// Do not delete this file. It is used by EF Core to create migrations.
/// </summary>
public class MsSqlDesignTimeDbContextFactory : IDesignTimeDbContextFactory<MssqlConsoleDbContext>
{
public MssqlConsoleDbContext CreateDbContext(string[] args)
{
var options = new DbContextOptionsBuilder<MssqlConsoleDbContext>();
options.UseSqlServer(args.Length == 1 ? args[0] : null);
return new MssqlConsoleDbContext(options.Options);
}
}
{% endhighlight %}


