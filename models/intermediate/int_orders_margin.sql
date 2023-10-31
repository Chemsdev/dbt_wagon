SELECT
	orders_id,
	date_date,
	ROUND(SUM(revenue),2) as revenue,
	ROUND(SUM(quantity),2) as quantity,
	ROUND(SUM(purchase_cost),2) as purchase_cost,
	ROUND(SUM(margin),2) as margin

-- On récupère la table créer dans le fichier int_sales_margin.
FROM {{ ref("int_sales_margin") }}

-- GroupBy par l'id et la date.
GROUP BY orders_id, date_date

-- On ordonne la table par 'DESC'.
ORDER BY orders_id DESC

