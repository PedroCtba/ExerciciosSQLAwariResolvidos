-- 1.	Crie os índices apropriadaos para as atbelas do nosso modelo de dados com o intuito de melhorar a performance.
CREATE INDEX idx_customers_orders ON olist_orders_dataset(customer_id);
CREATE INDEX idx_customers_customers ON olist_customers_dataset(customer_id);
CREATE INDEX idx_zipcode_geolocation ON olist_geolocation_dataset(geolocation_zip_code_prefix);
CREATE INDEX idx_ordenitems ON olist_order_items_dataset(order_id);
CREATE INDEX idx_ordenitems_prooduct_id ON olist_order_items_dataset(product_id);
CREATE INDEX idx_ordenitems_sller_id ON olist_order_items_dataset(seller_id);
CREATE INDEX idx_order_id_payments ON olist_order_payments_dataset(order_id);
CREATE INDEX idx_olist_oder_id_reviews ON olist_order_reviews_dataset(review_id);
CREATE INDEX idx_olist_product_id ON olist_products_dataset(product_id);
CREATE INDEX idx_olist_seller_id ON olist_sellers_dataset(seller_id);
