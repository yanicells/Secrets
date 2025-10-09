CREATE TABLE users(
id SERIAL PRIMARY KEY,
email VARCHAR(100) NOT NULL UNIQUE,
password VARCHAR(100),
);

CREATE TABLE secrets(
id SERIAL PRIMARY KEY,
secret TEXT NOT NULL,
user_email VARCHAR(100) REFERENCES users(email)
);

INSERT INTO secrets (secret, user_email) VALUES ('I love programming.', 'yanicapistrano@gmail.com');
INSERT INTO secrets (secret, user_email) VALUES ('I have a pet cat.', 'yanicapistrano@gmail.com');
INSERT INTO secrets (secret, user_email) VALUES ('I enjoy hiking on weekends.', 'yanicapistrano@gmail.com');
INSERT INTO secrets (secret, user_email) VALUES ('I can play the guitar.', 'akosiyanigwapo123@gmail.com');
INSERT INTO secrets (secret, user_email) VALUES ('I am learning to cook new recipes.', 'akosiyanigwapo123@gmail.com');
INSERT INTO secrets (secret, user_email) VALUES ('I have a secret talent for painting.', 'akosiyanigwapo123@gmail.com');