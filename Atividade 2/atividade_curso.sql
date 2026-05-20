CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT,
    nome_categoria VARCHAR(255) NOT NULL,
    nivel VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tb_cursos (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    carga_horaria INT NOT NULL,
    instrutor VARCHAR(255) NOT NULL,
    valor DECIMAL(7,2) NOT NULL,
    categoria_id BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias
(nome_categoria, nivel)
VALUES
('Java', 'Intermediário'),
('Front-end', 'Iniciante'),
('Banco de Dados', 'Intermediário'),
('Python', 'Avançado'),
('DevOps', 'Avançado');

INSERT INTO tb_cursos
(nome, carga_horaria, instrutor, valor, categoria_id)
VALUES
('Java Completo', 120, 'Carlos Silva', 899.90, 1),
('Java para Iniciantes', 80, 'Fernanda Souza', 650.00, 1),
('HTML e CSS Moderno', 60, 'Mariana Lima', 450.00, 2),
('JavaScript Avançado', 100, 'João Pereira', 750.00, 2),
('MySQL do Zero', 70, 'Ricardo Alves', 520.00, 3),
('Python para Data Science', 140, 'Juliana Costa', 1200.00, 4),
('Docker e Kubernetes', 90, 'Felipe Rocha', 980.00, 5),
('Jenkins na Prática', 75, 'Patrícia Gomes', 680.00, 5);

SELECT * FROM tb_cursos WHERE valor > 500.00;
SELECT * FROM tb_cursos WHERE valor BETWEEN 600.00 AND 1000.00;
SELECT * FROM tb_cursos WHERE nome LIKE '%J%';

SELECT
    tb_cursos.nome,
    tb_cursos.carga_horaria,
    tb_cursos.instrutor,
    tb_cursos.valor,
    tb_categorias.nome_categoria,
    tb_categorias.nivel
FROM tb_cursos
INNER JOIN tb_categorias
ON tb_cursos.categoria_id = tb_categorias.id;

SELECT
    tb_cursos.nome,
    tb_cursos.valor,
    tb_categorias.nome_categoria
FROM tb_cursos
INNER JOIN tb_categorias
ON tb_cursos.categoria_id = tb_categorias.id
WHERE tb_categorias.nome_categoria = 'Java';