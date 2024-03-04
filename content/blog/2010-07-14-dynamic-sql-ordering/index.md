---
title: "Dynamic SQL ordering"
date: "2010-07-14"
tags: 
  - "dev"
---

You can't rely on the ordering of a Dynamic SQL statement execution which can result in some hard to find bugs.

I was going to provide an example of this but short of posting large chunks of code it wouldn't be possible to illustrate. Suffice it to say, if you've got derived tables and a comparison expression (e.g. tab1.value >= (SELECT tab2.value) ) within a dynamic SQL statement you could have problems. (Well you definitely have problems, but worse you could have difficult to reproduce bugs).

You should only have to use dynamic SQL if you table names are changeable,  in which case consider putting all the dynamic SQL at the start and  at the end of the procedure where you copy the dynamic table to/from a permanent working table. This is not possible if you're multithreading but hey, who does that...
