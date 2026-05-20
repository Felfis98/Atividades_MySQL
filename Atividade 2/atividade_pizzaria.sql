CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL,
    tamanho VARCHAR(100) NOT NULL
);

CREATE TABLE tb_pizzas (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    ingredientes VARCHAR(500) NOT NULL,
    borda_recheada BOOLEAN NOT NULL,
    valor DECIMAL(6,2) NOT NULL,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (tipo, tamanho) VALUES
('Salgada', 'Pequena'),
('Salgada', 'Média'),
('Salgada', 'Grande'),
('Doce', 'Média'),
('Vegetariana', 'Grande');

INSERT INTO tb_pizzas
(nome, ingredientes, borda_recheada, valor, categoria_id)
VALUES
('Mussarela', 'Queijo mussarela e molho de tomate', true, 42.00, 2),
('Calabresa', 'Calabresa, cebola e queijo', false, 48.00, 3),
('Marguerita', 'Tomate, manjericão e queijo', true, 55.00, 5),
('Frango com Catupiry', 'Frango desfiado e catupiry', true, 60.00, 3),
('Chocolate', 'Chocolate ao leite e morango', false, 52.00, 4),
('Moda da Casa', 'Presunto, queijo, bacon e milho', true, 75.00, 3),
('Milho com Bacon', 'Milho verde, bacon e queijo', false, 46.00, 2),
('Banana com Canela', 'Banana, açúcar e canela', false, 50.00, 4);

SELECT * FROM tb_pizzas WHERE valor > 45.00;
SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;
SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

SELECT
    tb_pizzas.nome,
    tb_pizzas.ingredientes,
    tb_pizzas.valor,
    tb_categorias.tipo,
    tb_categorias.tamanho
FROM tb_pizzas
INNER JOIN tb_categorias
ON tb_pizzas.categoria_id = tb_categorias.id;

SELECT
    tb_pizzas.nome,
    tb_pizzas.valor,
    tb_categorias.tipo
FROM tb_pizzas
INNER JOIN tb_categorias
ON tb_pizzas.categoria_id = tb_categorias.id
WHERE tb_categorias.tipo = 'Doce';