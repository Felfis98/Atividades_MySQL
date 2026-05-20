CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE produtos (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(100),
    preco DECIMAL(10,2),
    estoque INT,
    marca VARCHAR(100),
    PRIMARY KEY (id)
);

INSERT INTO produtos (nome, categoria, preco, estoque, marca)
VALUES
("Notebook Dell", "Notebook", 4500.00, 10, "Dell"),
("Mouse Gamer", "Periféricos", 250.00, 50, "Logitech"),
("Teclado Mecânico", "Periféricos", 600.00, 20, "Redragon"),
("Monitor 24", "Monitor", 900.00, 15, "LG"),
("Fone Bluetooth", "Áudio", 300.00, 40, "JBL"),
("Smartphone Samsung", "Celular", 2500.00, 12, "Samsung"),
("Cadeira Gamer", "Móveis", 1200.00, 8, "DXRacer"),
("Webcam HD", "Acessórios", 150.00, 25, "Logitech");

SELECT * FROM produtos
WHERE preco > 500
ORDER BY nome ASC;

SELECT * FROM produtos
WHERE preco < 500
ORDER BY nome ASC;

UPDATE produtos
SET preco = 280.00
WHERE id = 2;

SELECT * FROM produtos
ORDER BY nome ASC;