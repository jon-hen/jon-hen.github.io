---
title: Using ngx-bootstrap/modal or BsModalRef in a separate component
date: 2019-04-25T10:03:59-04:00
author: jonashendrickx
category: programming
---
Valor Software has made a great set of Angular components available for free. And while they&#8217;re free, doesn&#8217;t the documentation is complete.

In our &#8216;app.module.ts&#8217; or custom module, we add:

{% highlight typescript %}
import { ModalModule, BsModalRef } from 'ngx-bootstrap/modal';

@NgModule({
    imports: [
        ...
            ModalModule.forRoot(),
        ...
    ],
    declarations: [
        ...
        YourParentComponent,
        YourModalComponent,
        ...
    ],
    entryComponents: [
        ...
        YourModalComponent
        ...
    ],
    providers: [
        ...
        BsModalRef,
        ...
    ]
{% endhighlight %}


If we don&#8217;t add our modal component to the &#8216;entryComponents&#8217; section in our module, we will actually only see the entire window turn gray, also known as the backdrop. It&#8217;s also mandatory for the modal component to implement &#8216;OnInit&#8217;.

If we don&#8217;t add &#8216;BsModalRef&#8217; to the &#8216;providers&#8217; in our module, we will get a &#8216;StaticInjectorError&#8217; when you try to compile or start your application. And we don&#8217;t want that.

Now it should all be straightforward. You can follow the guide <a href="https://valor-software.com/ngx-bootstrap/#/modals" target="_blank" rel="noopener noreferrer">here</a>.

Here is our modal&#8217;s HTML code:

{% highlight html %}
<div class="modal-header">
    <button type="button" class="close pull-right" aria-label="Close" (click)="close()">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<div class="modal-body">
    <div class="row">
        <div class="col-12">
        ... <!-- Some content -->    
        </div>
    </div>
    <div class="ibox-row-padding">
        <hr class="hr-line"/>
    </div>
    <div class="row">
        <div class="col-sm-6 m-b-xs">
            <button type="button" class="btn btn-primary btn-block" (click)="confirm()">{{ 'Confirm' | translate }}</button>
        </div>
        <div class="col-sm-6">
            <button class="btn btn-dark btn-block" type="button" (click)="close()">{{ 'Cancel' | translate }}</button>
        </div>
    </div>
</div>
{% endhighlight %}


And the Typescript&#8217;s code that goes with it:

{% highlight typescript %}
import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { BsModalRef } from 'ngx-bootstrap/modal';

@Component({
    selector: 'your-modal',
    templateUrl: 'your-modal.html'
})

export class YourModalComponent implements OnInit {
    parameter: number;
    constructor(
        private bsModalRef: BsModalRef,
        private translateService: TranslateService
    ) {
    }

    ngOnInit() {

    }

    confirm() {
        // do stuff
        this.close();
    }

    close() {
        this.bsModalRef.hide();
    }
}
{% endhighlight %}

The properties or variables inside our constant &#8216;initialState&#8217; below have to be fields that exist in your modal&#8217;s component. The fields will be automatically assigned and don&#8217;t need any additional programming.

{% highlight typescript %}
import { Component, OnInit } from '@angular/core';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';

@Component({
    selector: 'demo-modal-service-component',
    templateUrl: './service-component.html'
})
export class DemoModalServiceFromComponent {
    bsModalRef: BsModalRef;
    constructor(private modalService: BsModalService) {}

    showYourModal() {
        const initialState = {
            parameter: 2019,
        };
        this.bsModalRef = this.modalService.show(YourModalComponent, {initialState});
        this.bsModalRef.content.closeBtnName = 'Close';
    }
}
{% endhighlight %}