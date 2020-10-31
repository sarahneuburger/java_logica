#Criando base
CREATE DATABASE exercicio09;

# Habilitando a base
USE exercicio09;

# Criar quatro tabelas
# iFood - restaurante (nome, local), categoria (pizzaria, hamburgueria, lanches, mexicano), proprietário (nome), faixa de preço
CREATE TABLE categorias(
	idCategoria INT AUTO_INCREMENT PRIMARY KEY,
    nomeCategoria VARCHAR(20)
);

CREATE TABLE proprietarios(
	idProprietario INT AUTO_INCREMENT PRIMARY KEY,
    nomeProprietario VARCHAR(30),
    foneProprietário VARCHAR(20)
);

CREATE TABLE faixasPrecos(
	idFaixa INT AUTO_INCREMENT PRIMARY KEY,
    faixaPreco VARCHAR(20)
);

CREATE TABLE restaurantes(
	idRestaurante INT AUTO_INCREMENT PRIMARY KEY,
    nomeRestaurante VARCHAR(20),
    localRestaurante VARCHAR(30),
    idCategoria INT,
    idProprietario INT,
    idFaixa INT,
    FOREIGN KEY(idCategoria) REFERENCES categorias(idCategoria),
    FOREIGN KEY(idProprietario) REFERENCES proprietarios(idProprietario),
    FOREIGN KEY(idFaixa) REFERENCES faixasPrecos(idFaixa)
); 

SELECT * FROM restaurantes;

# Inserindo alguns valores

INSERT INTO categorias VALUES
(null, 'Pizzaria'),
(null, 'Lanches'),
(null, 'Hamburgueria'),
(null, 'Mexicano');

INSERT INTO categorias VALUES (null, 'Italiana');

SELECT * FROM categorias;

INSERT INTO proprietarios VALUES
(null, 'Amanda', '98722299'),
(null, 'Sarah', '33489203'),
(null, 'Joao', '999234509'),
(null, 'Marcos', '33456578'),
(null, 'Maria', '98465789');

SELECT * FROM proprietarios;

INSERT INTO faixasPrecos VALUES
(null, '$'),
(null, '$$'),
(null, '$$$');

SELECT * FROM faixasPrecos;

INSERT INTO restaurantes VALUES
(null, 'Los Tacos', 'Blumenau', 4, 2, 2),
(null, 'Burguer da Hora','Indaial', 3, 1, 1),
(null, 'Hora do Lanche', 'Blumenau', 2, 3, 2),
(null, 'Império da Pizza', 'Gaspar', 1, 5, 3),
(null, 'Disk Pizza', 'Blumenau', 1, 4, 3),
(null, 'Cocina Mexicana', 'Indaial', 4, 2, 2);

SELECT * FROM restaurantes;

# Criar procedures (insert, update, delete, select)
# Procedure - Insert
DELIMITER //
	CREATE PROCEDURE insereRestaurante(parametro_nome VARCHAR(20), parametro_local VARCHAR(30), parametro_categoria INT, parametro_proprietario INT, parametro_faixa INT)
		BEGIN
			INSERT INTO restaurantes(nomeRestaurante, localRestaurante, idCategoria, idProprietario, idFaixa) VALUES (parametro_nome, parametro_local, parametro_categoria, parametro_proprietario, parametro_faixa);
        END //
DELIMITER ;

CALL insereRestaurante('Burritos Master', 'Blumenau', 4, 3, 3);
SELECT * FROM restaurantes;

# Procedure - Update
DELIMITER //
	CREATE PROCEDURE atualizaLocal(parametro_local VARCHAR(30), parametro_id INT)
		BEGIN
			UPDATE restaurantes SET localRestaurante = parametro_local WHERE idRestaurante = parametro_id;
        END //
DELIMITER ;

CALL atualizaLocal('Gaspar', 6);

SELECT * FROM restaurantes;

# Procedure - Delete
DELIMITER //
	CREATE PROCEDURE deletaRestaurante(parametro_id INT)
		BEGIN
			DELETE FROM restaurantes WHERE idRestaurante = parametro_id;
        END //
DELIMITER ;

CALL deletaRestaurante(4);

SELECT * FROM restaurantes;

# Procedure - Select
DELIMITER //
	CREATE PROCEDURE buscaRestaurante(parametro_id INT)
		BEGIN
			SELECT * FROM restaurantes WHERE idRestaurante = parametro_id;
        END //
DELIMITER ;

CALL buscaRestaurante(1);

# Criar views
CREATE VIEW visualizaLocal AS
SELECT nomeRestaurante, localRestaurante FROM restaurantes;

SELECT * FROM visualizaLocal;

CREATE VIEW visualizaFaixa AS
SELECT nomeRestaurante, idFaixa FROM restaurantes;

SELECT * FROM visualizaFaixa;

# Criar inner join
# Visualizar tabela completa dos restaurantes
SELECT
	restaurantes.idRestaurante AS 'Nº Estabelecimento',
	restaurantes.nomeRestaurante AS 'Nome Estabelecimento',
    restaurantes.localRestaurante AS 'Local',
    proprietarios.nomeProprietario AS 'Nome Proprietário',
    proprietarios.foneProprietário AS 'Contato',
    categorias.nomeCategoria AS 'Categoria',
    faixasPrecos.faixaPreco AS 'Faixa de Preço'
FROM restaurantes
INNER JOIN proprietarios
ON restaurantes.idProprietario = proprietarios.idProprietario
INNER JOIN categorias
ON restaurantes.idCategoria = categorias.idCategoria
INNER JOIN faixasPrecos
ON restaurantes.idFaixa = faixasPrecos.idFaixa;

# Visualizar resumo dos restaurantes
SELECT
	restaurantes.nomeRestaurante AS 'Nome Estabelecimento',
    restaurantes.localRestaurante AS 'Local',
    proprietarios.nomeProprietario AS 'Nome Proprietário',
    categorias.nomeCategoria AS 'Categoria',
    faixasPrecos.faixaPreco AS 'Faixa de Preço'
FROM restaurantes
INNER JOIN proprietarios
ON restaurantes.idProprietario = proprietarios.idProprietario
INNER JOIN categorias
ON restaurantes.idCategoria = categorias.idCategoria
INNER JOIN faixasPrecos
ON restaurantes.idFaixa = faixasPrecos.idFaixa;

# Criar left join
SELECT 
	categorias.nomeCategoria,
    COUNT(restaurantes.idRestaurante)
FROM categorias
LEFT JOIN restaurantes
ON categorias.idCategoria = restaurantes.idCategoria
GROUP BY categorias.nomeCategoria;

SET SQL_SAFE_UPDATES = 0;

