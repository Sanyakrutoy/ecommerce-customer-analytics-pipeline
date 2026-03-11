# ecommerce-customer-analytics-pipeline
# Cosmetics Store Data Pipeline & Analytics 💄

## Executive Summary
Analyzed 4.6M customer events to identify growth opportunities. 
Key finding: **Conversion rate is 8.56%**, but potential revenue loss from abandoned carts exceeds **4.7M**.

## Project Workflow
1. **Data Cleaning (Python/Pandas)**: 
   - Reduced dataset noise by dropping columns with >90% missing values.
   - Handled data types for optimized SQL ingestion.
2. **Database Engineering (MySQL)**:
   - Built a relational schema for high-volume event data.
   - Leveraged `LOAD DATA LOCAL INFILE` for high-speed processing (4.6M rows in 16s).
3. **Business Intelligence**:
   - Calculated e-commerce KPIs (Conversion Rate, Revenue Leakage).
   - Visualized the sales funnel using Seaborn.

## Key Insights
- **Conversion Rate**: 8.56% (High intent audience).
- **Major Leakage**: Abandoned carts are 3x higher than actual purchases. Recommendation: Implement "Abandoned Cart" email triggers.
