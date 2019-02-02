DROP TABLE  IF EXISTS products;
DROP TABLE IF EXISTS manufacturers;

CREATE TABLE manufacturers
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  product_type VARCHAR(255) not null,
  contact VARCHAR(255) not null,
  cost FLOAT not null
);

CREATE TABLE products
(
  id SERIAL8 primary key,
  manufacturer_id INT8 REFERENCES manufacturers(id) ON DELETE CASCADE,
  name VARCHAR(255) not null,
  product_type VARCHAR(255) not null,
  description TEXT not null,
  price FLOAT not null,
  quantity INT4 not null
);
