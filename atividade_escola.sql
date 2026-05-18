CREATE DATABASE db_escola;

USE db_escola;

CREATE TABLE estudantes (
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    turma VARCHAR(50),
    nota DECIMAL(4,2),
    PRIMARY KEY (id)
);

INSERT INTO estudantes (nome, idade, turma, nota)
VALUES
("Ana", 16, "Java84", 8.5),
("Igor Y.", 26, "Java84", 7.1),
("Fernando", 28, "Java84", 9.0),
("Kaua", 19, "Java84", 5.5),
("Mariana", 17, "Java84", 7.8),
("Pedro", 15, "Java84", 4.0),
("Julia", 16, "Java84", 8.9),
("Lucas", 17, "Java84", 6.8);

SELECT * FROM estudantes
WHERE nota > 7.0;

SELECT * FROM estudantes
WHERE nota < 7.0;

UPDATE estudantes
SET nota = 7.2
WHERE id = 4;

SELECT * FROM esrudantes;