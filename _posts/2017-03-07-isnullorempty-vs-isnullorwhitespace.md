---
title: IsNullOrEmpty vs IsNullOrWhiteSpace
date: 2017-03-07T08:27:58-05:00
author: jonashendrickx
category: programming
---
At first sight, both these methods may sound like they are doing two different things. You would think the IsNullOrWhiteSpace function doesn&#8217;t check for an empty string but it actually does.

I have seen some blocks of code where they would write something like this:

    if (!string.IsNullOrEmpty(someString) && !string.IsNullOrWhiteSpace(someString))
    {
    ...
    }
    

Actually it is quite redundant to use IsNullOrEmpty here, because IsNullOrWhiteSpace already makes an empty string check according to [this reference source code at Microsoft](https://referencesource.microsoft.com/#mscorlib/system/string.cs,23a8597f842071f4).

The code for both are:

    [Pure]
    public static bool IsNullOrEmpty(String value) {
        return< (value == null || value.Length == 0);
    }
     
    [Pure]
    public static bool IsNullOrWhiteSpace(String value) {
        if (value == null) return true;
     
        for (int i = 0; i < value.Length; i++) {
            if (!Char.IsWhiteSpace(value[i]))
                return false;
        }
    
        return true;
    }

As you can see, if the length of the string is 0 in IsNullOrWhiteSpace, the for loop will be skipped and true will be returned. So doing another check with IsNullOrEmpty is redundant.