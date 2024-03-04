---
title: "1.01 Baby, baby steps"
date: "2010-09-17"
tags: 
  - "sisyphean-design"
---

[![](images/sand_footprints.jpg "sand_footprints")](http://spurious-logic.net/1-01-baby-baby-steps)

So here's the shortest example of getting an OpenGL window open with a polygon displayed inside it OpenTK. This is the effective implementation of the first example in the [OpenGL manual.](http://www.glprogramming.com/red/) (see below). This is pretty hacky code, designed just to illustrate the differences in approach between OpenGL and OpenTK, so don't use it as a standard to code against (or judge me by it).

using System;
using OpenTK;
using OpenTK.Graphics.OpenGL;
using OpenTK.Input;

namespace ConsoleApplication3
{
    class Program
    {
        static void Main(string\[\] args)
        {
            SimpleGameWindow theWindow = new SimpleGameWindow();
            theWindow.VSync = VSyncMode.On;
            theWindow.Run(30.0);
        }
    }

    class SimpleGameWindow : GameWindow
    {
        public SimpleGameWindow()
            : base(800, 600, OpenTK.Graphics.GraphicsMode.Default, "Example")
        {
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            GL.ClearColor(0.0f, 0.0f, 0.0f, 0.0f);
            GL.Clear(ClearBufferMask.ColorBufferBit);
            GL.Color3(1.0f, 1.0f, 1.0f);
            GL.Ortho(0.0f, 1.0f, 0.0f, 1.0f, -1.0f, 1.0f);

            GL.Begin(BeginMode.Polygon);
            GL.Vertex3(0.25f, 0.25f, 0.0f);
            GL.Vertex3(0.75f, 0.25f, 0.0f);
            GL.Vertex3(0.75f, 0.75f, 0.0f);
            GL.Vertex3(0.25f, 0.75f, 0.0f);
            GL.End();

            GL.Flush();
            SwapBuffers();
        }
    }
}

The red book has this equivalent code as:

#include <whateverYouNeed.h>

main() {

   InitializeAWindowPlease();

   glClearColor (0.0, 0.0, 0.0, 0.0);
   glClear (GL\_COLOR\_BUFFER\_BIT);
   glColor3f (1.0, 1.0, 1.0);
   glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0);
   glBegin(GL\_POLYGON);
      glVertex3f (0.25, 0.25, 0.0);
      glVertex3f (0.75, 0.25, 0.0);
      glVertex3f (0.75, 0.75, 0.0);
      glVertex3f (0.25, 0.75, 0.0);
   glEnd();
   glFlush();

   UpdateTheWindowAndCheckForEvents();
}

Which is not so much a little bit different but rather working off a totally different programming model.

Image from Flickr user [Juan Antonio Capó](http://www.flickr.com/photos/juan-antonio-capo/)
