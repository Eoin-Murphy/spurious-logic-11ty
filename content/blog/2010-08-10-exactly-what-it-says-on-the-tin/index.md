---
title: "Exactly what it says on the tin."
date: "2010-08-10"
tags: 
  - "dev"
---

![](/assets/img/outerMongolia.jpg "outerMongolia") One of my biggest problems as a developer is limiting the changes I make.

Initially, when you're a junior developer you're more focussed on learning how the system fits together, making sure your changes fix the defect and that you're not breaking the build.

Once you get past that stage and you start to think that "Hey, I know this stuff and I have a pretty good idea what the client wants", then you start spotting further improvements which would be a trivial code change but would improve the clients experience.

The only problem is, the client didn't ask for them and won't be expecting them. As a more experienced developer your job now is to track these 'suggestions', pass them on to your project manager with estimated effort for development and for testing. If your PM gives the go ahead then you look for client approval and schedule it for a release.

This is tangential to the other thought which occurred to me on the differences in perspective between clients and coders. Clients see a system as a tool. Input goes in, query's are preformed, results retuned amongst many other tasks. All defined clearly by business rules.

Coders on the other hand see the system as a set of projects (or modules or what have you) which ultimately are made up of lines of code. These can be (especially on legacy systems) a big mess of source code or SQL procedures. All of which means that it's easy for coders to forget that the code is only there to implement business rules. That's it's entire purpose. And changing code means that you might be changing business rules.

e.g. An eCommerce business wants to retrieve all emails from orders from the last 6 months to spam them. It defines these orders as "Recently Active" and asks the dev team to put together a script to extract them. During the development cycle the business realises that they don't want to send emails to anyone who had an order delivered to Outer Mongolia because the director went on holidays there and didn't like the local stew. So this exception is added in.

5 years later and our enthusiastic veteran of  2 years has been asked to see why the "extractRecentlyActive" proc has not been returning emails for "Outer Mongolia". The initial developer has left and there are no docs. Lo! He sees "where country <> "Outer Mongolia" " and strips it out without consulting docs or the client.

Suddenly we've broken a business rule. This was a very clear case a clearly defined rule which should have been commented clearly in the code and documented. But most businesses have poor documentation and worse code commenting. So what should our intrepid coder have done? ... Ask the client.

LINES OF CODE ARE BUSINESS RULES.

It may not be formally defined as such. And you can change them around when the defect says you can. But if you see something a clear cut as "where country <> "Outer Mongolia" " and the defect doesn't explicitly say "we previously excluded this country and now wish to include it". You do not change it without confirmation or you'll regret it.
