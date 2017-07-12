CREATE TABLE guests (
id INTEGER PRIMARY KEY,
name TEXT,
group_name TEXT,
occupation TEXT)

CREATE TABLE shows (
id INTEGER PRIMARY KEY,
year INTEGER,
air_date DATETIME
);

CREATE TABLE show_guests (
id INTEGER PRIMARY KEY,
guests_id INTEGER,
shows_id INTEGER
);