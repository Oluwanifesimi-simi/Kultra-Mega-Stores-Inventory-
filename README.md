# Kultra-Mega-Stores-Inventory-
Kultra Mega Stores (KMS), is a company focused on office supplies and furniture in Nigeria, that serves individuals, small businesses, and corporate clients nationwide. To support data-driven decisions, KMS commissioned a business insight report for its Abuja division to uncover key trends and improve regional performance.

Breaking into this analysis as my capstone project with DSA(The Incubator Hub), it was structured into two case scenarios covering product performance, regional sales trends, shipping efficiency, and customer segmentation.

## 🔍 Key Insights & Findings:
**Case Scenario I: Sales & Operations Overview**
- Identified the product category with the highest sales, helping prioritize inventory and promotions.

- Ranked the Top 3 and Bottom 3 regions by total sales to guide regional marketing efforts.

- Reported total appliance sales in Ontario, informing regional product strategy.

- Analyzed the bottom 10 customers and provided actionable strategies to increase revenue from this segment.

- Revealed the shipping method with the highest cost, offering opportunities for cost optimization.

**Case Scenario II: Customer Segmentation & Profitability**
- Identified most valuable customers, along with their preferred products and services.

- Highlighted the small business customer with the highest sales contribution.

- Determined the corporate client with the most orders placed between 2009–2012.

- Pinpointed the most profitable consumer customer.

- Tracked returned orders, identifying the responsible customers and their segment.

- Assessed whether shipping costs were efficiently aligned with order priority, comparing Express Air and Delivery Truck usage against urgency levels.
  
## Data Integration and Normalization
To ensure efficiency getting calculated columns and insights rightly, I joined the order dataset with the fact table dataset with:

<pre lang="markdown"> ```------JOINING THE KMS AND ORDER STATUS TABLE
	select
	order_status.order_id,
	order_status.Status,
---[KMS Sql Case Study].row_id,
[dbo].[KMS Sql Case Study].order_id,
[dbo].[KMS Sql Case Study].customer_name,
[dbo].[KMS Sql Case Study].customer_segment
from[dbo].[KMS Sql Case Study]
join order_status
on order_status.order_id=[dbo].[KMS Sql Case Study].order_id  ``` </pre>


<pre lang="markdown"> ```sql /*------11. If the delivery truck is the most economical but the slowest, shipping method and Express Air is the fastest but the most expensive one, do you think the company appropriately spent shipping costs based on the Order Priority? Explain your answer*/

SELECT 
  Order_Priority, Ship_Mode, 
  COUNT(*) AS Order_Count, 
  sum(Shipping_Cost) AS Sum_Shipping_Cost 
  FROM [dbo].[KMS Sql Case Study] 
  GROUP BY Order_Priority, Ship_Mode 
  ORDER BY Order_Priority, Sum_Shipping_Cost DESC ``` </pre>

