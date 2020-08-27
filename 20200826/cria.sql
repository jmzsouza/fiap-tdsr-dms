-- Gerado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   em:        2020-08-26 22:59:39 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE t_proj_papel_proj (
    cd_projeto            NUMBER(4) NOT NULL,
    cd_papel_projeto      NUMBER(2) NOT NULL,
    dt_inicio_papel_proj  DATE NOT NULL,
    dt_fim_papel_proj     DATE NOT NULL
);

ALTER TABLE t_proj_papel_proj ADD CONSTRAINT pk_proj_papel_proj PRIMARY KEY ( cd_projeto,
                                                                              cd_papel_projeto );

CREATE TABLE t_scp_bairro (
    cd_bairro  NUMBER(6) NOT NULL,
    cd_cidade  NUMBER(4) NOT NULL,
    nm_bairro  VARCHAR2(75) NOT NULL
);

ALTER TABLE t_scp_bairro ADD CONSTRAINT pk_scp_bairro PRIMARY KEY ( cd_bairro );

CREATE TABLE t_scp_cidade (
    cd_cidade  NUMBER(4) NOT NULL,
    cd_estado  NUMBER(2) NOT NULL,
    nm_cidade  VARCHAR2(50) NOT NULL
);

ALTER TABLE t_scp_cidade ADD CONSTRAINT pk_scp_cidade PRIMARY KEY ( cd_cidade );

CREATE TABLE t_scp_departamento (
    cd_departamento  NUMBER(2) NOT NULL,
    cd_funcionario   NUMBER(4) NOT NULL,
    nm_departamento  VARCHAR2(30) NOT NULL
);

ALTER TABLE t_scp_departamento ADD CONSTRAINT pk_scp_departamento PRIMARY KEY ( cd_departamento );

CREATE TABLE t_scp_endereco (
    nr_cep              NUMBER(8) NOT NULL,
    cd_bairro           NUMBER(6) NOT NULL,
    cd_tipo_logradouro  NUMBER(2) NOT NULL,
    ds_logradouro       VARCHAR2(100) NOT NULL
);

ALTER TABLE t_scp_endereco ADD CONSTRAINT pk_scp_endereco PRIMARY KEY ( nr_cep );

CREATE TABLE t_scp_estado (
    cd_estado  NUMBER(2) NOT NULL,
    nm_estado  VARCHAR2(25) NOT NULL,
    sg_estado  VARCHAR2(2) NOT NULL
);

ALTER TABLE t_scp_estado ADD CONSTRAINT pk_scp_estado PRIMARY KEY ( cd_estado );

CREATE TABLE t_scp_estado_civil (
    cd_estado_civil  NUMBER(2) NOT NULL,
    ds_estado_civil  VARCHAR2(20) NOT NULL
);

ALTER TABLE t_scp_estado_civil ADD CONSTRAINT pk_scp_estado_civil PRIMARY KEY ( cd_estado_civil );

CREATE TABLE t_scp_func_endereco (
    nr_cep            NUMBER(8) NOT NULL,
    cd_funcionario    NUMBER(4) NOT NULL,
    cd_tipo_endereco  NUMBER(2) NOT NULL,
    ds_complemento    VARCHAR2(20) NOT NULL,
    nr_logradouro     NUMBER(5) NOT NULL
);

ALTER TABLE t_scp_func_endereco
    ADD CONSTRAINT pk_scp_func_endereco PRIMARY KEY ( cd_tipo_endereco,
                                                      cd_funcionario,
                                                      nr_cep );

CREATE TABLE t_scp_func_fone (
    cd_funcionario  NUMBER(4) NOT NULL,
    nr_ddd          NUMBER(3) NOT NULL,
    nr_telefone     NUMBER(9) NOT NULL,
    cd_tipo_fone    NUMBER(1) NOT NULL,
    nr_ramal        NUMBER(5)
);

ALTER TABLE t_scp_func_fone
    ADD CONSTRAINT pk_scp_func_fone PRIMARY KEY ( nr_ddd,
                                                  nr_telefone,
                                                  cd_funcionario );

CREATE TABLE t_scp_func_papel_proj (
    cd_funcionario        NUMBER(4) NOT NULL,
    cd_papel_projeto      NUMBER(2) NOT NULL,
    dt_inicio_papel_func  DATE NOT NULL,
    dt_fim_papel_func     DATE NOT NULL
);

ALTER TABLE t_scp_func_papel_proj ADD CONSTRAINT pk_scp_func_papel_proj PRIMARY KEY ( cd_funcionario,
                                                                                      cd_papel_projeto );

CREATE TABLE t_scp_funcionario (
    cd_funcionario       NUMBER(4) NOT NULL,
    cd_estado_civil      NUMBER(2) NOT NULL,
    cd_genero            NUMBER(2) NOT NULL,
    nm_funcionario       VARCHAR2(75) NOT NULL,
    dt_nasc_funcionario  DATE NOT NULL,
    dt_admissao          DATE NOT NULL,
    vl_salario_func      NUMBER(7, 2) NOT NULL
);

ALTER TABLE t_scp_funcionario ADD CONSTRAINT pk_scp_funcionario PRIMARY KEY ( cd_funcionario );

CREATE TABLE t_scp_genero (
    cd_genero  NUMBER(2) NOT NULL,
    nm_genero  VARCHAR2(30) NOT NULL
);

ALTER TABLE t_scp_genero ADD CONSTRAINT pk_scp_genero PRIMARY KEY ( cd_genero );

CREATE TABLE t_scp_implantacao (
    cd_implantacao          NUMBER(4) NOT NULL,
    cd_projeto              NUMBER(4) NOT NULL,
    cd_departamento         NUMBER(2) NOT NULL,
    cd_funcionario          NUMBER(4) NOT NULL,
    dt_entrada_implantacao  DATE NOT NULL,
    dt_saida_implantacao    DATE NOT NULL
);

ALTER TABLE t_scp_implantacao ADD CONSTRAINT pk_scp_implantacao PRIMARY KEY ( cd_projeto,
                                                                              cd_implantacao );

CREATE TABLE t_scp_papel_projeto (
    cd_papel_projeto  NUMBER(2) NOT NULL,
    ds_papel_proejto  VARCHAR2(30) NOT NULL
);

ALTER TABLE t_scp_papel_projeto ADD CONSTRAINT pk_scp_papel_projeto PRIMARY KEY ( cd_papel_projeto );

CREATE TABLE t_scp_projeto (
    cd_projeto           NUMBER(4) NOT NULL,
    nm_projeto           VARCHAR2(50) NOT NULL,
    dt_inicio_projeto    DATE NOT NULL,
    dt_fim_prev_projeto  DATE NOT NULL,
    vl_budget_projeto    NUMBER(9, 2) NOT NULL
);

ALTER TABLE t_scp_projeto ADD CONSTRAINT pk_scp_projeto PRIMARY KEY ( cd_projeto );

CREATE TABLE t_scp_tipo_endereco (
    cd_tipo_endereco  NUMBER(2) NOT NULL,
    nm_tipo_endereco  VARCHAR2(15) NOT NULL
);

ALTER TABLE t_scp_tipo_endereco ADD CONSTRAINT pk_scp_tipo_endereco PRIMARY KEY ( cd_tipo_endereco );

CREATE TABLE t_scp_tipo_fone (
    cd_tipo_fone  NUMBER(1) NOT NULL,
    ds_tipo_fone  VARCHAR2(15) NOT NULL
);

ALTER TABLE t_scp_tipo_fone ADD CONSTRAINT pk_scp_tipo_telefone PRIMARY KEY ( cd_tipo_fone );

CREATE TABLE t_scp_tipo_logradouro (
    cd_tipo_logradouro  NUMBER(2) NOT NULL,
    nm_tipo_logradouro  VARCHAR2(20) NOT NULL
);

ALTER TABLE t_scp_tipo_logradouro ADD CONSTRAINT pk_scp_tipo_logradouro PRIMARY KEY ( cd_tipo_logradouro );

ALTER TABLE t_scp_endereco
    ADD CONSTRAINT fk_bairro_endereco FOREIGN KEY ( cd_bairro )
        REFERENCES t_scp_bairro ( cd_bairro );

ALTER TABLE t_scp_bairro
    ADD CONSTRAINT fk_cidade_bairro FOREIGN KEY ( cd_cidade )
        REFERENCES t_scp_cidade ( cd_cidade );

ALTER TABLE t_scp_implantacao
    ADD CONSTRAINT fk_depto_implantacao FOREIGN KEY ( cd_departamento )
        REFERENCES t_scp_departamento ( cd_departamento );

ALTER TABLE t_scp_func_endereco
    ADD CONSTRAINT fk_endereco_func_end FOREIGN KEY ( nr_cep )
        REFERENCES t_scp_endereco ( nr_cep );

ALTER TABLE t_scp_cidade
    ADD CONSTRAINT fk_estado_cidade FOREIGN KEY ( cd_estado )
        REFERENCES t_scp_estado ( cd_estado );

ALTER TABLE t_scp_funcionario
    ADD CONSTRAINT fk_estado_civil_func FOREIGN KEY ( cd_estado_civil )
        REFERENCES t_scp_estado_civil ( cd_estado_civil );

ALTER TABLE t_scp_departamento
    ADD CONSTRAINT fk_func_departamento FOREIGN KEY ( cd_funcionario )
        REFERENCES t_scp_funcionario ( cd_funcionario );

ALTER TABLE t_scp_implantacao
    ADD CONSTRAINT fk_func_implantacao FOREIGN KEY ( cd_funcionario )
        REFERENCES t_scp_funcionario ( cd_funcionario );

ALTER TABLE t_scp_func_papel_proj
    ADD CONSTRAINT fk_func_papel_proj FOREIGN KEY ( cd_funcionario )
        REFERENCES t_scp_funcionario ( cd_funcionario );

ALTER TABLE t_scp_func_fone
    ADD CONSTRAINT fk_funcionario_fone FOREIGN KEY ( cd_funcionario )
        REFERENCES t_scp_funcionario ( cd_funcionario );

ALTER TABLE t_scp_func_endereco
    ADD CONSTRAINT fk_funcionario_func_end FOREIGN KEY ( cd_funcionario )
        REFERENCES t_scp_funcionario ( cd_funcionario );

ALTER TABLE t_scp_funcionario
    ADD CONSTRAINT fk_genero_funcionaro FOREIGN KEY ( cd_genero )
        REFERENCES t_scp_genero ( cd_genero );

ALTER TABLE t_scp_endereco
    ADD CONSTRAINT fk_logradouro_endereco FOREIGN KEY ( cd_tipo_logradouro )
        REFERENCES t_scp_tipo_logradouro ( cd_tipo_logradouro );

ALTER TABLE t_scp_func_papel_proj
    ADD CONSTRAINT fk_papel_projeto_func FOREIGN KEY ( cd_papel_projeto )
        REFERENCES t_scp_papel_projeto ( cd_papel_projeto );

ALTER TABLE t_proj_papel_proj
    ADD CONSTRAINT fk_papel_projeto_proj FOREIGN KEY ( cd_papel_projeto )
        REFERENCES t_scp_papel_projeto ( cd_papel_projeto );

ALTER TABLE t_scp_implantacao
    ADD CONSTRAINT fk_projeto_implantacao FOREIGN KEY ( cd_projeto )
        REFERENCES t_scp_projeto ( cd_projeto );

ALTER TABLE t_proj_papel_proj
    ADD CONSTRAINT fk_projeto_papel_proj FOREIGN KEY ( cd_projeto )
        REFERENCES t_scp_projeto ( cd_projeto );

ALTER TABLE t_scp_func_endereco
    ADD CONSTRAINT fk_tipo_end_func_end FOREIGN KEY ( cd_tipo_endereco )
        REFERENCES t_scp_tipo_endereco ( cd_tipo_endereco );

ALTER TABLE t_scp_func_fone
    ADD CONSTRAINT fk_tipo_fone_func FOREIGN KEY ( cd_tipo_fone )
        REFERENCES t_scp_tipo_fone ( cd_tipo_fone );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            18
-- CREATE INDEX                             0
-- ALTER TABLE                             37
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
