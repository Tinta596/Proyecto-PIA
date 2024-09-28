CREATE DATABASE PROYECTO_PIA;

USE PROYECTO_PIA;

CREATE TABLE players (
    player_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    password VARCHAR(255) NOT NULL,
    health INT DEFAULT 100,
    score INT DEFAULT 0,
    level INT DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE dungeons (
    dungeon_id INT AUTO_INCREMENT PRIMARY KEY,
    dungeon_name VARCHAR(50),
    description TEXT,
    difficulty_level INT,
    max_enemies INT
);

CREATE TABLE enemies (
    enemy_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    health INT,
    attack_power INT,
    dungeon_id INT,
    FOREIGN KEY (dungeon_id) REFERENCES dungeons(dungeon_id)
);

CREATE TABLE items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    description TEXT,
    type VARCHAR(20), -- Por ejemplo: 'arma', 'pocion', 'escudo'
    effect INT, -- Valor del efecto (ej. cantidad de vida restaurada o daño)
    dungeon_id INT,
    FOREIGN KEY (dungeon_id) REFERENCES dungeons(dungeon_id)
);

CREATE TABLE player_items (
    player_item_id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT,
    item_id INT,
    quantity INT DEFAULT 1,
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);

CREATE TABLE player_progress (
    progress_id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT,
    dungeon_id INT,
    enemies_defeated INT,
    time_spent TIME,
    completed TINYINT DEFAULT 0, -- 1 si el jugador completó el nivel
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (dungeon_id) REFERENCES dungeons(dungeon_id)
);
