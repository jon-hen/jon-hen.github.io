---
title: Await Observable to complete in Angular
date: 2017-12-06T06:27:40-05:00
author: jonashendrickx
category: programming
---
## Background

I&#8217;ve encountered an instance where I was using &#8216;ag-grid&#8217; with Angular and I needed to have the headers translated. However, to retrieve the translations using &#8216;ngx-translate&#8217;, we get an &#8216;Observable&#8217; returned. If we subscribe to a successful result in the constructor, it will simply continue executing the rest of the code and initialize the user interface. After which the translations are probably already set, and they cannot be changed for some reason.

## Solution

For this I decided to await the Observable in the constructor, but it was not easy to figure out because I&#8217;m fairly new to Angular. Anyways, you may want to look into using a &#8216;Promise&#8217;. Using &#8216;Promise&#8217; as a return value in a method, you can use something similar to an &#8216;await&#8217; in C# with more or less a lambda syntax.

    constructor(public translateSvc: TranslateService) {
      let headerKeys: string[] = [
        'EMPLOYEE',
        'DATE',
        'CONTRACT',
        'REQUESTED_BY',
        'DURATION',
        'APPROVED',
        'STATE'
      ];
    
      this.getTranslations(headerKeys).then(success => {
        this.colDefs = [
          {
            headerName: '#',
            ...
          },
          {
            headerName: success['EMPLOYEE'],
            ...
          },
          {
            headerName: success['DATE'],
            ...
          },
          {
            headerName: success['CONTRACT'],
            ...
          },
          {
            headerName: success['REQUESTED_BY'],
            ...
          },
          {
            headerName: success['DURATION'],
            ...
          },
          {
            headerName: success['APPROVED'],
            field: 'approvalMinutes',
            filter: 'number',
            minWidth: 100,
            width: 100
          },
          {
            headerName: success['STATE'],
            ...
          },
          {
            headerName: '',
            ...
          }
        ];
      });
    }

<pre>private getTranslations(keys: string[]): Promise<any&gt; {
  return new Promise((resolve, reject) =&gt; {
    this.translateSvc.get(keys).subscribe(success =&gt; {
      resolve(success);
    });
  });
}</pre>

The above code should be fairly easy to understand. I&#8217;m retrieving the translations from &#8216;TranslationService&#8217; which we inject in the constructor with dependency injection. Check [this documentation](https://github.com/ngx-translate/core) for details on &#8216;[ngx-translate](https://github.com/ngx-translate/core)&#8216;. The method &#8216;get&#8217; returns a &#8216;Observable<string[]>&#8217; in the example above. However, even if we write the value in the subscribe method to the column definitions. the code will continue to run, and the translations will already be set.

We define &#8216;resolve&#8217; and &#8216;reject&#8217; as method names. We will only use &#8216;resolve&#8217; here to keep it fairly easy. Then in the lambda code (last block), write resolve as a method and pass the returned value from the Observable&#8217;s subscribe method.

Then in the constructor, append &#8216;.then(&#8230; do stuff &#8230;)&#8217; to the &#8216;getTranslations($keys)&#8217; method wait for the Promise to return a value and do your things.

I prefer this way of waiting for an Observable, because using &#8216;complete&#8217; from the rxjs/Observable doesn&#8217;t feel clean. If you have a better suggestion, please do let me know in the comments! Thank you!