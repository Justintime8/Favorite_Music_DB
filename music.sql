CREATE DATABASE music
GO

USE music
GO

CREATE TABLE artist (
  artist_id int NOT NULL PRIMARY KEY,
  name varchar(255) DEFAULT NULL
);


INSERT INTO artist (artist_id, name) VALUES
(1, 'Jimmy Eat World'),
(2, 'NSYNC'),
(3, 'Daft Punk'),
(4, 'Neo');


CREATE TABLE album (
  album_id int NOT NULL PRIMARY KEY,
  title varchar(255) DEFAULT NULL,
  artist_id int DEFAULT Null REFERENCES artist (artist_id) ON DELETE CASCADE ON UPDATE CASCADE,
);


INSERT album (album_id, title, artist_id) VALUES
(1, 'American Anthem', 1),
(2, 'Celebrity', 2),
(3, 'One More Time', 3),
(4, 'Year of the Gentleman', 4);


CREATE TABLE genre (
  genre_id int NOT NULL PRIMARY KEY,
  name varchar(255) DEFAULT NULL
);


INSERT INTO genre (genre_id, name) VALUES
(1, 'Alternative Rock'),
(2, 'Old Pop'),
(3, 'Techno'),
(4, 'New Pop');


CREATE TABLE track (
  track_id int NOT NULL PRIMARY KEY,
  title varchar(255) DEFAULT NULL,
  len int DEFAULT NULL,
  rating int DEFAULT NULL,
  count int DEFAULT NULL,
  album_id int DEFAULT NULL REFERENCES album (album_id) ON DELETE CASCADE ON UPDATE CASCADE,
  genre_id int DEFAULT NULL REFERENCES genre (genre_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO track (track_id, title, len, rating, count, album_id, genre_id) VALUES
(1, 'American Bleed', 400, 1, 10, 1, 1),
(2, 'Angel', 350, 2, 20, 1, 1),
(3, 'Authority Song', 370, 3, 30, 1, 1),
(4, 'Clover', 400, 4, 40, 1, 1),
(5, 'The Middle', 350, 5, 50, 1, 1),
(6, 'Dirty Pop', 350, 1, 10, 2, 2),
(7, 'Celebrity', 400, 2, 20, 2, 2),
(8, 'Gone', 500, 3, 30, 2, 2),
(9, 'Bye Bye Bye', 370, 4, 40, 2, 2),
(10, 'Its Gonna Be Me', 380, 5, 50, 2, 2),
(11, 'True Love', 400, 1, 10, 3, 3),
(12, 'Superheroes', 410, 2, 20, 3, 3),
(13, 'Digital Love', 390, 3, 30, 3, 3),
(14, 'Harder Worker Faster Stronger', 350, 4, 40, 3, 3),
(15, 'One more Time', 390, 5, 40, 3, 3),
(16, 'So Sick of Love Songs', 300, 1, 10, 4, 4),
(17, 'Camera Phone', 400, 2, 20, 4, 4),
(18, 'Miss Independent', 400, 3, 30, 4, 4),
(19, 'One in A Million', 350, 4, 40, 4, 4),
(20, 'Be on You', 390, 5, 50, 4, 4);


CREATE INDEX IX_title ON album (title);
CREATE INDEX IX_artist_id ON album (artist_id);
CREATE INDEX IX_title ON track (title);
CREATE INDEX IX_album_id ON track (album_id);
CREATE INDEX IX_genre_id ON genre (genre_id);

