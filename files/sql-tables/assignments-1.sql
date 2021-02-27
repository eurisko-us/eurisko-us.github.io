CREATE TABLE age ( 
    lastname VARCHAR(30), 
    age TINYINT
); 
 
INSERT INTO `age` (`lastname`, `age`)
VALUES
    ('Walton', 15),
    ('Sanchez', 15),
    ('Ng', 16),
    ('Smith', 16),
    ('Shenko', 17); 
 
CREATE TABLE name ( 
    lastname VARCHAR(30), 
    firstname VARCHAR(30)
); 
 
INSERT INTO `name` (`firstname`, `lastname`)
VALUES
    ('Franklin', 'Walton'),
    ('Sylvia', 'Sanchez'),
    ('Harry', 'Ng'),
    ('Ishmael', 'Smith'),
    ('Kinga', 'Shenko'); 

CREATE TABLE assignment ( 
    number TINYINT,
    lastname VARCHAR(30), 
    score TINYINT
); 
 
INSERT INTO `assignment` (`number`, `lastname`, `score`)
VALUES
    (1, 'Walton', 90),
    (1, 'Sanchez', 100),
    (1, 'Ng', 95),
    (1, 'Smith', 80),
    (1, 'Shenko', 85),
    (2, 'Walton', 90),
    (2, 'Sanchez', 90),
    (2, 'Ng', 75),
    (2, 'Smith', 100),
    (2, 'Shenko', 95),
    (3, 'Walton', 60),
    (3, 'Sanchez', 70),
    (3, 'Ng', 65),
    (3, 'Smith', 90),
    (3, 'Shenko', 75);
