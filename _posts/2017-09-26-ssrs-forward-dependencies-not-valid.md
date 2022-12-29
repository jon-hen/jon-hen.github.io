---
title: 'SSRS &#8211; Forward dependencies are not valid.'
date: 2017-09-26T02:23:28-04:00
author: jonashendrickx
category: programming
---
The error we will be discussing in this article is: &#8216;**[rsInvalidReportParameterDependency] The report parameter &#8216;X&#8217; has a DefaultValue or a ValidValue that depends on the report parameter &#8220;Y&#8221;. Forward dependencies are not valid.**&#8216;

![Forward dependencies are not valid.](/assets/img/posts/2017/09/ssrs_forwarddependenciesnotvalid_2.jpg){:class="img-fluid"}

Or in this example:

<pre>'[rsInvalidReportParameterDependency] The report parameter 'Employee' has a DefaultValue or a ValidValue that depends on the report parameter "EmployeeCompany". Forward dependencies are not valid.'</pre>

As you can see in the screenshot below, I have two parameters &#8216;EmployeeCompany&#8217; and &#8216;Employee&#8217;. The &#8216;Employee&#8217; drop-down list is populated depending on the selection of &#8216;EmployeeCompany&#8217; for this we use a dataset where the &#8216;EmployeeCompany&#8217; parameter is passed. But as you can see, the dropdown list of &#8216;Employee&#8217; is before &#8216;EmployeeCompany&#8217;.

  * &#8216;Employee&#8217; depends on &#8216;Employee Company&#8217;
  * &#8216;Contract&#8217; depends on &#8216;Company&#8217;

![The parameters as configured with the report failing to build.](/assets/img/posts/2017/09/ssrs_forwarddependenciesnotvalid_1.jpg){:class="img-fluid"}

If we swap their locations, the error goes away and the report will build just fine. As you can see in the screenshot above, the order of the &#8216;Contract&#8217; and &#8216;Company&#8217; parameters was already correct, which was why we were not receiving any errors for those two.

![Parameters with their swapped locations according to their dependencies.](/assets/img/posts/2017/09/ssrs_forwarddependenciesnotvalid_3.jpg){:class="img-fluid"}