DELIMITER $$

DROP FUNCTION IF EXISTS f_transferencia$$

SET GLOBAL log_bin_trust_function_creators = 1$$

CREATE FUNCTION f_transferencia(p_conta_origem SMALLINT(5) UNSIGNED,p_conta_destino SMALLINT(5) UNSIGNED,p_valor DECIMAL(10 , 2 ))
RETURNS varchar(80)

BEGIN
	DECLARE c_origem,c_destino int;
	DECLARE v_saldo DECIMAL (10,2);
	DECLARE ds_transacao,ds_origem,ds_destino varchar(80);
	DECLARE v_mensagem_resultado varchar(80);
	SELECT nr_conta INTO c_origem FROM conta WHERE nr_conta = p_conta_origem LIMIT 1;
	SELECT saldo INTO v_saldo FROM conta WHERE nr_conta=p_conta_origem LIMIT 1;
	SELECT nr_conta INTO c_destino FROM conta WHERE nr_conta = p_conta_destino LIMIT 1;
		IF(p_valor>0) THEN
			IF(p_conta_origem = c_origem) THEN
				IF(p_conta_destino=c_destino) THEN
					IF(v_saldo>=p_valor) THEN
						UPDATE conta SET saldo = saldo - p_valor WHERE nr_conta = c_origem;
						UPDATE conta SET saldo = saldo + p_valor WHERE nr_conta = c_destino;
						SELECT CONCAT('Transferência para ',p_conta_destino,' de ',p_valor,' R$.') INTO ds_origem;
						INSERT INTO movimentacao (nr_conta,dtmov_conta,vl_mov,ds_mov)
						VALUES (p_conta_origem,default,p_valor,ds_origem);
						SELECT CONCAT('Transferência de ',p_conta_origem,' de ',p_valor,' R$.') INTO ds_destino;
						INSERT INTO movimentacao (nr_conta,dtmov_conta,vl_mov,ds_mov)
						VALUES (p_conta_destino,default,p_valor,ds_destino);
						SELECT 'Transferência efetuada com sucesso!' INTO v_mensagem_resultado;
                        RETURN v_mensagem_resultado;
					ELSE
						SELECT 'Saldo insuficiente.' INTO v_mensagem_resultado;
                        RETURN v_mensagem_resultado;
					END IF;
				ELSE
					SELECT 'Conta de destino inexistente.' INTO v_mensagem_resultado;
                    RETURN v_mensagem_resultado;
				END IF;
			ELSE
				SELECT 'Conta de origem inexistente.' INTO v_mensagem_resultado;
                RETURN v_mensagem_resultado;
			END IF;
		ELSE
			SELECT 'Valor inválido para operação.' INTO v_mensagem_resultado;
            RETURN v_mensagem_resultado;
		END IF;
END;
$$
DELIMITER ;
