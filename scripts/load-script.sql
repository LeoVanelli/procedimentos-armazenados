DROP DATABASE IF EXISTS bancario;

CREATE DATABASE bancario;

DROP DATABASE IF EXISTS bancario;

CREATE DATABASE bancario;

USE bancario;

CREATE TABLE conta (
    nr_conta SMALLINT(5) UNSIGNED auto_increment, /* Troquei o tipo da variavel para ocupar menos espaço no banco de dados, pois não há clientes que excedão 
    um numero de conta equivalente a 65536, precisando de inúmeros cadastros, além do auto_increment  */
    nm_cliente VARCHAR(15) NOT NULL,
    snm_cliente VARCHAR(15) NOT NULL,
    dt_nascimento DATE,
    dtabertura_conta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    saldo DECIMAL(10 , 2) NOT NULL DEFAULT 0,
    PRIMARY KEY (nr_conta)
)  ENGINE=INNODB;

CREATE TABLE movimentacao (
    nr_conta SMALLINT(5) UNSIGNED,
    dtmov_conta TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'NÃO USAR ISSO NA PRÁTICA!',
    vl_mov DECIMAL(10 , 2 ) NOT NULL,
    ds_mov VARCHAR(55),
    PRIMARY KEY (nr_conta , dtmov_conta),
    INDEX (nr_conta),
    FOREIGN KEY (nr_conta)
        REFERENCES conta (nr_conta)
)  ENGINE=INNODB;

INSERT INTO conta (nm_cliente,snm_cliente,dt_nascimento,dtabertura_conta, saldo)
VALUES('João', 'Silva', '1995-12-25', default, 0),
('Maria', 'Santos','1980-02-17', default, 0),
('Maria', 'Santos','1980-02-17', default, 0),
('Pedro', 'Ferreira','1943-10-20', default, 0),
('Jéssica', 'Santos','1976-09-30', default, 0),
('Stephani','Pereira', '1990-05-07', default, 0),
('Paulo', 'Gomes','1987-03-24', default, 0),
('Augusto', 'Oliveira','1995-01-15', default, 0),
('Luana', 'Farias','1985-11-30', default, 0),
('Leandro','Vanelli','2001-11-11',default,100);
