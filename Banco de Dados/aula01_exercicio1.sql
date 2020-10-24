# 1- Criando a base de dados
CREATE DATABASE exercicio01;

# 2 - Selecionando a base
USE exercicio01;

# 3 - Criando tabela
CREATE TABLE uzuarios(
	nome VARCHAR(20),
    sobrenome VARCHAR(40),
    idade INT
);

# 4 - Renomeando a tabela
RENAME TABLE uzuarios to usuarios;

# 5 - Adicionar coluna do email
ALTER TABLE usuarios ADD COLUMN email VARCHAR(40);

# Selecionando tudo
SELECT * FROM usuarios;

# 6 - Deletando a coluna de sobrenome
ALTER TABLE usuarios DROP COLUMN sobrenome;

# 7 - Cadastrando dados
INSERT INTO usuarios VALUES
	('Vanessa', 16, 'vanessa.rosa@gmail.com'),
    ('Adailton', 22, 'adailton.mas@yahoo.com'),
    ('Andressa', 36, 'andressa.simas@uol.com.br'),
    ('Mayra', 24, 'mayra_antunes@gmail.com'),
    ('Cristiane', 14, 'cris.maya@gmail.com'),
    ('Carina', 27, 'carina.almeida@gmail.com'),
    ('Clóvis', 29, 'clovis.simao@hotmail.com'),
    ('Gabriela', 23, 'gabriela.bragantino@live.com'),
    ('Cibele', null, 'cibele_lins@uol.com.br');
 
# 8 - Contando os registros
SELECT COUNT(*) FROM usuarios;

# 9 - Contando usuários com até 17 anos
SELECT COUNT(*) FROM usuarios WHERE idade <= 17;

# 10 - Quantidade de usuários com email gmail
SELECT COUNT(*) FROM usuarios WHERE email LIKE '%gmail%';

# 11 - Retornar nome e idade da pessoa mais velha
SELECT nome, idade FROM usuarios WHERE idade
=
(SELECT MAX(idade) FROM usuarios); 

# 12 - Usuários com idade igual a nulo
SELECT * FROM usuarios WHERE idade IS NULL;

# 13 - Alterar as idades nulas para 27
UPDATE usuarios SET idade = 27 WHERE idade IS NULL;

# Selecionando tudo
SELECT * FROM usuarios;

# 14 - Deletar usuários menores de 18 anos
DELETE FROM usuarios WHERE idade < 18;

# 15 - Excluir dados e reinciar contabilização
TRUNCATE TABLE usuarios;

# 16 - Excluindo a base de dados
DROP DATABASE exercicio01;


