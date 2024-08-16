---
title: "2.0 All the way to chapter 3"
date: "2010-09-30"
tags: 
  - "sisyphean-design"
---

[![](/assets/img/wireCube.png "wireCube")](http://spurious-logic.net/?p=1006)So I'm working my way back through the OpenGL Red book. Helpfully enough this is if for version 3.0 of OpenGL. The latest version being 4.1 and I'm running OpenTK which is a wrapper around OpenGL.

Anyway, I'm working my way through examples and translating them to C#. Which if you know C++ and C# isn't really all that much of a stretch.

Anyway here's the code for a slightly modified example 3.1 to get it working with OpenTK. Basically it displays a wire frame cube and allows you to move your point of view while constantly looking at the origin. Again, this is compressed into one source file for purposes of demonstration so real code would be better structured than this.

using System;
using OpenTK;
using OpenTK.Graphics.OpenGL;
using OpenTK.Input;

namespace ConsoleApplication4
{
    //the program entry point
    class Program
    {

        static void Main(string\[\] args)
        {
            SimpleGameWindow theWindow = new SimpleGameWindow();
            theWindow.VSync = VSyncMode.On;

            theWindow.Run(60.0);    //run at 60fps
        }
    }

    //the display class
    class SimpleGameWindow : GameWindow
    {
        float eyeX, eyeY, eyeZ;

        public SimpleGameWindow()
            : base(800, 600, OpenTK.Graphics.GraphicsMode.Default, "Example")
        {
            //instantiate viewpoint at x,y origin, z a bit out
            //to allow us to look 'in' at the box from the start
            eyeX = 0.0f;
            eyeY = 0.0f;
            eyeZ = 1.0f;

            /\* uncomment for blending & antialiasing
            GL.Enable(EnableCap.LineSmooth);
            GL.Enable(EnableCap.Blend);
            GL.BlendFunc(BlendingFactorSrc.SrcAlpha, BlendingFactorDest.OneMinusSrcAlpha);
            GL.LineWidth(1.5f);
            GL.Hint(HintTarget.LineSmoothHint, HintMode.Nicest);
             \*/
        }

        protected override void OnRenderFrame(FrameEventArgs e)
        {
            base.OnRenderFrame(e);

            //input handling
            if (Keyboard\[Key.Escape\])
                Exit();

            if (Keyboard\[Key.Up\])
                eyeY += 0.001f;

            if (Keyboard\[Key.Down\])
                eyeY -= 0.001f;

            if (Keyboard\[Key.Left\])
                eyeX -= 0.001f;

            if (Keyboard\[Key.Right\])
                eyeX += 0.001f;

            if (Keyboard\[Key.W\])
                eyeZ -= 0.001f;

            if (Keyboard\[Key.S\])
                eyeZ += 0.001f;

            //end input handling

            //clear the screen
            GL.Clear(ClearBufferMask.ColorBufferBit);
            GL.Color3(1.0f, 1.0f, 1.0f);
            //clear the matrix
            GL.LoadIdentity();

            //apply perspective matrix
            Matrix4 projection = Matrix4.CreatePerspectiveFieldOfView((float)Math.PI / 4,
                                                                       Width / (float)Height,
                                                                       0.1f,
                                                                       2000.0f);
            GL.MatrixMode(MatrixMode.Projection);
            GL.LoadMatrix(ref projection);

            //look at the origin from the specified eye coordinates
            Matrix4 modelView = Matrix4.LookAt(eyeX, eyeY, eyeZ,
                                               0.0f, 0.0f, 0.0f,
                                               0.0f, 1.0f, 0.0f);
            GL.MatrixMode(MatrixMode.Modelview);
            GL.LoadMatrix(ref modelView);

            drawWireFrame(0.25f, BeginMode.LineLoop);

            SwapBuffers();
        }

        //just what the name says
        private void drawWireFrame(float size, BeginMode type)
        {

            //2d array for faces
            int\[,\] faces = new int\[6,4\]
            {
                {0, 1, 2, 3},
                {3, 2, 6, 7},
                {7, 6, 5, 4},
                {4, 5, 1, 0},
                {5, 6, 2, 1},
                {7, 4, 0, 3}
            };

            //2d array for vertices
            float\[,\] v = new float\[8,3\];
            int i;

            v\[0,0\] = v\[1,0\] = v\[2,0\] = v\[3,0\] = -size / 2;
            v\[4,0\] = v\[5,0\] = v\[6,0\] = v\[7,0\] = size / 2;
            v\[0,1\] = v\[1,1\] = v\[4,1\] = v\[5,1\] = -size / 2;
            v\[2,1\] = v\[3,1\] = v\[6,1\] = v\[7,1\] = size / 2;
            v\[0,2\] = v\[3,2\] = v\[4,2\] = v\[7,2\] = -size / 2;
            v\[1,2\] = v\[2,2\] = v\[5,2\] = v\[6,2\] = size / 2;

            for (i = 5; i >= 0; i--)
            {
                GL.Begin(type);               

                GL.Vertex3(ref v\[faces\[i, 0\], 0\]);
                GL.Vertex3(ref v\[faces\[i, 1\], 0\]);
                GL.Vertex3(ref v\[faces\[i, 2\], 0\]);
                GL.Vertex3(ref v\[faces\[i, 3\], 0\]);
                GL.End();
            }
        }
    }

}

If you've used OpenGL at all you might spot that the helper method `drawWireFrame` is based off the GLUT method `glutWireCube`. This code isn't open source but it is viewable and the licence says "The programs are not in the public domain, but they are freely distributable without licensing fees". So Mr Kilgard if this is an inappropriate use please just let me know and I'll remove it.

So as you can guess. Progress is slow. Slower thanks to Minecraft, a steeper than expected (re)learning curve and you know, real life. I'm inclined to think that I would have been better off starting with a pure 2d library like [SMFL](http://www.sfml-dev.org/index.php) (the spiritual successor to [SDL](http://www.libsdl.org/) which I played around with a long while back). I may yet incorporate something from that but for now I'll drive on and see if I can't pull something together. Nothing worse than changing technology mid-stream to kill any momentum.

EDIT: removed unnecessary code...  
EDIT 2: even simpler code  
EDIT 3: I also wanted to take the opportunity to point out that when you're writing a programming book and you know some aspects are deprecated, then it's a good idea to actually enumerate them rather than just provide a hand-wavy disclaimer at the start of a chapter. Something like this is very irritating as I don't know what is still in use and what not.

_"For OpenGL Version 3.1, many of the techniques and functions described in this chapter were removed through deprecation. The concepts are still relevant, but the transformations described need to be implemented in a vertex shader, as described in “Vertex Processing” in Chapter 15."_

EDIT 4: split long overflowing lines across multiple rows

EDIT 5: added blending & antialiasing
