-- Gerado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   em:        2020-05-29 01:14:03 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE t_sld_cliente (
    cd_cliente       NUMBER(8) NOT NULL,
    nm_cliente       VARCHAR2(60) NOT NULL,
    ds_sexo          VARCHAR2(15) NOT NULL,
    dt_nascimento    DATE,
    ds_endereco      VARCHAR2(100) NOT NULL,
    nr_telefone      NUMBER(15) NOT NULL,
    dt_cad_cliente   DATE NOT NULL,
    ds_estado_civil  VARCHAR2(15),
    ds_escolaridade  VARCHAR2(20)
);

ALTER TABLE t_sld_cliente ADD CONSTRAINT t_sld_cliente_pk PRIMARY KEY ( cd_cliente );

CREATE TABLE t_sld_cliente_endereco (
    cd_cliente          NUMBER(8) NOT NULL,
    nr_cep_endereco     NUMBER(8) NOT NULL,
    dt_cad_endereco     DATE NOT NULL,
    ds_endereco         VARCHAR2(100) NOT NULL,
    ds_tipo_endereco    VARCHAR2(15) NOT NULL,
    ds_status_endereco  VARCHAR2(15) NOT NULL
);

ALTER TABLE t_sld_cliente_endereco ADD CONSTRAINT t_sld_cliente_endereco_pk PRIMARY KEY ( cd_cliente,
                                                                                          nr_cep_endereco );

CREATE TABLE t_sld_embalagem (
    cd_embalagem        NUMBER(2) NOT NULL,
    ds_tipo_embalagem   VARCHAR2(15) NOT NULL,
    ds_embalagem        VARCHAR2(40) NOT NULL,
    ds_mater_embalagem  VARCHAR2(15) NOT NULL
);

ALTER TABLE t_sld_embalagem ADD CONSTRAINT t_sld_embalagem_pk PRIMARY KEY ( cd_embalagem );

CREATE TABLE t_sld_endereco (
    nr_cep_endereco  NUMBER(8) NOT NULL,
    nm_rua           VARCHAR2(70) NOT NULL,
    nr_endereco      NUMBER(5) NOT NULL,
    nm_bairro        VARCHAR2(70) NOT NULL,
    nm_cidade        VARCHAR2(70) NOT NULL,
    nm_estado        VARCHAR2(50) NOT NULL,
    sg_estado        CHAR(2) NOT NULL
);

ALTER TABLE t_sld_endereco ADD CONSTRAINT t_sld_endereco_pk PRIMARY KEY ( nr_cep_endereco );

CREATE TABLE t_sld_forma_pgto (
    cd_forma_pgto  NUMBER(2) NOT NULL,
    ds_forma_pgto  VARCHAR2(15) NOT NULL
);

ALTER TABLE t_sld_forma_pgto ADD CONSTRAINT t_sld_forma_pgto_pk PRIMARY KEY ( cd_forma_pgto );

CREATE TABLE t_sld_img_prod (
    cd_img_produto  NUMBER(2) NOT NULL,
    cd_produto      NUMBER(9) NOT NULL,
    ft_imagem       BLOB NOT NULL,
    nm_imagem       VARCHAR2(60) NOT NULL,
    tp_imagem       VARCHAR2(5) NOT NULL
);

ALTER TABLE t_sld_img_prod ADD CONSTRAINT t_sld_img_prod_pk PRIMARY KEY ( cd_img_produto );

CREATE TABLE t_sld_item_lista (
    cd_item_lista        NUMBER(9) NOT NULL,
    cd_lista_desejos     NUMBER(9) NOT NULL,
    cd_produto           NUMBER(9) NOT NULL,
    cd_forma_pgto        NUMBER(2) NOT NULL,
    dt_solicitacao_item  DATE NOT NULL,
    nr_qtd_item          NUMBER(3) NOT NULL,
    vl_unit_item         NUMBER(7, 2) NOT NULL,
    vl_total_item        NUMBER(9, 2) NOT NULL,
    ds_dia_entrega       VARCHAR2(15) NOT NULL
);

ALTER TABLE t_sld_item_lista ADD CONSTRAINT t_sld_item_lista_pk PRIMARY KEY ( cd_item_lista );

CREATE TABLE t_sld_lista_desejos (
    cd_lista_desejos  NUMBER(9) NOT NULL,
    cd_cliente        NUMBER(8) NOT NULL,
    dt_cad_lista      DATE NOT NULL,
    vl_total_pagar    NUMBER(9, 2) NOT NULL
);

ALTER TABLE t_sld_lista_desejos ADD CONSTRAINT t_sld_lista_desejos_pk PRIMARY KEY ( cd_lista_desejos );

CREATE TABLE t_sld_produto (
    cd_produto         NUMBER(9) NOT NULL,
    cd_embalagem       NUMBER(2) NOT NULL,
    cd_bar_produto     NUMBER(13) NOT NULL,
    ds_com_produto     VARCHAR2(40) NOT NULL,
    ds_det_produto     VARCHAR2(100) NOT NULL,
    nr_qtd_produto     NUMBER(4) NOT NULL,
    vl_produto         NUMBER(7, 2) NOT NULL,
    ds_status_produto  VARCHAR2(10) NOT NULL
);

ALTER TABLE t_sld_produto ADD CONSTRAINT t_sld_produto_pk PRIMARY KEY ( cd_produto );

CREATE TABLE t_sld_telefone (
    cd_telefone  NUMBER(5) NOT NULL,
    cd_cliente   NUMBER(8) NOT NULL,
    nr_ddi       NUMBER(3) NOT NULL,
    nr_ddd       NUMBER(3) NOT NULL,
    nr_telefone  NUMBER(9) NOT NULL,
    nm_tipo      VARCHAR2(15) NOT NULL
);

ALTER TABLE t_sld_telefone ADD CONSTRAINT t_sld_telefone_pk PRIMARY KEY ( cd_telefone );

ALTER TABLE t_sld_cliente_endereco
    ADD CONSTRAINT t_sld_cli_end_cliente_fk FOREIGN KEY ( cd_cliente )
        REFERENCES t_sld_cliente ( cd_cliente );

ALTER TABLE t_sld_cliente_endereco
    ADD CONSTRAINT t_sld_cli_end_endereco_fk FOREIGN KEY ( nr_cep_endereco )
        REFERENCES t_sld_endereco ( nr_cep_endereco );

ALTER TABLE t_sld_img_prod
    ADD CONSTRAINT t_sld_img_prod_produto_fk FOREIGN KEY ( cd_produto )
        REFERENCES t_sld_produto ( cd_produto );

ALTER TABLE t_sld_item_lista
    ADD CONSTRAINT t_sld_item_lista_desejos_fk FOREIGN KEY ( cd_lista_desejos )
        REFERENCES t_sld_lista_desejos ( cd_lista_desejos );

ALTER TABLE t_sld_item_lista
    ADD CONSTRAINT t_sld_item_lista_forma_pgto_fk FOREIGN KEY ( cd_forma_pgto )
        REFERENCES t_sld_forma_pgto ( cd_forma_pgto );

ALTER TABLE t_sld_item_lista
    ADD CONSTRAINT t_sld_item_lista_produto_fk FOREIGN KEY ( cd_produto )
        REFERENCES t_sld_produto ( cd_produto );

ALTER TABLE t_sld_lista_desejos
    ADD CONSTRAINT t_sld_lista_cliente_fk FOREIGN KEY ( cd_cliente )
        REFERENCES t_sld_cliente ( cd_cliente );

ALTER TABLE t_sld_produto
    ADD CONSTRAINT t_sld_produto_embalagem_fk FOREIGN KEY ( cd_embalagem )
        REFERENCES t_sld_embalagem ( cd_embalagem );

ALTER TABLE t_sld_telefone
    ADD CONSTRAINT t_sld_telefone_cliente_fk FOREIGN KEY ( cd_cliente )
        REFERENCES t_sld_cliente ( cd_cliente );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
