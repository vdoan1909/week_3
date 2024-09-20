-- TRANSACTION

-- START TRANSACTION;

-- INSERT INTO loans (book_id, user_id, loan_date, return_date, status)
-- VALUES ('1', '1', '2024-03-03', NULL, 'Borrowed');

-- COMMIT;

-- ROLLBACK;

START TRANSACTION;

UPDATE loans SET status = 'Returned', return_date = NOW()
WHERE id = 12;

COMMIT;

ROLLBACK;


-- TRIGGER: after_insert_loans

-- CREATE TRIGGER after_insert_loans
-- AFTER INSERT ON loans
-- FOR EACH ROW

-- BEGIN

-- UPDATE books SET books.status = 'Unavailable' WHERE books.id = NEW.book_id AND NEW.status = 'Borrowed';

-- END;

-- TRIGGER after_update_loans

-- CREATE TRIGGER after_update_loans
-- AFTER UPDATE ON loans
-- FOR EACH ROW

-- BEGIN 

-- UPDATE books SET books.status = 'Available' WHERE books.id = NEW.book_id AND NEW.status = 'Returned';

-- END;

-- DROP TRIGGER IF EXISTS after_insert_loans
-- DROP TRIGGER IF EXISTS after_update_loans

-- VIEW

-- CREATE VIEW CurrentLoans AS 
-- SELECT * FROM loans WHERE status = 'Borrowed'

-- SELECT * FROM CurrentLoans

-- Full-text search

-- SHOW INDEX FROM books

-- SELECT * FROM books 
-- WHERE MATCH(title)
-- AGAINST('Book' IN NATURAL LANGUAGE MODE)

-- SELECT * FROM books 
-- WHERE MATCH(author)
-- AGAINST('Author' IN NATURAL LANGUAGE MODE)
