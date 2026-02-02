-- Total funding by industry
SELECT
  industry,
  SUM(total_funding) AS total_funding
FROM
  crunchbase
GROUP BY
  industry
ORDER BY
  total_funding DESC;

-- Funding analysis by company status
SELECT
  status,
  COUNT(*) AS company_count
FROM
  crunchbase
GROUP BY
  status;

-- Rank startups by total funding
SELECT
  company_name,
  total_funding
FROM
  crunchbase
ORDER BY
  total_funding DESC
LIMIT 10;
