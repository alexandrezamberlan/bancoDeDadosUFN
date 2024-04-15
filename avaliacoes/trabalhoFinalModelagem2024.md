O enunciado deste trabalho foi adaptado de um livro de Peter Coad sobre projeto orientado a
objetos e retirado do livro do professor Carlos Heuser – Projeto de Banco de Dados. A partir da
descrição abaixo, por meio da ferramenta MySQL Workbench instalada no laboratório, crie o ER.
Ao final, gere a imagem (exportar para .jpg ou .png) e insira no documento a ser enviado ao
professor.

O almoxarifado pertence a um grupo de empresas do ramo industrial e serve para estocar peças destinadas
às várias empresas do grupo. Cada empresa do grupo é considerada um cliente do almoxarifado.
O almoxarifado está organizado em corredores. Cada corredor possui vários receptáculos para peças (um
receptáculo é uma bacia retangular de material plástico). Os receptáculos são todos do mesmo tamanho.

Os corredores são numerados e os receptáculos são numerados por corredor. Por exemplo, o receptáculo
2-10 é o décimo receptáculo do segundo corredor.

Em uma das extremidades do almoxarifado encontra-se o setor de recepção de peças. Lá chegam as peças
entregues pelos fornecedores. Quando ocorre a chegada de peças, a primeira atividade é registrar na
ordem de compra a chegada das peças. Uma cópia de toda ordem de compra é sempre enviada ao setor de
recepção. Assim, neste setor sempre sabe-se quais as peças que estão por ser entregues. As ordens de
compra são geradas no setor de compras e apenas repassadas ao almoxarifado.

Uma entrega corresponde sempre a uma ordem de compra. Entretanto, são admitidas entregas parciais,
isto é, entregas que não completam a ordem de compra. Em uma entrega podem ser entregues diferentes
quantidades de diferentes peças. As peças recebidas são colocadas sobre um estrado. Este estrado é então
levado para o almoxaridado por uma empilhadeira e as peças são distribuídas nos receptáculos. Um
estrado pode conter diferentes peças. Para cada peça, procura-se um receptáculo que já contenha unidades
da peça em questão e que ainda tenha espaço para a carga chegada. Caso não haja um receptáculo nestas
condições, procura-se um receptáculo vazio.

A saída do almoxarifado se dá contra pedidos de clientes. Um pedido pode solicitar vários tipos de peças.
Todas peças que atendem um pedido são juntadas, embaladas e colocadas em uma rampa de carga
(numerada) onde encosta o caminhão do cliente. Não há pedidos pendentes, isto é, os clientes sempre
pedem quantidades de peças que há em estoque.

O objetivo do sistema é o de aumentar o lucro do almoxarifado, ajudando sua equipe a guardar e
recuperar itens mais rapidamente e a conhecer as quantidades estocadas.

O almoxarifado é de grande porte e constantemente há várias empilhadeiras circulando por ele tanto para
estocar entregas quanto para buscar peças referentes a um pedido.

Outros detalhes do sistema são fornecidos a seguir.
O almoxarifado somente atente empresas. É necessário manter um cadastro de clientes com CGC, nome,
endereço e telefone de contato. Para cada peça é necessário conhecer seu UPC (Universal Product Code),
descrição e número interno à organização.

Para cada entrega, o setor de recepção monta uma lista de distribuição, que instrui o operador sobre que
peças, em quantidade ele deve estocar, em que receptáculos.

Para cada pedido, o setor de saída monta uma lista de busca, que instrui o operador sobre que peças, em
quantidade ele deve buscar em que receptáculos.

Em termos de processos, é necessário que o sistema processe o seguinte:
● Dê as ordens de distribuição de peças chegas para cada chegada;
● Dê as ordens para busca para cada pedido;
● Mantenha a quantidade estocada de cada item e de cada receptáculo
● Informe que peças em que quantidade devem ser estocadas ou buscadas em receptáculos.

Em termos específicos de transações devem ser consideradas:
● Transações de chegada;
● Registro da chegada de produtos;
● Instruções para estocagem (em que estrado, em que receptáculo);
● Confirmação da estocagem em um receptáculo
● Transações de saída de produtos;
● Registro de um pedido
● Geração da lista de busca
● Confirmação da busca
● Consolidação de receptáculos (juntar as peças de mesmo tipo de dois receptáculos diferentes)