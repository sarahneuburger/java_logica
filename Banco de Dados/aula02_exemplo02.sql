CREATE DATABASE bd_final;

USE bd_final;

CREATE TABLE clientes(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30),
    email VARCHAR(40),
    idade INT
);

INSERT INTO clientes  VALUES (null, 'Ana', 'ana.silva@gmail.com', 22);

SELECT * FROM clientes;

# Wiew - funciona somente com select
# criar um select grande e guarda no wiew para ser executado posteriormente 
# deixa o código mais suscinto
CREATE VIEW visao AS
SELECT nome, idade FROM clientes;

SELECT * FROM visao;

# Procedure - função - delimitar início e fim do código da procedure
# chamar futuramente na linguagem de programação
# // delimita o último end do código, visto que podemos ter vários
# a intenção é não chamar delet, insert, update - faz tudo através de procedure
DELIMITER && 
	CREATE PROCEDURE cadastrar(parametro_nome VARCHAR(30), parametro_email VARCHAR(40), parametro_idade INT)
    BEGIN
		INSERT INTO clientes (nome, email, idade) VALUES (parametro_nome, parametro_email, parametro_idade);
    END &&
DELIMITER ;

CALL cadastrar('Anderson', 'anderson.souza@gmail.com', 34);
# Call - chama a procedure 







