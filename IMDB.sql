//movies table for storing movie information

CREATE TABLE movies (
  id INT PRIMARY KEY,
  title VARCHAR(255) NOT NULL
);

//media table for storing multiple media types associated with a movie

CREATE TABLE media (
  id INT PRIMARY KEY,
  movie_id INT,
  type ENUM('video', 'image') NOT NULL,
  url VARCHAR(255) NOT NULL,
  FOREIGN KEY (movie_id) REFERENCES movies(id)
);

//genres table for storing genre information

CREATE TABLE genres (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

//movie_genre table for associating movies with multiple genres

CREATE TABLE movie_genre (
  movie_id INT,
  genre_id INT,
  PRIMARY KEY (movie_id, genre_id),
  FOREIGN KEY (movie_id) REFERENCES movies(id),
  FOREIGN KEY (genre_id) REFERENCES genres(id)
);

//users table for storing user information for reviews

CREATE TABLE users (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

//reviews table for storing reviews associated with a movie and a user

CREATE TABLE reviews (
  id INT PRIMARY KEY,
  movie_id INT NOT NULL,
  user_id INT NOT NULL,
  rating INT NOT NULL,
  comment TEXT,
  FOREIGN KEY (movie_id) REFERENCES movies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

//artists table for storing artist information

CREATE TABLE artists (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

//skills table for storing artist skills

CREATE TABLE skills (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

//artist_skill table for associating artists with multiple skills

CREATE TABLE artist_skill (
  artist_id INT,
  skill_id INT,
  PRIMARY KEY (artist_id, skill_id),
  FOREIGN KEY (artist_id) REFERENCES artists(id),
  FOREIGN KEY (skill_id) REFERENCES skills(id)
);

//roles table for storing artist roles in a movie

CREATE TABLE roles (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

//movie_artist_role table for associating movies with multiple artists and their roles in that movie.

CREATE TABLE movie_artist_role (
  movie_id INT,
  artist_id INT,
  role_id INT,
  PRIMARY KEY (movie_id, artist_id, role_id),
  FOREIGN KEY (movie_id) REFERENCES movies(id),
  FOREIGN KEY (artist_id) REFERENCES artists(id),
  FOREIGN KEY (role_id) REFERENCES roles(id)
);