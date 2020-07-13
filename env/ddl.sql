create table if not exists companies
(
	company_id integer
		constraint companies_pk
			unique,
	name_latest text,
	names_previous text
);

create table if not exists indicators_by_company
(
	company_id integer
		constraint indicators_by_company_companies_company_id_fk
			references companies (company_id),
	indicator_id text,
	"2010" numeric,
	"2011" numeric,
	"2012" numeric,
	"2013" numeric,
	"2014" numeric,
	"2015" numeric,
	"2016" text
);

create table if not exists stock_price
(
	stock_symbol text,
	company_id integer
		constraint indicators_by_company_companies_company_id_fk
			references companies (company_id),
	"year" numeric,
	"value" numeric
);