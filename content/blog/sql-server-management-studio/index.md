---
title: "SQL Server Management Studio"
date: "2010-05-27"
tags: 
  - "dev"
---

Overall a fine product but there's one minor niggle which gets to me...

When you log in there's a drop down list of servers you've previously tried to connect to. Organised chronologically I think. It includes servers which you failed to connect to (as in, they don't exist).

There's no way to clear out or reorganise this list. I know it's only a small, small thing but it takes up way too much time and allows too much scope for wasted effort.

rant over.

<edit>

Mentioned this to a coworker who ran with it and found that: It turns out that you actually can clear the list, but it requires that you remove the SqlStudio.bin file from the users application data path which generally is like the following for SQL Server 2008:

C:\\Documents and Settings\\<%username%>\\Application Data\\Microsoft\\Microsoft SQL Server\\100\\Tools\\Shell

or the following for SQL Server 2005:

C:\\Documents and Settings\\<%username%>\\Application Data\\Microsoft\\Microsoft SQL Server\\90\\Tools\\Shell

By deleting this file and restarting SQL Server Management Studio, the MRU List for Servers is cleared from the Connection Box.

C:\\Documents and Settings\\<%username%>\\Application Data\\Microsoft\\Microsoft SQL Server\\100\\Tools\\Shell

or the following for SQL Server 2005:

C:\\Documents and Settings\\<%username%>\\Application Data\\Microsoft\\Microsoft SQL Server\\90\\Tools\\Shell

By deleting this file and restarting SQL Server Management Studio, the MRU List for Servers is cleared from the Connection Box.

</edit>
