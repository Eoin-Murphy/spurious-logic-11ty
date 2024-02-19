---
title: "Freshdesk/Freshchat"
date: "2024-01-30"
---

So, a client wants to aggregate data from a number of sources, including Freshworks.

The first thing to know is that Freshdesk and Freshclient a separate API's (brought together via merger I guess)

The second is that Freshworks really don't want you to do this kind of work. They much rather you just use their dashboard. Or at least, the api is very much an afterthought.  
  
So, as part of the task I want to see how many conversations an agent engaged with (how many messages they sent & how many conversations were then resolved)  

This data is literally \_right there\_ in the dashboard but is basically inaccessible via the API.

The data that is there is structured in the most awkward, deeply nested, over-engineered way possible.

Personal favourite code snippet:  

csat\_metrics.count\_per\_rating:
Average rating received in the specified time period.
