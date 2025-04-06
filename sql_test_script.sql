C:\Users\07892>sqlplus sys as sysdba
Enter password:




CREATE PLUGGABLE DATABASE moise_27657_pdb_assI
ADMIN USER pdb_admin IDENTIFIED BY YourPassword
ROLES = (DBA)
FILE_NAME_CONVERT = ('C:\USERS\07892\ONEDRIVE\DESKTOP\ORADATA\ORCL\PDBSEED\', 
                      'C:\USERS\07892\ONEDRIVE\DESKTOP\ORADATA\ORCL\moise_27657_pdb_assI\');




SQL> ALTER PLUGGABLE DATABASE moise_27657_pdb_assI OPEN;



SQL> ALTER SESSION SET CONTAINER = moise_27657_pdb_assI;



 SHOW CON_NAME;


SQL> CREATE TABLE Users (
  2      user_id INT PRIMARY KEY,
  3      name VARCHAR(255),
  4      email VARCHAR(255) UNIQUE
  5  );



SQL>
SQL> CREATE TABLE Categories (
  2      category_id INT PRIMARY KEY,
  3      category_name VARCHAR(100) NOT NULL
  4  );



SQL>
SQL> CREATE TABLE Books (
  2      book_id INT PRIMARY KEY,
  3      title VARCHAR(255),
  4      author VARCHAR(255),
  5      category_id INT,
  6      FOREIGN KEY (category_id) REFERENCES Categories(category_id)
  7  );



SQL>
SQL> CREATE TABLE Transactions (
  2      transaction_id INT PRIMARY KEY,
  3      user_id INT,
  4      book_id INT,
  5      transaction_date DATE DEFAULT SYSDATE,
  6      FOREIGN KEY (user_id) REFERENCES Users(user_id),
  7      FOREIGN KEY (book_id) REFERENCES Books(book_id)
  8  );









SQL> INSERT INTO Categories (category_id, category_name) VALUES (1, 'Science Fiction');



SQL> INSERT INTO Books (book_id, title, author, category_id) VALUES (1, 'The Martian', 'Andy Weir', 1);



SQL> INSERT INTO Transactions (transaction_id, user_id, book_id) VALUES (1, 27657, 1);



SQL> SELECT * FROM USERS;

   

SQL> UPDATE Users SET email = 'new_email@example.com' WHERE user_id = 27657;



SQL> SELECT * FROM USERS;

 

SQL> DELETE FROM Users WHERE user_id = 27657;

ALTER TABLE Orders DISABLE CONSTRAINT sys_c007444;
DELETE FROM Users WHERE user_id = 27657;
ALTER TABLE Orders ENABLE CONSTRAINT sys_c007444;




SQL> SELECT u.name, b.title, t.transaction_date
  2  FROM Users u
  3  JOIN Transactions t ON u.user_id = t.user_id
  4  JOIN Books b ON t.book_id = b.book_id;






SQL> SELECT * FROM Transactions
  2  WHERE transaction_date > SYSDATE - 7;




SQL> ALTER TABLE Books ADD price NUMBER(10,2);


SQL> INSERT INTO Books (book_id, title, author, category_id, price)
  2  VALUES (2, 'Dune', 'Frank Herbert', 1, 25.50);



SQL>
SQL> INSERT INTO Books (book_id, title, author, category_id, price)
  2  VALUES (3, 'Neuromancer', 'William Gibson', 1, 22.75);



SQL>
SQL> INSERT INTO Books (book_id, title, author, category_id, price)
  2  VALUES (4, 'Snow Crash', 'Neal Stephenson', 1, 18.99);



SQL>




SQL> SELECT title, author, price
  2  FROM Books
  3  WHERE category_id = 1
  4  ORDER BY price DESC
  5  FETCH FIRST 5 ROWS ONLY;

