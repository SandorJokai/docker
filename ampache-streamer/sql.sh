CREATE DATABASE ampache;

CREATE USER 'ampache'@'localhost' IDENTIFIED BY 'ampache';

GRANT ALL PRIVILEGES ON ampache.* TO 'ampache'@'localhost';

FLUSH ALL PRIVILEGES;
