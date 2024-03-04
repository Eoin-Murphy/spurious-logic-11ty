---
title: "Unit tests are only as good as the tester"
date: "2015-11-11"
tags: 
  - "dev"
---

So, I screwed up.

When I was refactoring some code I dropped an internal check. Basically, we are installing a profile on an entity. The previous code was checking if the new profile was being used in the system already by a different entity. I took out the check "by a different entitity" so that it was failing whenever the profile existed already in the system.

Not ideal but this is exactly the sort of error you are looking to catch when you write those seemingly pointless unit tests. Checking that the basic functionality is there. It is obvious and trivial when you write them at the time of implementation. They only become useful 6 months later when you come in to refactor code and you drop some vital business logic.

So, unit test early, unit test often and check your coverage regularly...

["Experience is something you don't get until just after you need it."](http://www.goodreads.com/quotes/146279-experience-is-something-you-don-t-get-until-just-after-you)
