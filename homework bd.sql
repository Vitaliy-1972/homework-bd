CREATE TABLE genres (
genre_id SERIAL PRIMARY KEY,
genre_name VARCHAR(100) NOT NULL
);

CREATE TABLE singers (
singer_id SERIAL PRIMARY KEY,
singer_name VARCHAR(100) NOT NULL
);

CREATE TABLE genres_singers (
genres_singers_id SERIAL PRIMARY KEY,
genre_id INT NOT NULL,
singer_id INT NOT NULL,
CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genres(genre_id) ON DELETE CASCADE,
CONSTRAINT fk_singer FOREIGN KEY(singer_id) REFERENCES singers(singer_id) ON DELETE CASCADE
);

CREATE TABLE albums (
album_id SERIAL PRIMARY KEY,
album_name VARCHAR(100) NOT NULL,
album_date date NOT NULL
);

CREATE TABLE singers_albums (
singers_albums_id SERIAL PRIMARY KEY,
singer_id INT NOT NULL,
album_id INT NOT NULL,
CONSTRAINT fk_singer FOREIGN KEY(singer_id) REFERENCES singers(singer_id) ON DELETE CASCADE,
CONSTRAINT fk_album FOREIGN KEY(album_id) REFERENCES albums(album_id) ON DELETE CASCADE
);


CREATE TABLE tracks (
track_id SERIAL PRIMARY KEY,
album_id INTEGER NOT NULL REFERENCES albums(album_id),
track_name VARCHAR(100) NOT NULL,
duration TIME  NOT NULL
);

CREATE TABLE collections (
collection_id SERIAL PRIMARY KEY,
collection_name VARCHAR(100) NOT NULL,
collection_release date NOT NULL
);

CREATE TABLE collections_tracks (
collections_tracks_id SERIAL PRIMARY KEY,
collection_id INT NOT NULL,
track_id INT NOT NULL,
CONSTRAINT fk_collection FOREIGN KEY(collection_id) REFERENCES collections(collection_id) ON DELETE CASCADE,
CONSTRAINT fk_track FOREIGN KEY(track_id) REFERENCES tracks(track_id) ON DELETE CASCADE
);

