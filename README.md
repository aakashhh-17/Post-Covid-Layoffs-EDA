# Post-Covid-Layoffs-EDA

## Project Overview
This project explores layoffs in various companies post-COVID, using a dataset that captures key information such as company, location, industry, total layoffs, percentage laid off, date, stage of the company, country, and funds raised. The data was cleaned and analyzed using SQL to identify patterns and trends in layoffs over time, industries affected, and geographical distribution.

## Files in the Repository
* **layoffs.csv:** The original dataset containing information about layoffs post-COVID, including company name, location, industry, number of layoffs, and other relevant fields.
* **first.sql:** SQL script focused on cleaning the data by removing duplicates, standardizing fields, and handling null values.
* **second.sql:** SQL script performing exploratory analysis, aggregating the data, and visualizing key trends such as layoffs over time, company rankings, and geographic breakdowns.

## Dataset Overview
The dataset contains the following fields:
* **Company:** Name of the company.
* **Location:** The city where the company is based.
* **Industry:** The sector in which the company operates (e.g., Media, Tech, Finance).
* **Total Laid Off:** The total number of employees laid off.
* **Percentage Laid Off:** The percentage of the company’s workforce laid off.
* **Date:** Date of the layoffs.
* **Stage:** The financial stage of the company (e.g., Series B, Post-IPO).
* **Country:** The country where the layoffs occurred.
* **Funds Raised:** Total funds raised by the company (in millions).

## SQL Operations Breakdown
### Data Cleaning (`first.sql`)
* **Step 1:** Loaded the original data into a staging table for manipulation.
* **Step 2:** Removed duplicate records by creating a row_number() partition for each company and dropping duplicate rows.
* **Step 3:** Standardized the data by trimming spaces from text fields and cleaning up null values.
* **Step 4:** Removed irrelevant columns and refined the data for easier analysis.

### Data Analysis (`second.sql`)
* **Industry Analysis:** Grouped the layoffs by industry to identify which sectors were most affected.
* **Geographic Breakdown:** Aggregated layoffs by location and country to understand which regions were hit hardest by layoffs.
* **Temporal Analysis:** Aggregated layoffs over time, grouping by year and month to uncover patterns and trends in layoff announcements.
* **Top Companies:** Ranked companies based on the total number of employees laid off and their respective percentage of workforce reduction.

## Key Insights
1. **Layoff Trends Over Time:** Significant spikes in layoffs occurred during specific months/years as businesses adjusted to post-pandemic realities.
2. **Industry Impact:** Some industries, such as Technology and Retail, were particularly affected by post-COVID layoffs, whereas others remained relatively stable.
3. **Geographic Insights:** Countries such as the United States, Brazil, and Australia were among the most affected, with numerous layoffs concentrated in certain regions.
4. **Top Companies:** Certain large companies made significant layoffs, dominating the dataset with high layoff counts and large percentages of workforce reductions.

## How to Run the Project
1. Import the `layoffs.csv` file into your MySQL database.
2. Execute the SQL scripts (`first.sql` for data cleaning and `second.sql` for analysis) in your MySQL Workbench or preferred SQL environment.
3. Adjust the scripts as needed for your specific environment and MySQL version.
