# 1 - Criando a base
CREATE DATABASE exercicio02;

# 2 - Selecionando a base
USE exercicio02;

# 3 - Criando a tabela produtos
CREATE TABLE produtos(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    produto VARCHAR(40),
    categoria VARCHAR(20),
    valor DOUBLE,
    cadastro DATE
);

# Selecionando os dados
SELECT * FROM produtos;

# 4 - Cadastrando os produtos
INSERT INTO produtos (produto, categoria, valor, cadastro) VALUES 
	('Smartphone Samsung A8', 'telefonia', 1400.00, '2019-07-22'),
    ('Notebook Acer A650', 'informática', 3800.00, '2019-03-19'),
    ('Telefone sem fio Intelbras', 'telefonia', 129.90, '2018-12-20'),
    ('iPhone XR', 'telefonia', 5499.00, '2019-07-08'),
    ('Notebook Dell Espiron 500', 'informática', 3975.80, '2019-01-29'),
    ('All in one LG A8574', 'informática', 2547.12, '2019-02-13'),
    ('Smartphone Motorola G7', 'telefonia', 799.00, '2019-04-03'),
    ('Smartphone Galaxy S10', 'telefonia', 4600.00, '2019-05-03'),
    ('Notebook Acer Axpros 47', 'informática', 2857.00, '2019-08-16'),
    ('Smartphone Asus Zenfone 6', 'telefonia', 2356.00, '2018-07-29'), 
    ('Smartphone Samsung J4', NULL, 1700.00, '2018-06-16');

# 5 - Exibir a quantidade de produtos cadastrados
SELECT COUNT(*) FROM produtos;

# 6 - Exibir nome e valor do produto, conforme data de cadastro
SELECT produto, valor FROM produtos WHERE cadastro BETWEEN '2019-04-01' AND '2019-07-31'; 

# 7 - Alterar categoria do produto "null"
UPDATE produtos SET categoria = 'telefonia' WHERE categoria IS NULL;

# 8 - Exibir os nomes das categorias cadastradas e a quantidade de produtos
SELECT categoria, COUNT(*) FROM produtos GROUP BY categoria;

# 9 - Exibindo a média dos valores, por categoria
SELECT categoria, AVG(valor) AS 'Média' FROM produtos GROUP BY categoria;

# 10 - Exibir nome e valor do produto mais barato
SELECT produto, valor FROM produtos WHERE valor
=
(SELECT MIN(valor) FROM produtos);

# 11 - Exibindo produtos da categoria telefonia com valor igual ou superior à 4000
SELECT produto FROM produtos WHERE categoria = 'telefonia' AND valor >= 4000; # Mostra só os nomes dos produtos
SELECT * FROM produtos WHERE categoria = 'telefonia' AND valor >= 4000; # Mostra todos os dados dos produtos

# 12 - Listando produtos cadastros em 2018
SELECT produto FROM produtos WHERE cadastro LIKE '%2018%'; # Mostra só os nomes dos produtos
SELECT * FROM produtos WHERE cadastro LIKE '%2018%'; # Mostra todos os dados os produtos

# 13 - Deletando produtos Samsung ou LG
DELETE FROM produtos WHERE produto LIKE '%Samsung%' OR produto LIKE '%LG%'; # Repete o "produto LIKE" após o OR para fazer o comparativo

# Selecionando os dados
SELECT * FROM produtos;

# 14 - Exibindo código dos produtos que contenha o termo intelbras
SELECT codigo FROM produtos WHERE produto LIKE '%Intelbras%';

# 15 - Deletando a base de dados
DROP DATABASE exercicio02;











