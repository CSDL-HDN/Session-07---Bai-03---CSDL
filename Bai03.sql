CREATE DATABASE SS07_BAI03;
USE SS07_BAI03;

CREATE TABLE Students (
    id INT PRIMARY KEY,
    email VARCHAR(100),
    name VARCHAR(100)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(15, 2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(id)
);

INSERT INTO Students VALUES 
(1, 'anh.nguyen@gmail.com', 'Nguyen Van Anh'),
(2, 'binh.tran@yahoo.com', 'Tran Thanh Binh'),
(3, 'chi.le@hotmail.com', 'Le Thi Chi'),
(4, 'dung.vu@outlook.com', 'Vu Van Dung');

INSERT INTO Payments VALUES 
(101, 1, 500000, '2024-02-15'),
(102, 1, 200000, '2024-05-20'),
(103, 2, 1500000, '2024-01-10'),
(104, 3, 300000, '2023-12-25');

SELECT s.email, s.name
FROM Students s
WHERE NOT EXISTS (
    SELECT 1 
    FROM Payments p 
    WHERE p.student_id = s.id 
      AND p.payment_date BETWEEN '2024-01-01' AND '2024-12-31'
);