/*1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '*/
USE hw5;

delimiter //
CREATE FUNCTION numbers(Num INT)
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
	DECLARE days INT DEFAULT 0;
	DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    DECLARE seconds INT DEFAULT 0;
    DECLARE result VARCHAR(45); 
    SET days = (Num DIV 86400);
	SET hours = (Num - days*86400) DIV 3600;
    SET minutes =(Num - (days*86400 + hours*3600)) DIV 60;
    SET seconds = (Num - days*86400 - hours*3600 - minutes*60);
	SET result = CONCAT(days,' days ',hours,' hours ',minutes,' minutes ',seconds,' seconds ');
	RETURN result;
	END //
	delimiter  ;

	SELECT numbers(123456);

DROP FUNCTION numbers;

/*2. Выведите только четные числа от 1 до 10.
Пример: 2,4,6,8,10*/
    delimiter //
CREATE FUNCTION even_numbers()
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
	DECLARE Num INT DEFAULT 0;    
    DECLARE result VARCHAR(45);
    set result='';
	WHILE Num < 10 DO
    SET Num = Num + 2;
	SET result = CONCAT(result, ' ', Num);
    END WHILE;
    RETURN result;
	END //
    delimiter ;
    
	SELECT even_numbers();

DROP FUNCTION even_numbers;
    