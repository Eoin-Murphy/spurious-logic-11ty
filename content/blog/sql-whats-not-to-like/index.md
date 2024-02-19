---
title: "SQL, what's not to like?"
date: "2009-08-07"
tags: 
  - "dev"
---

Now I know all of the good things about stored procedures, and overall they're a fantastic improvement over embedded queries in higher layers. DRY, separation of logic, security, performance and all that.

I just have a few minor issues. One is the fact that there's no possibility of a defined inline function to avoid repetition of code. (important when your procs are running to 10k lines or more). I know there's the option of moving code out to a User Defined Function but this can have performance impacts (they can cause statements to change from set based to record by record processing).

What I'm talking about is something which would just be a predefined chunk of code, which would be replaced by a preprocessor so that when it comes to be compiled that it's treated as static text.

e.g. If I'm doing something like (and this is a trivial example):

SELECT \* FROM table1 WHERE id = 1 IF@@rowcount = 0 RAISEERROR('No rows returned', 16, 1)

SELECT \* FROM table1 WHERE id = 2 IF@@rowcount = 0 RAISEERROR('No rows returned', 16, 1)

instead being able to do this:

#define ERROR\_TEST = ( IF@@rowcount = 0 RAISEERROR('No rows returned', 16, 1) )

SELECT \* FROM table1 WHERE id = 1 ERROR\_TEST SELECT \* FROM table1 WHERE id = 2 ERROR\_TEST

I suppose it wouldn't be too difficult to pull a script together which does this as.

Secondly, and this is more of an editor issue, why doesn't Microsoft SQL Server Management Studio have code hiding? Again, it's only an issue for where you've got very long procs and in particular, where you've got  very long select, insert statements.

I don't know about you but my policy for formatting select/insert/update statments is:

select field\_1, field\_2, field\_3, field\_4, ect.. from table\_1 where field\_1 <> field\_x ...etc...

And if you've got 230, 40, 50+ fields, suddenly your sprocs are very, very akward to navigate around.

I guess these could be dismissed to an imperative style programmer grokking set based programming but the lack of navigational aids in the gui is a pain in the arse.

<edit 10-Aug-2009> And that's what I get for using an old version . SQL Server Management Studio 2009 has code hiding built in. SQL Server Management Studio 2005 does have bookmark navigaion (ctrl-k, ctrl-k: to create/delete on current line, ctrl-k, ctrl-n: go to next ctrl-k, ctrk-p: go to previous). Nice simple key chords... thanks Microsoft!

<edit 11-Nov-2009> [TSQLMacro](http://www.datamanipulation.net/tsqlmacro/) - "TSQLMacro provides a framework for defining dynamically included TSQL in stored procedures, user-defined functions, views, and triggers" - does exactly what I was looking for. Not going to happen in existing deployments without a very, very good reason but worth looking at for green field projects. It looks to have been last touched in 2006 so it could be a dead project and I would have serious doubts about ongoing support.
