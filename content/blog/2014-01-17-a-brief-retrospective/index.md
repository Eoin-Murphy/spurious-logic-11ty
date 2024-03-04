---
title: "A brief retrospective"
date: "2014-01-17"
tags: 
  - "dev"
---

I spent since last March working on a new project for Financial Express: [Trustnet Direct](https://www.trustnetdirect.com) A transactional website allowing users to buy and sell shares. Personally I think it's a really cool site and within the company it was something very new and exciting. Lots of new technologies, functionality and an entirely novel UI paradigm.

Overall I'm very happy with how the project went. We delivered the site in the allotted time frame and now it's up to the marketing folks to push it out there and make it a success. From the development perspective here's a few bit's I've learned:

**Get your Continuous Deployment to Dev working early:** We started out with manual build & deploys for the first two months or so and I think this held us back initially. The main benefit of continuous integration is having early integration of code to catch any merge issues, constant deployments forcing simplification of that process and a better sense of code velocity. Never mind the waste of time in performing the builds and dealing with assorted broken builds.

I was a big fan of CI before this project and I regret that I didn't push this more right from the very start. It's not hard to set up and it reaps huge rewards. On any future project I'm going to insist of the following:

- Continuous Integration with a build on checkin and at least minimal unit tests
- Automatic .config transformations on deployment
- Automatic database script executions on deployment
- Automatic or 'One button' deployments to any environment

**Log everything from day one:** ...especially if you're talking to a third party.

Logging is one part of projects that tends to be tacked on towards the end. To catch issues once you go live. It should be an integral tool which is used extensively from the very start of development for debugging of all issues. If you're not logging enough detail (or too much), then during development is the time to change this, not once you've gone live and you're trying to figure out what happened.

Of course once you add in communication with external sources it becomes an invaluable tool for accurately diagnosing where issues are arising and who's responsible for fixing them.

**[Cache All The Things!!:](http://www.youtube.com/watch?v=OGi8FT2j8hE)** We added caching too late. It was a [cache-aside strategy](http://msdn.microsoft.com/en-us/library/ee790918(v=azure.10).aspx) we used so it was entirely possible to work on the logic of the site without having caching implemented too early on. We found that once we did add the caching in we hit one of the 'hard problems of computer science'. Cache invalidation.

Basically, functionality which had previously been working started causing issues because the cache wasn't being updated in a timely manner. We had put our QA team in a position where they had to go back and retest any area where caching had been added. Which given the single page application style of the site meant pretty much everything.

So, I guess the moral here may be less "_put caching in early_" but rather "_don't say a component is done until the caching is in place_".

**Have Faith in your Team:** Developers want to learn. They want to work with challenging projects using new tools and technologies and if you give them licence they will amaze you.

We're using what I would consider a relatively straightforward architecture. We've got ASP.Net MVC working as the web tier with C# service classes accessed via interfaces. Ninject is used for dependency injection and we're using simple models to move data between the layers. However, I was told by a senior developer that it was "too complicated" and that developers wouldn't be able to understand it, never mind work with it.

One of the most satisfying parts of the project was how well the team as a whole took to the new technologies, architecture and design patterns. In fact, I would say that the use of new technologies energised and got more buy in from developers than would have been the case otherwise. In many cases they took broad instruction and came up with entirely novel solutions.

**Shout Louder:** This is more a personal improvement tip rather than one in general software development. I mentioned above in relation to Continuous Deployment that I had wanted it but was convinced that the setup overhead was prohibitive which in retrospective was absolutely false. The problem is that I knew this at the time as well. I knew Continuous Deployment would be valuable but I didn't push it. I allowed myself to be influenced by the status quo, those subtle urging of "_we have a system which works, don't change it_".

Now you don't want to be the new guy who breezes into a successful company and wants to change everything from programming languages to the colour of the walls (though I would argue that in some cases any of these is appropriate) so you have to pick your battles. If there's something with minimal friction but good payoffs push for it.

Don't take the "_but it's new_" or "_it's difficult_" as an answer. These are weasel words which if they go unchallenged long enough will cause a company to stagnate.

It is your job to push for better.
