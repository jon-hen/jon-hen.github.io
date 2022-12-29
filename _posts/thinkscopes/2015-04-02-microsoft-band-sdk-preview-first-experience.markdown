---
author: jonashendrickx
date: 2015-04-02 15:14:02+00:00
slug: microsoft-band-sdk-preview-first-experience
title: Microsoft Band SDK Preview - First experience
category: tech
---
My experience developing for the Microsoft Band. What you should know for now how it works. As it is different at this point than developing for the Apple Watch and Android wearables.
 
 Microsoft Band is definately the best smartwatch at this point for capturing data from sensors, leaving the competition way behind. It is very unlikely people will be using their smartwatch for actually running programs on it or interacting with it. You are more likely to grab your smartphone in your pocket. But the Windows wearables will do just fine for displaying notifications and capturing data. Plus these got great battery life too.
 

# Sensors


 The Microsoft Band has many sensors. Here is a list of all the sensors and their properties including the data type.
 
 All sensors have a different minimum or maximum reporting interval. For example, you can read the heartrate sensor once every second and you can read the skin temperature sensor only once per 30 seconds.
 


 	
  * **HeartRate:**
 
 	
    * **HeartRate : integer**

 	
    * **TimeStamp : DateTimeOffset**

 	
    * **Quality : HeartRateQuality enum** (Acquiring or Locked) -> Acquiring or Locked. Locked indicates the heart rate is accurate and locked. Acquiring means it is still busy locking or detecting your heart rate. Use this wisely to filter correct readings:
 [![MicrosoftBand0001](/assets/posts/img/thinkscopes/2015/05/MicrosoftBand0001.jpg)](/assets/img/posts/thinkscopes/2015/05/MicrosoftBand0001.jpg)

 
 

 	
  * **Skin temperature:** note that this detects your skin temperature, so this is not your body temperature.
 
 	
    * **Temperature : int**

 	
    * **Timestamp : DateTimeOffset**

 
 

 	
  * **Accelerometer:** I don't have to explain this. It measures accelerations.
 
 	
    * **AccelerationX : double**

 	
    * **AccelerationY : double**

 	
    * **AccelerationZ : double**

 	
    * **Timestamp : DateTimeOffset**

 
 

 	
  * **Contact:** Whether you are wearing the Microsoft Band or not.
 
 	
    * **State : BandContactState enum** (BandContactState.NotWorn or BandContactState.Worn)

 	
    * **Timestamp : DateTimeOffset**

 
 

 	
  * **Distance:**
 
 	
    * **CurrentMotion : MotionType enum **(Idle, Jogging, Running, Walking and Unknown)

 	
    * **Pace : double**

 	
    * **Speed :double**

 	
    * **TotalDistance : long**

 	
    * **Timestamp : DateTimeOffset**

 
 

 	
  * **Gyroscope:** is a device for measuring or maintaining orientation, based on the principle of preserving angular momentum
 
 	
    * **AccelerationX : double**

 	
    * **AccelerationY : double**

 	
    * **AccelerationZ : double**

 	
    * **AngularVelocityX : double**

 	
    * **AngularVelocityY : double**

 	
    * **AngularVelocityZ : double**

 	
    * **Timestamp : DateTimeOffset**

 
 

 	
  * **Pedometer:** count total steps taken:
 
 	
    * **TotalSteps : long**

 	
    * **Timestamp : DateTimeOffset**

 
 

 	
  * **Ultraviolet:** note that this detects your skin temperature, so this is not your body temperature.
 
 	
    * **ExposureLevel : UltravioletExposureLevel enum** (None, Low, Medium, High, VeryHigh)

 	
    * **Timestamp : DateTimeOffset**

 
 

 
 

# What you cannot do currently


 


 	
  * You cannot display custom images, controls or layout on the Microsoft Band. But you can add tiles and display notifications with them. The notifications you send cannot have a custom layout, all you can do is just send plain text.

 	
  * You cannot send push notifications or send anything from the Microsoft Band to your phone. You can only read sensor data or send notifications to your tiles.

 	
  * Galvanic Skin Response sensor readings are unavailable in this SDK version.

 	
  * You cannot program to use the hardware buttons of the Microsoft Band.

 	
  * You cannot read historical/cached sensors data.

 
 

# What you can do


 


 	
  * Send notifications to your Microsoft Band

 	
  * Create tiles for your Microsoft Band

 	
  * Read sensors (See above)

 
 

# Some difficulties I ran into


 Calling the ConnectAsync() method multiple times from the same application in Windows Phone 8.1 to connect to your Microsoft Band to do something with it will fail. You can only make one connection per application as far as I can see.
 
 So you should share and re-use the IBandClient bandClient object as much as possible when programming. Structure your code well to prevent problems down the road.
 
 See the manual for some demo code if you do not know what I am talking about: [http://developer.microsoftband.com/](http://developer.microsoftband.com/)
 

# Conclusion


 Despite the limitations in the current SDK for the Microsoft Band, we can still read a lot of sensor data. Which is very good if you are planning to use the sensors. But everything you could possibly do with the sensors is already available, so unless you are planning to do something innovative with it these is no real use for these. But they offer a great deal of flexibility if you want to create your own web services to log all the data and do something with it.
 
 If you want to create your own notification tile for your Microsoft Band you can do so without much programming. You have a working tile with maybe 10-30 lines of code and being able to send notifications to it. It is very easy to learn and easy to use. As opposed to the time consuming Apple Watch and Android Wearables SDKs. The question I ask myself is if people are actually going to use downloaded apps from the Play Store or Apple Store on their smartwatches. Would you really want a smartwatch you can only use 6-18 hours a day to run full blown applications on it as opposed to the Microsoft Band which lasts you 3-4-5 days?
 
 I am quite sure more features will become available as the SDK becomes more mature. It is still too early to say. But the Microsoft Band or the Windows Wearables will definately be the best smartwatch or wearable.
