CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(255) NOT NULL,
    descricao VARCHAR(500) NOT NULL
);

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    fabricante VARCHAR(255) NOT NULL,
    quantidade_estoque INT NOT NULL,
    valor DECIMAL(6,2) NOT NULL,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome_categoria, descricao) VALUES
('Medicamentos', 'Produtos para tratamento e prevenção'),
('Cosméticos', 'Produtos de beleza e cuidados pessoais'),
('Higiene', 'Produtos de higiene pessoal'),
('Vitaminas', 'Suplementos vitamínicos'),
('Infantil', 'Produtos voltados para crianças e bebês');

INSERT INTO tb_produtos
(nome, fabricante, quantidade_estoque, valor, categoria_id)
VALUES
('Creme Hidratante', 'Nivea', 30, 25.00, 2),
('Colágeno em Cápsulas', 'Neo Química', 20, 65.00, 4),
('Shampoo Infantil', 'Johnson', 15, 18.50, 5),
('Condicionador Repair', 'Elseve', 25, 32.90, 2),
('Vitamina C', 'Centrum', 40, 58.00, 4),
('Sabonete Facial', 'Dove', 50, 12.00, 3),
('Paracetamol', 'Medley', 100, 8.50, 1),
('Creme Dental', 'Colgate', 60, 9.90, 3);

SELECT * FROM tb_produtos WHERE valor > 50.00;
SELECT * FROM tb_produtos WHERE valor BETWEEN 5.00 AND 60.00;
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT
    tb_produtos.nome,
    tb_produtos.fabricante,
    tb_produtos.quantidade_estoque,
    tb_produtos.valor,
    tb_categorias.nome_categoria,
    tb_categorias.descricao
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

SELECT
    tb_produtos.nome,
    tb_produtos.valor,
    tb_categorias.nome_categoria
FROM tb_produtos
INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_categorias.nome_categoria = 'Cosméticos';