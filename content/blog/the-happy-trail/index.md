---
title: "The happy trail"
date: "2009-09-08"
tags: 
  - "dev"
---

No, it's not a part of your anatomy.

So I'm reading [Bad Science](http://www.amazon.co.uk/Bad-Science-Ben-Goldacre/dp/000728487X/ref=sr_1_1?ie=UTF8&s=books&qid=1252403324&sr=8-1) at the moment. The author is mainly concerned with the publics lack of understanding of science results and the scientific method generally. He also talks a lot on how this lack of understanding is manipulated by various parties, namely, the media to sell newspapers, by alternative medicine and big companies alike to sell their products, and by others with a fixed moral worldview to push their own agendas.

It's a fantastic book, and it will at least get you thinking about all those "Scientists have confirmed XYZ..." stories which are so common and give you tools to better evaluate medical claims which can only be good for your attitude towards your own helath. Equally likely it'll send you into fits of rage as he eviscerates the arguments which you use to support your own peccadillos. Highly recommended. For more, you can check out [badscience.net](http://badscience.net/)

...Anyway, there's a nice section in there on why intuition is so often wrong when it comes to science and in particular gut instincts about statistics. And one aspect in particular is very relevant to software development.

When we're doing a test and we already have a hypothesis/solution in mind, we will unconsciously only ask questions which support our hypothesis. In software development this is called "Happy trail testing". Only testing that our one explanation/solution is the correct one, not checking that other possibilities are wrong.

For example, if you're working on a batch job and it's producing invalid output for a particular set of inputs. Happy trail would be, developing a solution and testing against that exact set of inputs without checking how the the job behaves for another set. (basically, it's a failure to conduct correct regression tests)
