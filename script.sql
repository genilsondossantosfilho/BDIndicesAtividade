create table bolsaFamiliaPagamentos(
MES_COMPETENCIA varchar(8),
MES_REFERENCIA varchar(8),
UF varchar(2),
CODIGO_MUNICIPIO_SIAFI varchar(5),
NOME_MUNICIPIO varchar(100),
CPF_FAVORECIDO varchar(15),
NIS_FAVORECIDO varchar(11),
NOME_FAVORECIDO varchar(100),
VALOR_PARCELA varchar(10)
);

COPY bolsaFamiliaPagamentos FROM 'C:\Users\zenildo\Downloads\animes e series/202101_BolsaFamilia_Pagamentos.csv'
WITH (FORMAT csv, HEADER, DELIMITER ';', ENCODING 'WIN1252');



explain analyse select * from bolsaFamiliaPagamentos where NIS_FAVORECIDO = '16369724271' limit 10;
-- Consulta concluída "Execution time: 196581.811 ms" sem indice



create index index_nis ON bolsaFamiliaPagamentos (NIS_FAVORECIDO);
-- demorou Query returned successfully with no result in 1558929 ms.



explain analyse select * from bolsaFamiliaPagamentos where NIS_FAVORECIDO = '16369724271' limit 10;
-- "Execution time: 35.584 ms" mesma consulta na mesma tabela agora com indices


create table bolsaFamiliaPagamentos2(
MES_COMPETENCIA varchar(8),
MES_REFERENCIA varchar(8),
UF varchar(2),
CODIGO_MUNICIPIO_SIAFI varchar(5),
NOME_MUNICIPIO varchar(100),
CPF_FAVORECIDO varchar(15),
NIS_FAVORECIDO varchar(11),
NOME_FAVORECIDO varchar(100),
VALOR_PARCELA varchar(10)
);



COPY bolsaFamiliaPagamentos2 FROM 'C:\Users\zenildo\Downloads\animes e series\202001_BolsaFamilia_Pagamentos2.csv'
WITH (FORMAT csv, HEADER, DELIMITER ';', ENCODING 'WIN1252');

select * from bolsaFamiliaPagamentos2 limit 10


create index index_nis2 ON bolsaFamiliaPagamentos2 (NIS_FAVORECIDO);




EXPLAIN ANALYZE
select b1.NOME_FAVORECIDO, b1.NOME_MUNICIPIO from bolsaFamiliaPagamentos b1
inner join bolsaFamiliaPagamentos2 b2
on b1.NIS_FAVORECIDO = b2.NIS_FAVORECIDO
where b1.NIS_FAVORECIDO = '20921128228'

-- tempo de consulta usando os 2 index "Execution time: 0.446 ms"

drop index index_nis

drop index index_nis2



EXPLAIN ANALYZE
select b1.NOME_FAVORECIDO, b1.NOME_MUNICIPIO from bolsaFamiliaPagamentos b1
inner join bolsaFamiliaPagamentos2 b2
on b1.NIS_FAVORECIDO = b2.NIS_FAVORECIDO
where b1.NIS_FAVORECIDO = '20921128228'
-- mesma consulta mas sem os 2 indexes "Execution time: 98246.814 ms"




