##Part 1- Database-etl ##
This section includes etl process where data needs to be extracted from csv files, transform it by cleaning and formatting the data and loading into database.
Tools used:
1.Jupyter notebook for python scripting.
2.Mysql workbench for sql operation.

Steps:
Creation of python script which includes logic to load csv data and perform various operation acoording to data types like formatting dates, modifying data type of primary key attribute from int to varchar, handelling null values etc.
Afterwards data needs to be inserted into database where i have created 4 tables:
1.customer
2.Products
3.Orders
4.Order_items

Data need to be inserted respective to tables. 

Note: I have created one more table named 'sales' to keep transactional/buisiness raw data,
Since the provided sales CSV contains transaction-level data with product details and string-based IDs, I designed a sales table to match the source structure and ensure successful ETL loading. Normalization into orders and order_items can be done as a downstream process.”

Buisiness queries results:
<img width="1000" height="600" alt="image" src="https://github.com/user-attachments/assets/9e9ba627-f408-4776-b68f-40ff93513af0" />
<img width="1000" height="600" alt="image" src="https://github.com/user-attachments/assets/22e541b0-5417-41f3-a6e1-833644619176" />
<img width="1000" height="600" alt="image" src="https://github.com/user-attachments/assets/ed58c72f-26c8-4cd9-95fd-43bde608a573" />


