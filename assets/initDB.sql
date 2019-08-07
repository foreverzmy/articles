CREATE TABLE subscribe_feed (
  id INT NOT NULL PRIMARY KEY,
  name TEXT,
  title TEXT,
  link TEXT,
  updated TEXT,
  published TEXT,
  author TEXT,
  language TEXT,
  image TEXT,
  copyright TEXT,
  description TEXT,
  note TEXT
);

CREATE TABLE TAG (
  id INT NOT NULL PRIMARY KEY,
  name TEXT,
  created TEXT
);