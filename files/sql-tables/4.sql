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

CREATE TABLE class ( 
    id INT,
    name VARCHAR(50)
); 

INSERT INTO `class` (`id`, `name`)
VALUES
    (4990, 'Math'),
    (2307, 'Science'),
    (3110, 'English');

CREATE TABLE assignment ( 
    id INT,
    studentId INT,
    classId INT,
    score INT
); 
 
INSERT INTO `assignment` (`id`, `studentId`, `classId`, `score`)
VALUES
    (101, 1, 4990, 100),
    (101, 2, 4990, 95),
    (101, 4, 4990, 40),
    (101, 5, 4990, 60),
    (102, 1, 3110, 60),
    (102, 2, 3110, 95),
    (102, 3, 3110, 80),
    (102, 4, 3110, 80),
    (102, 5, 3110, 90),
    (103, 1, 2307, 60),
    (103, 2, 2307, 95),
    (103, 3, 2307, 80),
    (103, 4, 2307, 85),
    (104, 1, 4990, 90),
    (104, 2, 4990, 95),
    (104, 4, 4990, 75),
    (104, 5, 4990, 45),
    (105, 2, 4990, 65),
    (105, 3, 4990, 90),
    (105, 4, 4990, 55),
    (105, 5, 4990, 100),
    (106, 1, 3110, 70),
    (106, 2, 3110, 85),
    (106, 3, 3110, 85),
    (106, 5, 3110, 70)
    (107, 1, 2307, 80),
    (107, 2, 2307, 85),
    (107, 4, 2307, 95),
    (108, 1, 2307, 90),
    (108, 4, 2307, 75),
    (108, 5, 2307, 90);
