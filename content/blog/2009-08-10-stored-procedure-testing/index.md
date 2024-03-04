---
title: "Stored Procedure Testing"
date: "2009-08-10"
tags: 
  - "dev"
---

on large existing datasets.

The application I work in is fairly standard in that we're working with a large existing data set (several tables with millions of rows). Not massive, but large. And this data was imported from an older system so there are "quirks".

The upshot of this is that we cannot code against dummy data (at least not beyond initial prototyping) an so we require a local test copy of this for development purposes. Of course we have manual tests to ensure a particular proc is running correctly and before a deploy we do final smoke testing against a clean copy of data to make sure nothing is broken.

But wouldn't automated tests on stored procedures be nice? A kind of unit test for stored procs. There have been a number of situations where changes in one area have had knock-on effects to other, seemingly unrelated areas. It is dependent on the developer having enough system knowledge to know what'll be affected by any particular change (which is not infallible) or exhaustive examination of all areas (which is not practical in a tight development cycle). Unit testing would help avoid this.

Again it shouldn't be difficult to knock together a script to run a test for each stored procedure and test the output. The grunt work would be in the creation of valid test scenarios and conditions. Especially as we work with "actual" data.

It would require the creation of a Unit Test database which would be wiped & recreated on every run of every test. This database would have to be a reasonable facsimile of the actual data or the tests are invalid. And when you're database is big... this just isn't possible.  Wouldn't it be nice to be able to set a flag at the start of a proc... TESTING which would not commit any permanent changes to the DataBase. That way you would be able to test procs against actual data without commiting any changes.

Even if all this were possible, I'd still want to complete full manual testing before I'd be happy deploying a proc only for my own piece of mind. Test are only as good as they're written.
