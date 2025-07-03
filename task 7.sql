use librarydb;
CREATE VIEW MemberBorrowSummary AS
SELECT 
    m.MemberID,
    m.Name,
    COUNT(br.BorrowID) AS TotalBorrowed
FROM members m
LEFT JOIN borrowings br ON m.MemberID = br.MemberID
GROUP BY m.MemberID, m.Name;
CREATE VIEW ActiveBorrowings AS
SELECT 
    br.BorrowID,
    m.Name AS Member,
    b.Title AS Book,
    br.BorrowDate
FROM borrowings br
JOIN members m ON br.MemberID = m.MemberID
JOIN books b ON br.BookID = b.BookID
WHERE br.ReturnDate IS NULL;
SELECT * FROM MemberBorrowSummary
WHERE TotalBorrowed > 1;
DROP VIEW IF EXISTS MemberBorrowSummary;
