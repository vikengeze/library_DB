SELECT
    m.Mfirst,
    m.Mlast
FROM
    member AS m
WHERE
    (m.Mfirst LIKE '%n') OR (m.Mlast LIKE '%n')