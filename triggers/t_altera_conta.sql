DELIMITER $$
DROP TRIGGER IF EXISTS t_altera_conta$$
CREATE TRIGGER t_altera_conta AFTER UPDATE ON conta
FOR EACH ROW
BEGIN
   INSERT INTO movimentacao VALUES
      (NEW.numero_conta
      , NOW()
      , NEW.saldo
      , CONCAT('Alteração manual de dados em '
               , NEW.numero_conta
               , '. Saldo anterior: '
               , OLD.saldo
               , '. Saldo atual: '
               , NEW.saldo
               )
      );
END;
$$
