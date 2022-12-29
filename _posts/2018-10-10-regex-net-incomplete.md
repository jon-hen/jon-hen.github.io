---
title: RegEx matching in .NET is incomplete
date: 2018-10-10T04:58:40-04:00
author: jonashendrickx
category: programming
---
Recently, I have been working on a very large project. This partially contributed to my inactivity here on my blog. Now I found something that was kind of worth blogging about again. I was using regular expressions in .NET, and found that it was correctly validating some strings, while they should have been invalid.

Let&#8217;s say we want to validate phone numbers and only want to allow a &#8216;+&#8217;-sign in the front, and maybe some dashes or spaces between the numbers. Which gives us the regular expression below:

    (\+)?[0-9 \-]{0,20}

These are some strings we want to validate:

<pre>016820123

+3216820123

016/820123

016 82 01 23

016-82-01-23</pre>

Then the result would be:

<pre>016820123 - VALID

+3216820123 - VALID

016/820123 - INVALID

016 82 01 23 - VALID

016-82-01-23 - VALID</pre>

Unfortunately when using:

    Regex regex = new Regex("(\+)?[0-9 \-]{0,20}");<br/>
    var isMatch = regex.IsMatch("016/820123")

We would find that &#8216;isMatch&#8217; is true. But it should be false, because it contains a forward slash.

In fact, the correct code to check whether you have a full match is as follows:

    public static bool IsFullMatch(this Regex regex, string source)<br/>
    {<br/>
      var matches = regex.Matches(source);<br/>
      for (var i = 0; i < matches.Count; i++)<br/>
      {<br/>
        if (matches[i].Success && matches[i].Length == source.Length)<br/>
        {<br/>
          return true;<br/>
        }<br/>
      }<br/>
      return false;<br/>
    }

Perhaps Microsoft could have provided a method for this and saved us a big headache. At least now &#8216;016/820123&#8217; is being properly recognized as invalid as we&#8217;re checking that the length of the match should be equal to the length of the source string.