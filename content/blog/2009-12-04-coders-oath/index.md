---
title: "Coders Oath"
date: "2009-12-04"
tags: 
  - "dev"
---

These days I'm trying to work against the maintenance programmers oath:

Do no harm.

Basically any changes you make shouldn't worsen a problem I know this sounds incredibly obvious but it's easy to forget.

Especially if you're working through some seriously squirrely code it's tempting to try and 'fix' code that looks wrong.

This is a mistake that will come back to bite you in the ass.

If you change it, the best that will happen is that there will be no change in the performance in the system. In which case, why waste your time, and the time required to perform regression testing on these changes?

If you change it and there is _any_ change in the system (even for the better) then questions will be asked where you had better be 100% sure that what you did has absolutely no side effects. Given your reason for 'fixing' the code is almost impossible to guarantee.

Any other suggestions for mottos for coders to live by?
