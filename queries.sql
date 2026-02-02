-- 1. Dataset overview
SELECT
  COUNT(*) AS total_companies,
  MIN(founded_year) AS earliest_founded,
  MAX(founded_year) AS latest_founded
FROM
  crunchbase.companies;

-- 2. Total funding by industry
SELECT
  industry,
  SUM(total_funding_usd) AS total_funding
FROM
  crunchbase.companies
GROUP BY
  industry
ORDER BY
  total_funding DESC;

-- 3. Funding distribution by company status
SELECT
  status,
  COUNT(*) AS company_count,
  ROUND(AVG(total_funding_usd), 2) AS avg_funding
FROM
  crunchbase.companies
GROUP BY
  status
ORDER BY
  company_count DESC;

-- 4. Top funded companies
SELECT
  company_name,
  industry,
  total_funding_usd
FROM
  crunchbase.companies
ORDER BY
  total_funding_usd DESC
LIMIT 10;

-- 5. High-potential companies (HAVING)
SELECT
  industry,
  COUNT(*) AS funded_companies,
  ROUND(AVG(total_funding_usd), 2) AS avg_funding
FROM
  crunchbase.companies
GROUP BY
  industry
HAVING
  AVG(total_funding_usd) > 50000000
ORDER BY
  avg_funding DESC;
