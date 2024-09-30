-- Exploratory Data Analysis

select *
from layoffs_staging2;

select max(total_laid_off), max(percentage_laid_off)
from layoffs_staging2;

select *
from layoffs_staging2
where percentage_laid_off = 1
order by total_laid_off desc ;

select company, sum(total_laid_off) as s1
from layoffs_staging2
group by company
order by s1 desc;

select min(`date`), max(`date`)
from layoffs_staging2;

select industry, sum(total_laid_off) as s1
from layoffs_staging2
group by industry
order by s1 desc;

select country, sum(total_laid_off) as s1
from layoffs_staging2
group by country
order by s1 desc;

select year(`date`) , sum(total_laid_off) as s1
from layoffs_staging2
group by year(`date`)
order by 1 desc;

select stage , sum(total_laid_off) as s1
from layoffs_staging2
group by stage
order by s1 desc;

select substring(`date`,1,7) as `month`, sum(total_laid_off)
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `month`
order by `month`;

with rolling_total as
(
select substring(`date`,1,7) as `month`, sum(total_laid_off) as total_off
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `month`
order by `month` asc
)
select `month`, total_off,
sum(total_off) over(order by `month`) as rolling_total
from rolling_total;

select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select substring(`date`,1,4) as `year`,
sum(total_laid_off) as total_off
from layoffs_staging2
where substring(`date`,1,4) is not null
group by `year`
order by 1 asc;

with rolling_yearly_off as 
(
select substring(`date`,1,4) as `year`,
sum(total_laid_off) as total_off
from layoffs_staging2
where substring(`date`,1,4) is not null
group by `year`
order by 1 asc
)
select `year`, total_off, 
sum(total_off) over(order by `year`)
from rolling_yearly_off;

with company_year (company, years, total_laid_off) as
(
select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
), company_year_rank as
(
select *, 
dense_rank() over(partition by years order by total_laid_off desc) as ranking
from company_year
where years is not null
)
select *
from company_year_rank
where ranking <=5;