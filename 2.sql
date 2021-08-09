-- 1.Retorne a quantidade de itens vendidos em cada categoria por estado em que o cliente se encontra, mostrando somente categorias que tenham vendido uma quantidade de items acima de 1000.

SELECT
CUS.customer_state AS ESTADO,
PROD.product_category_name AS CATEGORIA,
COUNT(1) as CONTAGEM
FROM
olist_customers_dataset CUS
LEFT JOIN olist_orders_dataset ORD ON CUS.customer_id = ORD.customer_id
LEFT JOIN olist_order_items_dataset ORDI ON ORD.order_id = ORDI.order_id
LEFT JOIN olist_products_dataset PROD ON ORDI.product_id = PROD.product_id
GROUP BY PROD.product_category_name, CUS.customer_state
HAVING COUNT(PROD.product_category_name) > 1000

--2.mostre os 5 clientes (customer_id) que gastaram mais dinheiro em compras, qual foi o valor total de todas as compras deles, quantidade de compras, e valor médio gasto por compras. Ordene os mesmos por ordem decrescente pela média do valor de compra.

SELECT 
ORDENS.customer_id, 
ORDENS.order_status, 
(SUM(PAGAMENTOS.payment_value)/COUNT(ORDENS.order_status)) AS MEDIACADAPEDIDO, 
SUM(PAGAMENTOS.payment_value) AS SOMA, 
COUNT(ORDENS.order_status) AS PEDIDOS 
FROM olist_orders_dataset ORDENS 

--3.mostre o valor vendido total de cada vendedor (seller_id) em cada uma das categorias de produtos, somente retornando os vendedores que nesse somatório e agrupamento venderam mais de $1000. Desejamos ver a categoria do produto e os vendedores. Para cada uma dessas categorias, mostre seus valores de venda de forma decrescente.

SELECT 
seller_id AS VENDEDOR, 
product_category_name AS CATEGORIA, 
ROUND(SUM(price),0) AS TOTALVENDAS
FROM olist_order_items_dataset ORDENS 
INNER JOIN olist_products_dataset PRODUTOS ON ORDENS.product_id = PRODUTOS.product_id
GROUP BY seller_id HAVING TOTALVENDAS > 1000
ORDER BY TOTALVENDAS DESC
