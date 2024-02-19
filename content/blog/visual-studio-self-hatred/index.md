---
title: "Visual Studio Self Hatred"
date: "2012-06-25"
tags: 
  - "dev"
---

It seems that Visual Studio hates it's own project files and seems to be incapable of correctly handling merging conflicts.

If two developers both add new files to a project, then Visual Studio just put's up it's hands and marks it as a conflict, leaving it up to the developer to handle the merge in the project file. TFS merge really is dumb as a box of rocks. Just a straight line by line comparison, with no semantics. Ah well.

 

<edit>

And like every tech problem ever, someone else has spotted this and fixed it already. [Replace the visual studio merge tool with WinMerge (or whatever diff tool you like)](http://blog.paulbouwer.com/2010/01/31/replace-diffmerge-tool-in-visual-studio-team-system-with-winmerge/)
