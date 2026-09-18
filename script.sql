create table bolsaFamiliaPagamentos(
MES_COMPETENCIA varchar(8),
MES_REFERENCIA varchar(8),
UF varchar(2),
CODIGO_MUNICIPIO_SIAFI varchar(5),
NOME_MUNICIPIO varchar(100),
CPF_FAVORECIDO varchar(11),
NIS_FAVORECIDO varchar(11),
NOME_FAVORECIDO varchar(100),
VALOR_PARCELA varchar(10)
);




explain analyse select * from bolsaFamiliaPagamentos where NIS_FAVORECIDO = '16369724271' limit 10;
-- Consulta concluída 00:00:02.679 sem indice



CREATE INDEX index_cpf ON bolsaFamiliaPagamentos (CPF_FAVORECIDO);




explain analyse select * from bolsaFamiliaPagamentos where NIS_FAVORECIDO = '16369724271' limit 10;
-- Consulta concluída 00:00:00.541 mesma consulta na mesma tabela agora com indices
																																																																		
