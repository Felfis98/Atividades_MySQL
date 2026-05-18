CREATE DATABASE db_rh;

USE db_rh;

CREATE TABLE colaboradores (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100),
    idade INT,
    salario DECIMAL(10,2),
    setor VARCHAR(100),
    PRIMARY KEY (id)
);

INSERT INTO colaboradores (nome, cargo, idade, salario, setor)
VALUES
("Ana Souza", "Analista RH", 28, 3500.00, "RH"),
("Igor Yama", "Desenvolvedor Java", 25, 5500.00, "Tecnologia"),
("Fernando Garcia", "Front-End", 22, 1800.00, "Administrativo"),
("Kaua Alves", "Banco de Dados", 30, 1900.00, "TI"),
("Mariana Costa", "Gerente Financeiro", 40, 8000.00, "Financeiro");

SELECT * FROM colaboradores
WHERE salario > 2000
ORDER BY nome ASC;

SELECT * FROM colaboradores
WHERE salario < 2000
ORDER BY nome ASC;

UPDATE colaboradores
SET salario = 2500.00
WHERE id = 4;

SELECT * FROM colaboradores
ORDER BY nome ASC;