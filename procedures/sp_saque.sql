DELIMITER $$

DROP PROCEDURE IF EXISTS sp_saque$$

CREATE PROCEDURE sp_saque(IN p_conta SMALLINT(5) UNSIGNED, p_valor DECIMAL(10 , 2))
BEGIN
	DECLARE descricao varchar(55);
	DECLARE v_saldo ,c_conta int;
    SELECT nr_conta INTO c_conta FROM conta WHERE nr_conta = p_conta LIMIT 1;
	SELECT saldo INTO v_saldo FROM conta WHERE nr_conta = p_conta LIMIT 1;
	IF (c_conta=p_conta) THEN
		IF (p_valor>0) THEN
			IF(v_saldo>p_valor) THEN
				SELECT 'Saldo insuficiente';
			ELSE
				START TRANSACTION;
					SET SQL_SAFE_UPDATES=0;
					UPDATE conta SET saldo = saldo - p_valor WHERE nr_conta = p_conta;
					SELECT CONCAT('Saque de ',p_valor) INTO descricao;  
					INSERT INTO movimentacao (nr_conta,dtmov_conta,vl_mov,ds_mov) 
						values(c_conta,default,p_valor,descricao);
					SET SQL_SAFE_UPDATES=1;
				COMMIT;	
			END IF;
		ELSE
			SELECT 'Valor inválido para a operação.';
		END IF;
	ELSE
		SELECT 'Conta inexistente.';
	END IF;
END$$

DELIMITER ;
