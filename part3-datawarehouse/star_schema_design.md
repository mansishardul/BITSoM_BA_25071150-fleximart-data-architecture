**Schema Overview**   
FACT TABLE: **fact\_sales**

Grain: One row per product per order line item  
Business Process: Sales transactions

**Measures**:

* quantity\_sold: Units sold  
 
* unit\_price: Product price at sale time  
  
* discount\_amount: Discount applied  
  
* total\_amount: quantity × unit\_price − discount

**Foreign Keys**:

* date\_key → dim\_date  
  
* product\_key → dim\_product  
  
* customer\_key → dim\_customer  
 
* DIMENSION TABLE: dim\_date

Purpose: Time-based analysis  
Type: Conformed dimension

**Attributes:**

* date\_key (PK): Surrogate key (YYYYMMDD)   
* full\_date  
* day\_of\_week  
* day\_of\_month   
* month      
* month\_name   
* quarter      
* year  
* is\_weekend

DIMENSION TABLE: **dim\_product**

Purpose: Product analysis

**Attributes:**

* product\_key (PK): Surrogate key    
* product\_id: Business product code     
* product\_name     
* category    
* subcategory    
* unit\_price

DIMENSION TABLE: **dim\_customer**

Purpose: Customer behavior analysis

**Attributes**:

* customer\_key (PK): Surrogate key  
* customer\_id  
* customer\_name  
* city  
* state  
* customer\_segment

**Design Decisions**

The star schema is designed at the transaction line-item granularity to capture detailed sales behavior. Each row in the fact table represents a single product sold in an order, enabling accurate aggregation at daily, monthly, product, or customer levels. This granularity supports flexible analysis such as product performance, customer spending patterns, and time-based trends.

Surrogate keys are used instead of natural keys to improve performance and ensure historical accuracy. Business keys like product\_id or customer\_id may change over time, whereas surrogate keys remain stable. This also simplifies joins and improves query efficiency in analytical workloads.

The design supports drill-down and roll-up operations through well-structured dimensions. Analysts can roll up sales from daily to monthly or yearly using the date dimension, or drill down from category to individual products using the product dimension. This structure aligns with dimensional modeling best practices and supports scalable OLAP reporting.  
