# 1. Criar uma base de dados chamada exercicio08
CREATE DATABASE exercicio08;

# 2. Selecionar a base de dados criada anteriormente
USE exercicio08;

# 3. Criar uma tabela chamada produtos
CREATE TABLE produtos(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    marca VARCHAR(20),
    valor DOUBLE
); 

# 4. Criar uma procedure chamada cadastrar com dois parâmetros (nome, marca e valor)
DELIMITER //
	CREATE PROCEDURE cadastrar(parametro_nome VARCHAR(50), parametro_marca VARCHAR(20), parametro_valor DOUBLE)
    BEGIN
		INSERT INTO produtos(nome, marca, valor) VALUES (parametro_nome, parametro_valor, parametro_valor);
    END //
DELIMITER ;

# 5. Efetue o cadastramento de alguns produtos através da procedure criada
CALL cadastrar ('Celular', 'Xioami', 700);
CALL cadastrar ('Notebook', 'ASUS', 1000);
CALL cadastrar ('Televisão', 'LG', 1500);

SELECT * FROM produtos;

# 6. Crie uma view para selecionar o nome dos produtos e os valores
CREATE VIEW verProdutos AS
SELECT nome, valor FROM produtos;

# 7. Execute a view criada
SELECT * FROM verProdutos;

# 8. Criar uma procedure para remover produtos através do código
DELIMITER //
	CREATE PROCEDURE removerProdutos(parametro_nome VARCHAR(50))
    BEGIN
		DELETE FROM produtos WHERE nome = parametro_nome;
    END //
DELIMITER ;

# 9. Execute a procedure
CALL removerProdutos ('Celular');

SELECT * FROM produtos;

# 10. Excluir a base de dados
DROP DATABASE exercicio08;








