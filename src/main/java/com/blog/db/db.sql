CREATE TABLE blog.essay
(
    essayId VARCHAR(45) PRIMARY KEY,
    title   VARCHAR(45) NOT NULL,
    content LONGTEXT NOT NULL,
    time    DATETIME,
    author  VARCHAR(45),
    picture VARCHAR(45)
);

CREATE TABLE blog.user
(
    username VARCHAR(45) PRIMARY KEY,
    password VARCHAR(45),
    type     VARCHAR(45)
);

CREATE TABLE blog.userstar
(
    rId      VARCHAR(45) PRIMARY KEY,
    username VARCHAR(45) NOT NULL,
    essayId  VARCHAR(45) NOT NULL,
    FOREIGN KEY (username) REFERENCES blog.user (username),
    FOREIGN KEY (essayId) REFERENCES blog.essay (essayId)
);

INSERT INTO blog.user (username, password, type)
VALUES ('admin', '123456', 'admin');