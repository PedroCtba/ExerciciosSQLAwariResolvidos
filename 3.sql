-- 1.	Crie uma tabela analítica de todos os itens que foram vendidos, mostrando somente pedidos interestaduais. Queremos saber quantos dias os fornecedores demoram para postar o produto, se o produto chegou ou não no prazo.

SELECT
SEL.seller_state,
ROUND(JULIANDAY(ORD.order_delivered_carrier_date) - JULIANDAY(ORD.order_approved_at),2) 'POSTAGEM',
ROUND(JULIANDAY(ORD.order_estimated_delivery_date) - JULIANDAY(ORD.order_approved_at),2) 'ESTIMATIVA',
ROUND(JULIANDAY(ORD.order_delivered_customer_date) - JULIANDAY(ORD.order_approved_at),2) 'PRAZO_CUMPRIDO',
CUS.customer_state,
ORDI.order_id
FROM
olist_order_items_dataset ORDI
INNER JOIN olist_sellers_dataset SEL ON ORDI.seller_id = SEL.seller_id
INNER JOIN olist_orders_dataset ORD ON ORDI.order_id= ORD.order_id
INNER JOIN olist_customers_dataset CUS ON ORD.customer_id = CUS.customer_id
WHERE CUS.customer_state != SEL.seller_state

-- 2.	retorne todos os pagamentos do cliente, com suas datas de aprovação, valor da compra e o valor total que o cliente já gastou em todas as suas compras, mostrando somente os clientes onde o valor da compra é diferente do valor total já gasto.

SELECT
ORD.customer_id,
count(ORD.customer_id) as N_COMPRAS,
ORDI.price,
ROUND(SUM(ORDI.price),2) AS SOMA
FROM 
olist_orders_dataset ORD
LEFT JOIN olist_order_items_dataset ORDI ON ORD.order_id = ORDI.order_id
GROUP BY ORD.customer_id HAVING count(ORD.customer_id) > 1
ORDER BY ORD.customer_id LIMIT 5

-- 3.retorne as categorias válidas, suas somas totais dos valores de vendas, um ranqueamento de maior valor para menor valor junto com o somatório acumulado dos valores pela mesma regra do ranqueamento.

SELECT
product_category_name as CATEGORIA,
ROUND(SUM(ORDI.price),2) AS SOMA,
ROUND(AVG(ORDI.price),2) AS MEDIA
FROM
olist_products_dataset PROD
INNER JOIN olist_order_items_dataset ORDI ON ORDI.product_id = PROD.product_id
GROUP BY product_category_name
ORDER BY SUM(ORDI.price) DESC





