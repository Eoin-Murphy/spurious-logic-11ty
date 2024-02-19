---
title: "Fancy Copy and Paste"
date: "2013-02-19"
tags: 
  - "dev"
---

I know there's a lot more to it, but Nuget is basically just a fancy copy and paste (with pre & post scripting facilities).

The fact that I'm using it in such a manner makes me feel like I'm jamming a round peg into a square hole but MVC is really set up to have a single project supporting multiple clients and does not make it particularly easy to share Controllers/Views between different projects.

The issue is that there are potentially 300+ clients, each with potentially different setups and while I know it can be managed, I've seen it before where the compile time becomes impractical. This is especially the case when you're also compiling all the views. Impractical to me is +1 Min. If you have time to make a cup of tea while your project compiles, then there's a problem.

So, we go with separate projects and using Nuget to copy and paste code from our base project. I don't like it but I can't think of a better solution.

<edit>References:

[lavablast blog recommendations](http://blog.lavablast.com/post/2010/12/01/Slash-your-ASPNET-compileload-time.aspx)

[the stack overflow suggestion on large projects](http://stackoverflow.com/questions/280751/what-is-the-best-practice-for-copy-local-and-with-project-references)

[simple-talk blog recommendations](http://www.simple-talk.com/dotnet/.net-framework/partitioning-your-code-base-through-.net-assemblies-and-visual-studio-projects/)
