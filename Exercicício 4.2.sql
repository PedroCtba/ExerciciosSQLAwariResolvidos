SELECT
CLIENTES,
ANTERIOR,
ULTIMO_PEDIDO,
(ULTIMO_PEDIDO * 0.10) AS DESCONTO
FROM
(
	SELECT
	CLIENTES.customer_unique_id AS CLIENTES,
	ORDENS.order_id,
	payment_value AS ULTIMO_PEDIDO,
	LAG(payment_value, 1, 0) OVER(PARTITION BY CLIENTES.customer_unique_id) AS ANTERIOR
	FROM  olist_orders_dataset ORDENS
	LEFT JOIN olist_order_payments_dataset PAGAMENTOS ON ORDENS.order_id = PAGAMENTOS.order_id
	LEFT JOIN olist_customers_dataset CLIENTES ON ORDENS.customer_id = CLIENTES.customer_id
)
WHERE ANTERIOR > ULTIMO_PEDIDO
ORDER BY CLIENTES