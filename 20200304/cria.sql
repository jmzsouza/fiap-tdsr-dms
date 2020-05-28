-- Gerado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   em:        2020-05-28 15:06:16 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE t_sip_departamento (
    cd_depto  NUMBER(2) NOT NULL,
    nm_depto  VARCHAR2(30) NOT NULL
);

ALTER TABLE t_sip_departamento ADD CONSTRAINT pk_sip_departamento PRIMARY KEY ( cd_depto );

CREATE TABLE t_sip_depedente (
    cd_dependente  NUMBER(3) NOT NULL,
    nr_matricula   NUMBER(5) NOT NULL,
    nm_dependente  VARCHAR2(60) NOT NULL,
    dt_nascimento  DATE NOT NULL
);

ALTER TABLE t_sip_depedente ADD CONSTRAINT pk_sip_depedente PRIMARY KEY ( cd_dependente,
                                                                          nr_matricula );

CREATE TABLE t_sip_funcionario (
    nr_matricula    NUMBER(5) NOT NULL,
    cd_depto        NUMBER(2) NOT NULL,
    nm_funcionario  VARCHAR2(2) NOT NULL,
    dt_nascimento   DATE,
    dt_admissao     DATE NOT NULL,
    ds_endereco     VARCHAR2(80) NOT NULL,
    vl_salario      NUMBER(7, 2) NOT NULL
);

ALTER TABLE t_sip_funcionario ADD CONSTRAINT pk_sip_funcionario PRIMARY KEY ( nr_matricula );

CREATE TABLE t_sip_implantacao (
    cd_implantacao  NUMBER(6) NOT NULL,
    cd_projeto      NUMBER(4) NOT NULL,
    nr_matricula    NUMBER(5) NOT NULL,
    dt_entrada      DATE NOT NULL,
    dt_saida        DATE
);

ALTER TABLE t_sip_implantacao ADD CONSTRAINT pk_sip_implantacao PRIMARY KEY ( cd_implantacao,
                                                                              cd_projeto );

CREATE TABLE t_sip_projeto (
    cd_projeto  NUMBER(4) NOT NULL,
    nm_projeto  VARCHAR2(40) NOT NULL,
    dt_inicio   DATE NOT NULL,
    dt_termino  DATE
);

ALTER TABLE t_sip_projeto ADD CONSTRAINT pk_sip_projeto PRIMARY KEY ( cd_projeto );

ALTER TABLE t_sip_funcionario
    ADD CONSTRAINT fk_depto_func FOREIGN KEY ( cd_depto )
        REFERENCES t_sip_departamento ( cd_depto );

ALTER TABLE t_sip_depedente
    ADD CONSTRAINT fk_func_dependente FOREIGN KEY ( nr_matricula )
        REFERENCES t_sip_funcionario ( nr_matricula );

ALTER TABLE t_sip_implantacao
    ADD CONSTRAINT fk_implantacao_func FOREIGN KEY ( nr_matricula )
        REFERENCES t_sip_funcionario ( nr_matricula );

ALTER TABLE t_sip_implantacao
    ADD CONSTRAINT fk_implantacao_projeto FOREIGN KEY ( cd_projeto )
        REFERENCES t_sip_projeto ( cd_projeto );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                              9
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
