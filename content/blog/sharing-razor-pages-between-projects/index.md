---
title: "Sharing Razor pages between projects"
date: "2013-02-18"
tags: 
  - "dev"
---

I've spent too much time on this, so to save others my pain. Basically, you can get it to work, but you don't get access to the Viewbag/Model  if you go the embedded resource route

Resources were the following:

[Precompile using RazorGenerator](http://blog.davidebbo.com/2011/06/precompile-your-mvc-views-using.html): This solution was also promoted by [this page](http://www.chrisvandesteeg.nl/2010/11/22/embedding-pre-compiled-razor-views-in-your-dll/) and [this upcoming book from o'Reilly](http://ofps.oreilly.com/titles/9781449320317/ch_ReusableUI.html). Didn't work because there's a [bug compiling class libraries](http://razorgenerator.codeplex.com/workitem/72).

Precompile to Embedded resource and use a custom ViewEngine as described by [Stack overflow answer](http://stackoverflow.com/questions/4800819/sharing-controllers-and-views-with-multiple-web-applications) (Duplicate of [this](http://www.picnet.com.au/blogs/Guido/post/2009/08/12/Sharing-MVC-Views-Across-Projects)). This does work and you can use the shared Views, but as noted above, you don't get to use the @ViewBag or indeed the @Model. Which somewhat defeats the whole exercise.

We can't be the only people who what to have multiple ASP.NET MVC projects and share Views between them.

There's also the option of just pulling in the Views via Nuget but that requires a private Nuget feed which we don't have set up.

Frustrating

<edit> It's sometimes better to come back to these things after a break... The best solution I've found for now (as a proof of concept) is to package up a Nuget package of the standard views and have that on the local drive. When this comes to actual wider use, that'll have to be pulled in from somewhere on the network but shared drives aren't that hard to set up.

Next, set up a Visual Studio Template to pull the latest version of the Views off the network on initializing a new project.
