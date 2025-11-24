CREATE OR REPLACE TABLE `cogent-case-478808-v2.Kimia_Farma.tabel_analisa_kimia_farma` AS
SELECT
  t.transaction_id,
  t.date,
  t.branch_id,
  c.branch_name,
  c.kota,
  c.provinsi,
  c.rating AS rating_cabang,
  t.customer_name,
  t.product_id,
  p.product_name,
  p.price AS actual_price,
  t.discount_percentage,
  CASE
    WHEN p.price <= 50000 THEN 0.10
    WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
    WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
    WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
    WHEN p.price > 500000 THEN 0.30
  END AS persentase_gross_laba,
  (p.price * (1 - SAFE_DIVIDE(t.discount_percentage,100))) AS nett_sales,
  (p.price * (1 - SAFE_DIVIDE(t.discount_percentage,100))) *
  CASE
    WHEN p.price <= 50000 THEN 0.10
    WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
    WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
    WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
    WHEN p.price > 500000 THEN 0.30
  END AS nett_profit,
  t.rating AS rating_transaksi
FROM `cogent-case-478808-v2.Kimia_Farma.kf_final_transaction` t
LEFT JOIN `cogent-case-478808-v2.Kimia_Farma.kf_product` p
    ON t.product_id = p.product_id
LEFT JOIN `cogent-case-478808-v2.Kimia_Farma.kf_kantor_cabang` c
    ON t.branch_id = c.branch_id;
