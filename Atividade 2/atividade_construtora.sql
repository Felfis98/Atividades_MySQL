CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(255) NOT NULL,
    setor VARCHAR(255) NOT NULL
);

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    marca VARCHAR(255) NOT NULL,
    quantidade_estoque INT NOT NULL,
    valor DECIMAL(7,2) NOT NULL,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias
(nome_categoria, setor)
VALUES
('Hidráulica', 'Tubulações e conexões'),
('Elétrica', 'Fiação e iluminação'),
('Ferramentas', 'Equipamentos de trabalho'),
('Pintura', 'Tintas e acessórios'),
('Construção', 'Materiais estruturais');


INSERT INTO tb_produtos
(nome, marca, quantidade_estoque, valor, categoria_id)
VALUES
('Cimento CP II', 'Votoran', 100, 42.00, 5),
('Caixa d’água 1000L', 'Fortlev', 15, 520.00, 1),
('Chave de Fenda', 'Tramontina', 50, 35.00, 3),
('Cano PVC 50mm', 'Tigre', 80, 78.00, 1),
('Furadeira Elétrica', 'Bosch', 20, 349.90, 3),
('Tinta Acrílica Branca', 'Suvinil', 30, 120.00, 4),
('Cabo Flexível 10mm', 'Sil', 60, 145.00, 2),
('Carrinho de Mão', 'Tramontina', 12, 139.90, 5);

SELECT * FROM tb_produtos WHERE valor > 100.00;
SELECT * FROM tb_produtos WHERE valor BETWEEN 70.00 AND 150.00;
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT
    tb_produtos.nome,
    tb_produtos.marca,
    tb_produtos.quantidade_estoque,
    tb_produtos.valor,
    tb_categorias.nome_categoria,
    tb_categorias.setor
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
WHERE tb_categorias.nome_categoria = 'Hidráulica';