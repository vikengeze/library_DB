SELECT
    m.memberID,
    m.Mfirst,
    m.Mlast,
    COUNT(bo.MemberID) as Number_owed
FROM
    member AS m,
    borrows AS bo
WHERE
    m.MemberID = bo.MemberID AND bo.Date_of_return IS NULL
GROUP BY
	m.MemberID