
--
-- Você criou o projeto Sakspildap junto com seu professor e agora que o projeto está em testes finais 
-- antes de entrar em produção surgiu a necessidade de se realizar as algumas melhorias. 
-- Para agilizar o acesso as essas novas estruturas de informação foi solicitado que se realize os seguintes procedimentos:
--

--
-- Exercício 1
-- Utilizando o conceito de DDL manual, altere a estrutura da tabela T_SAK_DEPTO incluindo a coluna sigla do departamento, 
-- denominada SG_DEPTO como sendo CHAR(2) com conteúdo opcional.
--

ALTER TABLE t_sak_depto ADD sg_depto CHAR(2) NULL;

--
-- Exercício 2
-- Para a coluna NM_DEPTO crie uma chave ÚNICA.
--

ALTER TABLE t_sak_depto ADD CONSTRAINT un_nm_depto UNIQUE ( nm_depto );

--
-- Exercício 3
-- Para a coluna SG_DEPTO crie uma chave ÚNICA.
-- Houve um equívoco e agora a coluna SG_DEPTO deve ter o conteúdo CHAR(3).
-- Realize o comando que altera a sua estrutura para esse novo tamanho.
--

ALTER TABLE t_sak_depto ADD CONSTRAINT un_sg_depto UNIQUE ( sg_depto );
ALTER TABLE t_sak_depto MODIFY sg_depto CHAR(3);

--
-- Exercício 4
-- Na tabela T_SAK_TIPO_ENDERECO, crie uma coluna DT_CADASTRO do tipo DATE com conteúdo opcional.
--

ALTER TABLE t_sak_tipo_endereco ADD dt_cadastro DATE;

--
-- Exercício 5
-- Agora essa coluna deve ser obrigatória. Utilize o comando ALTER TABLE para criar essa restrição.
--

ALTER TABLE t_sak_tipo_endereco MODIFY dt_cadastro DATE NOT NULL;

--
-- Exercício 6
-- A coluna DT_CADASTRO não ficou boa nessa tabela. Favor elimina-la via comando ALTER TABLE
--

ALTER TABLE t_sak_tipo_endereco DROP COLUMN dt_cadastro;
DESCRIBE t_sak_tipo_endereco