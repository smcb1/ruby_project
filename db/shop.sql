DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS manufacturers;
DROP TABLE IF EXISTS categories;

CREATE TABLE categories
(
  id SERIAL8 primary key,
  category_type VARCHAR(255) not null
);

CREATE TABLE manufacturers
(
  id SERIAL8 primary key,
  contact_name VARCHAR(255) not null,
  contact_address VARCHAR(255) not null,
  contact_number VARCHAR(255) not null,
  list_cost FLOAT not null,
  url VARCHAR(255)
);

CREATE TABLE products
(
  id SERIAL8 primary key,
  category_id INT8 REFERENCES categories(id) ON DELETE CASCADE,
  manufacturer_id INT8 REFERENCES manufacturers(id) ON DELETE CASCADE,
  product_name VARCHAR(255) not null,
  description VARCHAR(255) not null,
  list_price FLOAT not null,
  quantity INT4 not null,
  url VARCHAR(255)
);
