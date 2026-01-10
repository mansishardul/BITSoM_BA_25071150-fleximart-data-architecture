## part3- datawarehouse
This section include understanding of star schema and benefits of it.<br>
+ Star schema is important because it simplifies data analysis, improves query performance, and supports efficient OLAP reporting for large historical datasets.<br>
+ Star schemas are ideal for OLAP (Online Analytical Processing) operations such as drill-down, roll-up, slice, and dice. For example, users can analyze sales by year, then drill down to quarter and month using the date dimension.

Tools Used:
1.mysql workbench

## Steps
+ Creation of new database as: fleximart_dw
+ Creation of 4 tables: dim_date, dim_product, dim_customer,fact_sales
+ Insertion of data according to no of records and guidlines given in requirment.
+ Perform OLAP queries over data

Query 1:
<img width="1000" height="600" alt="image" src="https://github.com/user-attachments/assets/3ec23034-4a9d-4431-8d9d-76ef2a5c31b9" />

Query 2:
<img width="1000" height="600" alt="image" src="https://github.com/user-attachments/assets/c36db4a9-fe77-4017-9df7-5c1e8d2dee94" />

Query3:
<img width="1000" height="600" alt="image" src="https://github.com/user-attachments/assets/d78a3452-a8af-4735-a0a3-eedac57c9208" />
