# 1 - Criando base de dados
CREATE DATABASE exercicio03;

# 2 - Selecionando a base de dados
USE exercicio03;

# 3 - Criando a tabela
CREATE TABLE alunos(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    genero VARCHAR(20),
    nota1 DOUBLE,
    nota2 DOUBLE,
    nota3 DOUBLE
);

# Selecionando os dados
SELECT * FROM alunos;

# 4 - Cadastrando os alunos
INSERT INTO alunos (nome, genero, nota1, nota2, nota3) VALUES 
	('Alana', 'Feminino', 7, 8, 9.5),
    ('Brenda', 'Feminino', 8.8, 7.3, 7.7),
    ('Gustavo', 'Masculino', 9, 9.1, 8.6), 
    ('Júlio', 'Masculino', 4.5, 3.9, 4),
    ('Jéssica', 'Feminino', 7, 6.8, 7),
    ('Lúcia', 'Feminino', 10, 9.8, 10), 
    ('Rony', 'Masculino', 5.6, 6.3, 5.9),
    ('Tamara', 'Feminino', 7, 8, 7.5),
    ('Lucas', 'Masculino', 7, 7.1, 7.7),
	('Lorena', 'Feminino', 4, 4.5, 4.4);

# 5 - Exibir a quantidade de homens e mulheres
SELECT genero, COUNT(*) FROM alunos GROUP BY genero;

# 6 - Exibir o nome e média de cada aluno - Quando a média é de várias colunas, a conta é feita normalmente, sem o AVG
SELECT nome, (nota1 + nota2 + nota3) / 3 AS 'Média' FROM alunos GROUP BY codigo;

# 7 - Quantos tiveram notas iguais ou superiores a 7
SELECT COUNT(*) FROM alunos WHERE (nota1 + nota2 + nota3) / 3 >=7;

# 8 - Nome, notas e média do aluno com maior média - Tem que calcular manualmente os valores da média a cada vez, não ficam armazenados
SELECT nome, nota1, nota2, nota3, (nota1 + nota2 + nota3) / 3 FROM alunos WHERE (nota1 + nota2 + nota3) / 3
= 
(SELECT MAX((nota1 + nota2 + nota3) / 3) FROM alunos);

# 9 - Nome, notas e média aluno com menor média
SELECT nome, nota1, nota2, nota3, (nota1 + nota2 + nota3) / 3 AS "Média" FROM alunos WHERE (nota1 + nota2 + nota3) / 3
= 
(SELECT MIN((nota1 + nota2 + nota3) / 3) FROM alunos);

# 10 - Exibir nomes e suas situações
 SELECT nome, IF(((nota1 + nota2 + nota3) / 3) >= 7, 'Aprovado', 'Reprovado') as 'Situação' FROM alunos;
 
 # 12 - Alterar o nome da aluna Jessica para Joice (pula do item 10 para o 12)
 UPDATE alunos SET nome = 'Joice' WHERE nome = 'Jéssica';

# Selecionando os dados
SELECT * FROM alunos;

# 13 - Exibir a quantidade de alunos acima da média e do gênero masculino
SELECT COUNT(*) FROM alunos WHERE ((nota1 + nota2 + nota3) / 3) >= 7 AND genero = 'Masculino';

# 14 - Exibir a quantidade de alunos que tenham a média entre 8 e 9 do gênero feminino
SELECT COUNT(*) FROM alunos WHERE ((nota1 + nota2 + nota3) / 3) BETWEEN 8 AND 9 AND genero = 'Feminino';

# 15 - Exibir a média da turma
SELECT CONCAT('A média da sala é ', AVG(nota1 + nota2 + nota3) / 3, '.') AS "Média" FROM alunos;

# 16 - Exibir o nome dos alunos e suas médias, onde suas respectivas médias sejam maiores ou iguais a média da turma
SELECT nome, (nota1 + nota2 + nota3) / 3 AS 'Média' FROM alunos WHERE ((nota1 + nota2 + nota3) / 3) 
>= 
(SELECT AVG(nota1 + nota2 + nota3) / 3 FROM alunos);

# 17 - Listar o nome dos alunos, onde as três notas obtidos sejam 7 ou superior
SELECT nome FROM alunos WHERE nota1 >= 7 AND nota2 >= 7 AND nota3 >= 7;

# 18 - Excluir a base de dados
DROP DATABASE exercicio03;

