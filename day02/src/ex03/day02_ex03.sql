WITH date_series AS (
    SELECT generate_series('2022-01-01', '2022-01-10', interval '1 day')::date AS missing_date
),
visits AS (
    SELECT visit_date
    FROM person_visits
    WHERE person_id IN (1, 2)
)
SELECT missing_date
FROM date_series
LEFT JOIN visits ON missing_date = visits.visit_date
WHERE visits.visit_date IS NULL
ORDER BY missing_date;