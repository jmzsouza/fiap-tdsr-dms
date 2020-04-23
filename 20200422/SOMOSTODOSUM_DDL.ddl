-- Gerado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   em:        2020-04-23 00:51:20 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE t_scu_bibliografia (
    cd_bibliografia    NUMBER(6) NOT NULL,
    nr_isbn13          NUMBER(13) NOT NULL,
    nm_titulo          VARCHAR2(60) NOT NULL,
    nm_autor           VARCHAR2(60) NOT NULL,
    nm_editora         VARCHAR2(60) NOT NULL,
    dt_ano_publicacao  NUMBER(4) NOT NULL
);

ALTER TABLE t_scu_bibliografia ADD CONSTRAINT t_scu_bibliografia_pk PRIMARY KEY ( cd_bibliografia );

CREATE TABLE t_scu_curso (
    cd_curso         NUMBER(3) NOT NULL,
    id_universidade  NUMBER(8) NOT NULL,
    nm_curso         VARCHAR2(70) NOT NULL,
    qt_horas_curso   NUMBER(7) NOT NULL,
    qt_vagas_curso   NUMBER(6) NOT NULL
);

ALTER TABLE t_scu_curso ADD CONSTRAINT t_scu_curso_pk PRIMARY KEY ( cd_curso );

CREATE TABLE t_scu_disc_biblio (
    sg_disciplina    VARCHAR2(4) NOT NULL,
    cd_bibliografia  NUMBER(6) NOT NULL
);

ALTER TABLE t_scu_disc_biblio ADD CONSTRAINT t_scu_disc_biblio_pk PRIMARY KEY ( sg_disciplina,
                                                                                cd_bibliografia );

CREATE TABLE t_scu_disciplina (
    sg_disciplina  VARCHAR2(4) NOT NULL,
    cd_curso       NUMBER(3) NOT NULL,
    nm_disciplina  VARCHAR2(30) NOT NULL,
    ds_conteudo    VARCHAR2(50) NOT NULL,
    nr_creditos    NUMBER(6) NOT NULL
);

ALTER TABLE t_scu_disciplina ADD CONSTRAINT t_scu_disciplina_pk PRIMARY KEY ( sg_disciplina );

CREATE TABLE t_scu_endereco (
    cd_endereco      NUMBER(6) NOT NULL,
    id_universidade  NUMBER(8) NOT NULL,
    nm_rua           VARCHAR2(70) NOT NULL,
    nr_numero        NUMBER(5) NOT NULL,
    nm_bairro        VARCHAR2(70) NOT NULL,
    nm_cidade        VARCHAR2(70) NOT NULL,
    nm_estado        VARCHAR2(50) NOT NULL,
    sg_estado        CHAR(2) NOT NULL
);

CREATE UNIQUE INDEX t_scu_endereco__idx ON
    t_scu_endereco (
        id_universidade
    ASC );

ALTER TABLE t_scu_endereco ADD CONSTRAINT t_scu_endereco_pk PRIMARY KEY ( cd_endereco );

CREATE TABLE t_scu_telefone (
    cd_telefone      NUMBER(5) NOT NULL,
    id_universidade  NUMBER(8) NOT NULL,
    nr_ddi           NUMBER(3) NOT NULL,
    nr_ddd           NUMBER(3) NOT NULL,
    nr_telefone      NUMBER(9) NOT NULL,
    nm_tipo          VARCHAR2(15) NOT NULL
);

ALTER TABLE t_scu_telefone ADD CONSTRAINT t_scu_telefone_pk PRIMARY KEY ( cd_telefone );

CREATE TABLE t_scu_universidade (
    id_universidade  NUMBER(8) NOT NULL,
    nm_universidade  VARCHAR2(70) NOT NULL,
    dt_fundacao      DATE NOT NULL,
    ds_endereco      VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    nr_telefone      NUMBER(13) NOT NULL
);

ALTER TABLE t_scu_universidade ADD CONSTRAINT t_scu_universidade_pk PRIMARY KEY ( id_universidade );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_scu_curso
    ADD CONSTRAINT t_scu_curso_t_scu_universidade_fk FOREIGN KEY ( id_universidade )
        REFERENCES t_scu_universidade ( id_universidade );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_scu_disc_biblio
    ADD CONSTRAINT t_scu_disc_biblio_t_scu_bibliografia_fk FOREIGN KEY ( cd_bibliografia )
        REFERENCES t_scu_bibliografia ( cd_bibliografia );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_scu_disc_biblio
    ADD CONSTRAINT t_scu_disc_biblio_t_scu_disciplina_fk FOREIGN KEY ( sg_disciplina )
        REFERENCES t_scu_disciplina ( sg_disciplina );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_scu_disciplina
    ADD CONSTRAINT t_scu_disciplina_t_scu_curso_fk FOREIGN KEY ( cd_curso )
        REFERENCES t_scu_curso ( cd_curso );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_scu_endereco
    ADD CONSTRAINT t_scu_endereco_t_scu_universidade_fk FOREIGN KEY ( id_universidade )
        REFERENCES t_scu_universidade ( id_universidade );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_scu_telefone
    ADD CONSTRAINT t_scu_telefone_t_scu_universidade_fk FOREIGN KEY ( id_universidade )
        REFERENCES t_scu_universidade ( id_universidade );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             1
-- ALTER TABLE                             13
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
-- ERRORS                                   7
-- WARNINGS                                 0
