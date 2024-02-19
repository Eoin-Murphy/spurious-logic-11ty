---
title: "Getting it wrong."
date: "2012-12-03"
tags: 
  - "dev"
---

[![](images/Pisanello-Codex_Vallardi.jpg "Pisanello-Codex_Vallardi")](http://spurious-logic.net/getting-it-wrong)

I've found that one of the big issues with managing is when a manager (or senior developer) gives instructions relating to a task to a developer and they fail to implement those instructions. This results either in the task not being completed, or being completed incorrectly. This can happen regardless of the nationality of either the manager or developer. The point of failure has to be one of the following:

**\- Developer does not hear what the manager says.** Didn’t read the email, receive the memo, attend the meeting. For whatever reason the instructions were not communicated to the developer.

_Solution:_ The manager must check their communication channels and ensure that the developer has actually received direction rather than just assuming messages have been passed on.

****\-**Developer heard the manager, but doesn’t understand the language.** Language in this context refers to actual spoken/written language (e.g. English vs Japanese). This is only really an issue with distributed/outsourced teams.

_Short term solution:_ Developer must say they don’t understand and get clarification. The manager must not consider the message has been understood until the developer can explain it back to them. _Long term solution:_ Language training for the developer and/or manager.

****\-**Developer understands the language, but doesn’t understand the concept.** This can crop up where you’ve got a new hire in the team and they’re still getting to grips with the business domain. e.g. A college graduate coming into a finance company will probably be a little lost when told he has to calculate the fair market valuation of a stock option using the Black Scholes model. If they’re good they’ll go away and research all of that and come up with a solution. If not, you’ve just given them an impossible task.

_Short term solution:_ Developer must say they don’t understand and get clarification. The manager must not consider the message has been understood until the developer can explain it back to them. _Long term solution:_ Business domain training for the developer and communication training for the manager.

****\-**Developer understands the concept, but doesn’t know how to implement.** The developer knows what they’re meant to do but either doesn’t have the technical skills or doesn’t understand the existing system well enough to be able to execute correctly. Again, this is typically more of a new hire issue, but if you’ve got a weak developer on the team, this is where they’ll screw up. Short term solution: Developer must say they’re not sure how to make changes and get clarification. The manager must not consider the message has been understood until the developer can explain it back to them and tells them how they are going to implement.

_Long term solution:_ Technical training, mentoring and time spent learning the system for the developer. The manager needs to be able to spot that the developer isn’t implementing correctly so having code reviews with trusted team members should catch these problems.

****\-**Developer understands all of the above, but disagrees with the manager and rather than discussing, implements their own way.** You have a competent programmer who understands exactly what is needed to be done but they feel that the manager’s instructions are incorrect and they decide to do it “THE RIGHT WAY” without consultation.

This one’s a bit awkward. You have a good developer who disagrees with their instructions. On one hand, they may well be right. They’re the ones closest to the code. They can see what issues could arise from incorrect instructions. And good developers with actual opinions on code are hard to find.

On the other hand, software development is a team effort and assuming the manager is also competent, they’re not just issuing instructions for fun. Maybe there are future business concerns which the developer isn’t aware of? Maybe there are interoperability/architecture issue which the code must play nicely with?

_Solution:_ Communication. The developer must be able to say “you’re instructions are wrong, here’s what I’m going to do instead” without fear of any consequences. The manager must be open to that type of discussion and be willing to go through the reasons for their instructions. The manager and developer both need to be able to say “No you’re right, we’ll do it your way”. This should really come up in planning, but it can also be caught during code review where a discussion will probably be too late.

****\-**Developer understands all of the above, but just doesn’t bother.** If the developer just decides it isn’t that important. They go about implementing the task in whatever way they want, again without consultation.

_Solution:_ This should be caught by code reviews but again, the discussions will probably be too late. If the developer is unable to justify why they ignored instructions despite receiving and understanding them then they’re in this category rather than the above. If the developer is this careless/disinterested then you do need to start talking to them about why exactly they’re on the team (which is a whole other blog post).

 

Image from [wikimedia commons](http://commons.wikimedia.org/wiki/File:Pisanello_-_Codex_Vallardi_2426.jpg)
