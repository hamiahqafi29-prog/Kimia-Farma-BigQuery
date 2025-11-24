SELECT
  provinsi AS region,
  ROUND(SUM(COALESCE(nett_profit,0)),2) AS total_profit,
  ROUND(SUM(COALESCE(nett_sales,0)),2) AS total_nett_sales,
  COUNT(1) AS total_transactions
FROM `cogent-case-478808-v2.Kimia_Farma.tabel_analisa_kimia_farma`
GROUP BY provinsi
ORDER BY total_profit DESC;
