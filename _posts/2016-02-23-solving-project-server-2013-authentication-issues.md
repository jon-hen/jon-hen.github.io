---
title: Solving Project Server 2013 authentication issues
date: 2016-02-23T03:31:22-05:00
author: jonashendrickx
category: programming
---
I have been working with Microsoft Project 2013/2016 and Microsoft Project Server 2013 for a few months now. And something that kept coming back was people that couldn&#8217;t access the Project Web App (PWA).

Now to diagnose where the connectivity problems are coming from start like this:

  1. Check if a license was assigned to the user in Office 365.
  2. Check if a user was created in Project Server.
  3. Verify the user in Project Server is a member of the correct **RBS** and **Security Group**.

We will cover this in detail below.

## Verify Project license

  1. Go to <https://portal.office.com/>
  2. Log in with the administrator credentials.
  3. Click the **<a href="https://portal.office.com/Admin/Default.aspx" target="_blank">Admin</a>** tile.
  4. Click **Users** in the left menu.
  5. Click **Active Users**.
  6. Use the search icon to look for the user having authentication or access issues in Project Server.
  7. Click on the user you are looking for once.
  8. And then on the right side, you will read **Assigned License**. Click the **Edit** button to modify the assigned licenses.
  9. Verify that either one of the following licenses or a similar license is applied depending on the product: 
      * Project Lite
      * Project Online with Project Pro for Office 365
      * Project Online

## Verify user exists in Project Server

  1. Visit your PWA url.
  2. Go to **Server Settings**.
  3. Under **Security**, click **Manage Users**.
  4. If you cannot find your user in the list, you may have to create a new one.

## Verify user permissions

  1. Visit your PWA url.
  2. Go to Server Settings.
  3. Under **Security**, click **Manage Users**.
  4. If you cannot find your user in the list, you may have to create a new one. If it exists, open the user.
  5. Fill in the fields **Security Group** and **RBS**, if they haven&#8217;t been filled in already.