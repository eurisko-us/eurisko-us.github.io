CREATE TABLE age ( 
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
lastname VARCHAR(30), 
age VARCHAR(30)
); 

INSERT INTO `age` (`id`, `lastname`, `age`)
VALUES ('1', 'Walton', '12'); 

INSERT INTO `age` (`id`, `lastname`, `age`)
VALUES ('2', 'Sanchez', '13'); 

INSERT INTO `age` (`id`, `lastname`, `age`)
VALUES ('3', 'Ng', '14'); 

INSERT INTO `age` (`id`, `lastname`, `age`)
VALUES ('4', 'Smith', '15'); 

INSERT INTO `age` (`id`, `lastname`, `age`)
VALUES ('5', 'Shenko', '16'); 

CREATE TABLE name ( 
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
firstname VARCHAR(30), 
lastname VARCHAR(30)
); 

INSERT INTO `name` (`id`, `firstname`, `lastname`)
VALUES ('1', 'Franklin', 'Walton'); 

INSERT INTO `name` (`id`, `firstname`, `lastname`)
VALUES ('2', 'Sylvia', 'Sanchez'); 

INSERT INTO `name` (`id`, `firstname`, `lastname`)
VALUES ('3', 'Harry', 'Ng'); 

INSERT INTO `name` (`id`, `firstname`, `lastname`)
VALUES ('4', 'Ishmael', 'Smith'); 

INSERT INTO `name` (`id`, `firstname`, `lastname`)
VALUES ('5', 'Kinga', 'Shenko');
