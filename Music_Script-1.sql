CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Executor (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre_Executor (
	executorid INTEGER REFERENCES Executor,
	genreId INTEGER REFERENCES Genre,
	constraint pk_ArtistsGenres PRIMARY KEY (Executorid, Genreid)
);

CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) UNIQUE NOT NULL,
	year DATE
);

CREATE TABLE IF NOT EXISTS Album_Executor (
	executorid INTEGER REFERENCES Executor,
	albumId INTEGER REFERENCES Album,
	constraint pk_AlbumsArtists PRIMARY KEY (executorid, albumid)
);

CREATE TABLE IF NOT EXISTS Track (
	id SERIAL PRIMARY KEY,
	albumid INTEGER REFERENCES Album,
	name VARCHAR(80) NOT NULL,
	duration INTEGER NOT NULL CHECK (duration > 0),
	constraint pk_Track UNIQUE (name, albumid)
);

CREATE TABLE IF NOT EXISTS Collection (	
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	year DATE
);

CREATE TABLE IF NOT EXISTS Collections_Track (
	collectionid INTEGER REFERENCES Collection,
	trackid INTEGER REFERENCES Track,
	constraint pk_Collections_Track PRIMARY KEY (collectionid, trackid)
);
