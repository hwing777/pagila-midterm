/*
 * Write a SQL query SELECT query that:
 * computes the country with the most customers in it. 
 */

SELECT country
FROM (
    SELECT country, count(DISTINCT customer_id) as "count"
    FROM (
        SELECT
            customer_id,
            country
        from customer
        INNER JOIN address USING (address_id)
        INNER JOIN city USING (city_id)
        INNER JOIN country USING (country_id)
    ) AS cust_country
    GROUP BY country
    ORDER BY "count" desc
    LIMIT 1
) AS top_country
;
