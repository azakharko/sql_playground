-- schema.sql for postgresql 9.6
CREATE TABLE categories (
  id        serial primary key,
  name      character varying NOT NULL,
  parent_id bigint
);
CREATE INDEX ON categories(parent_id);

INSERT INTO categories (name, parent_id)
  VALUES ('root', null);
INSERT INTO categories (name, parent_id)
  VALUES ('books', (SELECT id from categories WHERE name='root'));
INSERT INTO categories (name, parent_id)
  VALUES ('smartphones', (SELECT id from categories WHERE name='root'));
INSERT INTO categories (name, parent_id)
  VALUES ('laptops', (SELECT id from categories WHERE name='root'));
INSERT INTO categories (name, parent_id)
  VALUES ('tablets', (SELECT id from categories WHERE name='root'));
INSERT INTO categories (name, parent_id)
  VALUES ('apple smartphones', (SELECT id from categories WHERE name='smartphones'));
INSERT INTO categories (name, parent_id)
  VALUES ('samsung smartphones', (SELECT id from categories WHERE name='smartphones'));
INSERT INTO categories (name, parent_id)
  VALUES ('other smartphones', (SELECT id from categories WHERE name='smartphones'));
INSERT INTO categories (name, parent_id)
  VALUES ('huawei smartphones', (SELECT id from categories WHERE name='smartphones'));
INSERT INTO categories (name, parent_id)
  VALUES ('dell laptops', (SELECT id from categories WHERE name='laptops'));

CREATE TABLE products (
  id          serial primary key,
  name        character varying NOT NULL,
  category_id bigint NOT NULL
);
CREATE INDEX ON products(category_id);

INSERT INTO products (name, category_id)
  VALUES ('iPhone 6S', (SELECT id from categories WHERE name='apple smartphones'));
INSERT INTO products (name, category_id)
  VALUES ('iPhone 6S Plus', (SELECT id from categories WHERE name='apple smartphones'));
INSERT INTO products (name, category_id)
  VALUES ('iPhone 7', (SELECT id from categories WHERE name='apple smartphones'));
INSERT INTO products (name, category_id)
  VALUES ('iPhone 7 Plus', (SELECT id from categories WHERE name='apple smartphones'));
INSERT INTO products (name, category_id)
  VALUES ('iPhone 8', (SELECT id from categories WHERE name='apple smartphones'));
INSERT INTO products (name, category_id)
  VALUES ('iPhone 8 Plus', (SELECT id from categories WHERE name='apple smartphones'));
INSERT INTO products (name, category_id)
  VALUES ('iPhone X', (SELECT id from categories WHERE name='apple smartphones'));
INSERT INTO products (name, category_id)
  VALUES ('Galaxy 10e', (SELECT id from categories WHERE name='samsung smartphones'));
INSERT INTO products (name, category_id)
  VALUES ('Galaxy 9s', (SELECT id from categories WHERE name='samsung smartphones'));
INSERT INTO products (name, category_id)
  VALUES ('Galaxy Note9', (SELECT id from categories WHERE name='samsung smartphones'));
INSERT INTO products (name, category_id)
  VALUES ('Galaxy A80', (SELECT id from categories WHERE name='samsung smartphones'));
INSERT INTO products (name, category_id)
  VALUES ('Pixel 2', (SELECT id from categories WHERE name='other smartphones'));
INSERT INTO products (name, category_id)
  VALUES ('Pixel 3', (SELECT id from categories WHERE name='other smartphones'));
INSERT INTO products (name, category_id)
  VALUES ('Pixel 3a', (SELECT id from categories WHERE name='other smartphones'));
INSERT INTO products (name, category_id)
  VALUES ('Neil Gayman - Small Gods', (SELECT id from categories WHERE name='books'));
INSERT INTO products (name, category_id)
  VALUES ('Terry Prachett - Morth', (SELECT id from categories WHERE name='books'));
INSERT INTO products (name, category_id)
  VALUES ('Terry Pratchett - Thief of Time', (SELECT id from categories WHERE name='books'));



ALTER TABLE ONLY categories
    ADD CONSTRAINT category_parent_fk
    FOREIGN KEY (parent_id)
    REFERENCES categories(id);

ALTER TABLE ONLY products
    ADD CONSTRAINT product_category_fk
    FOREIGN KEY (category_id)
    REFERENCES categories(id);
