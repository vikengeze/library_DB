SELECT
    b.Title,
    c.SuperCatName
FROM
    book b
INNER JOIN belongs_to be ON
    b.ISBN = be.ISBN
INNER JOIN category c ON
    be.CatName = c.CatName