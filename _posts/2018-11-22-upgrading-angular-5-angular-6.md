---
title: Upgrading from Angular 5 to Angular 6
date: 2018-11-22T00:19:07-05:00
author: jonashendrickx
category: programming
---
My experience with Angular learns that not every tutorial may work for you, and nothing is documented properly. So I decided to write about my experience upgrading Angular 5 to Angular 6 with the ASP.NET Core Single Page Application (SPA) Template.

At the time of writing this article, version 6.2.7 was the latest. I did not want to upgrade to 7.x just yet.

<pre>npm install -g @angular/cli@6.2.7
npm install @angular/cli@6.2.7</pre>

All other tutorials seemed to suggest that executing the command below was sufficient, however for me it didn&#8217;t do anything.

My &#8216;angular-cli.json&#8217; wasn&#8217;t being converted to &#8216;angular.json&#8217; at all. Writing &#8216;angular.json&#8217; manually, is also a very bad way of doing things, so I kept looking. You can always learn more about this file format <a href="https://github.com/angular/angular-cli/wiki/angular-workspace" target="_blank" rel="noopener noreferrer">here</a>.

    npm update @angular/cli

Eventually I put something together. Since I was upgrading coming from Angular CLI 1.7.4, what did work for me was:

    npm update @angular/cli --from=1.7.4 --migrate-only

Sadly enough, this is not documented anywhere, at least not <a href="https://docs.npmjs.com/cli/update" target="_blank" rel="noopener noreferrer">where I would expect it to be documented</a>. When this is done, upgrade all individual @angular/&#8230; packages and their dependencies.

Now if you run &#8216;ng serve&#8217;, you will get the error message below:

<pre>InvalidOperationException: The NPM script ‘start’ exited without indicating that the Angular CLI was listening for requests. The error output was: Unknown option: ‘–extractCss’</pre>

This is because ng serve no longer supports the &#8211;extract-Css option, which you may have already found out.

Now in your &#8216;packages.json&#8217;, you will also have to remove &#8216;&#8211;extract-Css&#8217; from the &#8216;ng serve&#8217; command.

Last but not least, if your Angular project was created inside an ASP.NET Core project with Visual Studio, you may also need to change:

<pre>--bh your-path</pre>

To:

<pre>--base-href=your-path</pre>

Last but not least, you need to upgrade &#8216;RxJs&#8217; and remove backwards compatibility. Run the following commands:

<pre>npm install -g rxjs-tslint
rxjs-5-to-6-migrate -p src/tsconfig.app.json
npm uninstall rxjs-compat
</pre>

Then finally, run &#8216;ng serve&#8217; to verify your project is compiling.