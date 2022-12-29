---
title: 'Xamarin Forms &#8211; Update UI from dependency service?'
date: 2016-11-10T15:52:53-05:00
author: jonashendrickx
category: programming
---
Recently I was chatting with a Microsoft MVP who is actively working in mobile development and also with Xamarin. I was trying to create a music player with one button to start playing music or stop it. When you are using Xamarin Forms, you need to use a dependency service to use native code to play music on each platform. Now the issue here is, how do I do this? There isn&#8217;t any documentation anywhere.

The trick is to use an action delegate to pass a method as a parameter when calling your dependency service method. How this exactly works will be explained below.

First of all let&#8217;s create a new Xamarin Forms project or use your own project.

Create a folder &#8216;Services&#8217;, and create an interface &#8216;IAudioService&#8217;.

{% highlight csharp %}
using System;

namespace RGR_FM.Services
{
    public interface IAudioService
    {
        void Play(Action<bool> isPlaying);
        void Stop(Action<bool> isPlaying);
        bool IsPlaying();
    }
}
{% endhighlight %}

Now you can choose, either in your Android, iOS or UWP project, create a &#8216;Services&#8217; folder. In my example I will use Android.

Now in the &#8216;Services folder&#8217; of the platform of your preference, create a class &#8216;AudioService&#8217;. Make sure it inherits from the interface &#8216;IAudioService&#8217;.

{% highlight csharp %}
using System;
using Android.Content;
using Android.Media;
using Java.IO;
using RGR_FM.Droid.Services;
using RGR_FM.Services;
using Xamarin.Forms;

[assembly: Dependency(typeof(AudioService))]
namespace RGR_FM.Droid.Services
{
    public class AudioService : IAudioService
    {
        private MediaPlayer _mediaPlayer;
        private Action<bool> _isPlaying;

          public AudioService()
           {
           }

        public void Play(Action<bool> isPlaying)
        {
            // If you are missing this you will get a NullPointerException. This is necessary!
            _isPlaying = isPlaying;
               _mediaPlayer = new MediaPlayer();
               _mediaPlayer.SetDataSource("http://stream.intronic.nl/rgrfm");
               _mediaPlayer.SetAudioStreamType(Stream.Music);
               _mediaPlayer.Prepared += MediaPlayerPrepared;
               _mediaPlayer.Error += MediaPlayerError;
               try
               {
                   _mediaPlayer.Prepare();
               }
               catch (IOException e)
               {
                   // prepare failed, no internet connection, notify the UI
                   _isPlaying(false);
               }
           }

           public void Stop(Action<bool> isPlaying)
           {
            // If you are missing this you will get a NullPointerException. This is necessary!
               _isPlaying = isPlaying;
               _mediaPlayer.Stop();

            // Notify the UI
            _isPlaying(false);
        }

        public bool IsPlaying()
        {
            if (_mediaPlayer != null)
                return _mediaPlayer.IsPlaying;
            return false;
        }

        // Fired when an error has occurred during playback
        private void MediaPlayerError(object sender, MediaPlayer.ErrorEventArgs e)
        {
            // handle error

            // Notify the UI, and update UI accordingly
            _isPlaying(false);
        }

        // Fired when the MediaPlayer is ready to play.
        private void MediaPlayerPrepared(object sender, EventArgs e)
        {
            _mediaPlayer.Start();

                // Notify the UI playback started.
                _isPlaying(true);
        }
    }
}
{% endhighlight %}

Assuming you use XAML for your pages, add a button called &#8216;ButtonPlay&#8217; and set as text &#8216;Play&#8217;:

{% highlight xml %}
<Button x:Name="ButtonPlay" Text="Play" />
{% endhighlight %}

Now in the code behind, in the constructor you could put something like:

{% highlight csharp %}
ButtonPlay.Command = new Command(() =>
{
    if (DependencyService.Get<IAudioService>().IsPlaying())
    {
        DependencyService.Get<IAudioService>().Stop(isPlaying =>
        {
            ButtonPlay.Text = "Play";
        });
    }
    else
    {
        DependencyService.Get<IAudioService>().Play(isPlaying =>
        {
            // If isPlaying is equal to false, it means we didn't have any internet connection and streaming music would fail.
            if (isPlaying)
            {
                ButtonPlay.Text = "Stop";
            }
            else
            {
                ButtonPlay.Text = "Play";
            }
        });
    }
});
{% endhighlight %}