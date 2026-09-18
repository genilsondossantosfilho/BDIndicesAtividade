
explain analyse select * from bolsaFamiliaPagamentos where NIS_FAVORECIDO = '16369724271' limit 10;
-- Consulta concluída 00:00:02.679 sem indice



CREATE INDEX index_cpf ON bolsaFamiliaPagamentos (CPF_FAVORECIDO);




explain analyse select * from bolsaFamiliaPagamentos where NIS_FAVORECIDO = '16369724271' limit 10;
-- Consulta concluída 00:00:00.541 mesma consulta na mesma tabela agora com indices



CREATE TABLE notasFiscais (
    chave_acesso varchar(44),
    modelo varchar(100),
    serie varchar(10),
    numero varchar(20),
    natureza_operacao varchar(100),
    data_emissao varchar(20),
    evento_mais_recente varchar(100),
    data_hora_evento varchar(20),
    cpf_cnpj_emitente varchar(20),
    razao_social_emitente varchar(200),
    inscricao_estadual_emitente varchar(20),
    uf_emitente varchar(2),
    municipio_emitente varchar(100),
    codigo_orgao_superior_dest varchar(10),
    orgao_superior_dest varchar(200),
    codigo_orgao_dest varchar(10),
    orgao_dest varchar(200),
    cnpj_destinatario varchar(20),
    nome_destinatario varchar(200),
    uf_destinatario varchar(2),
    indicador_ie_destinatario varchar(50),
    destino_operacao varchar(50),
    consumidor_final varchar(50),
    presenca_comprador varchar(50),
    valor_nota_fiscal varchar(20)
);





COPY vinculos FROM '/tmp/vinculos.csv' WITH (
    FORMAT csv, HEADER,DELIMITER ',',   ENCODING 'LATIN1'
);


COPY notasFiscais FROM '/tmp/202601_NFe_NotaFiscal.csv' WITH (
    FORMAT csv, HEADER,DELIMITER ';',   ENCODING 'LATIN1'
);

cp /home/aluno/Downloads/genilson/202601_NFe_NotaFiscal.csv /tmp/

chmod 644 /tmp/202601_NFe_NotaFiscal.csv
ls -l /tmp/202601_NFe_NotaFiscal.csv


select * from notasFiscais limit 10

drop index index_cpf


select b.CPF_FAVORECIDO, n.modelo from 
notasFiscais
-- add mais uma tabela e faça alguns joins 



