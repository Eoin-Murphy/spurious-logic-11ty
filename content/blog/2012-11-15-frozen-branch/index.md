---
title: "Frozen Branch"
date: "2012-11-15"
tags:
  - "dev"
---

[![](./images/frozenBranch.jpg "frozenBranch")](http://spurious-logic.net/frozen-branch)

Your typical agile release process is once every few weeks (Ours it the third Thursday of the month). You should have a code freeze at some before the release date so that the testers have a stable code base to test. In that period between code freeze and release the only changes to code which will be released should be for specific issues discovered with the frozen code.

Our current approach to this is to branch the code on the code freeze day and create a release branch right there. Copy all the code and stick it in a different directory. The problem is that creating a branch takes time, if there are issues then developers have to get the branch code (which if you're in India and the TFS Server is in Ireland can take up to 4 hours) and finally you face potential merging issues.

We're looking at the moment at cutting our release cycle from around four weeks to two weeks and we're going to stop branching. Instead, the SQA team are going to label a particular build, test it and (using Octopus) promote it to staging/production as required.

Which is great in theory, except that what if we get a problem with the code designated for release testing? If we just apply the fix to the mainline and start testing after that, we could potentially be pulling in other changes which were added in the meantime which would basically require a full re-test of the release. Time that nobody has.

One alternative is to have two parallel branches. One for development and one for testing. When the SQA team decides to do a release build, they merge from development branch to the test branch and work from there. If an issue is found the developer would commit the fix to the test branch and then immediately merge that change down to the development branch.

The problem with this of course is that

- You've got the complexity of two branches
- What if the development branch has changed when the merge down from the test branch is performed and causes issues (should be rare but is possible)
- What if the fix isn't merged down from the release branch?

The only advantage over creating a new release branch for every release is that developers wouldn't have to constantly re-download new release branches whenever issues arose. Now I think we may have issues but since we're cutting down our release cycle we _should_ be ok.

Now, we're a MS shop using Visual Studio with TFS as both our source control and build server. There's been a lot of effort put towards getting our builds right but the issue here is using a centralized source control server. Ideally I'd look at moving towards a DCVS like git or mercurial but we have no where near the time to do that sort of major change.

What I'd like to see is a (D)CVS  which would allow the creation of a pseudo-branch which is in effect just a label for prospective releases. So the SQA team nominates a particular point in the mainline and marks it as ("Frozen Code"). When issues are found the developer must be able to work off of and check into this version of the code. This check in is appended to the FrozenCode  but also is checked in to the end of the main line as well so the requirement is on the developer to do the merge immediately. This could be most easily implemented on a DCVS where every developer has their own local full repository and would be able to load the code from any of the labels without having to  download the code especially.

Again, the problem with this approach would be that if there were conflicting changes between the pseudo-branching and the fix check in that the checked in fix would not work. This can always happen with branch merges so the trick would be to keep the testing cycle short. Basically, I would like to see a CVS which allows code labelling but which also allows for subsequent changes to be retroactively appended to that particular change set.

It's pushing towards continuous deployment but never quite getting there. I find the CD idea intriguing but as we need to keep control over what goes out in a release I can't see it happening. Continuous deployment is where you want to be but that's only feasible if you're process is geared for that, you've got great developers and rock solid unit tests.

Well we can all dream.

<edit>

And like all things in this world, if you've thought of it, then someone else has already thought of it. [http://gitready.com/intermediate/2009/03/04/pick-out-individual-commits.html](http://gitready.com/intermediate/2009/03/04/pick-out-individual-commits.html)

Tester creates their own branch for release, finds issue, notifies developer. Developer applies fix to main line which the tester pulls to the branch.

Image from wikimedia commons [http://commons.wikimedia.org/wiki/File:Ivje.JPG](http://commons.wikimedia.org/wiki/File:Ivje.JPG)
