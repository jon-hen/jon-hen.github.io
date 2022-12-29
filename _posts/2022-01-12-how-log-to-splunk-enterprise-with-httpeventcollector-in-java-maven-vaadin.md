---
title: How log to Splunk Enterprise with HttpEventCollector in Java/Maven/Vaadin?
date: 2022-01-12T10:47:30-05:00
author: jonashendrickx
category: programming
thumbnail: /assets/img/posts/java.jpg
---
## Code

First we need to add the required packages to our project. We do this by adding the references to &#8216;**pom.xml**&#8216;. 

{% highlight xml %}
...
<repository>
  <id>splunk-artifactory</id>
  <name>Splunk Releases</name>
  <url>https://splunk.jfrog.io/splunk/ext-releases-local</url>
</repository>
...
</repositories>
{% endhighlight %}
Now we need to tell Maven the dependencies we actually want:

{% highlight xml %}
<dependencies>
...
<dependency>
  <groupId>ch.qos.logback</groupId>
  <artifactId>logback-classic</artifactId>
  <version>1.2.10</version>
</dependency>
<dependency>
  <groupId>com.splunk.logging</groupId>
  <artifactId>splunk-library-javalogging</artifactId>
  <version>1.8.0</version>
</dependency>
...
</dependencies>
{% endhighlight %}

Place the following content in a file called &#8216;logback.xml&#8217;. Read more <a href="https://logback.qos.ch/manual/configuration.html" target="_blank" rel="noreferrer noopener">here</a>.

{% highlight xml %}
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <appender name="socket" class="com.splunk.logging.TcpAppender">
        <RemoteHost>127.0.0.1</RemoteHost>
        <Port>8088</Port>
        <layout class="ch.qos.logback.classic.PatternLayout">
            <pattern>%thread %level: %msg%n</pattern>
        </layout>
    </appender>
    <logger name="splunk.logger" additivity="false" level="INFO">
        <appender-ref ref="socket"/>
    </logger>
    <root level="INFO">
        <appender-ref ref="socket"/>
    </root>
    <appender name="http" class="com.splunk.logging.HttpEventCollectorLogbackAppender">
        <url>${SPLUNK_URL}</url>
        <token>${SPLUNK_TOKEN}</token>
        <source>${SPLUNK_SOURCE}</source>
        <sourcetype>_json</sourcetype>
        <messageFormat>text</messageFormat>
        <middleware>HttpEventCollectorUnitTestMiddleware</middleware>
        <layout class="ch.qos.logback.classic.PatternLayout">
            <pattern>%msg</pattern>
        </layout>
    </appender>
    <logger name="splunk.logger" additivity="false" level="INFO">
        <appender-ref ref="http"/>
    </logger>
    <root level="INFO">
        <appender-ref ref="http"/>
    </root>
</configuration>
{% endhighlight %}

You can now pass the URL, Source (for filtering your logs) and Token using environment variables or a different way. See &#8216;<a href="https://logback.qos.ch/manual/configuration.html" target="_blank" rel="noreferrer noopener">variable substitution</a>&#8216;.