-- 1.Selecione os dados da tabela de pagamentos onde só apareçam os tipos de pagamento “VOUCHER” e “BOLETO”.

SELECT 
* 
FROM 
'olist_order_payments_dataset'
WHERE payment_type = 'voucher' or payment_type = 'boleto'

--2 .Retorne os campos da tabela de produtos e calcule o volume de cada produto em um novo campo.

SELECT
*,
ROUND(((product_length_cm * product_width_cm)* product_height_cm*1/3),2) `volume`
FROM 
olist_products_dataset AS P

-- 3.Retorne somente os reviews que não tem comentários.

SELECT
*
FROM 
olist_order_reviews_dataset
WHERE review_comment_message is null

-- 4.Retorne pedidos que foram feitos somente no ano de 2017.

SELECT 
* 
FROM 
olist_orders_dataset
WHERE order_approved_at BETWEEN 2017-01-01 AND 2017-12-31

-- 5.Encontre os clientes do estado de SP e que não morem na cidade de São Paulo.

SELECT  
*  
FROM 
olist_customers_dataset 
WHERE  customer_state = 'SP'  AND customer_city != 'sao paulo'







