Which customer spent more money?
--Join customers table with sales_orders table
SELECT customers.cust_name, total_amount
FROM customers
JOIN sales_orders ON customers.cust_id = sales_orders.cust_id;


Which items did the highest spending customer purchase?
--Join order_items with products
SELECT *
FROM order_items
JOIN products ON order_items.prod_id = products.prod_id;

When was the most recent purchase?
--Select the date column and customer ID from sales_order table
SELECT cust_id, order_date
FROM sales_orders
ORDER BY order_date DESC;

Did the purchases happen during a marketing campaign?
--Join relevant tables and filter the date
SELECT sales_orders.order_id, sales_orders.order_date, marketing_campaigns.campaign_id, marketing_campaigns.campaign_name, products.prod_id, products.prod_name
FROM marketing_campaigns
JOIN campaign_products ON marketing_campaigns.campaign_id = campaign_products.campaign_id
JOIN products ON campaign_products.prod_id = products.prod_id
JOIN order_items ON products.prod_id = order_items.prod_id
JOIN sales_orders ON order_items.order_id = sales_orders.order_id
WHERE sales_orders.order_date BETWEEN marketing_campaigns.start_date AND marketing_campaigns.end_date;




