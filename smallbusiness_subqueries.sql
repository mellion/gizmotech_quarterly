--Find the total sales for the top  best-selling products
SELECT p.prod_name, SUM(oi.quantity) AS total_units_sold, SUM(oi.item_price * oi.quantity) AS total_sales
FROM products AS p
JOIN order_items AS oi ON p.prod_id = oi.prod_id
WHERE p.prod_id IN (
  SELECT prod_id
  FROM order_items
  GROUP BY prod_id
  ORDER BY SUM(quantity) DESC
  LIMIT 5
)
GROUP BY p.prod_name
ORDER BY total_sales DESC;



-- List all customers who have placed an order in a specific marketing campaign
SELECT DISTINCT c.cust_id, c.cust_name, c.cust_email
FROM customers AS c
JOIN sales_orders AS o ON c.cust_id = o.cust_id
WHERE o.order_id IN (
  SELECT oi.order_id
  FROM order_items AS oi
  JOIN campaign_products AS cp ON oi.prod_id = cp.prod_id
  WHERE cp.campaign_id = (
    SELECT campaign_id
    FROM marketing_campaigns
    WHERE campaign_name = 'Holiday Sale'
  )
)
ORDER BY c.cust_name;




--Get the average order amount for each product category
SELECT pc.cat_name, AVG(order_total) AS avg_order_amount
FROM product_categories AS pc
JOIN (
  SELECT p.prod_category_id, o.order_id, o.total_amount AS order_total
  FROM sales_orders AS o
  JOIN order_items AS oi ON o.order_id = oi.order_id
  JOIN products AS p ON oi.prod_id = p.prod_id
) AS subquery ON pc.cat_id = subquery.prod_category_id
GROUP BY pc.cat_name
ORDER BY avg_order_amount DESC;