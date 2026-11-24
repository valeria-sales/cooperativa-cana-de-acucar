
-- =============================================
-- SISTEMA DE GESTAO DA COOPERATIVA DE CANA
-- ARQUIVO: script-dml.sql
-- DML - INSERCAO DOS DADOS
-- =============================================

USE SistemaCooperativa;

-- =============================================
-- CENARIO 1: CADASTRO INICIAL DA COOPERATIVA
-- =============================================
-- A cooperativa iniciou suas atividades em 2026.
-- Foram cadastrados cinco produtores associados,
-- cinco usinas parceiras, cinco agronomos e
-- cinco tipos de insumos agricolas.

-- 1. CADASTRO DOS PRODUTORES

INSERT INTO Produtor
(idProdutor, codigoProdutor, nome, cpf, telefone,
 logradouro, numero, bairro, cidade, uf, cep)
VALUES
(1, '0094', 'Manoel Clemente', '12345678901', '84999991111',
 'Rua Principal', '100', 'Centro', 'Arez', 'RN', '59170000'),

(2, '0095', 'Maria Sales', '98765432100', '84999992222',
 'Rua das Flores', '200', 'Centro', 'Arez', 'RN', '59170000'),

(3, '0096', 'Joao Pedro', '11122233344', '84999993333',
 'Rua Nova', '50', 'Zona Rural', 'Arez', 'RN', '59170000'),

(4, '0097', 'Valeria Souza', '89667943211', '84999998897',
 'Rua Principal', '02', 'Centro', 'Arez', 'RN', '59170000'),

(5, '0098', 'Mariana Bezerra', '98723432100', '84999876222',
 'Rua das Flores', '12', 'Centro', 'Arez', 'RN', '59170000');


-- 2. CADASTRO DAS USINAS

INSERT INTO Usina
(idUsina, nomeUsina, cnpj, cidade, telefone)
VALUES
(1, 'Usina Estivas', '12345678000199', 'Arez', '8432221111'),
(2, 'Usina Vale Verde', '98765432000188', 'Arez', '8432222222'),
(3, 'Usina Santa Helena', '11223344000155', 'Arez', '8432223333'),
(4, 'Usina Sao Francisco', '22334455000166', 'Goianinha', '8432224444'),
(5, 'Usina Nova Esperanca', '33445566000177', 'Canguaretama', '8432225555');


-- 3. CADASTRO DOS AGRONOMOS

INSERT INTO Agronomo
(idAgronomo, nome, registroProfissional, telefone)
VALUES
(1, 'Carlos Mendes', 'CREA-RN-12345', '84988881111'),
(2, 'Ana Paula Costa', 'CREA-RN-67890', '84988882222'),
(3, 'Roberto Silva', 'CREA-RN-13579', '84988883333'),
(4, 'Fernanda Lima', 'CREA-RN-24680', '84988884444'),
(5, 'Marcos Oliveira', 'CREA-RN-11223', '84988885555');


-- 4. CADASTRO DOS INSUMOS AGRICOLAS

INSERT INTO Insumo
(idInsumo, nomeInsumo, categoria, descricao,
 unidadeMedida, precoUnitario)
VALUES
(1, 'Fertilizante NPK', 'Fertilizante',
 'Fertilizante para a cultura da cana', 'saco', 150.00),

(2, 'Adubo Organico', 'Adubo',
 'Adubo organico para o solo', 'saco', 80.00),

(3, 'Herbicida', 'Herbicida',
 'Produto para controle de plantas daninhas', 'litro', 120.00),

(4, 'Mudas de Cana', 'Mudas',
 'Mudas para plantio de cana-de-acucar', 'unidade', 200.00),

(5, 'Inseticida', 'Inseticida',
 'Produto para controle de insetos', 'litro', 95.00);


-- =============================================
-- CENARIO 2: PRIMEIRAS ENTREGAS DE CANA
-- =============================================
-- Os produtores iniciaram a entrega da producao
-- nas usinas parceiras da cooperativa.
-- Cada entrega registra data, toneladas e valor pago.

INSERT INTO Entrega_Cana
(idEntrega, dataEntrega, toneladas, valorPago,
 idProdutor, idUsina)
VALUES
(1, '2026-01-15', 100.00, 12000.00, 1, 1),
(2, '2026-02-10', 80.00, 9600.00, 2, 2),
(3, '2026-02-20', 120.00, 14400.00, 3, 3),
(4, '2026-03-05', 90.00, 10800.00, 4, 4),
(5, '2026-03-15', 110.00, 13200.00, 5, 5);


-- =============================================
-- CENARIO 3: CONTRIBUICOES ANUAIS
-- =============================================
-- A cooperativa calculou as contribuicoes anuais
-- dos produtores com base no valor de referencia.
-- O percentual estabelecido foi de 1,5%.
-- Cada produtor possui uma contribuicao em 2026.

INSERT INTO Contribuicao_Anual
(idContribuicao, anoReferencia, valorBase, percentual,
 valorContribuicao, autorizado, dataPagamento,
 statusPagamento, idProdutor, idUsinaRepasse)
VALUES
(1, 2026, 12000.00, 1.50, 180.00, TRUE,
 '2026-03-20', 'PAGO', 1, 1),

(2, 2026, 9600.00, 1.50, 144.00, FALSE,
 NULL, 'PENDENTE', 2, 2),

(3, 2026, 14400.00, 1.50, 216.00, TRUE,
 '2026-03-25', 'PAGO', 3, 3),

(4, 2026, 10800.00, 1.50, 162.00, FALSE,
 NULL, 'PENDENTE', 4, 4),

(5, 2026, 13200.00, 1.50, 198.00, TRUE,
 '2026-04-05', 'PAGO', 5, 5);


-- =============================================
-- CENARIO 4: COMPRAS DE INSUMOS AGRICOLAS
-- =============================================
-- Os produtores realizaram compras de insumos
-- para preparar e cuidar de suas plantacoes.
-- Primeiro registramos as compras e depois
-- os respectivos itens de cada compra.

-- 1. REGISTRO DAS COMPRAS

INSERT INTO Compra
(idCompra, dataCompra, statusCompra, idProdutor)
VALUES
(1, '2026-02-05', 'PAGA', 1),
(2, '2026-02-12', 'PAGA', 2),
(3, '2026-03-01', 'PAGA', 3),
(4, '2026-03-15', 'ABERTA', 4),
(5, '2026-04-01', 'PAGA', 5);


-- 2. ITENS DAS COMPRAS

INSERT INTO Item_Compra
(idCompra, idInsumo, quantidade, precoPraticado)
VALUES
(1, 1, 2.00, 150.00),
(1, 2, 3.00, 80.00),

(2, 3, 2.00, 120.00),
(2, 5, 1.00, 95.00),

(3, 4, 5.00, 200.00),
(3, 1, 2.00, 150.00),

(4, 2, 4.00, 80.00),
(4, 3, 3.00, 120.00),

(5, 5, 2.00, 95.00),
(5, 4, 3.00, 200.00);


-- =============================================
-- CENARIO 5: ASSISTENCIA TECNICA
-- =============================================
-- Os agronomos realizaram visitas aos produtores
-- para avaliar as plantacoes e orientar os associados.
-- Foram registradas observacoes e recomendacoes.

INSERT INTO Visita_Tecnica
(idVisita, dataVisita, observacoes, recomendacoes,
 idProdutor, idAgronomo)
VALUES
(1, '2026-02-15',
 'Plantio com desenvolvimento irregular',
 'Realizar analise do solo e corrigir a adubacao',
 1, 1),

(2, '2026-02-20',
 'Presenca de pragas na plantacao',
 'Aplicar controle adequado de pragas',
 2, 2),

(3, '2026-03-10',
 'Necessidade de melhorar a irrigacao',
 'Revisar o sistema de irrigacao',
 3, 3),

(4, '2026-03-20',
 'Solo com baixa fertilidade',
 'Realizar adubacao conforme analise do solo',
 4, 4),

(5, '2026-04-10',
 'Plantacao em fase de crescimento',
 'Acompanhar o desenvolvimento da cultura',
 5, 5);


-- =============================================
-- FIM DO SCRIPT DML
-- =============================================
