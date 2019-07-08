The most challenging aspect of writing this was working with a hierarchical, self-referential table.
Each row of reporting data in the view belonged to a node in this hierarchy, and the view itself needed to
include data from the associated root node.

To make this a little more concrete, imagine you had an arbitrarily deep nested category tree with
products in each category. How would you write a SQL query over all products where each row included the product’s
name and its top-level category name? I’ll refer to this simplified example for the rest of the post.

https://haughtcodeworks.com/blog/software-development/recursive-sql-queries-using-ctes/
