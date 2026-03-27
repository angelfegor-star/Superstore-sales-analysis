# Superstore Sales Analysis (2014-2017)

##Business Questions
1.Which regions and product categories drive the most revenue vs profit?
2.Does discounting increase profitability or destroy it?
3.What seasonal trends exist in the sales performance?

##Tools Used
- Excel - data cleaning, feature engineering, pivot tables, dashboard
- MySQL - aggregation queries, discount analysis, sub-category drill-down

  ## Dataset
  Superstore Sales Dataset from kaggle.
  9,994 order line items. 4 US regions. 2014-2017

  ## Key Findings
  
1.	Technology is the highest-revenue category ($836k), followed closely by office supplies each with a profit margin of 17.4% and 17.02% respectively. Furniture is a loss leader, tables alone produces a $177k loss on $207k in sales, suggesting cost structure or pricing issues in that sub-category.
2.	The discount strategy is actively destroying margin. Orders with 40%+ discount average a -77.4% profit margin. 31% of high-discount order lines lose money outright. The business is subsidizing sales volumes with profit. Machines, Binders and Tables receive the highest average discounts and also the most loss-making sub-categories.
3.	Sales grew approximately 20% year over year from 2014 to 2017, but Q4 alone accounts for 35% of annual revenue. This concentration creates a cash flow risk. A single weak Q4 would disproportionately impact the year. The pattern is more acute in Technology, where the Q4 spike is nearly 3x the monthly average.

## Files
- /data/superstore_sales.csv               - cleaned dataset
- /sql/Superstore Sales Data Query.sql     - all MySQL queries
- /excel/superstore_dashboard.xlsx         - Excel dashboard + pivots
- /memo/analyst_memo.pdf                   - findings summary


## Skills Demonstrated
Data cleaning . Feature engineering .  SQL aggregrations . Pivot Tables . Excel dashboard design .
Business communication . Profit margin analysis
