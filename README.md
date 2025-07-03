# 👓 Task 7: Creating Views

This task demonstrates how to create and use SQL views to abstract complex queries, simplify data access, and enhance security in a relational database.

---

## 🎯 Objective

- Learn how to create reusable and secure views
- Use views to encapsulate complex joins and aggregations
- Query views just like tables

---

## 🛠️ Tools Used

- MySQL Workbench  
---

## 📁 Views Created

### ✅ `MemberBorrowSummary`
Shows total books borrowed by each member.

```sql
CREATE VIEW MemberBorrowSummary AS
SELECT 
  m.MemberID,
  m.Name,
  COUNT(br.BorrowID) AS TotalBorrowed
FROM members m
LEFT JOIN borrowings br ON m.MemberID = br.MemberID
GROUP BY m.MemberID, m.Name;
