---
title: "Mental Block"
date: "2011-01-28"
tags: 
  - "dev"
---

Following on from my gearshift analogy yesterday, my personal programming mental block is the syntax of the switch statement. I know how it works, I know what it does, I just can't get the syntax right without looking it up. Regardless of the programming language. Java, C# or TSQL. I get as far as CASE ... before I have to research it. It's a pain in the ass but I just can't get it to stick and I don't use it often enough to memorise it properly. Ah well.

Just for reference, in TSQL this is what you want to be doing:

SELECT
   CASE tab1.col\_name
      WHEN 1 THEN 'one'
      WHEN 2 THEN 'two'
END
FROM table1 tab1

Yes it's trivial, but it just won't stick. Maybe it will now.
