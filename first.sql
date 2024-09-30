-- Data Cleaning

select *
from layoffs;

-- 1. Remove duplicates
-- 2. Standardize the data
-- 3. Null or blank values
-- 4. Remove any columns

create table layoffs_staging
like layoffs;

select *
from layoffs_staging;

insert layoffs_staging
select *
from layoffs;

select *,
row_number() over(
partition by company, industry, total_laid_off, percentage_laid_off, `date`) as row_num
from layoffs_staging;

with duplicate_cte as 
(
select *,
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoffs_staging
)
select * 
from duplicate_cte
where row_num > 1;

select *
from layoffs_staging
where company = 'Cazoo'; 



CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select *
from layoffs_staging2;

insert into layoffs_staging2
select *,
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoffs_staging;

select *
from layoffs_staging2;

delete 
from layoffs_staging2
where row_num > 1;

-- Summary of what we did here:
--  First we checked the duplicate values by adding row_num by its function. Then we pushed that
-- query in CTE but we can't alter/delete data in cte, So we had to create another table which we named layoffs_staging2 
-- where we added row_num then deleted the duplicate data/rows.


-- Standardizing data 

select company, trim(company)
from layoffs_staging2;

update layoffs_staging2 
set company = trim(company);

select *
from layoffs_staging2
where industry like 'Crypto%';

update layoffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%';

select distinct industry
from layoffs_staging2;

select distinct country
from layoffs_staging2
order by country
;

update layoffs_staging2
set country = 'United States'
where country like 'United States%';

select distinct stage
from layoffs_staging2;

select distinct *
from layoffs_staging2;

select `date`,
str_to_date(`date`, '%m/%d/%Y')
from layoffs_staging2;

update layoffs_staging2
set `date` = str_to_date(`date`, '%m/%d/%Y');

select `date`
from layoffs_staging2;

alter table layoffs_staging2
modify column `date` date;

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoffs_staging2
where industry is null
or industry = '';

select *
from layoffs_staging2
where company = 'Airbnb';

update layoffs_staging2
set industry = 'Travel'
where company = 'Airbnb' 
and industry = '';

select *
from layoffs_staging2
where company = "Carvana";

update layoffs_staging2
set industry = 'Transportation'
where company = 'Carvana' 
and industry = '';

select *
from layoffs_staging2
where company = "Juul";

update layoffs_staging2
set industry = 'Consumer'
where company = 'Juul' 
and industry = '';

delete
from layoffs_staging2
where percentage_laid_off is null
and percentage_laid_off is null;

select *
from layoffs_staging2;

alter table layoffs_staging2
drop column row_num;