-- Find specific metric
select distinct indicator_id
from indicators_by_company
where indicator_id ~ 'OperatingIncome';

-- Filled metrics
select ic.indicator_id, count(*) as "Amount"
from (select *
      from indicators_by_company ic
      where ic."2010" is not null
        and ic."2011" is not null
        and ic."2012" is not null
        and ic."2013" is not null
        and ic."2014" is not null
        and ic."2015" is not null) as ic
group by ic.indicator_id
order by "Amount" desc;

-- Find data for given metrics by companies that have non-null values in 2010-2015
select name_latest,
       indicator_id,
       "2010",
       "2011",
       "2012",
       "2013",
       "2014",
       "2015"
from indicators_by_company ic
         join companies c on ic.company_id = c.company_id
where ic."2010" is not null
  and ic."2011" is not null
  and ic."2012" is not null
  and ic."2013" is not null
  and ic."2014" is not null
  and ic."2015" is not null
  and indicator_id in ('Assets', 'NetIncomeLoss');
