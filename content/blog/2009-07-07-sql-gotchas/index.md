---
title: "sql gotchas"
date: "2009-07-07"
tags:
  - "dev"
---

a running commentry on gotcha's as I find them. Unless otherwise noted, these are all from MSSql 2008:

- Concatenating a varchar with a null value results in a null. Silently. The reason why is [here.](http://msdn.microsoft.com/en-us/library/aa276862(SQL.80).aspx) i.e. @string = 'TEST ' + @var where var is null causes @string to be set to null. Workaround? @string = 'TEST' + ISNULL(@var, ''). Ugly, but correct and it works
- You can't do a NOLOCK on a variable table. Obvious enough as only you have access to it, except that it is reported as incorrect syntax
- BEGIN XYZ statements reset @rowcount. So if you do something like

    SELECT @l\_loop\_index = 0 BEGIN TRANSACTION WHILE @@rowcount > 0 --do loopy things

    This will result in the loop not starting. Wheras

    BEGIN TRANSACTION SELECT @l\_loop\_index = 0 WHILE @@rowcount > 0 --do loopy things

    will work fine.
- IF NULL = NULL is false. Null is not a value. It is the absence of value and cannot equal anything.
