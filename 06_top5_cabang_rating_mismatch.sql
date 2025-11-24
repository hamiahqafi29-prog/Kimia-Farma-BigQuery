SELECT
  branch_id,
  branch_name,
  ROUND(AVG(COALESCE(rating_cabang,0)),2) AS avg_branch_rating,
  ROUND(AVG(COALESCE(rating_transaksi,0)),2) AS avg_transaction_rating,
  ROUND(
    AVG(COALESCE(rating_cabang,0)) - AVG(COALESCE(rating_transaksi,0))
  ,2) AS rating_diff,
  COUNT(1) AS total_transactions,
  ROUND(SUM(COALESCE(nett_sales,0)),2) AS total_nett_sales
FROM `cogent-case-478808-v2.Kimia_Farma.tabel_analisa_kimia_farma`
GROUP BY branch_id, branch_name
HAVING COUNT(1) >= 30
ORDER BY rating_diff DESC
LIMIT 5;
