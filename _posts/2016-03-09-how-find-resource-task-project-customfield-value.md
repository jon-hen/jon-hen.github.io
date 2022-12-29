---
title: How to find an Resource, Task or Project based on a CustomField value?
date: 2016-03-09T03:34:41-05:00
author: jonashendrickx
category: programming
---
Finding or filtering resources, tasks and projects can be done in several ways. What you need is the internal name of the custom field. We can retrieve the objectsAssuming you want to make your application compatible with multiple PWA&#8217;s so you can reuse your code, it might be a good idea to use the CustomField name first to retrieve the InternalName property of the CustomField object. We will take the <a href="https://msdn.microsoft.com/EN-US/library/office/microsoft.projectserver.client.customfield_di_pj14mref.aspx" target="_blank">Microsoft.ProjectServer.Client.CustomField</a> class. There are three properties you must remember:

| Property | Description | Object Type | Example |
| --- | --- | --- | --- |
| Name | This is the name you have given to your custom field. | string | Resource_Alias |
| Id  | This is the unique identifier for the custom field. | Guid | 554b6e30-b1d4-46c2-b85a-98fd21d3f425 |
| InternalName | This is a string in the format ‘Custom_’ with the dashes removed. | string | Custom_554b6e30b1d446c2b85a98fd21d3f425 |

In case you want to look up the &#8216;**InternalName**&#8216; property of the custom field, you can do that with the code below. Note that depending on which method you use &#8216;_Single_&#8216;, &#8216;_Find_&#8216; or &#8216;_First_&#8216; it will affect the lookup speed.

{% highlight csharp %}
public string GetInternalName(string customFieldName)
{
    using (ProjectContext projContext = new ProjectContext("http://domain/pwa")) // Connect to Project Server
    {
        CustomFieldCollection customFields = projContext.CustomFields;
        projContext.Load(customFields);
        projContext.ExecuteQuery();
        return customFields.Single(c => c.Name.Equals(customFieldName)).InternalName;
    }
}
{% endhighlight %}

Now if we pass the parameter &#8216;_Resource_Alias_&#8216; to the method &#8216;_GetInternalName_&#8216;, we will get an exception if more than one result is found, which is impossible since you cannot define a custom field with the same name twice. But if the custom field is found once, we will get a string value in the format: &#8216;_Custom_554b6e30b1d446c2b85a98fd21d3f425_&#8216;. This is basically &#8216;_Custom__&#8216; with a guid string appended to it. Now what we need to do is retrieve all the resources from ProjectServer, and filter based on the value we just retrieved.

{% highlight csharp %}
// Define the name of your custom field here
public const string CustomFieldName = "Resource_Alias";

public static EnterpriseResource FindResource(string resourceAlias)
{
    using (ProjectContext projContext = new ProjectContext("http://domain/pwa")) // Connect to Project Server
    {
        // Load all resources
        EnterpriseResourceCollection resources = projContext.EnterpriseResources;
        projContext.Load(resources);
        projContext.ExecuteQuery();

        // Convert to list
        List<EnterpriseResource> resList = resources.ToList();

        // Filter
        string internalName = GetInternalName(CustomFieldName); // You can also enter the InternalName property directly here.

        // Beware PropertyNotInitializedException
        EnterpriseResource resource = resList.Find(r => r.FieldValues[internalName].ToString().Equals(resourceAlias));

        // return it
        return resource;
    }
}
{% endhighlight %}

This method will work for every object type that uses custom fields in Project Server. Also not that instead of:

{% highlight csharp %}
r.FieldValues[internalName]
{% endhighlight %}

You can also use:

{% highlight csharp %}
r[internalName]
{% endhighlight %}

Now in the large block of code above, I highlighted a small part:

{% highlight csharp %}
EnterpriseResource resource = resList.Find(r => r.FieldValues[internalName].ToString().Equals(resourceAlias));
{% endhighlight %}

It appears that this can crash your application with a &#8216;**PropertyNotInitializedException**&#8216; if the custom field is empty for a certain task, resource or project. One way to solve this is by writing your code like this:

{% highlight csharp %}
public EnterpriseResource FindResource(string resource_alias)
{
    foreach (var r in resources)
    {
        try
        {
            var value = r.FieldValues["Custom_893e3e3001b744fc9b3eb19965e9e0d2"].ToString();
            if(value.Equals(resource_alias)
            {
                return r;
            }
        }
        catch (KeyNotFoundException)
        {
            continue;
        }
        catch (PropertyOrFieldNotInitializedException)
        {
            continue;
        }
    }
    throw new ObjectNotFoundException("No matched resource found.");
}
{% endhighlight %}
