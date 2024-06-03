# Avaliação de SQL

Em duplas, responder as questões SQL em arquivo, que deve ser disponibilizado em repositório do GitHub. Ao final, o link do repositório deve ser enviado para alexz@ufn.edu.br com os nomes da dupla.

1) Qual o papel do SQL em SGBD?
2) Na construção de esquemas de banco de dados, onde o desenvolvedor cria esquema (database), tabelas, atributos, restrições e outros tantos elementos. Comente as principais restrições que o desenvolvedor cria no projeto de banco de dados.
3) Leia com atenção a descrição, crie um esquema (database prova) no MySQL Workbench via shell para a seguinte situação:

Existe um sistema de gerenciamento de projetos em hospitais escola na UFN, chamado de COMIC. Nele, é possível gerenciar professores(nome, email, curso|chave estrangeira, área de atuação). Logo, é preciso gerenciar curso(nome, área). Todo o professor pode submeter um projeto(titulo,resumo,responsavel professor|chave estrangeira, colaborador|chave estrangeira, instituicao|chave estrangeira). Logo, é preciso gerenciar instituicao(nome, sigla).

Para as tabelas inserir os seguintes valores:
Professor:
  - 1,"Alexandre Zamberlan","alexz@ufn.edu.br",1,"Tecnologia"
  - 2,"Ana Paula","apc@ufn.edu.b",1,"Tecnologia"
  -  3,"Sylvio Garcia","sylvio@ufn.edu.br",2,"Tecnologia"
  -  4,"Mirkos Martins","mirkos@ufn.edu.br",1,"Tecnologia"

Curso
  -  1,"Ciência da Computação","Tecnologia"
  - 2,"Sistemas de Informação","Tecnologia"
  - 3,"Filosofia","Sociais"

Instituicao
  - 10,"Universidad Franciscana","UFN"
  - 20,"Universidade Federal de Santa Maria","UFSM"

projeto(titulo,resumo,responsavel professor|chave estrangeira, colaborador|chave estrangeira, instituicao|chave estrangeira)
Projeto
  - 1,"Web Crawler","Trabalho do Zamba",1,NULL,10
  - 2,"SirPerf","Sistema de perfusão",1,3,10
  - 3,"OdontoTren","Sistema de gestão de atendimento",2,3,20
  - 4,"Avida","Sistema de acompanhamento psiquiátrico",1,NULL,10

4) Descubra quais os projetos da instituição UFN.
5) Mostre os professores que não possuem projetos submetidos
6) Mostre todos os projetos enviados do professor Alexandre Zamberlan
7) Exiba quantos projetos foram submetidos
8) Mostre os projetos que não possuem colaboradores
9) Mostre os projetos que estão vinculados a área de Tecnologia.
10) Mostre os projetos vinculados a cada curso.



