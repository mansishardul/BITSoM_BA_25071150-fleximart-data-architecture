INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,false),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,false),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,false),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,false),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,false),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,true),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,true),
(20240108,'2024-01-08','Monday',8,1,'January','Q1',2024,false),
(20240109,'2024-01-09','Tuesday',9,1,'January','Q1',2024,false),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,false),
(20240111,'2024-01-11','Thursday',11,1,'January','Q1',2024,false),
(20240112,'2024-01-12','Friday',12,1,'January','Q1',2024,false),
(20240113,'2024-01-13','Saturday',13,1,'January','Q1',2024,true),
(20240114,'2024-01-14','Sunday',14,1,'January','Q1',2024,true),
(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,false),

(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,false),
(20240202,'2024-02-02','Friday',2,2,'February','Q1',2024,false),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,true),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,true),
(20240205,'2024-02-05','Monday',5,2,'February','Q1',2024,false),
(20240206,'2024-02-06','Tuesday',6,2,'February','Q1',2024,false),
(20240207,'2024-02-07','Wednesday',7,2,'February','Q1',2024,false),
(20240208,'2024-02-08','Thursday',8,2,'February','Q1',2024,false),
(20240209,'2024-02-09','Friday',9,2,'February','Q1',2024,false),
(20240210,'2024-02-10','Saturday',10,2,'February','Q1',2024,true),
(20240211,'2024-02-11','Sunday',11,2,'February','Q1',2024,true),
(20240212,'2024-02-12','Monday',12,2,'February','Q1',2024,false),
(20240213,'2024-02-13','Tuesday',13,2,'February','Q1',2024,false),
(20240214,'2024-02-14','Wednesday',14,2,'February','Q1',2024,false),
(20240215,'2024-02-15','Thursday',15,2,'February','Q1',2024,false);


select * from dim_date;


INSERT INTO dim_product (product_id, product_name, category, subcategory, unit_price) VALUES
('P001','Laptop Pro','Electronics','Computers',75000),
('P002','Smartphone X','Electronics','Mobiles',45000),
('P003','Bluetooth Headphones','Electronics','Accessories',8000),
('P004','Smart TV','Electronics','Television',60000),
('P005','Tablet','Electronics','Tablets',30000),

('P006','Running Shoes','Fashion','Footwear',5000),
('P007','Leather Jacket','Fashion','Clothing',12000),
('P008','Jeans','Fashion','Clothing',3500),
('P009','Sneakers','Fashion','Footwear',4500),
('P010','T-Shirt','Fashion','Clothing',1500),

('P011','Office Chair','Home','Furniture',10000),
('P012','Dining Table','Home','Furniture',45000),
('P013','Bed Lamp','Home','Lighting',2500),
('P014','Sofa Set','Home','Furniture',85000),
('P015','Wall Clock','Home','Decor',1800);

select * from dim_product;

INSERT INTO dim_customer (customer_id, customer_name, city, state, customer_segment) VALUES
('C001','Amit Sharma','Mumbai','MH','Retail'),
('C002','Neha Verma','Mumbai','MH','Retail'),
('C003','Rahul Mehta','Delhi','DL','Corporate'),
('C004','Priya Singh','Delhi','DL','Retail'),
('C005','Ankit Jain','Bangalore','KA','Corporate'),
('C006','Sneha Rao','Bangalore','KA','Retail'),
('C007','Rohit Patil','Pune','MH','Retail'),
('C008','Kavita Deshmukh','Pune','MH','Retail'),
('C009','Suresh Iyer','Mumbai','MH','Corporate'),
('C010','Pooja Nair','Bangalore','KA','Retail'),
('C011','Vikas Malhotra','Delhi','DL','Corporate'),
('C012','Manish Kulkarni','Pune','MH','Retail');

select * from dim_customer;


INSERT INTO fact_sales
(date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount)
VALUES
(20240101,1,1,1,75000,5000,70000),
(20240102,2,2,2,45000,0,90000),
(20240103,3,3,3,8000,0,24000),
(20240104,4,4,1,60000,3000,57000),
(20240105,5,5,2,30000,0,60000),

(20240106,6,6,4,5000,0,20000),
(20240107,7,7,3,12000,2000,34000),
(20240108,8,8,2,3500,0,7000),
(20240109,9,9,1,4500,0,4500),
(20240110,10,10,5,1500,0,7500),

(20240111,11,11,1,10000,0,10000),
(20240112,12,12,1,45000,5000,40000),
(20240113,13,1,4,2500,0,10000),
(20240114,14,2,1,85000,10000,75000),
(20240115,15,3,3,1800,0,5400),

(20240201,1,4,2,75000,5000,145000),
(20240202,2,5,1,45000,0,45000),
(20240203,3,6,5,8000,0,40000),
(20240204,4,7,2,60000,6000,114000),
(20240205,5,8,3,30000,0,90000),

(20240206,6,9,4,5000,0,20000),
(20240207,7,10,2,12000,0,24000),
(20240208,8,11,3,3500,0,10500),
(20240209,9,12,1,4500,0,4500),
(20240210,10,1,6,1500,0,9000),

(20240211,11,2,2,10000,0,20000),
(20240212,12,3,1,45000,0,45000),
(20240213,13,4,5,2500,0,12500),
(20240214,14,5,1,85000,5000,80000),
(20240215,15,6,4,1800,0,7200),

(20240106,1,7,1,75000,0,75000),
(20240107,2,8,2,45000,0,90000),
(20240113,3,9,4,8000,0,32000),
(20240114,4,10,1,60000,5000,55000),
(20240203,5,11,3,30000,0,90000),
(20240204,6,12,5,5000,0,25000),
(20240210,7,1,2,12000,0,24000),
(20240211,8,2,3,3500,0,10500),
(20240214,9,3,1,4500,0,4500),
(20240215,10,4,6,1500,0,9000);

select * from fact_sales;