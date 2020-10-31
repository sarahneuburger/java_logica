# 1 - Criar uma base de dados
CREATE DATABASE exercicio04;

# 2 - Selecionar a base de dados criada anteriormente
USE exercicio04;

# 3 - Cria uma tabela
CREATE TABLE cursos(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    curso VARCHAR(30),
    valor DOUBLE,
    area VARCHAR(30),
    dificuldade INT
);

# 4 - Cadastrar os cursos:
INSERT INTO cursos VALUES 
	(1, 'PHP', 700, 'Back-End', 3),
    (2, 'Oracle', 2500, 'Banco de Dados', 1),
    (4, 'Java', 1700, 'Back-End', 3),
    (5, 'Spring MVC', 2500, 'Back-End', 2),
    (6, 'MySQL', 400, 'Banco de Dados', 1),
    (7, 'Excel Básico', 500, 'Utilidades', 1),
    (8, 'Excel Avançado', 400, 'Utilidades', 2),
    (9, 'Excel Dashboard', 600, 'Utilidades', 2),
    (10, 'C#', 1600, 'Back-End', 3),
    (11, 'Python', 780, 'Back-End', 3),
    (12, 'JavaScript', 500, 'Back-End', 2),
    (13, 'NodeJS', 900, 'Back-End', 3);

SELECT * FROM cursos;

# 5 - Exibir o nome dos cursos, valor e o nível de dificuldade. Os níveis de dificuldade deverão ser exibidos em formato de texto, sendo assim 1 significa iniciante, 2 intermediário e 3 avançado
# 6 - Para alterar o número para o texto utilize a função case
SELECT curso, valor, dificuldade,
CASE 
	WHEN dificuldade = 1 THEN 'Iniciante'
    WHEN dificuldade = 2 THEN 'Intermediário'
    ELSE 'Avançado'
END AS 'Nível de dificuldade'
FROM cursos;

# 7 - Exibir a quantidade de cursos através da área
SELECT area, COUNT(*) FROM cursos GROUP BY area;

# 8 - Listar nome e valor dos cursos, ordene do maior valor para o menor
SELECT curso, valor FROM cursos ORDER BY valor ASC;

# 9 - Exibir o nome dos cursos de maior valor
SELECT curso FROM cursos ORDER BY curso ASC;

# 10 - Quantidade de cursos cadastrados por dificuldade
SELECT COUNT(*),
CASE 
	WHEN dificuldade = 1 THEN 'Iniciante'
    WHEN dificuldade = 2 THEN 'Intermediário'
    ELSE 'Avançado'
END AS 'Nível de dificuldade'
FROM cursos GROUP BY dificuldade;

# 11 - Exibir todos os cursos de nível 2 ou 3 e que sejam da área de back-end e com valor mínimo de R$1.000,00 
# não deu certo
SELECT curso FROM cursos WHERE dificuldade 
= 
(SELECT 2 OR dificuldade = 3 FROM cursos)
AND 
(SELECT area = 'Back-End' AND valor >= 1000 FROM cursos);

# 12 - Remover todos os cursos onde a área seja utilidades
DELETE FROM cursos WHERE area = 'Utilidades';

# Habilitar a alteração de dados
SET SQL_SAFE_UPDATES = 0;

# 13 - Exibir os cinco cursos mais baratos
SELECT * FROM cursos WHERE valor ORDER BY valor ASC LIMIT 5;

# 14 - Exibir o nome e o valor de todos os cursos que não sejam da área de back-end
SELECT curso, valor FROM cursos WHERE area <> 'Back-End';

# 15 - Exibir a quantidade de cursos registrados, exiba a data e hora da pesquisa realizada. Para exibir a data e hora utilize a função NOW()
SELECT COUNT(*), NOW() AS 'Data' FROM cursos;

# 16 - Exibir todos os dados do curso, onde o nome dele contenha a letra y
SELECT * FROM cursos WHERE curso LIKE '%y%';

# 17 - Excluir a tabela cursos
DROP TABLE cursos;

# 18 - Excluir a base de dados
DROP DATABASE exercicio04;
