############################################################################
# Seleção de todos os campos (ou colunas) da tabela de Departamentos.
############################################################################
#
SELECT  *  FROM  Departamento;
#
# where
#
# Operadores lógicos
#
# operador significado
# =  igual a
# >  maior que
# >= maior que ou igual a
# <  menor que
# <= menor que ou igual a
#
SELECT  Empregado.nome, Empregado.funcao
FROM  Empregado
WHERE  Empregado.Departamento_idDepartamento > 3;
#
SELECT  Empregado.nome, Empregado.funcao
FROM  Empregado
WHERE Empregado.funcao = 'GERENTE';
#
############################################################################
# Selecione todos os departamentos cujo orçamento mensal
#seja maior que 100000. Apresente o Nome de tal departamento
#e seu orçamento anual, que será obtido multiplicando-se o
#orçamento mensal por 12.
############################################################################
#
select Departamento.nome, Departamento.orcamento * 12
from Departamento
where Departamento.orcamento >= 10000;
#
############################################################################
# Apresente a instrução anterior porém ao invés dos
#"feios" DepNome e DepOrca, os Títulos Departamento e Orçamento.
############################################################################
#
SELECT  Departamento.nome "DEPARTAMENTO", Departamento.orcamento * 12 "ORCAMENTO ANUAL"
FROM  Departamento
WHERE Departamento.orcamento > 5000;
#
############################################################################
# Apresente todos os cargos existentes na empresa,
# porém omita eventuais duplicidades.
############################################################################
#
select distinct Empregado.funcao
from Empregado;
#
############################################################################
# Apresente os nomes e funções da cada funcionário contidos
#na tabela empresa, porém classificados alfabeticamente (A..Z)
#e depois alfabeticamente invertido (Z..A).
############################################################################
#
select Empregado.nome "Nome do Empregado", Empregado.funcao "Cargo"
from Empregado
order by  Empregado.nome;
#
select Empregado.nome "Nome do Empregado", Empregado.funcao "Cargo"
from Empregado
order by  Empregado.nome desc;
#
# Demais Operadores
#
#Operador                  significado
#between  ...  and ...     entre dois valores ( inclusive )
#in ( .... )               lista de valores
#like                      com um padrao de caracteres
#is null                   é um valor nulo
#
SELECT  EMPNOME, EMPSALA
FROM  EMP
WHERE  EMPSALA BETWEEN  20  AND  30;
#
SELECT  EMPNOME,  DEPNUME
FROM  EMP
WHERE  DEPNUME  IN  (3,5);
#
SELECT  EMPNOME, EMPSERV
FROM  EMP
WHERE   EMPNOME  LIKE  'L%';
#
SELECT EMPNOME, EMPSERV
FROM  EMP
WHERE  EMPCOMI  IS  NULL;
#
# Operadores Negativos
#
#operador               descrição
#<>                     diferente
#not nome_coluna =      diferente da coluna
#not nome_coluna >      não maior que
#not between            não entre dois valores informados
#not in                 não existente numa dada lista de valores
#not like               diferente do padrao de caracteres informado
#is not null            não é um valor nulo
#
############################################################################
# Selecione os Empregados cujos salários sejam
#menores que 1000 ou maiores que 3500.
############################################################################
#
SELECT EMPNOME,  EMPSALA
FROM  EMP
WHERE  EMPSALA  NOT  BETWEEN  1000  AND  3500;
#
############################################################################
# Apresente todos os funcionários com salários
#entre 3400 e 4000 e que sejam balconistas.
############################################################################
#
# Operadores  "AND" (E) e  "OR" (OU).
#
SELECT EMPNOME, EMPSALA, EMPSERV
FROM  EMP
WHERE  EMPSALA  BETWEEN  3400 AND 5000
AND  EMPSERV =  'balconista';
#
############################################################################
# Apresente todos os funcionários com salários
#entre 3400 e 4000 ou que sejam balconistas.
############################################################################
#
SELECT EMPNOME, EMPSALA, EMPSERV
FROM  EMP
WHERE EMPSALA  BETWEEN  3400 AND 5000
OR  EMPSERV =  'balconista';
#
#
############################################################################
# Apresente o nome de todos os empregados em letras minúsculas.
############################################################################
#
# Funções de Caracteres
#Lower - 		força caracteres maiúsculos aparecerem em minúsculos.
#Upper - 		força caracteres minúsculos aparecerem em maiúsculos.
#Concat(x,y)- 		concatena a string "x" com a string "y".
#Substring(x,y,str)- 	extrai um substring da string "str", começando em "x", e termina em "y".
#To_Char(num)- 		converte um valor numérico para  uma string de caracteres.
#To_Date(char,fmt)- 	converte uma string caracter em uma data.
#
SELECT LOWER( EMPNOME )
FROM EMP;
#
############################################################################
# Apresente o nome de todos os empregados (somente as 5 primeiras letras).
############################################################################
#
SELECT SUBSTRING(EMPNOME,1,5) FROM EMP;
#
############################################################################
# Apresente a Média, o Maior, o Menor e também a Somatória
#dos Salários pagos aos empregados.
############################################################################
#
# Funções Agregadas (ou de Agrupamento)
#
#função        retorno
#avg(n)        média do valor n, ignorando nulos
#count(expr)   vezes que o número da expr avalia para algo nao nulo
#max(expr)     maior valor da expr
#min(expr)     menor valor da expr
#sum(n)	       soma dos valores de n, ignorando nulos
#
SELECT  AVG(EMPSALA)  FROM  EMP;
#
SELECT  MIN(EMPSALA)  FROM  EMP;
#
SELECT  MAX(EMPSALA)  FROM EMP;
#
SELECT  SUM(EMPSALA) FROM  EMP;
#
############################################################################
# Apresente a média de salário pagos por departamento.
############################################################################
#
SELECT DEPNUME, AVG(EMPSALA)
FROM EMP
GROUP BY DEPNUME;
#
############################################################################
#  Retome o problema anterior, porém apresente resposta
#apenas para departamentos com mais de 3 empregados.
############################################################################
#
SELECT  DEPNUME, AVG(EMPSALA)
FROM  EMP
GROUP BY DEPNUME
HAVING COUNT(*) > 2;
#
############################################################################
# Listar Nomes de Empregados, Cargos e
#Nome do Departamento onde o empregado trabalha.
############################################################################
#
SELECT A.EMPNOME, A.EMPSERV, B.DEPNOME
FROM EMP A, Departamento  B
WHERE A.DEPNUME = B.DEPNUME;
#
############################################################################
# Liste os Códigos do Cada Funcionário, seus Nomes, seus Cargos
#e o nome do Gerente ao qual este se relaciona.
############################################################################
#
SELECT  A.EMPNUME, A.EMPNOME, A.EMPSERV, B.EMPNOME
FROM  EMP A, EMP B
WHERE  A.EMPGERE  = B.EMPNUME;
#
############################################################################
# INSERT
############################################################################
#
INSERT INTO Departamento (DEPNUME,DEPNOME,DEPLOCA) VALUES (70,"PRODUCAO","RIO DE JANEIRO");
#
############################################################################
# UPDATE
############################################################################
#
UPDATE EMP SET EMPSALA = EMPSALA* 1.2 WHERE EMPSALA< 1000;
#
############################################################################
# DELETE
############################################################################
#
DELETE FROM emp WHERE EMPSALA > 5000;
#
############################################################################
# FIM DO SUPORTE DO MYSQL
############################################################################
# Relacione todos os nomes de funcionários e seus respectivos
#cargos, desde que o orçamento do departamento seja igual a 10000.
############################################################################
#
SELECT  EMPNOME, EMPSERV
FROM EMP as A
WHERE  10000 IN (SELECT DEPORCA
                  FROM Departamento
                  WHERE Departamento.DEPNUME = A.DEPNUME);
#
############################################################################
# Relacione todos os departamentos que possuem
#empregados com remuneração maior que 3000.
############################################################################
#
SELECT DEPNOME
FROM Departamento A
WHERE EXISTS (SELECT * FROM EMP
              WHERE EMPSALA > 3000 AND EMP.DEPNUME = A.DEPNUME);
#
############################################################################
# TRANSACOES
############################################################################
#
begin transaction;
  delete from emp where salario > 500;
  if SQL_RECORDCOUNT > 20 THEN;
     ROLLBACK TRASACTION;
  else
     COMMIT;
  endif;
end transaction;
#
############################################################################
# VISOES
############################################################################
#
CREATE VIEW EMP_DEP
AS SELECT E.EMPNOME, D.DEPNOME
FROM EMP E, Departamento D
WHERE E.DEPNUME = D.DEPNUME;
#
# FIM SQL
#
