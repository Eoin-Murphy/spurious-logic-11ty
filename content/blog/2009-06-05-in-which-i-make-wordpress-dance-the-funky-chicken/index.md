---
title: "In which I make wordpress dance the funky chicken"
date: "2009-06-05"
tags:
  - "dev"
---

So, yeah, birthday + long weekend +  good weather = no posts.

So, I was approached by a client who wanted an update to their webpage. They run a franchise system where each franchisee should be able to log in to the website and update class details for classes running in their own branch.

They should not be able to change anyone elses class details or the overall layout of the branch page. The admin should have full access.

To do this with wordpress I installed Exec-PHP (so that the individual pages can have dynamic content), Inline Javascript (for flashy effects) and Role Manager (for access rescrictions)

For each branch I set up a master info page which belonged to the admin (so not editable) with a php script which pulls in all the sub-pages under a specific parent page (i.e. the class info root page).

The class info root page is just an empty wordpress page belonging to the admin. To add new classes to the centre page the user just creates a new page and ensures that the parent is set to the root page. Then when they check the center page they see the updated info.

The timetable and workshops panels are just plain grabs while the teacher and class sections combine some nice javascript (required for the suckerfish list rollover effects) and scriptaculous effects to give it that extra bling.

You can check out the page source to see the javascript stuff while the php for creating the list  goes something like this:

<ul class="list" id="list-tutors">
   <?php
      $parent = $tutor\_parent; //set to the root tutor info page
      $children = get\_children($parent);
      foreach ($children as $child) {
         echo("<li id='list-".$child->ID."' onclick=\\"showNewTutor('".$child->ID."')\\" >" . $child->post\_title . "</li>\\n");
      }
   ?>
</ul>

p.s.  I'm really liking this theme less and less so as soon as I get a chance i'll go ahead and change it. A combination of being too cluttered with all the icons around the posts and too narrow with the fixed width content column.
