SELECT
  provinsi,
  ROUND(SUM(COALESCE(nett_sales,0)),2) AS total_nett_sales,
  ROUND(SUM(COALESCE(nett_profit,0)),2) AS total_nett_profit
FROM `cogent-case-478808-v2.Kimia_Farma.tabel_analisa_kimia_farma`
GROUP BY provinsi
ORDER BY total_nett_sales DESC
LIMIT 10;
