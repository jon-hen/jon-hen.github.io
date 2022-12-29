---
title: 'Project Server Online &#8211; License administration'
date: 2016-03-31T03:45:15-04:00
author: jonashendrickx
category: programming
---
When you have Project Server Online, you have several types of licenses you can assign to your users. If you assign Project Professional licenses to employees that generally don&#8217;t require it, you will end up wasting a lot of money.

  * **Project Lite:** Assign this license to users that will just be accessing Project Server using the website. This can be used for simple tasks such as editing your timesheet.
  * **Project Online with Project Pro for Office 365:** This license is for more advanced tasks that require Microsoft Project 2016 Professional. Do not assign this license if your users do not require it. This license should be meant for project managers.&nbsp;

If a user was previously assigned a **SharePoint Online** license, you may also receive an error dialog saying it is impossible to assign a **Project Lite** or **Project Online with Project Pro for Office 365**.

> <table>
>   <tr>
>     <td class="msgboxTd" valign="top">
>       <span class="dspBlock breakWord Error">You can&#8217;t assign licenses that contain these conflicting services: SharePoint Online (Plan 1), SharePoint Online (Plan 2). Review the services included with each license, and try again.</span>
>     </td>
>   </tr>
> </table>

If this is the case, expand the &#8216;SharePoint Online &lrm;(Plan 1)&lrm; with Yammer&#8217; license for a user on your SharePoint user administration page, and remove the &#8216;SharePoint Online (Plan 1)&#8217; license, leaving Yammer enabled, then try to apply the Project Lite or Project Online license again.