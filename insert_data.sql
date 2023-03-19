--Populate the product_categories table
INSERT INTO product_categories (cat_name, cat_description)
VALUES ('Electronics', 'Consumer electronics products'),
       ('Furniture', 'Home and office furniture'),
       ('Clothing', 'Apparel for men, women, and children'),
       ('Toys', 'Toys and games for kids of all ages');


--Populate the products table
INSERT INTO products (prod_name, prod_description, prod_category_id, prod_price, prod_sku, prod_stock)
VALUES ('Smartphone', 'Latest model with advanced features', 1, 699.99, 'SP-12345', 100),
       ('Laptop', 'High-performance laptop for professionals', 1, 1199.99, 'LP-54321', 50),
       ('Sofa', 'Comfortable 3-seater sofa', 2, 899.99, 'SF-11223', 25),
       ('T-shirt', 'Cotton t-shirt in various sizes and colors', 3, 19.99, 'TS-33221', 200),
       ('Action Figure', 'Collectible action figure', 4, 29.99, 'AF-99876', 80);


--Populate the customers table
INSERT INTO customers (cust_name, cust_email, cust_phone, cust_address, cust_city, cust_state, cust_country, cust_zip)
VALUES ('John Doe', 'john.doe@example.com', '555-1234', '123 Main St', 'New York', 'NY', 'USA', '10001'),
       ('Jane Smith', 'jane.smith@example.com', '555-5678', '456 Elm St', 'Los Angeles', 'CA', 'USA', '90001');

--Populate the sales_orders table
INSERT INTO sales_orders (cust_id, order_date, total_amount, order_status, shipping_method, payment_method)
VALUES (1, '2022-12-01', 719.98, 'Shipped', 'UPS Ground', 'Credit Card'),
       (2, '2022-12-05', 49.99, 'Processing', 'FedEx 2Day', 'PayPal');

--Populate the order_items table
INSERT INTO order_items (order_id, prod_id, quantity, item_price, item_discount)
VALUES (1, 1, 1, 699.99, 0.0),
       (1, 5, 1, 29.99, 10.0),
       (2, 4, 1, 19.99, 0.0);

--Populate the marketing_campaigns table
INSERT INTO marketing_campaigns (campaign_name, campaign_description, start_date, end_date, campaign_budget, campaign_channel, campaign_objective)
VALUES ('Holiday Sale', 'Special discounts for the holiday season', '2022-11-25', '2022-12-31', 5000.00, 'Social Media', 'Increase Sales');

--Populate the campaign_products table
INSERT INTO campaign_products (campaign_id, prod_id, featured_position)
VALUES (1, 1, 'Top'),
       (1, 3, 'Highlighted');
