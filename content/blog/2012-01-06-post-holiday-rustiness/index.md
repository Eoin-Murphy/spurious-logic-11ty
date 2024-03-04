---
title: "Post Holiday Rustiness"
date: "2012-01-06"
tags: 
  - "dev"
---

[![](images/527px-Come_Take_a_drink.png "527px-Come!_Take_a_drink")](http://spurious-logic.net/wp-content/uploads/2012/01/527px-Come_Take_a_drink.png)

There's nothing quite like coming back to a development job after two or more weeks out. That feeling of looking at code for the first time and not being able to see the meaning of the lines.

Publicpay ActionResultway Avesay(Odelmay odelmay)
{
 isthay.OpulateRulepay(efray odelmay);

ActionResultway esultray = isthay.EdirectToActionray("Iewvay", odelmay);
eturnray esultray;

}

Three days later my brain has finally recognised that this should be:

public ActionResult Save(Model model)
{
   this.PopulateRule(ref model);

   ActionResult result = this.RedirectToAction("View", model);
   return result;

}

And I know there's logic in there, but I just can't focus to carry the thread through. It's like reading a book, seeing and reading the words without being able to get the meaning from a sentence.

So in future, whenever I'm taking a break for longer than a week I will not leave large abstract tasks for myself when I come back. Maybe a couple of gimmie tasks to get up and running again.
