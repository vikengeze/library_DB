SELECT
    b.Title,
    COUNT(b.ISBN = c.ISBN) AS NumberOfCopies
FROM
    book b
INNER JOIN copies c ON
    b.ISBN = c.ISBN
GROUP BY
    b.ISBN
HAVING
    COUNT(b.ISBN = c.ISBN) > 1