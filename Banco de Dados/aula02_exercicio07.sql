# 1. Criar uma base de dados chamada exercicio07
CREATE DATABASE exercicio07;

# 2. Selecionar a base de dados criada anteriormente
USE exercicio07;

# 3. Criar uma tabela chamada professores
CREATE TABLE professores(
	idProfessor INT AUTO_INCREMENT PRIMARY KEY,
    nomeProfessor VARCHAR(20),
    especializacao VARCHAR(50)
);

# 4. Criar uma tabela chamada alunos
CREATE TABLE alunos(
	idAluno INT AUTO_INCREMENT PRIMARY KEY,
    nomeAluno VARCHAR(30)
);

SELECT * FROM professores;
SELECT * FROM alunos;

# 5. Criar uma tabela chamada turmas
CREATE TABLE turmas(
	idTurma INT AUTO_INCREMENT PRIMARY KEY,
    diaTurma VARCHAR(10),
    turnoTurma VARCHAR(10),
    idProfessor INT,
    idAluno INT,
    FOREIGN KEY(idProfessor) REFERENCES professores(idProfessor),
    FOREIGN KEY(idAluno) REFERENCES alunos(idAluno)
);

# 6. Cadastre os professores
INSERT INTO professores VALUES
(null, 'Alessandra', 'Engenharia de Software'),
(null, 'Carlos', 'Administração'),
(null, 'Jéssica', 'Engenharia Mecânica'),
(null, 'Paulo', 'Direito'),
(null, 'Larissa', 'Direito'),
(null, 'Paula', 'Contabilidade');

SELECT * FROM professores;

# 7. Cadastre os alunos
INSERT INTO alunos VALUES
(null, 'Ana'),
(null, 'Bruna'), 
(null, 'Camila'),
(null, 'Daniel'),
(null, 'Elton'),
(null, 'Felipe'),
(null, 'Gabriela'),
(null, 'Henrique'),
(null, 'Ionara'),
(null, 'Jaqueline');

SELECT * FROM alunos;

# 8. Cadastrar as turmas
INSERT INTO turmas VALUES
(null, 'Segunda', 'matutino', 1, 3),
(null, 'Sexta', 'matutino', 4, 4),
(null, 'Terça', 'matutino', 1, 4),
(null, 'Segunda', 'vespertino', 5, 8),
(null, 'Sexta', 'noturno', 2, 2),
(null, 'Quarta', 'matutino', 1, 3),
(null, 'Quarta', 'noturno', 2, 7),
(null, 'Segunda', 'noturno', 3, 7), 
(null, 'Sábado', 'matutino', 6, 3);

SELECT * FROM turmas;

# 9. Exiba o dia da semana, turno, nome do professor e nome do aluno da tabela turmas
SELECT
	turmas.diaTurma AS 'Dia',
    turmas.turnoTurma AS 'Turno',
    professores.nomeProfessor AS 'Professor',
    alunos.nomeAluno AS 'Aluno'
FROM turmas
INNER JOIN professores
ON turmas.idProfessor = professores.idProfessor
INNER JOIN alunos
ON turmas.idAluno = alunos.idAluno;

# 10. Informe quantos alunos realizam o curso no período matutino de segunda à sexta
select count(*) FROM turmas WHERE turmas.turnoTurma = 'matutino' AND turmas.diaTurma <> 'Sábado';

# 11. Exiba o nome de todos os professores que estão lecionando
SELECT
	professores.nomeProfessor
FROM turmas
INNER JOIN professores
ON turmas.idProfessor = professores.idProfessor
GROUP BY professores.nomeProfessor;

# 12. Exiba o nome de todos os professores e informe quantas vezes eles lecionam na tabela turmas
SELECT
	professores.nomeProfessor,
    COUNT(turmas.idTurma)
FROM turmas
INNER JOIN professores
ON turmas.idProfessor = professores.idProfessor
GROUP BY professores.nomeProfessor;

# 13. Listar o nome dos professores e o turno que leciona em ordem alfabética (nome do professor)
SELECT
	professores.nomeProfessor,
    turmas.diaTurma
FROM turmas
INNER JOIN professores
ON turmas.idProfessor = professores.idProfessor
ORDER BY professores.nomeProfessor ASC;

# 14. Exiba os nomes e matérias dos professores que lecionam para o aluno de código 4
SELECT
	professores.nomeProfessor,
    professores.especializacao
FROM turmas
INNER JOIN professores
ON turmas.idProfessor = professores.idProfessor
WHERE turmas.idAluno = 4;

# 15. Excluir a base de dados
DROP DATABASE exercicio07;

