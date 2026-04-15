# Jenson-USA-Advanced-Sql-Project

## Project Overview
This project focuses on a comprehensive analysis of Jenson USA, a leading bicycle and gear retailer, using a structured SQL database. The analysis covers critical business dimensions including store operations, customer purchasing patterns, inventory management, and product category performance. By leveraging advanced SQL techniques, the project transforms raw transactional data into actionable insights for retail optimization.

## Repository Structure
<img width="620" height="286" alt="image" src="https://github.com/user-attachments/assets/e23400dc-d105-4023-9ce2-47ba299d3690" />


## Technical Workflow
1. Database Initialization
Schema Definition: Executed the create objects.sql script to establish a relational schema involving multiple tables: customers, orders, products, categories, brands, and stores.

Data Ingestion: Populated the schema using the load data.sql script to simulate a high-volume retail environment.

2. Analytical Implementation
The analysis in jenson solutions.sql utilizes several advanced SQL layers:

Joins & Relationships: Used LEFT JOIN and USING clauses to combine customer data with order history, ensuring comprehensive reporting even for customers without current orders.

Aggregations & Grouping: Applied SUM(), COUNT(), and AVG() to calculate total products sold per store and average order values.

Window Functions: Implemented functions like MAX() OVER(PARTITION BY...) to identify the highest-priced products within each category without losing individual item details.

Filtering & Subqueries: Utilized WHERE, HAVING, and EXISTS to isolate specific metrics, such as finding the top-spending customers or identifying stagnant inventory.

## Key Insights
Store & Inventory Performance
Operational Efficiency: Successfully tracked the total number of products sold per store and identified the total number of orders placed by individual customers across different locations.

Category Dominance: Identified high-performing brands and categories (e.g., Mountain Bikes vs. Road Bikes) to assist in inventory forecasting.

Customer Insights
Purchasing Behavior: Segmented customers based on order frequency and total expenditure to highlight the most valuable segments for the Jenson USA "Insider" program.

Geographic Trends: Analyzed customer distribution to understand the reach of physical superstores versus online sales.

## Final Deliverables
SQL Scripts: Functional code for database creation and insight extraction.

JENSON USA.pdf: A visual report detailing the brand history (founded 1994), operational scope, and the results of the SQL analysis.

## Tools Used
Database Management: MySQL / SQL Server

## Documentation: Canva (for the SQL Report Analysis)

## Analysis: Advanced SQL Queries

## Author
Divya Sharma Email: divya649sharma99@gmail.com GitHub: github.com/Divya9916 LinkedIn:www.linkedin.com/in/divya9916

## License
This project is licensed under the MIT License.

## Acknowledgements
dataset references (Wscubetech)
