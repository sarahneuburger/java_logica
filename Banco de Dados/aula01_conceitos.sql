# Criar uma base de dados
CREATE DATABASE projeto_bd;

# Selecionar a base
USE projeto_bd;

# Criar tabela, como se fosse uma planilha do excel e essas são as colunas
CREATE TABLE clientez(
	nome VARCHAR(20),
    idade INT
);

# Renomear a tabela
RENAME TABLE clientez to clientes;

# Verificar o que consta na tabela - Obter a estrutura da tabela
DESCRIBE clientes;

# Adicionar coluna - por padrão, fica como última coluna
ALTER TABLE clientes ADD COLUMN email VARCHAR(30);

# Remover coluna - DROP é para colunas - DDL
ALTER TABLE clientes DROP COLUMN email;
 
# Até remover coluna era DDL
# Abaixo é DML

# Inserir clientes
INSERT INTO clientes VALUES ('Beatriz', 22);

# Inserir mais de um por vez
INSERT INTO clientes VALUES
('Caio', 16),
('Ellen', 29),
('Lucas', 37);

# Cadastrar dados específicos da estrutura
INSERT INTO clientes (nome) VALUE ('Paulo');

# Selecionar todos os clientes - * significa tudo
SELECT * FROM clientes;

# Selecionar dados específicos
SELECT nome FROM clientes;

 # Selecionar todos os dados e realizar uma condicional - O "as" altera o nome da coluna
 SELECT *, IF(idade >=18, 'Maior de idade', 'Menor de idade') as 'Verificação'FROM clientes;
 
 # Informar a quantidade de clientes
 SELECT COUNT(*) FROM clientes;
 
 # Concatenar
 SELECT CONCAT('Foram encontrados ', COUNT(*), ' clientes.') FROM clientes;
 
 # Obter a maior idade
 SELECT MAX(idade) FROM clientes;
 
# Obter a menor idade
SELECT MIN(idade) FROM clientes;

# Obter a média das idades
SELECT AVG(idade) FROM clientes;

# Filtrar dados com o comando where - Exibe dados conforme o parâmetr
SELECT * FROM clientes where idade >= 18;

/* Operadores relacionais
>  Maior
<  Menor
>=  Maior ou igual
<=  Menor ou igual
=  Igual, apenas um 
<>  Diferente

Operadores lógicos
AND  e
OR  ou
NOT  não
*/

# Listar clientes entre 20 e 30 - maneira menos correta para comparar valores da mesma coluna
SELECT * FROM clientes WHERE idade >= 20 AND idade <= 30;
# Correto
SELECT * FROM clientes WHERE idade BETWEEN 20 AND 30;

# Colocar valores em ordem, trabalha com números e letras - ASC sinaliza que os valores são crescentes - DESC sinaliza que são decrescentes
SELECT * FROM clientes ORDER BY idade DESC;
SELECT * FROM clientes ORDER BY idade ASC;

# Selecionar clientes com idades nulas - Comando IS
SELECT * FROM clientes WHERE idade IS NULL;

# Comparar informações - % filtra nomes que contenham o desejado
SELECT * FROM clientes WHERE nome LIKE '%o'; # Termina em "o"
SELECT * FROM clientes WHERE nome LIKE 'b%'; # Inciam em "b"
SELECT * FROM clientes WHERE nome LIKE '%a%'; # Contêm em "a"

# Habilitar a alteração de dados
SET SQL_SAFE_UPDATES = 0;

# Alterar cliente
UPDATE clientes SET idade = 26 WHERE idade IS NULL;

# Remover clientes - delete para linhas, DML
DELETE FROM clientes WHERE idade < 18;

/* Comandos DML
	SELECT
    INSERT
    UPDATE
    DELETE
    -----------------
    CRUD (Sistema que utiliza as quatro funções DML)
*/

# Remover tabela
DROP TABLE clientes;

# Remover base de dados
DROP DATABASE projeto_bd;

