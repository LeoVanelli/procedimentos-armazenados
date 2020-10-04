DELIMITER $$
DROP TRIGGER IF EXISTS t_nova_conta$$
CREATE TRIGGER t_nova_conta BEFORE INSERT ON conta
FOR EACH ROW
BEGIN
   IF (NEW.saldo < 0) THEN
      SET NEW.saldo = 0;
   END IF;
END;
$$
