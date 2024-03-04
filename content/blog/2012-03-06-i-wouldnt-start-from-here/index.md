---
title: "I wouldn't start from here"
date: "2012-03-06"
tags: 
  - "dev"
---

It's funny, in my last job we had a monstrosity of a sql batch script which was run on a nightly basis to import literally tens of thousands of rows of data into the database. Apart from being a windows scheduled task calling a classic VB application (which did some trivial processing) the whole thing was a shining example of MSSQL spaghetti code. Undocumented program flow (there were 2, maybe 3 developers who knew how it worked),  uncommented (global) variables, masses of dynamic SQL, partially transactional, partially not, use of triggers and constraints. The list goes on and on. It was pretty painful to work with (great job security though) but... it did actually work. And given the volume of data being imported and the processing required for each piece of data doing it down at the database layer was pretty much the only option.

So, in my current position, we are also doing data imports. Instead of doing all the work at DB layer, instead we're loading the import data into memory and doing all the heavy lifting in C#. Again, it's working for now, but if data sizes start increasing I can't see it being usable. Plus there's all sorts of potential concurrency issues where two operators could be loading the same file at the same time. Or they hammer that import button because nothing's happening.

I find myself thinking maybe we should go back to the DB first approach? Here's to making the same mistakes all over again and again.
