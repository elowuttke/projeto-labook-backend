-- Active: 1682704897613@@127.0.0.1@3306

CREATE TABLE
    users (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        role TEXT NOT NULL,
        created_at TEXT DEFAULT(DATETIME('now', 'localtime')) NOT NULL
    );

INSERT INTO
    users (id, name, email, password, role)
VALUES
    -- tipo ADMIN e senha = eloisa123  
    (
        "u001",
        "Eloísa",
        "eloisa@labenu.com.br",
        "$2a$12$Xc99sXwpeEnn1q8sg6IHfOtGhCs8kAp8Nk.qjzQGaM41oZaUy6jYC",
        "ADMIN"
    ),
    -- tipo NORMAL e senha = elisio123  
    (
        "u002",
        "Elisio",
        "elisio@labenu.com.br",
        "$2a$12$1UD0970W4RK9.33hjsflj.KjTL4OjIacgHcjFSwl0OPzur8e2vzgK",
        "NORMAL"
    ),
    -- tipo NORMAL e senha = elton123  
    (
        "u003",
        "Elton",
        "elton@labenu.com.br",
        "$2a$12$Ih1IsQHuZcM3OPf/T3jDFOz339mnED9aPasLDYML5sEQ3GqSjlSiW",
        "NORMAL"
    ),
    -- tipo NORMAL e senha = elisete123  
    (
        "u004",
        "Elisete",
        "elisete@labenu.com.br",
        "$2a$12$.UxR.NnIw5BsRnFHWawGquy.ZazOdwJcajjALbo9kvrC6PXZfXO1i",
        "NORMAL"
    ),
    -- tipo NORMAL e senha = ester123  
    (
        "u005",
        "Ester",
        "ester@labenu.com.br",
        "$2a$12$dEY2NoCuBu.OMU0ZK9E/0eCx7I76trfNFMe0O8CUGqQGD927HzLxi",
        "NORMAL"
    ),
    -- tipo ADMIN e senha = eduardo123  
    (
        "u006",
        "Eduardo",
        "eduardo@labenu.com.br",
        "$2a$12$zIprjpPu8R83k3mkjTNFJe3pBY532SHqPSr65U3AzyT859zDqwyey",
        "ADMIN"
    );

SELECT * FROM users;


CREATE TABLE
    posts (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        creator_id TEXT NOT NULL,
        content TEXT NOT NULL,
        likes INTEGER DEFAULT(0) NOT NULL,
        dislikes INTEGER DEFAULT(0) NOT NULL,
        created_at TEXT DEFAULT(DATETIME('now', 'localtime')) NOT NULL,
        updated_at TEXT DEFAULT(DATETIME('now', 'localtime')) NOT NULL,
        FOREIGN KEY (creator_id) REFERENCES users (id) 
            ON UPDATE CASCADE 
            ON DELETE CASCADE
    );

INSERT INTO
    posts (id, creator_id, content)
VALUES (
        "p0001",
        "u001",
        "O ERRADO É ERRADO, mesmo que todo mundo esteja fazendo. O CERTO É CERTO, mesmo que ninguém esteja fazendo."
    ), (
        "p0002",
        "u002",
        "O que somos é presente de Deus; no que nos transformamos é o nosso presente a Ele."
    ), (
        "p0003",
        "u002",
        "Fizeste-nos para Ti, Senhor. E o nosso coração está inquieto enquanto não repousar em Ti."
    ), (
        "p0004",
        "u003",
        "Comece onde você está. Use o que você tem. Faça o que você pode."
    ), (
        "p0005",
        "u004",
        "Inspira, Respira e Não Pira."
    ), (
        "p0006",
        "u005",
        "Sorte é o encontro da preparação com a oportunidade."
    ), (
        "p0007",
        "u006",
        "Tenha orgulho de quem você é!"
    );

SELECT * FROM posts;


CREATE TABLE
    likes_dislikes (
        user_id TEXT NOT NULL,
        post_id TEXT NOT NULL,
        like INTEGER NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users (id) 
            ON UPDATE CASCADE 
            ON DELETE CASCADE,
        FOREIGN KEY (post_id) REFERENCES posts (id) 
            ON UPDATE CASCADE 
            ON DELETE CASCADE
    );

INSERT INTO
    likes_dislikes (user_id, post_id, like)
VALUES ("u001", "p0003", 1), ("u001", "p0005", 1), ("u002", "p0006", 1), ("u003", "p0002", 1), ("u004", "p0001", 0), ("u004", "p0005", 1), ("u005", "p0004", 0), ("u005", "p0003", 0);

SELECT * FROM likes_dislikes;

UPDATE posts
SET dislikes = 1
WHERE id = "p0001";

UPDATE posts
SET likes = 1
WHERE id = "p0002";

UPDATE posts
SET likes = 1, dislikes = 1
WHERE id = "p0003";

UPDATE posts
SET dislikes = 1
WHERE id = "p0004";

UPDATE posts
SET likes = 2
WHERE id = "p0005";

UPDATE posts
SET likes = 1
WHERE id = "p0006";

SELECT * FROM posts;






DROP TABLE likes_dislikes;

DROP TABLE posts;

DROP TABLE users;