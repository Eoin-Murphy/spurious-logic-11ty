---
title: "Stick to the Defect description..."
date: "2010-04-26"
tags: 
  - "dev"
---

about time I talked about legacy systems and defects.

If you're tasked with maintaining and correcting defects on legacy systems the most important thing you have to do is: don't change more than you have to!

e.g. You're responsible for managing an important (possibly mission critical) batch job for a company and a bug report comes in on a small, non critical subsystem. You investigate and spot that this small bug is easily fixable but it's been hiding a larger, more significant problem with the subsystem.

Do you:

- a) Fix the original bug and large problem as one and send it back with a note detailing the fix.
- b) Fix the original bug and report the larger problem as a possible defect.
- c) Ignore the original bug and fix the fundamental problem.
- d) None of the above, report to the client and wait for feedback before taking any decision.

Obviously the answer varies depending on the exact situation, but 99% of the time your primary goal is to solve the clients immediate problem while minimizing changes but also notifying them of potential problems. Meaning answer (b)

In choosing (a) you are taking responsibility for any changes made to the system. As it's a legacy system, what appears to be problematic behaviour may be required by other sections of the system. You need to be very aware of the systems internals and expected behaviour before making this kind of call.

Choosing (c) is even more extreme as you're purposely ignoring an explicit request from the client.

While (d) is technically correct and you would not be criticised for putting safety first, you are still wasting development time waiting for confirmation on what action to take. Depending on the lag time this could be a few hours/days/weeks being processed. It is your responsibility as a developer provide the client with what they requested (the bug fix) in a safe and timely manner.

A small bit of awareness of the clients needs, time for communication and personal responsibility is necessary to provide good service. The client wants neither an automaton which blindly implements what they ask for or a wildcard who modifies processes and behaviours without any oversight.
