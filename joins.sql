--Scenario 1: Retrieve a list of all orders along with their customer information and the total order amount


SELECT o.order_id, c.cust_name, c.cust_email, o.order_date, o.total_amount
FROM sales_orders AS o
JOIN customers AS c ON o.cust_id = c.cust_id
ORDER BY o.order_date;

/*Purpose: This query uses an INNER JOIN to retrieve order details along with customer information from the sales_orders and customers tables. This can be useful to analyze order history, customer purchase patterns, or to generate a report for customer service or sales analysis.*/






--Scenario 2: List all the products featured in a specific marketing campaign along with their category information


SELECT p.prod_name, pc.cat_name, cp.featured_position
FROM campaign_products AS cp
JOIN marketing_campaigns AS mc ON cp.campaign_id = mc.campaign_id
JOIN products AS p ON cp.prod_id = p.prod_id
JOIN product_categories AS pc ON p.prod_category_id = pc.cat_id
WHERE mc.campaign_name = 'Holiday Sale'
ORDER BY cp.featured_position;

/*Purpose: This query uses multiple INNER JOINs to retrieve product and category information for all products featured in a specific marketing campaign. This can help the marketing team analyze which products were promoted and how they were positioned within the campaign.*/





--Scenario 3: Find the total revenue for each product category in a given quarter


SELECT pc.cat_name, SUM(oi.item_price * oi.quantity) AS total_revenue
FROM order_items AS oi
JOIN sales_orders AS o ON oi.order_id = o.order_id
JOIN products AS p ON oi.prod_id = p.prod_id
JOIN product_categories AS pc ON p.prod_category_id = pc.cat_id
WHERE EXTRACT(QUARTER FROM o.order_date) = 4 AND EXTRACT(YEAR FROM o.order_date) = 2022
GROUP BY pc.cat_name
ORDER BY total_revenue DESC;

/*Purpose: This query uses INNER JOINs to calculate the total revenue for each product category within a specific quarter. This can help the company analyze the performance of different product categories and identify the most and least profitable categories during that quarter.*/