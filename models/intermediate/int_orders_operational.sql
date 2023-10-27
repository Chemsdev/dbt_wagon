-- Marge opérationnelle = marge + frais de port - log_cost - ship_cost



-- Jointure.
SELECT
    marg.date_date,
    ship.ship_cost,
    ship.log_cost,
    ship.shipping_fee,
    ship.orders_id,

    -- calcul
    ROUND(marg.margin + ship.shipping_fee - (ship.log_cost + ship.ship_cost), 2) AS operationnal_margin

-- JOINTURE.
FROM {{ref("int_sales_margin")}} marg
LEFT JOIN {{ref("stg_raw__ship")}} ship
    USING (orders_id)

-- On ordonne la table par ordre décroissant.
ORDER BY orders_id desc