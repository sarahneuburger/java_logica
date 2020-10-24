# Item 1
CREATE DATABASE exercicio04;

#Item 2
USE exercicio04;

# Item 3
CREATE TABLE cursos(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    curso VARCHAR(30),
    valor DOUBLE,
    area VARCHAR(30),
    dificuldade INT
);

# Item 4
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

# Item 5 e 6
SELECT curso, valor, dificuldade,
CASE 
	WHEN dificuldade = 1 THEN 'Iniciante'
    WHEN dificuldade = 2 THEN 'Intermediário'
    ELSE 'Avançado'
END AS 'Nível de dificuldade'
FROM cursos;

# Item 7
SELECT area, COUNT(*) FROM cursos GROUP BY area;

# Item 8
SELECT curso, valor FROM cursos ORDER BY valor ASC;

# Item 9

