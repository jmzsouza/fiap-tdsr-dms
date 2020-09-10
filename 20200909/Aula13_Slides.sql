
--
-- Slide 7
--
CREATE TABLE t_sak_cliente (
    cd_cliente  NUMBER(10) NOT NULL,
	nm_cliente	VARCHAR2(30) NOT NULL,
	nr_cpf		NUMBER(12) NOT NULL,
	ds_genero	VARCHAR2(30),
	dt_cadastro	DATE
);

ALTER TABLE t_sak_cliente ADD CONSTRAINT pk_sak_cliente PRIMARY KEY ( cd_cliente );
ALTER TABLE t_sak_cliente ADD CONSTRAINT un_sak_cliente_cpf UNIQUE ( nr_cpf );


--
-- Slide 8
--
ALTER TABLE t_sak_cliente ADD DS_EMAIL VARCHAR2(80);
ALTER TABLE t_sak_cliente ADD (DS_OBS1 VARCHAR2(50) NOT NULL, DS_OBS2 VARCHAR2(50) );


--
-- Slide 9
--
ALTER TABLE t_sak_cliente MODIFY ds_obs1 VARCHAR2(80);
ALTER TABLE t_sak_cliente MODIFY nm_cliente CHAR(80);
ALTER TABLE t_sak_cliente MODIFY ds_genero NOT NULL;
ALTER TABLE t_sak_cliente MODIFY dt_cadastro DEFAULT SYSDATE;

--
-- Slide 10
--
ALTER TABLE t_sak_cliente MODIFY ds_genero NULL;
ALTER TABLE t_sak_cliente MODIFY ds_obs1 NULL;

--
-- Slide 11
--
ALTER TABLE t_sak_cliente DROP COLUMN ds_obs2;
ALTER TABLE t_sak_cliente DROP (ds_obs1, ds_email);

--
-- Slide 12
--
ALTER TABLE t_sak_cliente DROP CONSTRAINT pk_sak_cliente CASCADE;


--
-- Slide 13
--
ALTER TABLE t_sak_cliente DROP CONSTRAINT un_sak_cliente_cpf;

ALTER TABLE t_sak_cliente MODIFY dt_cadastro DEFAULT NULL;


--
-- Slide 14
--
ALTER TABLE t_sak_cliente RENAME TO t_sak_cli;
ALTER TABLE t_sak_cli RENAME COLUMN nm_cliente TO nm_cli;


--
-- Slide 16
--
COMMENT ON TABLE t_sak_cli IS 'A tabela de cliente irá receber todas as informações dos clientes da Sakspilpad';
COMMENT ON COLUMN t_sak_cli.nm_cli IS 'O nome do cliente deve ser preenchido em letras maiúscula e pode conter ate 60 caracteres. Seu conteúdo é obrigatório';

--
-- Slide 17
--
SELECT COMMENTS FROM  USER_TAB_COMMENTS WHERE TABLE_NAME = 'T_SAK_CLI';
SELECT COMMENTS FROM  USER_COL_COMMENTS WHERE TABLE_NAME = 'T_SAK_CLI' AND COLUMN_NAME = 'NM_CLI';



