---
title: "godammit"
date: "2011-04-27"
tags: 
  - "dev"
---

[![](/assets/img/rusty_fence_web.jpg "rusty_fence_web")](http://spurious-logic.net/godammit)

You know what's worse than getting a defect fix back in your queue?

Getting a defect fix back in your queue, for the second time, when you were very confident of the previous fixes (in fact even proud that you managed to crack that tough problem) and the only place that the problem is presenting is on QA's side.

I never, ever, want to be the dev who seriously says 'but it works on my machine' but when I've tried from team mates machines, remote desktopped into QA boxes and I still can't reproduce the problem it makes me want to pull my hair out.

My first instinct as a developer is to say "they're doing something wrong" but the fact is that if QA say's it's slow for them, well then, it's slow for them.

It doesn't help that as a performance issue there's a whole host of potential other issues which could also be impacting on all of this from computer hardware, anti-virus or other programs to network latency.

Oy Vey.

\>edit - 2 weeks later<   To paraphrase Homer Simpson; "JavaScript! The cause of, and solution to, all of life's problems." There once was a GridView. And in that GridView one cell in every row contained a custom control. Now that little custom control had JavaScript associated with it. But not always!

You see, that little custom control's JavaScript was only valid when the control was active (or being edited) so the clever, clever coder put in a test in the Page\_Load to only include the onkeyup="function();" when the control was Enabled.

Of course what the clever clever coder forgot is that the control was Enabled by default and so this was always inserted, even when the JavaScript function was not inserted. (The control only included the JavaScript by testing the control's state using a hacky server control <% if(control.Enabled == true) { %> JAVASCRIPT <% } %> ).

So on the client's computer (for some, as yet undiscovered reason) the Attributes.Add(onkeyup, "function()") was called for every row in the GridView, which could get very, very slow.

Solution? Set the control to Enabled="False" by default, move the Attributes.Add and JavaScript inclusion (using Page.ClientScript.RegisterClientScriptBlock) to a separate code-behind function and only call it when the control is explicitly enabled.

 

image from flickr user [Universal Pops](http://www.flickr.com/photos/universalpops/)
