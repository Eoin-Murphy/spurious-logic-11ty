---
title: "Mapped drive TFS pain"
date: "2013-02-21"
tags: 
  - "dev"
  - "random"
---

I have an issue where my Visual Studio Source Control Explorer is unable to do a “Get Latest” from time to time and I couldn't see a common cause to the issue.

We have our local TFS mapped to a local mapped network drive, P:. This means that P: can point to anywhere you want but in practice it's usually something like D:/Projects.

I had issues with TFS from when I started. I was constantly getting an error message of “Could not find a part of the path "_P:\\<ClientName>\\Release\\<ProjectName>\\<Code>_" whenever there was data being retrieved as part of a get latest.

When I opened up the folder in explorer I can see that it’s there. I can even see the path in the Source Control Explorer which is telling me that I have got the latest version.

This was continuing until about two weeks ago when I remapped it and re-downloaded the everything (I had to delete my workspace as TFS thought I had files downloaded which I didn't . Since then it’s been working fine and I've been doing regular (not quite daily) “Get Latest” on the whole repository.

Yesterday morning I tried to do a get latest again and got the same error and now I’m prevented from doing a get latest.

I did a little digging and found that while I can access the P: drive from the command line when I’m a regular user, if I run the command line as Administrator I cannot access the P: drive.

It is apparently as a result of this: [http://support.microsoft.com/kb/937624](http://support.microsoft.com/kb/937624). And as we're usually running Visual Studio as Administrator, this means that TFS was unable to see the P: drive.

I tried re-creating the P drive as an administrator, but it didn't make any difference to the behaviour.

So, rather than editing the registry, I have to run Visual Studio as a ‘non-administrator’ to do a Get Latest.

 

Entirely logical.
