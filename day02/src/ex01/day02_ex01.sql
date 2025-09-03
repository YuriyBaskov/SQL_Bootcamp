SELECT missing_date::date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS missing_date
LEFT JOIN (
    SELECT visit_date
    FROM person_visits
    WHERE person_id IN (1, 2)
) AS visits ON missing_date = visits.visit_date
WHERE visits.visit_date IS NULL
ORDER BY missing_date;