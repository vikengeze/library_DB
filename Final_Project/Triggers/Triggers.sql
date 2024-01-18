CREATE TRIGGER `Book_Borrowed` AFTER INSERT ON `borrows`
 FOR EACH ROW UPDATE copies	
SET copies.Availability = 0
WHERE copies.CopyNr=new.CopyNr AND copies.ISBN = new.ISBN

CREATE TRIGGER `Book_Returned` AFTER UPDATE ON `borrows`
 FOR EACH ROW UPDATE copies
SET copies.Availability = 1
WHERE copies.CopyNr=new.CopyNr AND copies.ISBN=new.ISBN
