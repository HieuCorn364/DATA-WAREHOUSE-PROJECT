# DATA-WAREHOUSE-PROJECT
Build a hospital data warehouse system for analytics and reporting
# Badges
![SSAS 3.0.15](https://camo.githubusercontent.com/5c1fcfcffcc4f66dffb3d50ebb25bd9a7bb6e6ee2686871f03cfdd346823bab6/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f535341532d332e302e31352d626c75653f6c696e6b3d68747470732533412532462532466d61726b6574706c6163652e76697375616c73747564696f2e636f6d2532466974656d732533466974656d4e616d6525334450726f4249546f6f6c732e4d6963726f736f6674416e616c7973697353657276696365734d6f64656c696e6750726f6a6563747332303232)
![SSIS 1.3.2](https://camo.githubusercontent.com/2c68d65b8490de9b0e8ee6eee80234bf7941aebfe362c6b887ff7b965042eb46/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f535349532d312e332e322d79656c6c6f773f6c696e6b3d68747470732533412532462532466d61726b6574706c6163652e76697375616c73747564696f2e636f6d2532466974656d732533466974656d4e616d65253344535349532e4d6963726f736f667444617461546f6f6c73496e746567726174696f6e5365727669636573)
# Data decription
- ERD Datawarehouse

<p align="center">
  <img src="https://github.com/HieuCorn364/DATA-WAREHOUSE-PROJECT/blob/main/Images/DW.png?raw=true" alt="ERD Datawarehouse" width="700">
</p>

Data is taken from data sources taken from hospitals. Hopefully, data is a collection of information about patients' medical examinations, transactions, services, accounts, clinics... compiled based on chemistry. hospital application in 2016.

To synthesize and store the above data for the purpose of analyzing operational situations, as well as supporting decision making. Therefore, the team conducted research and built a patient data warehouse to meet the hospital's needs.

# ETL from DBStore to DBStage
<p align="center">
  <img src="https://github.com/HieuCorn364/DATA-WAREHOUSE-PROJECT/blob/main/Images/Load%20DB%20To%20Stage.png?raw=true" alt="Load DB To Stage" width="700">
</p>

### 1. Clean data

Here is the general process for handling data cleansing:

- Split tables from common data into separate tables  
- Delete duplicate lines  
- Remove the null value of the `_ID` column to avoid errors in the primary key of the tables  
- Handle and replace null values for the remaining columns of each table  
<p align="center">
  <img src="https://github.com/HieuCorn364/DATA-WAREHOUSE-PROJECT/blob/main/Images/Clean%20data.png?raw=true" alt="Clean Data" width="700">
</p>

### 2. Load the temporary table that stores foreign key information

- Select the invoice ID columns so that it can store information about each invoice detail, making it easy to create a fact table.  
- Do not delete duplicates here, because there will be service invoices used multiple times by the same patient and recorded at the same time.  
- For example: if a person uses hospital bed service for 4 nights, when recording the bill, it will be duplicated 4 times.

<p align="center">
  <img src="https://github.com/HieuCorn364/DATA-WAREHOUSE-PROJECT/blob/main/Images/Load%20FactBill-Stage.png?raw=true" alt="Load FactBill to Stage" width="700">
</p>

### 3. Load time stage
Load detailed date and time information in 2016 (year of invoice storage)
<p align="center">
  <img src="https://github.com/HieuCorn364/DATA-WAREHOUSE-PROJECT/blob/main/Images/Load%20DimTime%20Stage.png?raw=true" alt="Load DimTime Stage" width="700" />
</p>

# Load data to Data Warehouse
<p align="center">
  <img src="https://github.com/HieuCorn364/DATA-WAREHOUSE-PROJECT/blob/main/Images/Load%20From%20Stage%20To%20DW.png?raw=true" alt="Load From Stage To DW" width="700" />
</p>

1. First create the DW database from the dimension design excel file following link: [DimensionDesign](https://github.com/HieuCorn364/DATA-WAREHOUSE-PROJECT/blob/main/Design/Detailed-Dimensional-Modeling-Workbook-Hopepital.xlsm)

2. Remove foreign keys to avoid data binding errors
3. Truncate existing data in the DW beforehand to avoid adding duplicate data
4. Add data from DBStage to DW in order from outside to inside (dim -> fact)
5. Select the appropriate SCD Type for the dim panels
6. Add back the foreign key to ensure data binding

### 1. Design load data for Dim table type 1
<p align="center">
  <a href="https://github.com/HieuCorn364/DATA-WAREHOUSE-PROJECT/blob/main/Images/Load-from-DBStage-to-DW-Type1.png">LoadDBtoDW</a>
</p>

### 2. Design load data for Dim table type 2
<p align="center">
  <a href="https://github.com/HieuCorn364/DATA-WAREHOUSE-PROJECT/blob/main/Images/Load-from-DBStage-to-DW-Type2.png">LoadDBtoDWType2</a>
</p>

# Generate Cube
Create a cube to be able to observe the data warehouse in different dimensions of the data warehouse, easily for querying and analyzing with Excel or Power BI
### 1. Item Hierarchy
<p align="center">
  <img src="https://github.com/HieuCorn364/DATA-WAREHOUSE-PROJECT/blob/main/Images/ItemHierachy.png?raw=true" alt="ItemHierachy" width="700" />
</p>

### 2. Date Hierarchy
<p align="center">
  <img src="https://github.com/HieuCorn364/DATA-WAREHOUSE-PROJECT/blob/main/Images/DateH%E1%BB%89eachy.png?raw=true" alt="DateHierachy" width="700" />
</p>


### 3. Patient Hierarchy
<p align="center">
  <img src="https://github.com/HieuCorn364/DATA-WAREHOUSE-PROJECT/blob/main/Images/PatientHierachy.png?raw=true" alt="PatientHierachy" width="700" />
</p>

### 4. Doctor Hierarchy
<p align="center">
  <img src="https://github.com/HieuCorn364/DATA-WAREHOUSE-PROJECT/blob/main/Images/DoctorHierachy.png?raw=true" alt="DoctorHierachy" width="700" />
</p>

### 5. Implement pivot table by loading Cube into excel
Excel file information according to the path: [HospitalPivotTable](https://github.com/HieuCorn364/DATA-WAREHOUSE-PROJECT/blob/main/PivotTable/Hospital_PivotTable.xlsx)

# Power BI
Finally, perform data warehouse visualization using Power BI according to the path : [PowerBI](https://github.com/HieuCorn364/DATA-WAREHOUSE-PROJECT/tree/main/Power%20BI)
<p align="center">
  <img src="https://github.com/HieuCorn364/DATA-WAREHOUSE-PROJECT/blob/main/Images/Doctor%20BI.png?raw=true" alt="Doctor BI" width="700" />
</p>

<p align="center">
  <img src="https://github.com/HieuCorn364/DATA-WAREHOUSE-PROJECT/blob/main/Images/Patient%20BI.png?raw=true" alt="Patient BI" width="700" />
</p>

<p align="center">
  <img src="https://github.com/HieuCorn364/DATA-WAREHOUSE-PROJECT/blob/main/Images/Sales%20BI.png?raw=true" alt="Sales BI" width="700" />
</p>

