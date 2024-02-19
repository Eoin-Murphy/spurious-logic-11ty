---
title: "ka-Pow!!!"
date: "2011-01-31"
tags: 
  - "dev"
---

Take that! unnecessary table variable! Removed by the power of common table expressions!

I have a table in the form:

<table border="1" cellpadding="3"><tbody><tr><td>ID</td><td>Seller</td><td>Description</td></tr><tr><td>1</td><td>Alice</td><td>widget1</td></tr><tr><td>2</td><td>Alice</td><td>widget2</td></tr><tr><td>3</td><td>Bob</td><td>widget1</td></tr><tr><td>4</td><td>Bob</td><td>widget3</td></tr><tr><td>5</td><td>Bob</td><td>widget4</td></tr></tbody></table>

But what I really need is a table with an extra column with a sales id for each seller, like this;

<table border="1" cellpadding="3"><tbody><tr><td>ID</td><td>Seller</td><td>Sales Id</td><td>Description</td></tr><tr><td>1</td><td>Alice</td><td>1</td><td>widget1</td></tr><tr><td>2</td><td>Alice</td><td>2</td><td>widget2</td></tr><tr><td>3</td><td>Bob</td><td>1</td><td>widget1</td></tr><tr><td>4</td><td>Bob</td><td>2</td><td>widget3</td></tr><tr><td>5</td><td>Bob</td><td>3</td><td>widget4</td></tr></tbody></table>

In a past life I would have written the alter script to add in the column, with an empty field (null or -1); created a temporary table to iterate over every 'Alice' sale and set those values, followed by those for 'Bob'. And this is what you get when you're thinking procedurally. Using Common Table Expressions and a Partition makes this far more efficient (at the cost of more complicated code).

WITH cte (ID, seller, sales\_id)
AS
   (
      SELECT
         ID,
         seller,
         ROW\_NUMBER() OVER (PARTITION BY ID ORDER BY ID)
      FROM sales WITH (NOLOCK)
   )
UPDATE S
SET S.sales\_id = C.Pattern\_ID
FROM sales S
INNER JOIN cte C
   ON S.ID = C.ID
AND S.seller = C.seller

And hey! a legitimate reason to actually use a <table> on a webpage without designers shaking their goate-ed heads at my foolishness.
