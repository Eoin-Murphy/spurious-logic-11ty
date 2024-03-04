---
title: "Code Quality"
date: "2015-09-21"
tags: 
  - "dev"
---

I've been thinking a lot recently about code quality. Specifically, how we get from good intentions to bad implementations. Developers don't generally go into work and think "Hurrah! today I'm going to hack together a dirty solution to a deep problem and then move on".

Edit: As has been pointed out to me, all of this advice is assuming that you have competent developers. They don't need to be rockstar-ninjas but they do need to have an interest in their work. If they're more of the "implement the feature/fix the bug and move on" mindset, then there's nothing you can do. The question then becomes, how did they get to a point where this is an acceptable way to work and how to avoid/repair the situation.

I guess, a starting point for this would be to define what I mean by quality code. Kinda like quality described in Zen and the art of motorcycle maintenance, it's hard to define, but you know it when you see it. A [stackoverflow answer](http://stackoverflow.com/a/954582/135762) has these points which pretty much nail it down though:

- Easy to understand.
- Easy to modify.
- Easy to test.
- Works correctly.

Probably the number one cause of poor quality code is a mismatch between the company needs and what the programmer wants. The company needs a product to sell, and the programmer (typically) want's to write quality code. When push comes to shove and quality code takes too long (and it does typically take longer to implement initially) 99% of companies will mark it down to technical debt and go for the quick and dirty solution.

And you know what, that's absolutely fine. In fact it's needed. But when the business ignores pain points for so long, despite literally an entire engineering team saying they're an efficency hinderance, then you start getting into dysfunctional territory. Some warning signs may include

- your tech stack is so calcified to the "state of the art" of 5 years ago and any real change is massively painful
- your best developers are generally unhappy/leaving
- there's a general miasma of helplessness
- new features are more and more difficult to implement
- it takes 6 months plus for new hires to be productive because your code base is so Byzantine and "special"

and so on and so forth...

No one starts out wanting to write bad code. But we do it to get features out on time. If you're good, you mark it with  plenty of documentation on how it should be done and put it in the backlog for when you have more time. If you're bad, it gets forgotten about and it's just one more thing to work around.

As good developers when we find ourselves in a project where there is a lot of technical debt, it's our responsibility to map them out, suggest solutions and with the business side, road map out a way to resolving them. Of course, just because you want to refactor that monster god class, business isn't going to give you a weeks budget because it's "poor quality". You need substantive arguments about system performance and developement speed. You need to talk their language to get approval for technical changes.

Developers want good code, we just have to make the right sales pitch to the business people.
