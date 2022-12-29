---
title: How to add an icon to a Button in UWP and Xamarin.Forms?
date: 2016-12-21T12:21:45-05:00
author: jonashendrickx
category: programming
---
In this article, you will learn how to create a customized button with an icon for Universal Windows Apps (UWP) or Xamarin.

## Icon only

Now let&#8217;s start easy by creating a button with only an icon. We will be creating a hamburger menu button that is 50 pixels wide and 50 pixels in height. You can choose to use an image, which doesn&#8217;t scale very well usually, or you can use a font.

The font we will be using is &#8216;**Segoe MDL2 Assets**&#8216;, you can view the available icons for this font on [this page](https://msdn.microsoft.com/windows/uwp/style/segoe-ui-symbol-font). The hamburger menu button can be found by searching for the name &#8216;**GlobalNavButton**&#8216;, but feel free to use any icon you like.

Make sure to set the &#8216;**FontFamily**&#8216; property to the name of this font, &#8216;Segoe MDL2 Assets&#8217;. Then in the &#8216;**Content**&#8216; property, enter the code for the icon as shown below.

{% highlight xml %}
<Button FontFamily="Segoe MDL2 Assets" Content="&#xE700;" Width="50" Height="50" />
 {% endhighlight %}   

Now if you did it correctly. The result should look like the hamburger button on the left:

![](/assets/img/posts/2016/12/uwp-buttonicons.jpg){:class="img-fluid"}

## Icon and text

Here we will be creating the home button as shown in the picture above. To achieve this, we will have to modify the content template of the button. This way, we can embed 2 TextBlock objects in the button.

Use the layout of your preference inside the button to get the desired results. In my case, a StackPanel was sufficient. Inside the layout, we embed two TextBlock controls. The first one will be used to display the icon, while the second one will be used to display text.

Tip: Use the &#8216;**VerticalAlignment**&#8216; property on both TextBlock controls to get both align better with each other vertically.

{% highlight xml %}
<Button>
  <StackPanel>
    <TextBlock Grid.Column="0" FontFamily="Segoe MDL2 Assets" Text="&#xE80F;" VerticalAlignment="Center"/>
    <TextBlock Grid.Column="1" Text="Home" Margin="10,0,0,0" VerticalAlignment="Center" />
  </StackPanel>
</Button>
{% endhighlight %}
    

If everything went well, you should now see a similar button as shown in the picture above.