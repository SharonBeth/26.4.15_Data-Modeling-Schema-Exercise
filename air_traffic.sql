-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE country
(
  id SERIAL PRIMARY KEY,
  country TEXT UNIQUE NOT NULL
);

CREATE TABLE city
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  country_id INTEGER REFERENCES country NOT NULL
);

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE flight_info
(
  id SERIAL PRIMARY KEY,
  departure_time TIMESTAMP NOT NULL,
  arrival_time TIMESTAMP NOT NULL,
  departure_location_id INTEGER REFERENCES city NOT NULL,
  arrival_location_id INTEGER REFERENCES city NOT NULL,
  airline_id INTEGER REFERENCES airlines NOT NULL
);

CREATE TABLE flight_passengers
(
  id SERIAL PRIMARY KEY,
  pass_id INTEGER REFERENCES passengers NOT NULL,
  flight_id INTEGER REFERENCES flight_info NOT NULL,
  seat TEXT NOT NULL
);

INSERT INTO airlines
  (airline)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO country
  (country)
VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('Mexico'),
  ('France'),
  ('Morocco'),
  ('UAE'),
  ('China'),
  ('Brazil'),
  ('Chile');

INSERT INTO city
  (city, country_id)
VALUES
  ('Washington DC', 1),
  ('Seattle', 1),
  ('Tokyo', 2),
  ('London', 3),
  ('Los Angeles', 1),
  ('Las Vegas', 1),
  ('Mexico City', 4),
  ('Paris', 5),
  ('Casablanca', 6),
  ('Dubai', 7),
  ('Beijing', 8),
  ('New York', 1),
  ('Charlotte', 1),
  ('Cedar Rapids', 1),
  ('Chicago', 1),
  ('New Orleans', 1),
  ('Sao Paolo', 9),
  ('Santiago', 10);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Jennifer', 'Finch'),
  ('Waneta', 'Skeleton'),
  ('Thadeus', 'Gathercoal'),
  ('Berkie', 'Wycliff'),
  ('Alin', 'Leathes'),
  ('Berkie', 'Wycliff'),
  ('Cory', 'Squibbes');

INSERT INTO flight_info
  (departure_time, arrival_time, departure_location_id, arrival_location_id, airline_id)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 2, 1 ),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 3, 4, 2),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 5, 6, 3),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 2, 7, 3),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 8, 9, 4),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 10, 11, 5),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 12, 13, 1),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 14, 15, 6),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 13, 16, 6),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 17, 18, 7);

INSERT INTO flight_passengers
  (pass_id, flight_id, seat)
VALUES
  (1, 1, '33B'),
  (2, 2, '8A'),
  (3, 3, '12F'),
  (4, 4, '20A'),
  (5, 5, '23D'),
  (6, 6, '18C'),
  (7, 7, '9E'),
  (8, 8, '1A'),
  (9, 9, '32B'),
  (10, 10, '10D');
-- 
-- 
-- Original section, delete at the end--
-- 
-- CREATE TABLE tickets
-- (
  -- id SERIAL PRIMARY KEY,
  -- first_name TEXT NOT NULL,
  -- last_name TEXT NOT NULL,
  -- seat TEXT NOT NULL,
  -- departure TIMESTAMP NOT NULL,
  -- arrival TIMESTAMP NOT NULL,
  -- airline TEXT NOT NULL,
  -- from_city TEXT NOT NULL,
  -- from_country TEXT NOT NULL,
  -- to_city TEXT NOT NULL,
  -- to_country TEXT NOT NULL
-- );
-- 
-- INSERT INTO tickets
  -- (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
  -- ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
  -- ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
  -- ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
  -- ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
  -- ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
  -- ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
  -- ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
  -- ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  -- ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
  -- ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');