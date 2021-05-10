DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS oracle;
DROP TABLE IF EXISTS question;
DROP TABLE IF EXISTS wrong_question;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  num_questions_per_time INTEGER DEFAULT 30,
  next_question_id INTEGER DEFAULT 1
);

CREATE TABLE oracle (
	id	INTEGER PRIMARY KEY AUTOINCREMENT,
	img	TEXT NOT NULL UNIQUE,
	name TEXT NOT NULL
);

CREATE TABLE question (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    img	TEXT,
    a TEXT NOT NULL,
    b TEXT NOT NULL,
    c TEXT NOT NULL,
    d TEXT NOT NULL,
    FOREIGN KEY (img) REFERENCES oracle (img)
);

CREATE TABLE wrong_question (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    question_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES user (id),
    FOREIGN KEY (question_id) REFERENCES question (id)
);