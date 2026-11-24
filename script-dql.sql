
-- =============================================
-- SISTEMA DE GESTAO DA COOPERATIVA DE CANA
-- ARQUIVO: script-dql.sql
-- DQL - CONSULTAS AO BANCO DE DADOS
-- =============================================

USE SistemaCooperativa;

-- =============================================
-- CONSULTA 1: DADOS DOS PRODUTORES
-- =============================================

SELECT
    idProdutor,
    nome,
    cpf,
    cidade
FROM Produtor;


-- =============================================
-- CONSULTA 2: ENTREGAS DE CANA COM JOIN
-- =============================================
-- Mostra o produtor, a usina e os dados da entrega.

SELECT
    p.nome AS Produtor,
    u.nomeUsina AS Usina,
    e.dataEntrega AS Data,
    e.toneladas AS Toneladas,
    e.valorPago AS Valor_Pago
FROM Entrega_Cana e
INNER JOIN Produtor p
    ON e.idProdutor = p.idProdutor
INNER JOIN Usina u
    ON e.idUsina = u.idUsina
ORDER BY e.dataEntrega;


-- =============================================
-- CONSULTA 3: TOTAL RECEBIDO POR PRODUTOR
-- =============================================
-- Soma as toneladas e os valores recebidos.

SELECT
    p.nome AS Produtor,
    SUM(e.toneladas) AS Total_Toneladas,
    SUM(e.valorPago) AS Total_Recebido
FROM Produtor p
INNER JOIN Entrega_Cana e
    ON p.idProdutor = e.idProdutor
GROUP BY p.idProdutor, p.nome;


-- =============================================
-- CONSULTA 4: CONTRIBUICOES ANUAIS
-- =============================================

SELECT
    p.nome AS Produtor,
    c.anoReferencia AS Ano,
    c.percentual AS Percentual,
    c.valorContribuicao AS Valor,
    c.statusPagamento AS Situacao
FROM Contribuicao_Anual c
INNER JOIN Produtor p
    ON c.idProdutor = p.idProdutor;


-- =============================================
-- CONSULTA 5: COMPRAS E SEUS ITENS
-- =============================================
-- Mostra os insumos adquiridos por cada produtor
-- e calcula o subtotal de cada item.

SELECT
    c.idCompra AS Compra,
    c.dataCompra AS Data,
    p.nome AS Produtor,
    i.nomeInsumo AS Insumo,
    item.quantidade AS Quantidade,
    item.precoPraticado AS Preco_Unitario,
    (item.quantidade * item.precoPraticado) AS Subtotal
FROM Compra c
INNER JOIN Produtor p
    ON c.idProdutor = p.idProdutor
INNER JOIN Item_Compra item
    ON c.idCompra = item.idCompra
INNER JOIN Insumo i
    ON item.idInsumo = i.idInsumo
ORDER BY c.idCompra;


-- =============================================
-- CONSULTA 6: TOTAL GASTO POR PRODUTOR
-- =============================================

SELECT
    p.nome AS Produtor,
    SUM(item.quantidade * item.precoPraticado) AS Total_Gasto
FROM Produtor p
INNER JOIN Compra c
    ON p.idProdutor = c.idProdutor
INNER JOIN Item_Compra item
    ON c.idCompra = item.idCompra
GROUP BY p.idProdutor, p.nome;


-- =============================================
-- CONSULTA 7: VISITAS TECNICAS
-- =============================================

SELECT
    p.nome AS Produtor,
    a.nome AS Agronomo,
    v.dataVisita AS Data_Visita,
    v.observacoes AS Observacoes,
    v.recomendacoes AS Recomendacoes
FROM Visita_Tecnica v
INNER JOIN Produtor p
    ON v.idProdutor = p.idProdutor
INNER JOIN Agronomo a
    ON v.idAgronomo = a.idAgronomo
ORDER BY v.dataVisita;


-- =============================================
-- CONSULTA 8: CONFERENCIA DOS REGISTROS
-- =============================================
-- Verifica a quantidade de registros em cada tabela.

SELECT 'Produtor' AS Tabela, COUNT(*) AS Quantidade FROM Produtor
UNION ALL
SELECT 'Usina', COUNT(*) FROM Usina
UNION ALL
SELECT 'Entrega_Cana', COUNT(*) FROM Entrega_Cana
UNION ALL
SELECT 'Contribuicao_Anual', COUNT(*) FROM Contribuicao_Anual
UNION ALL
SELECT 'Insumo', COUNT(*) FROM Insumo
UNION ALL
SELECT 'Compra', COUNT(*) FROM Compra
UNION ALL
SELECT 'Item_Compra', COUNT(*) FROM Item_Compra
UNION ALL
SELECT 'Agronomo', COUNT(*) FROM Agronomo
UNION ALL
SELECT 'Visita_Tecnica', COUNT(*) FROM Visita_Tecnica;


-- =============================================
-- FIM DO SCRIPT DQL
-- =============================================
