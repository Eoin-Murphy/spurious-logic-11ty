---
title: "4.0 Spick and Span"
date: "2010-10-11"
tags: 
  - "sisyphean-design"
---

[![](images/cherry_blossom.jpg "cherry_blossom")](http://spurious-logic.net/spick-and-span)

**1) Timing:**

If you look at the sample code from [the wireframe post](http://spurious-logic.net/all-the-way-to-chapter-3) or the the [first pong post](http://spurious-logic.net/striding-forward-with-great-purpose) you can see that the all of the display and game logic  code is hanging off one single method - "OnRenderFrame". Looking at the API  it specified this is "Called when the frame is rendered" Further down there is another method "OnUpdateFrame" which is "Called when the frame is updated".

Looking down at the Run method I see that I was wrong with the previous posts. I had said that this:

theWindow.Run(30.0);    //run at 30fps

What this call does is actually sets the frame update rate at 30 updates per second and the frame renders at the maximum possible. From the API:

<table border="1"><tbody><tr><td>void OpenTK.GameWindow.Run</td><td>(double updateRate)</td><td>Enters the game loop of the&nbsp;The GameWindow class. Contains cross-platform methods to create and render on an OpenGL.GameWindow using the specified update rate. maximum possible render frequency.</td></tr><tr><td>void OpenTK.GameWindow.Run</td><td>(double updates_per_second, double frames_per_second)</td><td>Enters the game loop of the GameWindow updating and rendering at the specified frequency.</td></tr></tbody></table>

So rather than setting the FPS as I thought, I was setting the update rate. And because the code was tied to the frame render method which was set to the "maximum possible render frequency" I was getting different performance on different machines.

So, I refactored the game logic out and ran it from he OnUpdateFrame method and left the display code in the OnRenderFrame method. I've also specified the frames\_per\_second. So now at least it should have the same performance across different machines.

It's worth playing around with different update and framerates to see their interaction. Setting the update rate speeds up and slows down the game while framerate determines how often the screen is redrawn. If your update rate is faster than your framerate then it'll be choppy, but if the update rate is too slow then the game is not playable.

The take home lesson from this? [Read the API. Or RTFAPI if you prefer.](http://www.opentk.com/files/doc/index.html)

**2) Polish:**

**2.1) Code:**

As you can see from the previous section the refactoring is less of a "wouldn't it be nice"  and more a "the poor structure of the code is impacting on the system" it becomes a little more important to get the architecture right. I was going to go step by step through the refactoring, providing downloads of each stage but I'm not sure how much use that would actually be and it would be very very tedious. (Plus I haven't saved the interim stages - no, I don't have any source control set up. Bad developer, no cookie...). My approach to refactoring is very much - make a change and test if it works immediately. Remember the function of refactoring is to maintain the same behaviour while organising the code in a better/more logical/more [performant](http://stackoverflow.com/questions/44105/is-performant-a-valid-word-whats-the-alternative) way. So don't go adding functionality when refactoring as that would prevent you from ensuring that it's all working as it should. All of this can also be done automatically by Visual Studio from the refactor menu but I wanted to go through it manually. After every step I re-ran the program to check that it was still working.

**2.1.1)** I moved the SimpleGameWindow class out of the program file. Simply put, it's wrong to have more than one (non-private) class in a file. They're easier to organise if they're in separate files. Yes my Java background is coming through here but it's better practice.  It was useful for demonstration of hello world style programs but for anything beyond that it get very cumbersome.

So I created a new folder called Display and in there created a new class TheDisplay.cs. I copied the code from Program.cs and repointed  the Program.cs calls to the new class.

**2.1.2)** Next I split the game logic (i.e that code which modifies the game state) from the display code. Creating another folder called World and a class called TheWorld.cs I moved over all the non-display variables and the  methods which updated them. The Program.cs main method was modified to create a new TheWorld class and pass it to the TheDisplay class. The TheDisplay class was then modified to call those functions from TheWorld class.

**2.1.3)** The game logic function calls were placed in the OnFrameUpdate method while the display calls were left in the OnRenderFrame method. This way the game now actually works correctly as per the very first part of this post.

**2.1.4)** Looking at TheWorld class I saw there I had a load of variables defining the state of individual game objects. In the World folder I created a new class WorldObject. Into this I placed those relevant variables and I reworked both TheWorld and TheDisplay classes to work with the new class.

**2.1.5)** Similarly I looked at the TheDisplay class and saw that there was a lot of variables describing individual display objects. So again, a new class DisplayObject was created in the Display folder. It takes a WorldObject as a parameter to its constructor and handles the display for that world object.

**2.1.6)** I didn't like that the DisplayObject had so much display code which was specific to drawing a cube. If at any time in the future I wanted to display any other type of polygon I'd be stuck. So I refactored the actual drawing work out to a new Cube class. The DisplayObject object still performs setting the objects colour and translating the matrix but it's the Cube object which draws the cube polygon.

And that was the limit of my refactoring for now. No interfaces created, no hierarchies, no polymorphism implemented, no object factories, no design patterns enforced.... Like I said earlier, there's plenty of stops on the way to our destination. It's still a horrible mismash of coding styles and paradigms. A tangled ball of cross object calls with no clearly defined architecture. This doesn't bother me too much as I can get the code sorted as long as the game is playable.

**2.2)Gameplay:**

**2.2.1)** I wanted sound. So I created a new class PongAudio (in a new folder Audio). You'll need to download and install [OpenAL for this to work (oainst from the list)](http://connect.creativelabs.com/openal/Downloads/Forms/AllItems.aspx). Googling around I slapped together the most basic sound code I could and using the windows native Ding.wav and now we have a little noise whenever the ball hits a paddle.

I'm not 100% happy as there's an audible _click_ when the sound stops playing but I'm not going to worry about that now.

**2.2.2)** I also wanted a clearer visual feedback so I set the paddles to flash red when the ball hits them.\* Also the ball is now green (easier to see against the paddles) and I've added a "court" object to act as a light grey background so the playing area is visible as opposed to trying to guess where the edged are.

**2.2.3)** I added in extra input handling so that hitting space bar now pauses the game and hitting 'P' changes the perspective between top down and end on views.

Actually if you look at those last changes you'll see that they were implemented by registering a new EventHandler to the OnKeyUp event rather than in the keyPressed method in the update loop. The reason for this is that when I had them in the keyPressed method it was called 30 times a second so that if you held a key for any length of time it would change state (pausing/unpausing, or switching perspectives) 30 times a second also. The OnKeyUp approach means that the method is only called once, when the key is released.

**2.2.4)** This made me realise that the input handling was wrong and inefficient. It's polling every loop rather than hanging on an event handler. I changed it so that the keyPressed()  method reacted to a OnKeyPressed event by setting the world player direction to up, down or stationary. The world is then responsible for updating the player paddle based on this variable. This allowed me to do a nice momentum based movement. This means that the player has to tap the up & down keys to move quickly. The ball very quickly gets faster than you can move.

Had I wanted to keep the "hold key down to move" style play I could have set it so that the world kept on moving until turned off by a OnKeyUp event but I think the tapping is more "gamey".

\*As there is a ping, paddle flash and velocity change which all occur when the ball hits the paddle (just velocity changes when it hits the wall) I'm inclined to think that creating a CollisionEvent event and handling the collisions that way would be better. But that's for the next post.

**3)Game Concepts:**

I guess this will be a bit hand wavy and vague as well, that's the nature of subjective criticism.

This game is about user input controlling a paddle, using that paddle to interact with the active element, the ball and trying to beat the AI. As I said above I like the tapping type of input with the paddle sliding to a stop. It feels more natural than just holding the button down. It would be better though if I could get the paddle to accelerate (a little) the longer the  key was held down.

The ping sound and flashing are important as they give the player a clearer signal that they've hit the ball which is good as it reinforces what they're meant to be doing.

I'm not happy with the collision physics as it feels like it doesn't matter whether the paddle is moving in the same direction as the ball or not (for putting a spin on the ball - or just varying the movement) and so it just doesn't feel 'right'.

Still missing is a display of the current score. The win score is something like 99,999 for testing purposes but if the player can't see what they've achieved then it will all seem to be just pointless repetition.

The AI is too good. As I said before, with a fast enough paddle/slow enough ball and no control over direction and an AI which always goes to the right spot you won't win. Or you'll learn which set of moves means you'll always win. Either is not what I'm looking for. Also it's movement seems jumpy for whatever reason. It's quite distracting once you notice it. I have a feeling this is caused by reacting to the ball position rather than setting a destination and moving there.

I like playing with the perspective as it feels like it changes the game totally. Instead of looking down from above, distant from the action below, the side on perspective engages you more with what's happening. Technically the top down may be better because you can see everything more clearly but I feel that the end on view is easier to play with as it demands your attention more.

As I said, vague and handwavy.

**Summary:**

[So here's the latest verion of the game with all the changes above.](http://spurious-logic.net/wp-content/uploads/2010/10/Pong_11_10_2010.zip)

God, that was a very _formal_ style post. Numbered sections and sub-sections? Next I'll have footnotes, reference and appendices. I guess that I'm used to writing about code in a structured way (thank you documentation writing tasks) so it feels more natural to me to break things down like this. It's not a bad practice to get into as code can get unwieldy and complicated. I'm afraid it is quite dry to read so I'll try and make it more conversational while still being concise and clear.

I don't know if I mentioned this before but I think I've started this or a similar project a least 3 times a year for the last 8 years. I got as far as a playable 2d version using C and SDL before I got tangled up in re-engineering the whole thing. Since the I've always tried (half-heartedly) to design first and program later. That's great if you're in a formal process/client-provider type system (agile methodologies notwithstanding) but when it's your own pet project it's _really really_ important to get something working up on the screen. Otherwise it's easy to lose momentum and the whole thing dies. I've lost too much time losing track of the code, trying to perfect which ModelObject calls which DisplayObject (all interfaces), mediated by a ControllerObject and which all means that you've got some lovely architecture which doesn't work.

So therefore I'm happy with the _ball o'mud_ design pattern demonstrated above and I think it's better to refactor it out, piece by piece. Pausing every now and then to add new functionality. Note, the _ball o'mud_ design pattern is not appropriate for any program with more than one developer. Nor is it appropriate when you're trying to develop something which will ever have to be maintained.

In my next post I'll move the code into a more event driven model and try and tackle some of the elements I mentioned in part 3.

Image from Flickr user [hojusaram](http://www.flickr.com/photos/hojusaram/)
