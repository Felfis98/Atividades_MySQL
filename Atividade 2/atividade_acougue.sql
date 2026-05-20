CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo_carne VARCHAR(255) NOT NULL,
    origem VARCHAR(255) NOT NULL
);

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    peso_kg DECIMAL(5,2) NOT NULL,
    validade DATE NOT NULL,
    valor DECIMAL(6,2) NOT NULL,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias
(tipo_carne, origem)
VALUES
('Bovina', 'Nacional'),
('Suína', 'Nacional'),
('Aves', 'Granja'),
('Peixes', 'Importado'),
('Embutidos', 'Industrializado');

INSERT INTO tb_produtos
(nome, peso_kg, validade, valor, categoria_id)
VALUES
('Contra Filé', 1.50, '2026-06-10', 89.90, 1),
('Costela Suína', 2.00, '2026-06-15', 65.00, 2),
('Coxa de Frango', 1.20, '2026-06-08', 28.90, 3),
('Camarão Cinza', 1.00, '2026-06-05', 120.00, 4),
('Calabresa Defumada', 0.80, '2026-07-01', 35.50, 5),
('Cupim Bovino', 2.50, '2026-06-20', 75.00, 1),
('Coração de Frango', 1.00, '2026-06-12', 22.00, 3),
('Costela Bovina', 3.00, '2026-06-18', 95.00, 1);

SELECT * FROM tb_produtos WHERE valor > 50.00;
SELECT * FROM tb_produtos WHERE valor BETWEEN 50.00 AND 150.00;
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT
    tb_produtos.nome,
    tb_produtos.peso_kg,
    tb_produtos.validade,
    tb_produtos.valor,
    tb_categorias.tipo_carne,
    tb_categorias.origem
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

SELECT
    tb_produtos.nome,
    tb_produtos.valor,
    tb_categorias.tipo_carne
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_categorias.tipo_carne = 'Aves';