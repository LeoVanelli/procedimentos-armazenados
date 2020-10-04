DELIMITER $$
DROP TRIGGER IF EXISTS t_registra_nova_conta$$
CREATE TRIGGER t_registra_nova_conta AFTER INSERT ON conta
FOR EACH ROW
BEGIN
   INSERT INTO movimentacao VALUES
      (NEW.numero_conta, NOW(), NEW.saldo, CONCAT('Conta ', NEW.numero_conta, ' aberta com ', NEW.saldo));
END;
$$
