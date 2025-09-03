SELECT 
    address,
    ROUND((MAX(age) - (MIN(age)::numeric / MAX(age)))::numeric, 2) AS formula,
    ROUND(AVG(age)::numeric, 2) AS average,
    (MAX(age) - (MIN(age)::numeric / MAX(age))) > AVG(age) AS comparison
FROM person
GROUP BY address
ORDER BY address;