---
title: "3.0 Striding forward with great purpose"
date: "2010-10-01"
tags: 
  - "sisyphean-design"
---

[![](/assets/img/Ping-Pong_Zimnicea.jpg "Ping-Pong_Zimnicea")](http://spurious-logic.net/?p=1022)So here's a take on the simplest of simple games. One of the very first video games, implemented badly with massive hardware requirements and it still doesn't work as well as it did back in 1972. [Pong](http://en.wikipedia.org/wiki/Pong).

using System;
using OpenTK;
using OpenTK.Graphics.OpenGL;
using OpenTK.Input;

namespace ConsoleApplication5
{
    //the program entry point
    class Program
    {

        static void Main(string\[\] args)
        {
            SimpleGameWindow theWindow = new SimpleGameWindow();
            theWindow.VSync = VSyncMode.On;

            theWindow.Run(30.0);    //run at 30fps
        }
    }

    //the display class
    class SimpleGameWindow : GameWindow
    {
        //player paddle position
        float playerX, playerY;
        //ai paddle position
        float aiX, aiY;
        //ball position
        float ballX, ballY;
        //working on 2d plane so all Z's should be the same
        float theZ;
        //ball movement
        float ballDeltaX, ballDeltaY;
        //how fast the paddles move
        float paddleDelta;
        //precalculated values
        float fov, aspectRatio;

        //playing field size
        const float playingHeight = 7.0f;
        const float playingWidth = 9.0f;
        //paddle depth and size
        const float halfPaddleDepth = 0.05f;
        const float halfPaddleHeight = 0.9f;
        //ball size
        const float ballRadius = 0.15f;

        public SimpleGameWindow()
            : base(800, 600, OpenTK.Graphics.GraphicsMode.Default, "Example")
        {
            //instantiate viewpoint at x,y origin, z a bit out
            //to allow us to look 'in' at the box from the start
            playerX = 8.0f;
            aiX = -playerX;
            playerY = aiY = 0.0f;
            theZ = 0.0f;
            ballX = ballY = 0.0f;
            ballDeltaY = ballDeltaX = 0.005f;
            paddleDelta = 0.01f;

            //precalculating to save per loop cost
            fov = (float)Math.PI / 3;
            aspectRatio = Width / (float)Height;
        }

        protected override void OnRenderFrame(FrameEventArgs e)
        {
            base.OnRenderFrame(e);

            handlePlayerInput();

            moveAiPaddle();

            checkPaddles();

            moveBall();

            doDisplay();

        }

        private void handlePlayerInput()
        {
            //ESC is quit
            if (Keyboard\[Key.Escape\])
                Exit();

            //Arrow keys move paddle up and down
            if (Keyboard\[Key.Up\])
                playerY += paddleDelta;

            if (Keyboard\[Key.Down\])
                playerY -= paddleDelta;
        }

        //decide which direction to move AI paddle
        private void moveAiPaddle()
        {
            float newBallY = ballY + ballDeltaY;

            //yes this does make the AI unbeatable unless
            //randomness/variance in movement or ball speed/direction is added

            if (newBallY > aiY)
                //move up
                aiY += paddleDelta;
            else
                //move down
                aiY -= paddleDelta;
        }

        //keep the paddles in the playing area
        private void checkPaddles()
        {
            if (playerY > playingHeight)
                playerY = playingHeight;

            if (playerY < -playingHeight)
                 playerY = -playingHeight;

             if (aiY > playingHeight)
                aiY = playingHeight;

            if (aiY < -playingHeight)
                 aiY = -playingHeight;
        }

        private void moveBall()
        {
            float newBallX = ballX + ballDeltaX;
            float newBallY = ballY + ballDeltaY;

            //score
            if (newBallX > playingWidth)
            {   //AI scores!! for now just reset
                newBallX = ballX = 0.0f;
                newBallY = ballY = 0.0f;
            }
            else if (newBallX < -playingWidth)
            {   //player scores!! for now just reset

                newBallX = ballX = 0.0f;
                newBallY = ballY = 0.0f;
            }

            //bounce off paddles
            if (newBallX > playerX
                && newBallY < (playerY + halfPaddleHeight + 2.0f)
                && newBallY > (playerY - halfPaddleHeight - 2.0f)
               )
            {   //bounce off player paddle
                ballX = playerX - (newBallX - playerX);
                ballDeltaX = -ballDeltaX;
            }
            else if (newBallX < aiX
                        && newBallY < (aiY + halfPaddleHeight)
                        && newBallY > (aiY - halfPaddleHeight)
                     )
            {    //bounce off ai paddle
                ballX = aiX - (newBallX - aiX);
                ballDeltaX = -ballDeltaX;
            }
            else
            {    //no bounce
                ballX = newBallX;
            }

            //bounce off top or bottom.
            if (newBallY > playingHeight)
            {    //bounce off top
                ballY = playingHeight - (newBallY - playingHeight);
                ballDeltaY = -ballDeltaY;
            }
            else if (newBallY < -playingHeight)
            {    //bounce off bottom
                ballY = -playingHeight + (newBallY + playingHeight);
                ballDeltaY = -ballDeltaY;
            }
            else
            {
                ballY = newBallY;
            }
        }

        private void doDisplay()
        {
            //clear the screen
            GL.Clear(ClearBufferMask.ColorBufferBit);
            //clear the matrix
            GL.LoadIdentity();

            GL.Color3(1.0f, 1.0f, 1.0f);

            //apply perspective matrix
            GL.MatrixMode(MatrixMode.Projection);
            Matrix4 projection = Matrix4.CreatePerspectiveFieldOfView(fov,
                                                                      aspectRatio,
                                                                      0.1f,
                                                                      2000.0f
                                                                     );
            GL.LoadMatrix(ref projection);

            //look at the origin from the specified eye coordinates
            GL.MatrixMode(MatrixMode.Modelview);
            Matrix4 modelView = Matrix4.LookAt(0.0f, 0.0f, 14.0f,
                                               0.0f, 0.0f, 0.0f,
                                               0.0f, 1.0f, 0.0f);
            GL.LoadMatrix(ref modelView);

            //draw player paddle
            GL.PushMatrix();
            GL.Translate(playerX, playerY, theZ);
            drawPaddle(BeginMode.Polygon);
            GL.PopMatrix();

            //draw ai paddle
            GL.PushMatrix();
            GL.Translate(aiX, aiY, theZ);
            drawPaddle(BeginMode.Polygon);
            GL.PopMatrix();

            //draw ball
            GL.PushMatrix();
            GL.Translate(ballX, ballY, theZ);
            drawBall(BeginMode.Polygon);
            GL.PopMatrix();

            SwapBuffers();
        }

        private void drawPaddle(BeginMode type)
        {
            GL.Begin(type);

            GL.Vertex3(-halfPaddleDepth, halfPaddleHeight, theZ);
            GL.Vertex3(halfPaddleDepth, halfPaddleHeight, theZ);
            GL.Vertex3(halfPaddleDepth, -halfPaddleHeight, theZ);
            GL.Vertex3(-halfPaddleDepth, -halfPaddleHeight, theZ);

            GL.End();
        }

        private void drawBall(BeginMode type)
        {
            GL.Begin(type);

            GL.Vertex3(-ballRadius, ballRadius, theZ);
            GL.Vertex3(ballRadius, ballRadius, theZ);
            GL.Vertex3(ballRadius, -ballRadius, theZ);
            GL.Vertex3(-ballRadius, -ballRadius, theZ);

            GL.End();
        }
    }
}

And there you have it!

...wait. There's no way to win. The game, just like [Isner–Mahut](http://en.wikipedia.org/wiki/Isner%E2%80%93Mahut_match_at_the_2010_Wimbledon_Championships) will never, ever stop. Constantly resetting the ball every time it flies off into the void behind each of the paddles. There's no score, no end point no victory.

I don't mean it as a philosophical statement on the futility of competition, but more that I didn't get around to adding a score counter and check and I didn't want to bother displaying a score.

It's also unwinnable because of the constant speed and direction of the ball combined with the perfect AI behaviour and the fact that the paddles are so fast compared to the ball (if they start from the opposite sides of the screen then the paddle is still fast enough to get across to intercept the ball) means that you'll never get the ball past the other paddle. The solution to this could be any of these

- add a spin effect where the motion of the paddle effects the acceleration of the ball
- slow the paddles down/speed up the ball
- accelerate the ball every time it hits a paddle
- make the A.I. paddle go in the wrong direction randomly

Another point with this (very, very) simple _game_ is that it uses the display coordinates as the world coordinates. i.e. If the ball is displayed at 1,1 then that's exactly where it is. This is fine for something like this, but with a more complicated game world (particularly when not all of it will display on the screen) there is a translation to be performed. kind of. OpenGL will take care of what should be displayed and what should not be displayed, but if there's interaction between in game elements you may not want to use the OpenGL coordinate system. For example, if we're doing a tic tac toe game, the game world model is a 3x3 grid. This does not map directly to a 800 x 700 display so some sort of translation must occur.

So, next time I do tic-tac-toe with game world -> display translation and mouse input as well.

Edit: Played around with this some more. Changed paddle and ball speeds, added score (still not displayed) and acceleration of the ball off the paddles. Source is [here.](http://spurious-logic.net/wp-content/uploads/2010/10/Program.zip "here") The formerly 'perfect' AI is now easily beatable as it's purely reactive. A further challenge would be to implement an AI which predicts the ball movements and goes there (with random error to avoid another perfect opponent - simple game system and full knowledge make this possible).

Image is Ping-Pong Zimicea.jpg from commons.wikimedia.org.
