-- 1.Crie uma view (SELLER_STATS) para mostrar por fornecedor, 
-- a quantidade de itens enviados, 
-- o tempo médio de postagem após a aprovação da compra, 
-- dade total de pedidos de cada Fornecedor, 
-- note que trabalharemos na mesma query com 2 granularidades diferentes.

-- O exercicio parece pedir isso
CREATE VIEW SELLER_STATS_1 AS
SELECT
ORDENSITENS.seller_id AS ID_VENDEDOR, 
AVG(julianday(ORDENS.order_delivered_customer_date)-(julianday(ORDENS.order_approved_at))) OVER() AS TEMPO_MEDIO_POSTAGEM, 
COUNT(ORDENS.order_approved_at) AS NUMERO_DE_PEDIDOS_ENVIADOS,
COUNT(ORDENSITENS.order_id) AS NUMERO_DE_PEDIDOS_RECEBIDOS
FROM olist_order_items_dataset ORDENSITENS
INNER JOIN olist_orders_dataset ORDENS ON ORDENSITENS.order_id = ORDENS.order_id
GROUP BY ORDENSITENS.seller_id;

SELECT * FROM SELLER_STATS_1;

-- Mas eu achei que isso fazia bem mais sentido

CREATE VIEW SELLER_STATS_2 AS
SELECT
ORDENSITENS.seller_id AS ID_VENDEDOR, 
AVG(julianday(ORDENS.order_delivered_customer_date)-(julianday(ORDENS.order_approved_at))) AS TEMPO_MEDIO_POSTAGEM, 
COUNT(ORDENS.order_approved_at) AS NUMERO_DE_PEDIDOS_ENVIADOS,
COUNT(ORDENSITENS.order_id) AS NUMERO_DE_PEDIDOS_RECEBIDOS
FROM olist_order_items_dataset ORDENSITENS
INNER JOIN olist_orders_dataset ORDENS ON ORDENSITENS.order_id = ORDENS.order_id
GROUP BY ORDENSITENS.seller_id;

SELECT * FROM SELLER_STATS_2;
