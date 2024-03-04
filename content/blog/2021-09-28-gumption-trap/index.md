---
title: "Gumption Trap"
date: "2021-09-28"
tags:
  - "dev"
---

So, I've read "Zen and the art of motorcycle maintenance" a bunch of times. I don't feel that much wiser but I like the book and some of the ideas which it outlines.

Anyway, the best section in the whole book I think is the bit on gumption traps. Basically, those traps which wait in any task ready to suck your enthusiasm.

I'm working on a gumption trap problem right now and it's certainly destroying my enthusiasm.

We want to upload a photo to S3 directly from the client. So the client makes a request to the server, gets a pre-signed URL and then does a PUT to that url with the file.

It all seemed to be going so well until I actually tried to do the PUT and now I'm looking at the oh-so meaningful AWS error message:

`SignatureDoesNotMatch   The request signature we calculated does not match the signature you provided. Check your key and signing method.`

So now I have to go back and reexamine all my assumptions from the start of the task. And probably the best way to do this is implement the AWS tutorial code and check that my credentials are set up right ...
