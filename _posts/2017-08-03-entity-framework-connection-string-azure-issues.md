---
title: Entity Framework connection string in Azure issues
date: 2017-08-03T04:40:34-04:00
author: jonashendrickx
category: programming
---
I had an Azure Web Job in Azure which was using an Entity Framework connection string. After a while it stopped working and threw the exception below. 

    <b>Microsoft.Azure.WebJobs.Host.FunctionInvocationException</b>:
    Microsoft.Azure.WebJobs.Host.FunctionInvocationException:
    Exception while executing function: Functions.Synchronize
     ---> System.AggregateException: One or more errors occurred.
     ---> System.ArgumentException: Keyword not supported: 'data source'.
     at System.Data.Entity.Core.EntityClient.Internal.DbConnectionOptions.ParseInternal(IDictionary`2 parsetable, String connectionString, IList`1 validKeywords)
     at System.Data.Entity.Core.EntityClient.Internal.DbConnectionOptions..ctor(String connectionString, IList`1 validKeywords)
     at System.Data.Entity.Core.EntityClient.EntityConnection.ChangeConnectionString(String newConnectionString)
     at System.Data.Entity.Core.EntityClient.EntityConnection..ctor(String connectionString)
     at System.Data.Entity.Internal.LazyInternalConnection.InitializeFromConnectionStringSetting(ConnectionStringSettings appConfigConnection)
     at System.Data.Entity.Internal.LazyInternalConnection.TryInitializeFromAppConfig(String name, AppConfig config)
     at System.Data.Entity.Internal.LazyInternalConnection.Initialize()
     at System.Data.Entity.Internal.LazyInternalConnection.CreateObjectContextFromConnectionModel()
     at System.Data.Entity.Internal.LazyInternalContext.InitializeContext()
     at System.Data.Entity.Internal.InternalContext.GetEntitySetAndBaseTypeForType(Type entityType)
     at System.Data.Entity.Internal.Linq.InternalSet`1.Initialize()
     at System.Data.Entity.Internal.Linq.InternalSet`1.get_InternalContext()
     at System.Data.Entity.Infrastructure.DbQuery`1.System.Linq.IQueryable.get_Provider()
     at System.Linq.Queryable.Join[TOuter,TInner,TKey,TResult](IQueryable`1 outer, IEnumerable`1 inner, Expression`1 outerKeySelector, Expression`1 innerKeySelector, Expression`1 resultSelector)
     at xxx.Services.SyncService.<>c__DisplayClass7_1.<xxx>b__1(String me) in D:\Development\Workspaces\xxx\Automation\xxx\xxx\Services\SyncService.cs:line 77
     at System.Collections.Generic.List`1.ForEach(Action`1 action)
     at xxx.Services.SyncService.<xxx>d__7.MoveNext() in D:\Development\Workspaces\xxx\Automation\xxx\xxx\Services\SyncService.cs:line 75
     --- End of inner exception stack trace ---
     at System.Threading.Tasks.Task.ThrowIfExceptional(Boolean includeTaskCanceledExceptions)
     at System.Threading.Tasks.Task.Wait(Int32 millisecondsTimeout, CancellationToken cancellationToken)
     at xxx.Functions.Synchronize(TimerInfo timerInfo, TextWriter log) in D:\Development\Workspaces\xxx\Automation\xxx\xxx\Functions.cs:line 27
     at lambda_method(Closure , Functions , Object[] ) at Microsoft.Azure.WebJobs.Host.Executors.VoidMethodInvoker`1.InvokeAsync(TReflected instance, Object[] arguments)
     at Microsoft.Azure.WebJobs.Host.Executors.FunctionInvoker`1.<InvokeAsync>d__8.MoveNext()
     --- End of stack trace from previous location where exception was thrown ---
     at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
     at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
     at Microsoft.Azure.WebJobs.Host.Executors.FunctionExecutor.<InvokeAsync>d__22.MoveNext()
     --- End of stack trace from previous location where exception was thrown ---
     at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
     at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
     at System.Runtime.CompilerServices.TaskAwaiter.ValidateEnd(Task task)
     at Microsoft.Azure.WebJobs.Host.Executors.FunctionExecutor.<ExecuteWithWatchersAsync>d__21.MoveNext()
     --- End of stack trace from previous location where exception was thrown ---
     at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
     at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
     at Microsoft.Azure.WebJobs.Host.Executors.FunctionExecutor.<ExecuteWithLoggingAsync>d__19.MoveNext()
     --- End of stack trace from previous location where exception was thrown ---
     at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
     at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
     at System.Runtime.CompilerServices.TaskAwaiter.ValidateEnd(Task task)
     at Microsoft.Azure.WebJobs.Host.Executors.FunctionExecutor.<ExecuteWithLoggingAsync>d__13.MoveNext()
     --- End of inner exception stack trace ---
     at System.Runtime.ExceptionServices.ExceptionDispatchInfo.Throw()
     at Microsoft.Azure.WebJobs.Host.Executors.FunctionExecutor.<ExecuteWithLoggingAsync>d__13.MoveNext()
     --- End of stack trace from previous location where exception was thrown ---
     at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
     at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
     at Microsoft.Azure.WebJobs.Host.Executors.FunctionExecutor.<TryExecuteAsync>d__10.MoveNext()

The cause was the connection string for one of the EDMX files we were using. Since the EDMX has to be read-only, we had to use a different connection string in Azure:

    metadata=res://*/MainDB.csdl|res://*/MainDB.ssdl|res://*/MainDB.msl;provider=System.Data.SqlClient;provider connection string=&quot;Data Source=.\SQLEXPRESS;AttachDbFilename=D:\Workspace\vs\Leftouch\Leftouch.Web\Data\Leftouch.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True;App=EntityFramework&quot;

When replacing **&quote;** by a single quote **( &#8216; )**, it will work fine again.

Note: Make sure you also select &#8216;Custom&#8217; instead of &#8216;SQL Azure&#8217; for your Entity Framework connection string, even though the database runs on Azure.