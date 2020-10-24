# Criar base de dados
CREATE DATABASE base;

# Selecionar base de dados
USE base;

# Criar tabela - Primary Key - garente que não teremos códigos iguais - auto increment - para seguir a sequência dos valores
CREATE TABLE clientes (
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL, # not null, garente que não pode ficar vazio
	cidade VARCHAR(30)
);

# Adicionar nova coluna - data de inclusão
ALTER TABLE clientes ADD COLUMN cadastro DATETIME;

# Cadastrar cliente
INSERT INTO clientes VALUES (NULL, 'Beatriz', 'Blumenau', NOW());
INSERT INTO clientes (nome, cidade, cadastro) VALUES
('Roberto', 'Blumenau', '2020-08-31 12:08:56'),
('Daniela', 'Gaspar', '2020-12-30 16:36:09');

# Selecionar clientes
SELECT * FROM clientes;

# Contar e agrupar dados
SELECT cidade, COUNT(*) FROM clientes GROUP BY cidade;

# Formatar datas - Comandos com % para apresentar as datas
SELECT nome, 
	DATE_FORMAT(cadastro, '%d/%m/%Y') AS 'Data',
    DATE_FORMAT(cadastro, '%H:%i') AS 'Hora'    
FROM clientes;

# Remover o cliente de código 2
DELETE FROM clientes where codigo = 2;

# Selecionar clientes
SELECT * FROM clientes;

# Cadastrar novo cliente - Segue a sequência dos códigos, não sobrepões o que foi excluído, a não ser que force isso
INSERT INTO clientes VALUES (NULL, 'Mayra', 'Blumenau', NOW());

# Remover todos os registros e reinciar a contagem
TRUNCATE TABLE clientes;

# Cadastrar novo cliente - Agora será com o códido 1, visto que reinciamos
INSERT INTO clientes VALUES (NULL, 'Mayra', 'Blumenau', NOW());

# Remover a base de dados
DROP DATABASE base;