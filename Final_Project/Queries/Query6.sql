SELECT
    m.MemberID,
    m.Mfirst,
    m.Mlast
FROM
    member m
WHERE EXISTS
    (
    SELECT
        *
    FROM
        borrows b
    WHERE
        m.MemberID = b.MemberID
)