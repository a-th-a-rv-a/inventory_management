# Inventory Analytics & Optimization

This project presents a **SQL-driven solution** for inventory monitoring, analysis, forecasting, and optimization, built for a simulated retail chain — *Urban Retail Co.* The aim is to help retail operations manage inventory more intelligently by leveraging historical sales, supplier data, and stock logs. Since all the commands are derived only from one dataset, you can also use this project for your own business!

_________________________________________________________________________________________________________________


## Project Purpose

As Urban Retail Co. scaled across multiple regions and thousands of SKUs, manual inventory decision-making became unsustainable. This project addresses core challenges like:

- Frequent **stockouts** of fast-moving SKUs  
- **Overstocking** of slow-moving items tying up capital  
- Inadequate visibility into SKU performance, supplier reliability, and demand trends  
- Lack of data-driven recommendations for reorder quantities, safety stocks, and stock adjustments  

By building a complete SQL analytics pipeline — from data cleaning to forecasting to KPI reporting — this repository demonstrates how to turn raw operations data into actionable insights.

_________________________________________________________________________________________________________________


## Key Aspects Included:

### 1. **Database Design & Schema**

- `Inventory Management ERD.pdf` — logical design of tables and relationships  
- Designed tables capture entities such as **Products**, **Product Categories**, **Stores**, **Regions**, **Inventory**, **Sales** and others.

### 2. **Data Preparation & Cleaning**

- `urban_retail_data_cleaning.sql` — scripts to clean, standardize, and integrate raw data  
- `urban_retail_forward_filling.sql` — techniques for filling missing data where appropriate  

### 3. **Analytical Modules / SQL Scripts**

- `urban_retail_total_product_stock.sql` — compute aggregate stock across stores & warehouses  
- `urban_retail_low_stock.sql` — detect SKUs with inventory below threshold  
- `urban_retail_inventory_turnover.sql` — turnover analysis  
- `urban_retail_fast_vs_slow.sql` — classification of SKUs based on movement of inventory
- `urban_retail_supplier_inconsistency.sql` — detect inconsistent supply of goods  
- `urban_retail_reorder_point_estimation.sql` — estimate reorder points using historical demand trends  
- `urban_retail_stock_adjustments.sql` — propose stock level adjustments based on observed trends  
- `uban_retail_demand_forecast.sql` — demand forecasting
- `urban_retail_product_analysis.sql` — overview of product analysis  

### 4. **Reporting & Visualization**

- `Urban_retail_summary_report.pdf` — executive summary covering results, findings, and recommendations  
- `SQL_INVENTORY.twbx` — Tableau Dashboard with key insights

_________________________________________________________________________________________________________________


## Sample Workflows & Insights

Using this repository you can:

1. Load raw transactional, inventory, and supplier data into a relational schema.  
2. Clean and forward-fill missing values as needed.  
3. Compute baseline metrics: total stock per SKU, per store/warehouse.  
4. Identify understocked items using data-driven thresholds.  
5. Segment SKUs into fast-moving vs slow-moving.  
6. Calculate inventory turnover and aging.  
7. Assess supplier delivery consistency and flag anomalies.  
8. Estimate reorder points and suggest stock adjustments.  
9. Forecast demand trends using time-series or seasonal patterns.  

_________________________________________________________________________________________________________________


## Business Impact

This solution helps Urban Retail Co. or any business, in general, to:

- Reduce frequency of stockouts and lost sales  
- Lower inventory carrying cost by avoiding overstock  
- Increase inventory turnover  
- Improve supplier reliability and renegotiation  
- Make proactive, data-driven restocking decisions

_________________________________________________________________________________________________________________


## How to Use this project for your business:

Since all the codes are derived from one dataset, you can easily use this project for your own business needs. Here's how:
1. Clone the repository  
2. Make your own dataset in the following format (you can also refer to the inventory_forecasting.csv file): Date |	Store ID | Product ID | Category | Region |	Inventory Level |	Units Sold | Units Ordered |	Demand Forecast |	Price	Discount | Weather Condition | Holiday/Promotion | Competitor Pricing |	Seasonality 
3. Run the codes in the following recommended order: urban_retail_data_cleaning.sql --> urban_retail_product_analysis.sql --> urban_retail_total_product_stock.sql --> urban_retail_forward_filling.sql --> urban_retail_fast_vs_slow.sql --> urban_retail_inventory_turnover.sql --> uban_retail_demand_forecast.sql --> urban_retail_low_stock.sql --> urban_retail_reorder_point_estimation.sql --> urban_retail_stock_adjustments.sql --> urban_retail_supplier_inconsistency.sql 
4. Use the derived insights for your own business needs as per your requirements. 





