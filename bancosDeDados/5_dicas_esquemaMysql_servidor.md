# Criando esquema e tabelas em MySQL em servidor Linux

## Acessar o servidor
    - SEMPRE via ssh (protocolo de comunicação remoto seguro)

## Acessar o serviço de MySQL via sudo
    1) criar o esquema de banco de dados;
        - create database nomeEsquema_db;
        
    2) criar um usuário para o esquema de banco de dados a ser criado;
        - como visualizar os usuários cadastrados no MySQL
            select user from mysql.user;

        - criar o usuário
            create user 'nomeUsuario'@'localhost' identified by 'senhaDesejada';
        
        - se o sistema se chamar comic, o nome do esquema deve ser 'comic_db' e o usuário deve ser 'comic'

    3) definir privilégios ao usuário criado;
        - grant all privileges on nomeEsquema_db.* to 'nomeUsuario'@'localhost' identified by 'senhaDesejada'; 
        
    4) rodar os scripts de criação de tabelas e primeiros dados via arquivo salvo no diretório em que o mysql foi chamado
        - source nomeArquivoComScripts;