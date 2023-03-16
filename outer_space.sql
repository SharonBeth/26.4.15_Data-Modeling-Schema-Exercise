-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moon_name TEXT
);

CREATE TABLE galaxy
(
  id SERIAL PRIMARY KEY,
  galaxy_name TEXT
);

CREATE TABLE stationary_object
(
  id SERIAL PRIMARY KEY,
  stationary_object_name TEXT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxy
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxy NOT NULL
);

CREATE TABLE planet_moons
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets NOT NULL,
  moon_id INTEGER REFERENCES moons NOT NULL
);

CREATE TABLE orbits_around
(
  id SERIAL PRIMARY KEY,
  planet_id TEXT NOT NULL,
  stationary_object_id FLOAT NOT NULL
);

INSERT INTO moons
  (moon_name)
VALUES
  ('The Moon'),
  ('Phobos'),
  ('Deimos'), 
  ('Naiad'), 
  ('Thalassa'),
  ('Despina'), 
  ('Galatea'),
  ('Larissa'),
  ('S/2004 N 1'), 
  ('Proteus'),
  ('Triton'),
  ('Nereid'),
  ('Halimede'),
  ('Sao'),
  ('Laomedeia'),
  ('Psamathe'),
  ('Neso');

INSERT INTO galaxy
  (galaxy_name)
VALUES
  ('Milky Way')
;

INSERT INTO stationary_object
  (stationary_object_name, galaxy_id)
VALUES
  ('The Sun', 1),
  ('Proxima Centauri', 1),
  ('Gliese 876', 1)
;


INSERT INTO planets
  (name, orbital_period_in_years, galaxy_id)
VALUES
  ('Earth', 1.00, 1),
  ('Mars', 1.88, 1),
  ('Venus', 0.62, 1),
  ('Neptune', 164.8, 1),
  ('Proxima Centauri b', 0.03, 1),
  ('Gliese 876 b', 0.23, 1)
;

INSERT INTO planet_moons
  (planet_id, moon_id)
VALUES
  (1, 1),
  (2, 2),
  (2, 3),
  (4, 4),
  (4, 5),
  (4, 6),
  (5, 7),
  (5, 8),
  (5, 9),
  (5, 10),
  (5, 11),
  (5, 12),
  (5, 13),
  (5, 14),
  (5, 15),
  (5, 16),
  (5, 17)
;
INSERT INTO orbits_around
  (planet_id, stationary_object_id)
VALUES
  (1, 1), 
  (2, 1), 
  (3, 1),
  (4, 1),
  (5, 2),
  (6, 3)
;