CREATE DATABASE db_game;

USE db_game;

CREATE TABLE tb_classes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_classe VARCHAR(255) NOT NULL,
    especialidade VARCHAR(255) NOT NULL
);

CREATE TABLE tb_personagens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    nivel INT NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    classe_id BIGINT,
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

INSERT INTO tb_classes (nome_classe, especialidade) VALUES
('Atirador', 'Ataque à distância'),
('Guerreiro', 'Combate corpo a corpo'),
('Mago', 'Magias elementais'),
('Assassino', 'Ataques furtivos'),
('Paladino', 'Defesa e suporte');

INSERT INTO tb_personagens 
(nome, nivel, poder_ataque, poder_defesa, classe_id) 
VALUES
('Fiora', 35, 2500, 1800, 2),
('Draven', 28, 1900, 1200, 1),
('Camille', 40, 2800, 1900, 2),
('Veigar', 22, 2300, 1000, 3),
('Zed', 30, 2800, 1500, 4),
('Soraka', 33, 1700, 1050, 5),
('Ryze', 27, 2100, 1300, 3),
('Tristana', 18, 1400, 900, 1);

SELECT * FROM tb_personagens WHERE poder_ataque > 2000;
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;
SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

SELECT 
    tb_personagens.nome,
    tb_personagens.nivel,
    tb_personagens.poder_ataque,
    tb_personagens.poder_defesa,
    tb_classes.nome_classe,
    tb_classes.especialidade
FROM tb_personagens
INNER JOIN tb_classes
ON tb_personagens.classe_id = tb_classes.id;

SELECT 
    tb_personagens.nome,
    tb_personagens.nivel,
    tb_personagens.poder_ataque,
    tb_personagens.poder_defesa,
    tb_classes.nome_classe
FROM tb_personagens
INNER JOIN tb_classes
ON tb_personagens.classe_id = tb_classes.id
WHERE tb_classes.nome_classe = 'Atirador';