SELECT
  EXTRACT(YEAR FROM SAFE_CAST(date AS DATE)) AS year,
  COUNT(1) AS total_transactions,
  ROUND(SUM(COALESCE(nett_sales,0)),2) AS total_nett_sales,
  ROUND(SUM(COALESCE(nett_profit,0)),2) AS total_nett_profit,
  ROUND(AVG(COALESCE(rating_transaksi,0)),2) AS avg_rating_transaksi
FROM `cogent-case-478808-v2.Kimia_Farma.tabel_analisa_kimia_farma`
WHERE SAFE_CAST(date AS DATE) IS NOT NULL
  AND EXTRACT(YEAR FROM SAFE_CAST(date AS DATE)) BETWEEN 2020 AND 2023
GROUP BY year
ORDER BY year;
