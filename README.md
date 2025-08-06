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

### Answering the Eleventh question and insight
To evaluate whether Kultra Mega Stores (KMS) is aligning its shipping method choices appropriately with order priority levels, considering the cost and speed implications of each method with a breakdown.

<pre lang="markdown"> ```sql 

SELECT 
  Order_Priority, Ship_Mode, 
  COUNT(*) AS Order_Count, 
  sum(Shipping_Cost) AS Sum_Shipping_Cost 
  FROM [dbo].[KMS Sql Case Study] 
  GROUP BY Order_Priority, Ship_Mode 
  ORDER BY Order_Priority, Sum_Shipping_Cost DESC ``` </pre>
  
![Insight 11](https://github.com/Oluwanifesimi-simi/Kultra-Mega-Stores-Inventory-/blob/main/SQL-Findings/Insight.png?raw=true)

**Background:**
KMS utilizes three main shipping methods:

Express Air – Fastest and most expensive

Regular Air – Moderate speed and cost

Delivery Truck – Slowest but most economical

It is expected that higher-priority orders (e.g., Critical or High) should be shipped using faster methods, while lower-priority orders (Low, Medium, Not Specified) should favor economical options.

**Findings:**

| Shipping_Method | Critical_Orders | High_Priority | Medium_Priority | Low_Priority | Not_Specified |
|-----------------|-----------------|---------------|-----------------|--------------|---------------|
| Delivery Truck  | 228 orders,₦10,783.82 | 248 orders,₦11,206.88 | 205 orders, ₦9,461.62 | 250 orders, ₦11,131.61 | 215 orders, ₦9,388.01 |
| Regular Air | 1,180 orders, ₦8,586.76 | 1,308 orders, ₦10,005.01 | 1,225 orders, ₦9,418.72 | 1,280 orders, ₦10,263.62 | 1,277 orders, ₦9,734.08 |
| Express Air | 200 orders, ₦1,742.10 | 212 orders, ₦1,453.53 | 201 orders, ₦1,633.59 | 190 orders, ₦1,551.63 | 180 orders, ₦1,470.06 |

For Critical orders, Express Air (expected) was only used 200 times, while Delivery Truck was used more frequently (228 times), potentially impacting delivery speed.

Regular Air accounted for the highest number of shipments for Critical orders (1,180 times), showing some prioritization but inconsistent policy adherence.

Low and Medium priority orders still had significant use of Express Air, which is cost-inefficient given the lower urgency.

Delivery Truck, despite being the slowest, was used frequently even for High-priority orders, suggesting mismatched logistics decisions.

**conclusions** 
There is a lack of clear alignment between order priority and shipping methods. KMS appears to overspend on Express Air for low-priority shipments and under-utilize it for critical ones, undermining both cost-efficiency and delivery effectiveness.

**Recommendation:**
KMS should establish a shipping policy framework that aligns methods with order priority levels:

Critical/High Priority → Use Express Air or Regular Air

Medium/Low Priority → Use Regular Air or Delivery Truck

Implementing this alignment will optimize shipping costs while maintaining service quality.



## NOTE:
More insights, findings, and their results are in the file attached to this README.md file 📂. 

[Screenshot with insights and results](https://github.com/Oluwanifesimi-simi/Kultra-Mega-Stores-Inventory-/tree/main/SQL-Findings)

[SQL Syntaxes](https://github.com/Oluwanifesimi-simi/Kultra-Mega-Stores-Inventory-/blob/main/Capstone%20project%20%5BKMS%20sql%20Case%20Study%5D.sql) 

