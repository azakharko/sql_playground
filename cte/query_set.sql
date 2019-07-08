-- select * from categories;
-- select * from products;

--
--
--
WITH RECURSIVE sub_tree AS (
  SELECT id, name, 1 AS relative_depth
  FROM categories
  WHERE name = 'root'

  UNION ALL

  SELECT cat.id, cat.name, st.relative_depth + 1
  FROM categories cat, sub_tree st
  WHERE cat.parent_id = st.id
)
SELECT * FROM sub_tree;

--
--
--
WITH RECURSIVE categories_with_roots AS (
  SELECT id, parent_id, name, name as root_name
  FROM categories
  WHERE parent_id IS NULL

  UNION ALL

  SELECT cat.id, cat.parent_id, cat.name, cwr.root_name
  FROM categories cat, categories_with_roots cwr
  WHERE cat.parent_id = cwr.id
)
SELECT p.name AS product_name, cwr.name
FROM products p, categories_with_roots cwr
WHERE p.category_id = cwr.id;
