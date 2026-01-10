# BITSoM_BA_25071150-fleximart-data-architecture
# FlexiMart Data Architecture Project

**Student Name:** Mansi Parag Shardul
**Student ID:** bitsom_ba_25071150
**Email:** mansishardul@gmail.com
**Date:** 06/01/26

## Project Overview

This project implements an end-to-end data architecture solution for FlexiMart, covering transactional data processing, NoSQL analysis, and data warehousing. 
It includes an ETL pipeline to clean and load operational data into MySQL, a MongoDB-based product catalog analysis for handling semi-structured data, 
and a star-schema data warehouse to support analytical and OLAP queries.

## Repository Structure
├── part1-database-etl/
│   ├── etl_pipeline.py
│   ├── schema_documentation.md
│   ├── business_queries.sql
│   └── data_quality_report.txt
├── part2-nosql/
│   ├── nosql_analysis.md
│   ├── mongodb_operations.js
│   └── products_catalog.json
├── part3-datawarehouse/
│   ├── star_schema_design.md
│   ├── warehouse_schema.sql
│   ├── warehouse_data.sql
│   └── analytics_queries.sql
└── README.md

## Technologies Used

- Python 3.x, pandas, mysql-connector-python,Anaconda
- MySQL 8.0 (mysql workbench)
- MongoDB 6.0 (mondodb compass and mongosh)

## Setup Instructions

### Database Setup

```bash
# Create databases
Used mysql workbench for creation of database and further operations for same:
CREATE DATABASE IF NOT EXISTS fleximart;
USE fleximart;

CREATE DATABASE IF NOT EXISTS fleximart_dw;
USE fleximart_dw;

# Run Part 1 - ETL Pipeline
python part1-database-etl/etl_pipeline.py //This python script will load the input csv and transform it (cleaning and formatting) and load into database respective tables.

# Run Part 1 - Business Queries
 create sql file with buisiness operation queries into business_queries.sql  //this can be run in mysql workbench only

# Run Part 3 - Data Warehouse
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_schema.sql  /this can be run in mysql workbench only
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_data.sql /this can be run in mysql workbench only
mysql -u root -p fleximart_dw < part3-datawarehouse/analytics_queries.sql /this can be run in mysql workbench only


### MongoDB Setup
// Download and install mondodb server which includes mongo shell and mongodb compass for GUI and perform nosql operations.
mongosh < part2-nosql/mongodb_operations.js

## Key Learnings

1. Gained hands-on experience building an ETL pipeline with Python(jupyter notebook)and MySQL, including data cleaning, deduplication, and data quality reporting.

2. Understood the differences between relational and NoSQL databases and how MongoDB handles flexible schemas and nested data.

3. Learned dimensional modeling concepts by designing and implementing a star schema for analytical reporting.

4. Practiced writing complex SQL queries for business intelligence and OLAP analysis.

## Challenges Faced

1. Handling inconsistent and missing data in CSV files
Solution: Implemented robust data cleaning logic in Python to standardize formats, handle missing values, and remove duplicates.Also handelled issue of data type mismatch between actual data and given schema for custmer, products,order and order_ietms table.

2. Understanding dimensional modeling and OLAP queries
Solution: Broke down the star schema design step-by-step and validated relationships before writing analytical queries.

