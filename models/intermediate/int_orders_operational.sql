-- Marge opérationnelle = marge + frais de port - log_cost - ship_cost


SELECT

  -- Séléction des colonnes. 
  marg.orders_id,
  marg.date_date,
  marg.quantity,
  marg.revenue,
  marg.purchase_cost,
  marg.margin,
  ship.shipping_fee,
  ship.log_cost,
  ship.ship_cost,

    -- calcul
  ROUND(marg.margin + ship.shipping_fee - (ship.log_cost + ship.ship_cost),2) AS operational_margin 

-- JOINTURE.
FROM {{ref("int_orders_margin")}} marg
LEFT JOIN {{ref("stg_raw__ship")}} ship
	USING(orders_id)

-- On ordonne la table par ordre décroissant.
ORDER BY orders_id desc