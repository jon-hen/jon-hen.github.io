---
author: jonashendrickx
date: 2015-06-03 16:09:30+00:00
slug: efficiently-reading-sensors
title: Efficiently reading sensors
category: tech
---
The Microsoft Band has support for many sensors, however it may cause you a headache to figure out how to read all the sensors efficiently depending on your needs.



  * Accelerometer

  * Contact

  * Distance

  * Gyroscope

  * HeartRate

  * Pedometer

  * SkinTemperature

  * UltraViolet


However some of these sensors only have to be scanned once. For example ‘Pedometer’ has a property named ‘TotalSteps’ that indicated the amount of steps done with the band. This property increments continuously.

    
    /**
    * Pedometer
    **/
    bool sensor_pedometer_isrunning = false;
    if (bandClient.SensorManager.Pedometer.IsSupported && (bool)localSettings.Values["sensor_pedometer_enabled"])
    {
    	if (bandClient.SensorManager.Pedometer.GetCurrentUserConsent() != UserConsent.Granted)
    	{
    		await bandClient.SensorManager.Pedometer.RequestUserConsentAsync();
    	}
    	if (bandClient.SensorManager.Pedometer.GetCurrentUserConsent() == UserConsent.Granted)
    	{
    		bandClient.SensorManager.Pedometer.ReadingChanged += (sender, e) =>
    		{
    			// Store in database
    			DatabaseHelper_Pedometer.Insert(new PedometerItem(e.SensorReading.TotalSteps, e.SensorReading.Timestamp.DateTime));
    			bandClient.SensorManager.Pedometer.StopReadingsAsync();
    			sensor_pedometer_isrunning = false;
    		};
    	}
    	sensor_pedometer_isrunning = await bandClient.SensorManager.Pedometer.StartReadingsAsync();
    }


As we have retrieved the value from the ‘Pedometer’ sensor, we tell the phone to stop reading the sensor to save power and resources. And we also immediately store it in the local SQLite database. The Boolean indicates whether the sensor is still running or not.

The ‘HeartRate’ sensor doesn’t always lock immediately. And if it does, we still want to read multiple values to get a more accurate reading. The problem is that it can sometimes take 1-2 minutes to lock the heart rate. But assuming it locks early, and we read the heart rate values during 2 minutes, we would have too much readings to process. If it locks too late, then we have no readings at all. So I came up with the algorithm below.

When the heart rate is locked, we read exactly 10 heart rate values. And as soon as we reach 10 values, we stop reading. When we stop the sensor we can also start processing the data if we temporarily store it in a list. Then we can calculate the average value to give an example and store that in our database.

    
    /**
     * Heart rate
     **/
    bool sensor_heartrate_isrunning = false;
    if (bandClient.SensorManager.HeartRate.IsSupported && (bool)localSettings.Values["sensor_heartrate_enabled"])
    {
    	if (bandClient.SensorManager.HeartRate.GetCurrentUserConsent() != UserConsent.Granted)
    	{
    		await bandClient.SensorManager.HeartRate.RequestUserConsentAsync();
    	}
    	if (bandClient.SensorManager.HeartRate.GetCurrentUserConsent() == UserConsent.Granted)
    	{
    		int count = 0;
    		bandClient.SensorManager.HeartRate.ReadingChanged += (sender, e) =>
    		{
    			if (e.SensorReading.Quality.Equals(HeartRateQuality.Locked))
    			{
    				DatabaseHelper_HeartRate.Insert(new HeartRateItem(e.SensorReading.HeartRate, e.SensorReading.Timestamp.DateTime));
    				if (count == 10)
    				{
    					bandClient.SensorManager.HeartRate.StopReadingsAsync();
    					sensor_heartrate_isrunning = false;
    				}
    			}
    		};
    		sensor_heartrate_isrunning = await bandClient.SensorManager.HeartRate.StartReadingsAsync();
    	}
    }


The Booleans also serve a purpose. Before the end of the using clause that initializes our IBandClient object, we will put a while-loop that will continue to run as long as a sensor is still running. This way we make sure we read the values we want. Before disconnecting the band from our application and releasing the resources it is using. We use Task.Delay(...) to wait 1 second in a task.

    
    while (sensor_calories_isrunning || sensor_distance_isrunning || sensor_heartrate_isrunning || sensor_pedometer_isrunning || sensor_skintemperature_isrunning)
    {
    	// Wait one second
    	await Task.Delay(TimeSpan.FromSeconds(1));
    }


This is the most efficient way to read, store and process the values we have read from the Microsoft Band.
