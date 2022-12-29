---
title: Update CustomField based on LookUpTable value
date: 2016-04-11T04:26:17-04:00
author: jonashendrickx
category: programming
---
If you have a custom field that only accepts values from a lookup table, you cannot assign values the way you would with a regular custom field value. To start we will retrieve the &#8216;_InternalName_&#8216; property of the custom field, the value should look like the variable &#8216;_customFieldInternalName_&#8216; below.

To write our article, we used a project. So first check out the project to be able to make changes to the custom fields. We will then create a variable of the lookup table, and retrieve its values. We are looking for a specific entry in the lookup table, of which we will save the &#8216;InternalName&#8217; property for later use. We stored the value of the &#8216;InternalName&#8217; property in a variable called &#8216;invoicedInternalName&#8217;.

**The custom field only accepts an array of strings as values. These strings are the values of the &#8216;_InternalName_&#8216; property of the entry in the lookup table.**

All is left is to check in and publish your project in this sample. This method also works for tasks and resources.

{% highlight csharp %}
// InternalName of the custom field
string customFieldInternalName = "Custom_d6f1eabe76f5e64580ed00126ee74a0e"
// Checkout the project
DraftProject draftProject = publishedProject.Checkout()

// Create a shortcut for the lookup table and load all lookup tables
var luts = projContext.LookupTables;
projContext.Load(luts);
projContext.ExecuteQuery();

// Just retrieve the lookup table we need
var lut = luts.GetByGuid(new Guid("73897025-0aa0-e511-80eb-00155d0ce209"));

// Retrieve a specific entry
var entry = lut.Entries.Single(e => e.FullValue.Equals("Invoiced"));

// Get its internal name from the InternalName property
var invoicedInternalName = entry.InternalName;

// and store it in an array of strings
string[] lutInvoiceStatusValues = {invoicedInternalName};

// Apply it to the checked out project.
draftProject[customFieldInternalName] = lutInvoiceStatusValues

// Check project in and publish
// ...
{% endhighlight %}