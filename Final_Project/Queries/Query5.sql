SELECT
    e.EFirst,
    e.ELast,
    m.Mfirst,
    m.Mlast,
    r.Date_of_reminder
FROM
    employee e
INNER JOIN reminder r ON
    e.EmpID = r.EmpID
INNER JOIN member m ON
    m.MemberID = r.MemberID
ORDER BY
    r.Date_of_reminder DESC