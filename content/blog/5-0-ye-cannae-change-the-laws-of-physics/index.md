---
title: "5.0 Ye cannae change the laws of physics"
date: "2010-10-28"
tags: 
  - "sisyphean-design"
---

[![](images/dead_end.jpg "dead_end")](http://spurious-logic.net/5-0-ye-cannae-change-the-laws-of-physics)

As I mentioned in my previous post, I was looking at the physics of this and thought, _"hey, I did applied maths and honours level maths in school  (over a decade ago now) so surely I can whip together a simple yet precise physics engine"_.

Not exactly famous last words, more very very naive and dumb words.

I started down the road of creating purely physics simulator project. (Re)Defining vectors, points, polygons etc... Very sophmore. In fact I'll put the code up here before too long so if you want to see what a dead end looks like you'll have a good example. Basically my idea was a series of collision tests from very coarse (does the object's total possible movement sphere intersect with anothers?) working down through detecting whether the movement vectors of the centre of gravity (with a cylinder of the maximum object radius)  collides finally to vector level collision detection, taking object rotation about a point into account. Once you get to this stage though, you've got to start taking velocity into account as two movement vectors may intersect but depending on the time at which it occurs, the objects may not collide. So all of a sudden you start talking about time quanta of time. And still you mightn't be getting it just right.

Basically it went that bit too far and failed to work at all so I got frustrated and gave up on it. Between this loss of momentum and you know "real life things happening" I've just basically stopped with the Pong project.

So where does that leave me? I've realised that even though it was fun and a nice recap on some (very) basic 3d & game programming techniques that it wasn't really doing what I wanted. I was looking too much at the technology and less at the game design or playing around. There are much better tech demos and frankly I'm never going to be the next Carmack (given the choice I'd prefer to be the next [Notch](http://www.rockpapershotgun.com/2010/11/23/markus-notch-persson-talks-minecraft/) or [Eskil Steenberg](http://www.rockpapershotgun.com/2010/03/25/eskil-steenberg-made-love/) but that's just as unlikely to happen). These are all solved (if hard to approach naively) problems and if I was going to do a physics based game I'd be much, much better off spending my free time looking at a library like [bulletphysics](http://bulletphysics.org/wordpress/) rather than noodling around reinventing the wheel (as fun as that is).

Plus this wasn't even meant to be "the Pong project". It was meant to be a create a little game project and talk about game concepts. Not 3d maths and openGL(TK) tutorial series.

So I'm going to do one more refinement to the Pong game physics. Instead of a complex, perfectionist approach I'm just going to [extrude a polygon](http://en.wikipedia.org/wiki/Polygonal_modeling) for every moving object (there are only 3) and do collision detection against these. It's not perfect but given the small movements per game cycle it shouldn't be visible to the player, won't be too performance intensive and shouldn't be too hard to do (these are famous last words).

After that I'm going to take a look around at other toolkits and maybe see if I can't implement a game with some pre-existing framework... Desiging a game rather than programming.

Edit<1>: Here's the physics project which failed miserably. Included for completeness & entertainment value: [BrokenPhysics07-12-2010](http://spurious-logic.net/wp-content/uploads/2010/10/BrokenPhysics07-12-2010.zip)

Image is from Flickr user [tjdewey](http://www.flickr.com/photos/22416200@N05/)
