create database `telco churn`;
use `telco churn`;

-- Menampilkan info table
desc `WA_Fn-UseC_-Telco-Customer-Churn`;

-- Menganti nama table
alter table `WA_Fn-UseC_-Telco-Customer-Churn` rename to telco_cust_churn;

-- Menampilkan seluruh data dalam table
select*from telco_cust_churn;

							-- TELCO CUST CHURN ANALYSIS --

-- Statistika deskriptif--

(select 'Count' as ` `,count(tenure) as `Tenure`, count(MonthlyCharges) as `Monthly Charges`, count(TotalCharges) as `Total Charges` from telco_cust_churn)
union
(select 'Mean' ,round(avg(tenure),2), round(avg(MonthlyCharges),2), round(avg(TotalCharges),2) from telco_cust_churn)
union
(select 'Min', round(min(tenure),2), round(min(MonthlyCharges),2), round(min(TotalCharges),2) from telco_cust_churn)
union
(select 'Max', round(max(tenure),2), round(max(MonthlyCharges),2), round(max(TotalCharges),2) from telco_cust_churn);

-- Churn rate by gender--
-- Not churn
select gender as Gender, count(case when Churn = 'No' then customerID end) as `Not churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as ` Not churn rate (%)` 
from telco_cust_churn group by gender;
-- Churn
select gender as Gender, count(case when Churn = 'Yes' then customerID end) as `Churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as ` Churn rate (%)` 
from telco_cust_churn group by gender;

-- Churn rate by Senior Citizen--
-- Not churn
select SeniorCitizen as `Senior Citizen`, count(case when Churn = 'No' then customerID end) as `Not churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as ` Not churn rate (%)` 
from telco_cust_churn group by SeniorCitizen;
-- Churn
select SeniorCitizen as `Senior Citizen`, count(case when Churn = 'Yes' then customerID end) as `Churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as ` Churn rate (%)` 
from telco_cust_churn group by SeniorCitizen;

-- Churn rate by partner--
-- Not churn
select Partner, count(case when Churn = 'No' then customerID end) as `Not churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as `Not churn rate (%)` 
from telco_cust_churn group by partner;
-- Churn
select Partner, count(case when Churn = 'Yes' then customerID end) as `Churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as `Churn rate (%)` 
from telco_cust_churn group by partner;

-- Churn rate by dependents--
-- Not churn
select Dependents, count(case when Churn = 'No' then customerID end) as `Not churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as `Not churn rate (%)` 
from telco_cust_churn group by Dependents;
-- Churn
select Dependents, count(case when Churn = 'Yes' then customerID end) as `Churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as `Churn rate (%)` 
from telco_cust_churn group by Dependents;

-- Churn rate by internet service--
-- Not churn
select InternetService as `Internet Service`, count(case when Churn = 'No' then customerID end) as `Not churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as `Not churn rate (%)` 
from telco_cust_churn group by InternetService;
-- Churn
select InternetService as `Internet Service`, count(case when Churn = 'Yes' then customerID end) as `Churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as `Churn rate (%)` 
from telco_cust_churn group by InternetService;

-- Churn rate by online security--
-- Not churn
select OnlineSecurity as `Online Security`, count(case when Churn = 'No' then customerID end) as `Not churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as `Not churn rate (%)` 
from telco_cust_churn group by OnlineSecurity;
-- Churn
select OnlineSecurity as `Online Security`, count(case when Churn = 'Yes' then customerID end) as `Churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as `Churn rate (%)`
from telco_cust_churn group by OnlineSecurity;

-- Churn rate by device protection--
-- Not churn
select DeviceProtection as `Device Protection`, count(case when Churn = 'No' then customerID end) as `Not churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as `Not churn rate (%)` 
from telco_cust_churn group by DeviceProtection;
-- Churn
select DeviceProtection as `Device Protection`, count(case when Churn = 'Yes' then customerID end) as `Churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as `Churn rate (%)`
from telco_cust_churn group by DeviceProtection;

-- Churn rate by streaming movies--
-- Not churn
select StreamingMovies as `Streaming Movies`, count(case when Churn = 'No' then customerID end) as `Not churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as `Not churn rate (%)` 
from telco_cust_churn group by StreamingMovies;
-- Churn
select StreamingMovies as `Streaming Movies`, count(case when Churn = 'Yes' then customerID end) as `Churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as `Churn rate (%)` 
from telco_cust_churn group by StreamingMovies;

-- Churn rate by streaming tv--
-- Not churn
select StreamingTV as `Streaming TV`, count(case when Churn = 'No' then customerID end) as `Not churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as `Not churn rate (%)` 
from telco_cust_churn group by StreamingTV;
-- Churn
select StreamingTV as `Streaming TV`, count(case when Churn = 'Yes' then customerID end) as `Churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as `Churn rate (%)`
from telco_cust_churn group by StreamingTV;

-- Churn rate by contract--
-- Not churn
select Contract, count(case when Churn = 'No' then customerID end) as `Not churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as `Not churn rate (%)` 
from telco_cust_churn group by Contract;
-- Churn
select Contract, count(case when Churn = 'Yes' then customerID end) as `Churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as `Churn rate (%)` 
from telco_cust_churn group by Contract;

-- Churn rate by payment method--
-- Not churn
select PaymentMethod as `Payment Method`, count(case when Churn = 'No' then customerID end) as `Not churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as `Not churn rate (%)` 
from telco_cust_churn group by PaymentMethod;
-- Churn
select PaymentMethod as `Payment Method`, count(case when Churn = 'Yes' then customerID end) as `Churn rate`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as `Churn rate (%)`
from telco_cust_churn group by PaymentMethod;

-- Total customer by churn rate
select churn as `Churn category`, count(customerID) as `Total customer`, concat(round(count(customerID)*100/(select count(customerID) from telco_cust_churn),2),'%') as `Total customer (%)`
from telco_cust_churn group by churn;

-- Average Tenure by churn rate--
select churn as `Churn category`, round(avg(tenure),2) as `Average tenure`
from telco_cust_churn group by churn;

-- Total monthly charges by churn rate--
select churn as `Churn category`, round(sum(MonthlyCharges),2) as `Total monthly charges`
from telco_cust_churn group by churn;

-- Total charges by churn rate--
select churn as `Churn category`, round(sum(TotalCharges),2) as `Total Charges`
from telco_cust_churn group by churn;
