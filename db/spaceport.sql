DROP TABLE ships;
DROP TABLE owners;

CREATE TABLE owners
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  wanted_level VARCHAR(255)
);

CREATE TABLE ships
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  type VARCHAR(255),
  size INT8,
  owner_id INT8 references owners(id) ON DELETE CASCADE
);
