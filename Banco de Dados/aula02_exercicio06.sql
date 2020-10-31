# 1. Criar uma base de dados chamada exercicio06
CREATE DATABASE exercicio06;

# 2. Selecionar a base de dados criada anteriormente
USE exercicio06;

# 3. Criar uma tabela chamada fabricantes
CREATE TABLE fabricantes(
	idFabricante INT AUTO_INCREMENT PRIMARY KEY,
    nomeFabricante VARCHAR(30)
);

# 4. Criar uma tabela chamada categorias
CREATE TABLE categorias(
	idCategoria INT AUTO_INCREMENT PRIMARY KEY,
    nomeCategoria VARCHAR(30)
);

# 5. Criar uma tabela chamada produtos
CREATE TABLE produtos(
	idProduto INT AUTO_INCREMENT PRIMARY KEY,
    nomeProduto VARCHAR(30),
    valorProduto DOUBLE,
    idFabricante INT,
    idCategoria INT,
    FOREIGN KEY(idFabricante) REFERENCES fabricantes(idFabricante),
    FOREIGN KEY(idCategoria) REFERENCES categorias(idCategoria)
);

SELECT * FROM produtos;

# 6. Cadastre as fabricantes
INSERT INTO fabricantes(nomeFabricante) VALUES
('Apple'),
('Brastemp'),
('Consul'),
('Dell'),
('General Electric'),
('Microsoft'),
('Philips'),
('Samsung'),
('Sony');

SELECT * FROM fabricantes;

# 7. Cadastre as categorias
INSERT INTO categorias(nomeCategoria) VALUES
('Áudio e Vídeo'),
('Ar e Ventilação'),
('Eletrodomésticos'),
('Informática'),
('Telefonia');

SELECT * FROM categorias;

# 8. Cadastrar os produtos
INSERT INTO produtos VALUES
(null, 'Ar Condicionado', 1400, 2, 2),
(null, 'Televisão Led 32', 2100, 7, 1),
(null, 'Fone de ouvido', 160, 7, 1),
(null, 'Aparelho de som', 950, 9, 1),
(null, 'Telefone fixo', 140, 7, 5),
(null, 'Fritadeira', 400, 5, 3),
(null, 'Televisão Full HD', 4290, 8, 1),
(null, 'Notebook A98', 3900, 4, 4),
(null, 'Surface Pro', 5300, 6, 4), 
(null, 'iMac 27', 12000, 1, 4);

SELECT * FROM produtos;

# 9. Exiba o nome do produto, valor, nome do fabricante e nome da categoria
SELECT
	produtos.nomeProduto AS 'Produto',
    produtos.valorProduto AS 'Valor',
    fabricantes.nomeFabricante AS 'Fabricante',
    categorias.nomeCategoria AS 'Categoria'
FROM produtos #tabela central
INNER JOIN fabricantes #tabela referenciada
ON produtos.idFabricante = fabricantes.idFabricante
INNER JOIN categorias #tabela referenciada
ON produtos.idCategoria = categorias.idCategoria;

# 10. Exiba todos os nomes das categorias e a quantidade de produtos cadastrados daquela categoria
SELECT
	categorias.nomeCategoria,
    COUNT(produtos.idProduto)
FROM categorias
INNER JOIN produtos
ON produtos.idCategoria = categorias.idCategoria
GROUP BY categorias.nomeCategoria;

# 11. Exiba todos os nomes dos fabricantes e a quantidade de produtos cadastrados daquele fabricante
SELECT
	fabricantes.nomeFabricante AS 'Fabricante',
    COUNT(produtos.idProduto) AS 'Quantidade'
FROM fabricantes #tabela central
INNER JOIN produtos #tabela referenciada
ON produtos.idFabricante = fabricantes.idFabricante
GROUP BY fabricantes.nomeFabricante;

# 12. Exiba o nome das categorias e a média vendida dos produtos
SELECT
	categorias.nomeCategoria,
    AVG(produtos.valorProduto)
FROM produtos
INNER JOIN categorias
ON produtos.idCategoria = categorias.idCategoria
GROUP BY categorias.nomeCategoria;

# 13. Exibir a média dos valores da tabela produtos
SELECT AVG(produtos.valorProduto) AS 'Média' FROM produtos;

# 14. Exiba o nome do produto, valor, nome da categoria e nome do fabricante dos produtos com valor maior ou igual a 
# média dos valores de todos os produtos cadastrados
SELECT
	produtos.nomeProduto,
    produtos.valorProduto,
    categorias.nomeCategoria,
    fabricantes.nomeFabricante
FROM produtos
INNER JOIN categorias
ON produtos.idCategoria = categorias.idCategoria
INNER JOIN fabricantes
ON produtos.idFabricante = fabricantes.idFabricante
WHERE produtos.valorProduto >= (SELECT AVG(produtos.valorProduto) from produtos); #tem que fazer novo select para realizar a comparação

# 15. Excluir a base de dados
DROP DATABASE exercicio06;



