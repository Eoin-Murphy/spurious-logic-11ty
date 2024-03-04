---
title: "3.01 Striding forward with great purpose, pt2"
date: "2010-10-08"
tags: 
  - "sisyphean-design"
---

[![](images/tangled_wires.jpg "tangled_wires")](http://spurious-logic.net/striding-forward-with-great-purpose-pt2)

I know I said I'd put together a tic-tac-toe game to get mouse input and element selection but I have a few issues with the code as it was presented in the last post.

**Firstly;** timing issues.

I tried the code from the last post on different machines and I found that the performance was significantly different. Like, _broken_ different. With the same code from the last post I ran the game on a dedicated games pc and it _crawled_. So I bumped up the delta's for the ball and paddle movement the variables and hey, it moved responsively again. Then today I ran the code with the faster delta's from the weekend on the 1st computer (standard desktop computer) and it was unplayably fast.

The faster pc (with newer/better hardware - and a modern dedicated graphics card) ran it more slowly while the older pc (integrated graphics) ran it faster? So what's going on here?

I tried changing the FPS refresh rate but that had no impact at all. Changing the ball speed down to 0.0075 from 0.075 makes the ball move at a more manageable pace, but if you also change the paddles down by the same order of magnitude they are barely moving. In fact, the paddles seemed to be moving at a comparable speed on both PC's. It almost seems that the balls state is being updated more frequently than that of the paddles or that the player input code isn't handling correctly. Alternatively the size of the playing area is smaller (somehow - due to the resolution of the screen possibly) and so at the same speed the ball moves faster on screen. This would be a danger of using the screen coordinates as your world coordinates.

So far it's just been running in debug mode and the older pc has Visual Studio 2008 while the newer only has the express edition of Visual Studio 2010. Possibly the express version doesn't run as fast? Maybe compiling and running the binary would be a better test? Stranger and stranger. Given that I have 2 pc's and I can't compare them side by side and do proper testing I have to put out all future code with the caveat "alter variables to suit".

**Secondly;** rather than moving on to a new game I'd rather polish up the pong game a bit more.

The code is pretty awful and any competent coder should be screaming "refactor for the love of god". So that'll be happening. Looking at the actual program it looks like it's constantly fighting against the restrictions imposed by OpenTK. Barely calling the right functions where they should be called. This isn't how it should be. I realised that it's using the wrong model. I've written it in an iterative style hanging off the one OnRenderFrame() event. As you'll see it works much easier as a event driven style and it should also read more easily.

I'm not too worried that the first version is [shonky](http://www.urbandictionary.com/define.php?term=shonky) as I'm very much a "Get it working first, make it pretty later" type of developer. I'm much more concerned with the end product rather than the code looking pretty. Coders complain about spaghetti code, but the end user really shouldn't care. And yes, I am aware of the concept and significance of [technical debt](http://en.wikipedia.org/wiki/Technical_debt) in relation to an ongoing project but as a prototype it's better to just throw it in there and fix it later. But as this is a learning project I think it better to improve this just to learn "the right way" and in future it'll be easier to develop/design with that in mind (and event driven is very much "the right way" as far as OpenTK and .Net is concerned)

Also, I think reworking the Pong game is important because, while the initial game is very simple there is an awful lot of room for improvement there. Adding some neat effects, sounds, perspective changes, control changes, displaying scores, etc. The fact is that if I were to go off and start another project then I would probably finish it to roughly the same level of completion without polishing it off and there would be no real progression. Just a bunch of partially completed games with no "sparkle".

**Thirdly;** I'd like to use this game to talk about world coordinates vs display coordinates and other basic concepts.

I'd like to rework the game so that the world coordinates are distinct from the screen coordinates and hopefully improve the physics. Lastly, playing-wise it's beyond basic but I think it can still be used as a nice framework to play around with assumptions on perspective and gameplay.

As an ultimate aim for all of this will be a mouse-driven, 3d tennis style game (talk about scope creep) but there's a long way between here and there with plenty of stops along the way.

p.s. All future code will be in the form of zip archives as they will no longer be single files.

Image from Flickr user [petekraynak](http://www.flickr.com/photos/thecornballer/)
