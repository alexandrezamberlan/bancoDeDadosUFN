Banco de Dados 1 = Projeto de Banco de Dados
    - Modelagem = diagramação + lógica + física
        - conceitual: desenho -> cliente
        - lógico: chave primaria + chave estrangeira -> relacionamentos (cardinalidade)
        - físico: restrições (pk, fk, indice) + tipagem + SGBD + boas práticas
            - evitar campos nulos
            - evitar pk compostas
    
    - SGBD + SQL = Definição de esquemas de BD (DDL) + Manipulação de dados (consulta, inserções, deleções, atualizações) (DML)
        - Foco: DML
        

    Tab1(pk1, campo1, ...) n    ---    n Tab2(pk2, campo1, ...)
    Tab1_Tab2(idTab1_Tab2, pk1, pk2, ....)

    Medico(idMedico, nome)
    Medico(100, Bernardo)
    Medico(101, Bissacotti)

    Paciente(idPaciente, nome)
    Paciente(1, Alexandre)
    Paciente(2, Gabriel)

    Consulta(idMedico, idPaciente, data, hora)
    Consulta(100, 1, 2023-05-10, 10:00)
    Consulta(100, 1, 2023-05-10, 18:00)
    Consulta(101, 1, 2023-05-12, 18:00)



    select Paciente.nome
    from Medico, Paciente, Consulta
    where Medico.nome = 'Bernardo' and Medico.idMedico = Consulta.idMedico and 
          Consulta.idPaciente = Paciente.idPaciente


CREATE SCHEMA  editora_db;

USE editora_db ;

CREATE TABLE Autor (
  idAutor INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (idAutor)
)

CREATE TABLE Editora (
  idEditora INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (idEditora)
)

CREATE TABLE Genero (
  idGenero INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (idGenero)
)

CREATE TABLE Livro (
  idLivro INT NOT NULL,
  titulo VARCHAR(45) NOT NULL,
  preco DECIMAL(3) NULL,
  idEditora INT NOT NULL,
  idGenero INT NOT NULL,
  PRIMARY KEY (idLivro),  
  CONSTRAINT fk_Livro_Editora
    FOREIGN KEY (idEditora)
    REFERENCES Editora (idEditora)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Livro_Genero
    FOREIGN KEY (idGenero)
    REFERENCES Genero (idGenero)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)

CREATE TABLE Livro_Autor (
  idAutor INT NOT NULL,
  idLivro INT NOT NULL,
  PRIMARY KEY (idAutor, idLivro),
  CONSTRAINT fk_Autor_has_Livro_Autor
    FOREIGN KEY (idAutor)
    REFERENCES Autor (idAutor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Livro_has_Livro_Autor
    FOREIGN KEY (idLivro)
    REFERENCES Livro (idLivro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)

CREATE TABLE Ranking (
  idRanking INT NOT NULL,
  dataInicial DATE NOT NULL,
  dataFinal DATE NOT NULL,
  PRIMARY KEY (idRanking)
)

CREATE TABLE Ranking_Semanal (
  idRanking INT NOT NULL,
  idLivro INT NOT NULL,
  posicao DECIMAL(2) NULL,
  quantidadeSemanas DECIMAL(2) NULL,
  semanasConsecutivas DECIMAL(2) NULL,
  posicaoSemanaAnterior DECIMAL(2) NULL,
  PRIMARY KEY (idRanking, idLivro),  
  CONSTRAINT fk_Ranking_has_Livro_Ranking
    FOREIGN KEY (idRanking)
    REFERENCES Ranking (idRanking)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Livro_has_Livro_Ranking
    FOREIGN KEY (idLivro)
    REFERENCES Livro (idLivro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)

