DROP TABLE owners;
DROP TABLE ships;

CREATE TABLE ships
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  type VARCHAR(255),
  size INT8
  
);

CREATE TABLE owners
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  wanted_level VARCHAR(255),
  ship_id INT8 references ships(id) ON DELETE CASCADE
);
