create procedure adc_user(id_cont int ,crc varchar,cpf_cont varchar,cnpj_cont varchar,nome varchar,senha varchar,sexo char,email varchar,razao_social varchar,telefone varchar)
language SQL
begin atomic
insert into tb_contador values (id_cont,crc,cpf_cont,cnpj_cont,nome,senha,sexo,email,razao_social,telefone );

end;