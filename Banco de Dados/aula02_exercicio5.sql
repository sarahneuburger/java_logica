# 1. Criar uma base de dados chamada exercicio05
CREATE DATABASE exercicio05;

# 2. Selecionar a base de dados criada anteriormente
USE exercicio05;

# 3. Criar uma tabela chamada marcas
CREATE TABLE marcas(
	idMarca INT AUTO_INCREMENT PRIMARY KEY,
    nomeMarca VARCHAR(30)
);

# 4. Criar uma tabela chamada produtos
CREATE TABLE produtos(
	codigo INT AUTO_INCREMENT PRIMARY KEY, #deveria ter criado como idProduto, cuidar
    nomeProduto VARCHAR(30),
	valorProduto DOUBLE,
    idMarca INT,
    FOREIGN KEY(idMarca) REFERENCES marcas(idMarca) 
);

# 5. Cadastre as marcas
INSERT INTO marcas(nomeMarca) VALUES
('Apple'),
('LG'),
('Motorola'),
('Samsung'),
('Sony');

SELECT * FROM marcas;

# 6. Cadastrar os produtos
INSERT INTO produtos VALUES
(null, 'Galaxy S20', 5000, 4),
(null, 'iPhone 11', 4300, 1),
(null, 'iPhone Pro Max', 8000, 1),
(null, 'K12', 1700, 2),
(null, 'G8', 1400, 3),
(null, 'A31', 2200, 4),
(null, 'A51', 3100, 4),
(null, 'iPhone Xr', 4000, 1),
(null, 'iPhone 12', 7000, 1);

SELECT * FROM produtos;

# 7. Exiba o nome do produto, valor e nome da marca.
SELECT
	produtos.nomeProduto,
    produtos.valorProduto,
    marcas.nomeMarca
FROM produtos #tabela central
INNER JOIN marcas #tabela referenciada
ON produtos.idMarca = marcas.idMarca;
    
# 8. Exiba o nome de todas as marcas e a quantidade de produtos cadastrados na tabela produtos
SELECT
	marcas.nomeMarca,
    COUNT(produtos.codigo)
FROM marcas
INNER JOIN produtos
ON produtos.idMarca = marcas.idMarca
GROUP BY marcas.nomeMarca;

# 9. Exiba o nome do produto, valor e nome da marca de maior valor
SELECT
	produtos.nomeProduto,
    produtos.valorProduto,
    marcas.nomeMarca    
FROM marcas
INNER JOIN produtos
ON produtos.idMarca = marcas.idMarca
WHERE produtos.valorProduto = (SELECT MAX(produtos.valorProduto) FROM produtos);

# 10. Excluir a base de dados
DROP DATABASE exercicio05;





