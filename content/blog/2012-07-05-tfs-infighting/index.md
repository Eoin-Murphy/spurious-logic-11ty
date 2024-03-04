---
title: "TFS Infighting"
date: "2012-07-05"
tags: 
  - "dev"
---

If you've got a shared assembly which has been updated and two instances of Visual Studio open, pointing at different projects which call that assembly. When you do a 'get latest' in one instance of Visual Studio, the other prompts you with a "this file has been edited... do you want to reload?'

What you don't see is that the update to both can be held up until you hit that confirm button.
