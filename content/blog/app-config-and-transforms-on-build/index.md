---
title: "App.Config and Transforms on build"
date: "2015-10-21"
tags: 
  - "dev"
---

It's been a while since I worked with setting up a project and I'd forgotten that a Class Library, while it can have an App.Config file, that file doens't necessarily get read by the ConfigurationManager (or Formo as I was using)

Hence 20 mins of banging my head on the desk trying to read a connection string and only getting that which was defined in the Web.Config. I don't really want to go down the line of [defining an external xml file](http://stackoverflow.com/questions/396139/create-your-own-settings-in-xml) so I just pushed the definition up to the Web.Config.

The next issue I had is that I had defined Debug and Release Transforms with an empty string in the base config. So, running a Debug build, I fully expected the transform to be applied and the app to read from the updated Web.config. But instead it just read the base Web.config.

Again, I'd fogotten that, normally, transforms are only applied when you Publish, not when you do a build. However [Google to the rescue!](https://gist.github.com/EdCharbeneau/9135216) And now my transforms are applied at build and I can test them properly
