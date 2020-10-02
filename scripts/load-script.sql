DROP DATABASE IF EXISTS bancario;

CREATE DATABASE bancario;

USE bancario;

CREATE TABLE conta (
    nr_conta SMALLINT(5) UNSIGNED, /* Troquei o tipo da variavel para ocupar menos espaço no banco de dados, pois não há clientes que excedão 
    um numero de conta equivalente a 65536, precisando de inúmeros cadastros  */
    nm_cliente VARCHAR(15) NOT NULL,
    snm_cliente VARCHAR(15) NOT NULL,
    dtnasc_cliente DATE,
    dtabertura_conta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    saldo DECIMAL(10 , 2) NOT NULL DEFAULT 0,
    PRIMARY KEY (nr_conta)
)  ENGINE=INNODB;

CREATE TABLE movimentacao (
    nr_conta SMALLINT(5) UNSIGNED,
    dtmov_conta TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'NÃO USAR ISSO NA PRÁTICA!',
    vl_mov DECIMAL(10 , 2 ) NOT NULL,
    ds_mov VARCHAR(255),
    PRIMARY KEY (nr_conta , dtmov_conta),
    INDEX (nr_conta),
    FOREIGN KEY (nr_conta)
        REFERENCES conta (nr_conta)
)  ENGINE=INNODB;

INSERT INTO conta VALUES(12345, 'João', 'Silva', '1995-12-25', null, 0);
INSERT INTO conta VALUES(23497, 'Maria', 'Santos','1980-02-17', null, 0);
INSERT INTO conta VALUES(876, 'Pedro', 'Ferreira','1943-10-20', null, 0);
INSERT INTO conta VALUES(1236, 'Jéssica', 'Santos','1976-09-30', null, 0);
INSERT INTO conta VALUES(9875, 'Stephani','Pereira', '1990-05-07', null, 0);
INSERT INTO conta VALUES(6320, 'Paulo', 'Gomes','1987-03-24', null, 0);
INSERT INTO conta VALUES(470, 'Augusto', 'Oliveira','1995-01-15', null, 0);
INSERT INTO conta VALUES(987, 'Luana', 'Farias','1985-11-30', null, 0);
