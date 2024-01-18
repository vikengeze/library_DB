SELECT
    a.AFirst,
    a.ALast,
    a.ABirthDate
FROM
    author a
ORDER BY
    a.ABirthDate
DESC
LIMIT 5