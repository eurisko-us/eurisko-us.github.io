CREATE TABLE student ( 
    id INT,
    lastname VARCHAR(50), 
    firstname VARCHAR(50)
); 
 
INSERT INTO `student` (`id`, `firstname`, `lastname`)
VALUES
    (1, 'Franklin', 'Walton'),
    (2, 'Sylvia', 'Sanchez'),
    (3, 'Harry', 'Ng'),
    (4, 'Ishmael', 'Smith'),
    (5, 'Kinga', 'Shenko'); 

CREATE TABLE assignment ( 
    id INT,
    studentId INT, 
    score INT
); 
 
INSERT INTO `assignment` (`id`, `studentId`, `score`)
VALUES
    (101, 2, 100),
    (101, 3, 95),
    (101, 4, 80),
    (102, 1, 90),
    (102, 2, 90),
    (102, 3, 75),
    (102, 4, 100),
    (102, 5, 95),
    (103, 3, 65),
    (103, 4, 90),
    (103, 5, 75),
    (104, 3, 55),
    (104, 4, 95),
    (104, 5, 80);
