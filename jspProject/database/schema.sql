CREATE DATABASE IF NOT EXISTS jspProject 
DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE jspProject;

CREATE TABLE IF NOT EXISTS user (
    id VARCHAR(32) PRIMARY KEY,
    password VARCHAR(32),
    name VARCHAR(32),
    place VARCHAR(32),
    tema VARCHAR(32),
    birth VARCHAR(32),
    phone VARCHAR(32),
    image MEDIUMBLOB,
    date DATE
);

CREATE TABLE IF NOT EXISTS board (
    uid VARCHAR(32),
    title VARCHAR(1024),
    place VARCHAR(32),
    tema VARCHAR(32),
    content VARCHAR(1024),   
    image MEDIUMBLOB,
    date DATE
);

CREATE TABLE IF NOT EXISTS recom (
    uid VARCHAR(32),
    place VARCHAR(32),
    tema VARCHAR(32),
    season VARCHAR(48),
    title VARCHAR(1024),
    content VARCHAR(1024),   
    image MEDIUMBLOB,
    date DATE
);

