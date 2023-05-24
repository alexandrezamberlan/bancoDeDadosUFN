use editora_db;
show tables;

insert into Genero values (1, "Infantil");
insert into Genero values (2, "Ficção");
insert into Genero values (3, "Romance");
insert into Genero values (4, "Auto-ajuda");
insert into Genero values (5, "Negócios");
insert into Genero values (6, "História");

select * from Genero;

insert into Editora values (1, "Ática");
insert into Editora values (2, "Makron Books");
insert into Editora values (3, "Rocco");
insert into Editora values (4, "Scipione");
insert into Editora values (5, "Sagra Luzato");

select * from Editora;

insert into Autor values (1, "Pedro");
insert into Autor values (2, "Marcos");
insert into Autor values (3, "Felipe");
insert into Autor values (4, "Ana");
insert into Autor values (5, "Maria");
insert into Autor values (6, "Francisco");
insert into Autor values (7, "Lucas");

select * from Autor;

insert into Livro values (1, "A", 25.30, 1, 1);
insert into Livro values (2, "B", 32.45, 1, 4);
insert into Livro values (3, "C", 122.00, 4, 2);
insert into Livro values (4, "D", 100.99, 4, 3);
insert into Livro values (5, "E", 16.16, 1, 5);
insert into Livro values (6, "F", 4.56, 3, 1);
insert into Livro values (7, "G", 85.20, 2, 5);
insert into Livro values (8, "H", 89.90, 5, 5);
insert into Livro values (9, "I", 63.36, 2, 2);
insert into Livro values (10, "J", 41.40, 3, 3);
insert into Livro values (11, "K", 200.30, 4, 6);
insert into Livro values (12, "L", 99.99, 2, 4);

select * from Livro;

insert into Livro_Autor values (1, 1);
insert into Livro_Autor values (6, 1);
insert into Livro_Autor values (6, 2);
insert into Livro_Autor values (5, 3);
insert into Livro_Autor values (1, 3);
insert into Livro_Autor values (4, 3);
insert into Livro_Autor values (4, 4);
insert into Livro_Autor values (1, 5);
insert into Livro_Autor values (5, 6);
insert into Livro_Autor values (3, 6);
insert into Livro_Autor values (3, 7);
insert into Livro_Autor values (2, 8);
insert into Livro_Autor values (6, 9);
insert into Livro_Autor values (6, 10);
insert into Livro_Autor values (1, 10);
insert into Livro_Autor values (2, 11);
insert into Livro_Autor values (2, 12);

select * from Livro_Autor;

insert into Ranking values (1, "20030817", "20030823");
insert into Ranking values (2, "20030824", "20030830");
insert into Ranking values (3, "20030831", "20030906");
insert into Ranking values (4, "20030907", "20030913");

select * from Ranking;

insert into Ranking_Semanal values (1,1,4,6,3,3);
insert into Ranking_Semanal values (2,1,5,7,3,4);
insert into Ranking_Semanal values (3,2,1,1,1,null);
insert into Ranking_Semanal values (4,2,1,2,2,1);
insert into Ranking_Semanal values (1,3,2,2,2,null);
insert into Ranking_Semanal values (2,3,2,3,3,2);
insert into Ranking_Semanal values (3,3,8,4,4,2);
insert into Ranking_Semanal values (4,3,10,5,5,8);
insert into Ranking_Semanal values (1,4,1,50,43,1);
insert into Ranking_Semanal values (2,5,1,1,1,null);
insert into Ranking_Semanal values (3,5,2,2,2,1);
insert into Ranking_Semanal values (4,5,9,3,3,2);
insert into Ranking_Semanal values (4,6,8,1,1,null);
insert into Ranking_Semanal values (3,7,5,1,1,null);
insert into Ranking_Semanal values (4,7,5,2,2,5);
insert into Ranking_Semanal values (1,8, 3,13,12,6);
insert into Ranking_Semanal values (2,8, 3, 14,13,3);
insert into Ranking_Semanal values (3,8,3,15,14,3);
insert into Ranking_Semanal values (4,8,4,16,15,3);
insert into Ranking_Semanal values (2,9,7,1,1,null);
insert into Ranking_Semanal values (3,9,7,2,2,7);
insert into Ranking_Semanal values (1,10,8,4,4,10);
insert into Ranking_Semanal values (2,10,9,5,5,8);
insert into Ranking_Semanal values (3,11,9,1,1,null);
insert into Ranking_Semanal values (1,12,6,3,2,6);

select * from Ranking_Semanal;

-- Conta quantas tuplas/linhas há na tabela Ranking_Semanal
select count(*)
from Ranking_Semanal;

-- i.Mostre todos os autores cadastrados; 
select * from Autor;

-- ii.Mostre apenas os nomes dos autores;
select nome
from Autor;

-- iii.Mostre o nome e a identificação do autor, nesta ordem;
select nome, idAutor
from Autor;

-- iv.Mostre o nome dos autores que aparecem na tabela Livro_Autor;
select Autor.nome
from Autor, Livro_Autor
where Autor.idAutor = Livro_Autor.idAutor;

SELECT distinct(Autor.nome)
FROM Autor
INNER JOIN Livro_Autor
ON Autor.idAutor = Livro_Autor.idAutor;

-- v.Mostre o nome dos autores, sem repetição, presentes na tabela Livro_Autor; 
select distinct(Autor.nome)
from Autor, Livro_Autor
where Autor.idAutor = Livro_Autor.idAutor;

-- vi.Mostre os autores em ordem alfabética;
select distinct(Autor.nome)
from Autor, Livro_Autor
where Autor.idAutor = Livro_Autor.idAutor
order by Autor.nome;

-- vii.Mostre o título dos livros que são da editora Rocco ou da editora Scipione; 
select Livro.titulo, Editora.nome
from Livro, Editora 
where (Editora.nome = "Rocco" or Editora.nome = "Scipione") and Livro.idEditora = Editora.idEditora;
      
-- viii.Mostre, em ordem alfabética, os autores que começam com M;
select nome
from Autor
where nome like "M%"
order by nome;

-- ix.Mostre, em ordem alfabética, os autores que começam com L;
select nome
from Autor
where nome like "L%"
order by nome;

-- x.Mostre, em ordem alfabética, os autores que NÃO começam com L; 
select nome
from Autor
where nome not like "L%"
order by nome;

-- xi.Mostre, em qualquer ordem, os autores que não começam com M;
select nome
from Autor
where nome not like "M%"
order by nome;

-- xii.Liste apenas os livros das editoras 1 OU 5;
select Livro.titulo, Editora.nome
from Livro, Editora
where (Editora.idEditora = 1 or Editora.idEditora = 5) and
      Livro.idEditora = Editora.idEditora;

-- xiii.Mostre os livros infantis das editoras 1 e 5;
select Livro.titulo, Genero.descricao, Livro.idEditora "Código Editora", Editora.nome
from Livro, Genero, Editora
where  Genero.descricao = "Infantil" and
       Livro.idGenero = Genero.idGenero and
       (Livro.idEditora = 1 or Livro.idEditora = 5) and
       Livro.idEditora = Editora.idEditora;
      
-- xiv.Mostre os códigos e os títulos dos livros, com seus respectivos preços;
select idLivro, titulo, preco 
from Livro;

-- xv.Mostre os autores em ordem contrária à alfabética;
select * 
from autor 
order by nome desc;

-- xvi.Liste os livros, na ordem de preços do mais caro ao mais barato; 
select * 
from Livro 
order by preco desc;

-- xvii.Liste os livros, na ordem de preços do mais barato ao mais caro;
select * 
from Livro 
order by preco;

-- xviii.Mostre apenas os livros de auto-ajuda, na ordem crescente de preço; 
select livro.titulo, livro.preco 
from livro 
where idGenero = '4' 
order by preco;

SELECT * 
FROM Livro, Genero 
WHERE Livro.idGenero = Genero.idGenero AND 
Genero.descricao = "Auto-ajuda" 
ORDER BY preco ASC;

select livro.* 
from livro,genero 
where descricao = "Auto-Ajuda" and livro.idGenero = genero.idGenero 
order by preco asc;

-- xix.Mostre quantos autores estão cadastros;
select count(*)
from autor;

-- xx.Mostre os preços dos livros mais baratos e mais caros da editora 1; 
select max(preco) as livroMaisCaro, min(preco) as livroMaisBarato 
from Livro
where Livro.idEditora = 1;

select max(preco), min(preco) 
from livro 
where idEditora = '1';

select titulo, preco 
from livro 
where preco = (select max(preco) 
	       from livro 
               where idEditora = 1) or preco = (select min(preco) 
                                                from livro 
                                                 where idEditora = 1);

-- xxi.Liste a média de preços dos livros da editora 2;
select avg(preco) as precoMedio 
from Livro 
where idEditora=2;

SELECT AVG(preco) 
FROM Livro 
WHERE idEditora=2;

select round(avg(preco),2) 
from livro 
where idEditora = 2;

create view MediaPreco as
select round(avg(preco),2) 
from livro 
where idEditora = 2;

-- xxii.Mostre os livros com seus respectivos nomes de editoras e gêneros;
select Livro.titulo, Editora.nome as editora, Genero.descricao as genero 
from Livro, Editora, Genero 
where Livro.idEditora=Editora.idEditora and 
      Livro.idGenero=Genero.idGenero;

SELECT Livro.titulo, Editora.nome "Editora", Genero.descricao "Genero" 
FROM Livro, Editora, Genero 
WHERE Livro.idGenero = Genero.idGenero AND 
Livro.idEditora = Editora.idEditora;

-- xxiii.Liste os livros, mostrando o titulo de cada um bem como o nome do autor;
SELECT Livro.titulo, Autor.nome 
FROM Livro, Autor, Livro_Autor 
WHERE Livro_Autor.idLivro = Livro.idLivro AND 
Livro_Autor.idAutor = Autor.idAutor;

select Livro.titulo as livro, Autor.nome as autor 
from Livro, Autor, LivroAutor 
where LivroAutor.idAutor=Autor.idAutor and 
LivroAutor.idLivro=Livro.idLivro;

SELECT Livro.titulo, Autor.nome, Editora.nome 
FROM Livro, Autor, Livro_Autor, Editora 
WHERE Livro_Autor.idLivro = Livro.idLivro AND 
Livro_Autor.idAutor = Autor.idAutor AND 
Livro.idEditora = Editora.idEditora 
ORDER BY Livro.titulo;

-- xxiv.Mostre o título do livro que ficou o maior número de semanas consecutivas em 1o lugar;
SELECT Livro.titulo, Ranking_semanal.posicao, Ranking_semanal.semanasConsecutivas 
FROM Livro, Ranking_semanal 
WHERE semanasConsecutivas = (SELECT max(semanasConsecutivas) 
                             FROM Ranking_semanal 
                             WHERE posicao = 1) 
      AND Livro.idLivro = Ranking_semanal.idLivro;

select livro.titulo, ranking_semanal.idLivro, ranking_semanal.semanasConsecutivas 
from ranking_semanal, livro 
where Livro.idLivro = Ranking_semanal.idLivro
order by semanasConsecutivas desc limit 1 ;

-- xxv.Mostre o nome dos autores dos livros que estavam no ranking da semana de 24/08/2003 a 30/08/2003;
select distinct Autor.nome as autor 
from Livro, Autor, Livro_Autor, Ranking, Ranking_Semanal 
where Livro_Autor.idAutor=Autor.idAutor and 
      Livro_Autor.idLivro=Livro.idLivro and 
      Ranking_Semanal.idRanking = Ranking.idRanking and 
      Ranking_Semanal.idLivro=Livro.idLivro and Ranking.idRanking=2;
      
select distinct Autor.nome as autor 
from Livro, Autor, Livro_Autor, Ranking, Ranking_Semanal 
where (Ranking.dataInicial="2003-08-24" and Ranking.dataFinal="2003-08-30") and
Livro_Autor.idAutor=Autor.idAutor and 
Livro_Autor.idLivro=Livro.idLivro and 
Ranking_Semanal.idRanking = Ranking.idRanking and 
Ranking_Semanal.idLivro=Livro.idLivro;

select autor.nome
from autor,ranking, ranking_semanal, livro_autor
where ranking_semanal.idRanking = (select idRanking
				   from ranking
				   where dataInicial = "2003-08-24" and
				   dataFinal = "2003-08-30") 
	and
	ranking.idRanking = ranking_semanal.idRanking and
	ranking_semanal.idLivro = livro_autor.idLivro and
	livro_autor.idAutor = autor.idAutor;
