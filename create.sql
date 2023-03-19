/*Create the create database
Open pgAdmin 4.
In the Browser panel on the left side, expand the Servers node, then expand your PostgreSQL server node.
Right-click on the Databases node, and then click on Create > Database.
In the Create - Database dialog box, enter the name of the new database, e.g., my_company_db, and click Save.
*/

--Create product categories table
CREATE TABLE product_categories (
    cat_id SERIAL PRIMARY KEY,
    cat_name VARCHAR(255) NOT NULL,
    cat_description VARCHAR(255)
);



--Create products table
CREATE TABLE products (
    prod_id SERIAL PRIMARY KEY,
    prod_name VARCHAR(255) NOT NULL,
    prod_description VARCHAR(255),
    prod_category_id INTEGER REFERENCES product_categories(cat_id),
    prod_price DECIMAL(10, 2) NOT NULL,
    prod_sku VARCHAR(255) NOT NULL,
    prod_stock INTEGER NOT NULL
);




--Create customers table
CREATE TABLE customers (
    cust_id SERIAL PRIMARY KEY,
    cust_name VARCHAR(255) NOT NULL,
    cust_email VARCHAR(255) UNIQUE NOT NULL,
    cust_phone VARCHAR(50),
    cust_address VARCHAR(255),
    cust_city VARCHAR(255),
    cust_state VARCHAR(255),
    cust_country VARCHAR(255),
    cust_zip VARCHAR(20)
);



--Create sales order table
CREATE TABLE sales_orders (
    order_id SERIAL PRIMARY KEY,
    cust_id INTEGER REFERENCES customers(cust_id),
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    order_status VARCHAR(255) NOT NULL,
    shipping_method VARCHAR(255),
    payment_method VARCHAR(255)
);




--Create order items table
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES sales_orders(order_id),
    prod_id INTEGER REFERENCES products(prod_id),
    quantity INTEGER NOT NULL,
    item_price DECIMAL(10, 2) NOT NULL,
    item_discount DECIMAL(10, 2) NOT NULL
);




--Create marketing campaign table
CREATE TABLE marketing_campaigns (
    campaign_id SERIAL PRIMARY KEY,
    campaign_name VARCHAR(255) NOT NULL,
    campaign_description VARCHAR(255),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    campaign_budget DECIMAL(10, 2) NOT NULL,
    campaign_channel VARCHAR(255) NOT NULL,
    campaign_objective VARCHAR(255) NOT NULL
);



--Create campaign products table
CREATE TABLE campaign_products (
    camp_prod_id SERIAL PRIMARY KEY,
    campaign_id INTEGER REFERENCES marketing_campaigns(campaign_id),
    prod_id INTEGER REFERENCES products(prod_id),
    featured_position VARCHAR(255)
);



