DROP DATABASE IF EXISTS bancario;

CREATE DATABASE bancario;

USE bancario;

CREATE TABLE conta (
    numero_conta INT UNSIGNED,
    nome_cliente VARCHAR(15) NOT NULL,
    sobrenome_cliente VARCHAR(15) NOT NULL,
    dtnasc_cliente DATE,
    dtabertura_conta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    saldo DECIMAL(10 , 2 ) NOT NULL DEFAULT 0,
    PRIMARY KEY (numero_conta)
)  ENGINE=INNODB;

CREATE TABLE movimentacao (
    numero_conta INT UNSIGNED,
    dtmov_conta TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'NÃO USAR ISSO NA PRÁTICA!',
    valor_mov DECIMAL(10 , 2 ) NOT NULL,
    descricao_mov VARCHAR(255),
    PRIMARY KEY (numero_conta , dtmov_conta),
    INDEX (numero_conta),
    FOREIGN KEY (numero_conta)
        REFERENCES conta (numero_conta)
)  ENGINE=INNODB;

INSERT INTO conta VALUES(12345, 'João', 'Silva', '1995-12-25', null, 0);
INSERT INTO conta VALUES(23497, 'Maria', 'Santos','1980-02-17', null, 0);
INSERT INTO conta VALUES(876, 'Pedro', 'Ferreira','1943-10-20', null, 0);
INSERT INTO conta VALUES(1236, 'Jéssica', 'Santos','1976-09-30', null, 0);
INSERT INTO conta VALUES(9875, 'Stephani','Pereira', '1990-05-07', null, 0);
INSERT INTO conta VALUES(6320, 'Paulo', 'Gomes','1987-03-24', null, 0);
INSERT INTO conta VALUES(470, 'Augusto', 'Oliveira','1995-01-15', null, 0);
INSERT INTO conta VALUES(987, 'Luana', 'Farias','1985-11-30', null, 0);
