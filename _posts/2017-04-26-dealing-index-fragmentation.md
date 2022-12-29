---
title: Dealing with index fragmentation
date: 2017-04-26T11:05:47-04:00
author: jonashendrickx
category: programming
---
## What is index fragmentation?

As more people get a new phone number, we have to add them to our phone book. Ideally, our phone book has empty space, which is controlled with a fill factor. The fill factor decides how much free space to leave on each space. If there is not enough free space, then SQL Server needs to rearrange its records. However, since you can&#8217;t add any pages to the middle of a phone book, it has to add it in the back, which causes fragmentation.

  * Internal fragmentation: We have a new empty page that is nearly empty.
  * External fragmentation: Updating can cause problems too! For example, when one person gets married to another person. The wife&#8217;s last name changes, causing the record to be deleted in one location and to be added again into the other location. Deletes simply leave an empty space behind.

Bad internal fragmentation (having lots of free space on the pages) means the index is bigger than it needs to be.  Instead of our phone book having 1,000 pages that are 100% full, we might have 1100 pages that are only 90% full.  This means every time we need to scan the index, it’ll take 10% longer (1,100 pages instead of 1,000).  This also means we need more memory to cache the same amount of data – because SQL Server has to cache the empty space on each page.  Our lowest unit of caching is a single page, not a record.

Bad external fragmentation means our storage performance could be slower. A solid state drive for your server will perform much better in random reads than a traditional hard drive.

### Fixing Index Fragmentation Temporarily

If the database cannot be cached into the memory, you can solve it by [rebuilding the index](https://technet.microsoft.com/en-us/library/ms187874(v=sql.105).aspx).  Most people do this with scheduled maintenance plans, but those cause more problems down the road.  They rebuild every single index whether it’s necessary or not.  The maintenance plans ignore whether the table was written to since the last maintenance.

This is a problem because rebuilding and defragmenting indexes causes SQL Server to write to the transaction log.  The more we write to the logs, the longer log backups take, the more we have to push across the network wire for database mirroring or log shipping, and the longer restores take.

<div id="attachment_15250" class="wp-caption alignright">
  <p class="wp-caption-text">
     
  </p>
</div>

We might even be doing more damage, too.  Some database administrators think they can fix fragmentation by setting a too low fill factor, for example 50%. By doing so, half of every page would be empty – so inserts would be blazing fast.  Reads, however, would be twice as slow.  In order to scan the entire phone book, we’d have twice as many pages we have to read.  Tweaking fill factor is a dangerous dance, much like the ones I did in high school.  (True story: broke my nose slam dancing.)  We might be forcing more empty space on each page every time we rebuild when we don’t need to.

### Fix Index Fragmentation Permanently

Start by caching your database or frequently accessed data in memory.  External fragmentation won&#8217;t matter as if we don’t have to make use of the hard drives.  The performance difference between unfragmented and fragmented data on a hard drive is much lower compared to the accessing the data from the memory rather than the hard drive.

Next, dig into what your storage system is really doing with your data.  If you’re using shared storage that shares drives between a bunch of different servers, then all of your drive access will be random anyway.  Your hard drives are shared with other servers that are also making requests at the same time, so the drives will always be jumping all over the place to get data.  Defragging your indexes is just pointless busy work.