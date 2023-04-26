show databases;
use padel_db;

show tables;

select *
from jogador;

select * 
from torneio;

select *
from jogador_torneio;

show tables;

CREATE TABLE Ranking (
  idRanking INT NOT NULL,
  idJogador INT NOT NULL,
  pontos INT NOT NULL,
  PRIMARY KEY (idRanking),
  INDEX `Index` (pontos DESC) VISIBLE,
  CONSTRAINT `fk_Ranking_Jogador`
    FOREIGN KEY (idJogador)
    REFERENCES Jogador (idJogador)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

show tables;

select *
from ranking;

drop table ranking;

ALTER TABLE Ranking
ADD ano date,
ADD INDEX `IndexAno` (ano DESC) VISIBLE;


#jogador
INSERT INTO Jogador (idJogador, nome, apelido, posicao)
VALUES (1, 'Luiz Batista', NULL, 'Drive');
INSERT INTO Jogador VALUES (2, 'Tobias Vieiro', 'Harris', 'Reves');
INSERT INTO Jogador VALUES (3, 'Guilherme Scalcon', 'Guiga', 'Reves');
INSERT INTO Jogador VALUES (4, 'Victor Bortoluzzi', 'Vitinho', 'Reves');

select *
from jogador;

#torneio
INSERT INTO Torneio VALUES (100, 'StarPadel');
INSERT INTO Torneio VALUES (101, 'Squadra');
INSERT INTO Torneio VALUES (102, 'Clube Dores');

select * 
from Torneio;

#jogador_torneio
#ranking

INSERT INTO Ranking (idRanking, idJogador, pontos, ano)
VALUES (1, 1, 100,'2020-12-01');
INSERT INTO Ranking VALUES (2, 2, 10,'2020-12-01');
INSERT INTO Ranking VALUES (3, 2, 70,'2021-12-01');


select *
from ranking;