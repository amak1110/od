SELECT
    rp.*,
    COALESCE(
        p.value_reference,
        (
            SELECT
                value_reference
            FROM
                ir_property
            WHERE
                name = 'property_product_pricelist'
            ORDER BY
                id
            LIMIT
                1
        )
    )
FROM
    res_partner rp
    LEFT JOIN ir_property p ON p.name = 'property_product_pricelist'
    AND res_id = CONCAT('res.partner,', rp.id)
    AND p.company_id = 2
WHERE
    rp.id = 24453