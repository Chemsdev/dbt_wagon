-- Marge = revenu - purchase_cost
-- Purchase_cost = quantity * Purchase_price

SELECT 

    -- Récupération des colonnes.
    products_id, 
    date_date, 
    orders_id,
    revenue, 
    quantity, 
    purchase_price, 

    -- Calcul des colonnes marge & purchase_cost.
    ROUND(s.quantity*p.purchase_price,2) AS purchase_cost,
    s.revenue - ROUND(s.quantity*p.purchase_price,2) AS margin

-- Jointure.
FROM {{ref("stg_raw__sales")}} s
LEFT JOIN {{ref("stg_raw__product")}} p 
		USING (products_id)