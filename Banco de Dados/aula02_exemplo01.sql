CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE categorias(
	idCategoria INT AUTO_INCREMENT PRIMARY KEY,
    nomeCategoria VARCHAR(20)
);

INSERT INTO categorias(nomeCategoria) VALUES
('Aventura'),
('Drama'),
('Romance'),
('Terror');

SELECT * FROM categorias;

CREATE TABLE autores(
	idAutor INT AUTO_INCREMENT PRIMARY KEY,
    nomeAutor VARCHAR(50)
);

INSERT INTO autores (nomeAutor) VALUES
('Bianca'),
('Mauricio'),
('Daniela');

SELECT * FROM autores;

# Foreign key referencia dados de outra tabela, normalmente se utiliza a id por não se repetir. Só podemos usar os dados que já existem
# nas outras tabelas, não podemos inserir novos dados na table categorias/autores a partir da livro
CREATE TABLE livros(
	idLivro INT AUTO_INCREMENT PRIMARY KEY,
    nomeLivro VARCHAR(40),
    idCategoria INT,
    idAutor INT,
    FOREIGN KEY(idCategoria) REFERENCES categorias(idCategoria),
    FOREIGN KEY(idAutor) REFERENCES autores(idAutor)
);

SELECT * FROM livros;

INSERT INTO livros VALUES 
(null, 'Up Altas Aventuras', 1, 2),
(null, 'Dias de Verão', 2, 1),
(null, 'Um dia muito louco', 1, 2),
(null, 'Além do tempo', 4, 3);

# INNER JOIN
SELECT 
	livros.nomeLivro,
    categorias.nomeCategoria
FROM livros
INNER JOIN categorias
ON livros.idCategoria = categorias.idCategoria;
# inner join referencia uma tabela complementar
# on é como se fosse o where, o que as tabelas tem em comum

SELECT 
	livros.nomeLivro,
    categorias.nomeCategoria,
    autores.nomeAutor
FROM livros
INNER JOIN categorias
ON livros.idCategoria = categorias.idCategoria
INNER JOIN autores
ON livros.idAutor = autores.idAutor;
# inner join referencia uma tabela complementar
# on é como se fosse o where, o que as tabelas tem em comum

# Contar quantos livros pertencem a categoria
# left join - tem uma tabela fixa, se a outra não tem nada dela, traz zero. Fixa a tabela da esquerda (neste caso, a categoria)
SELECT 
	categorias.nomeCategoria,
    COUNT(livros.idLivro)
FROM categorias
LEFT JOIN livros
ON categorias.idCategoria = livros.idCategoria
GROUP BY categorias.nomeCategoria;

