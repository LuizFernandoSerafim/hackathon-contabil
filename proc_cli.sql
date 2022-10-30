create procedure adc_cliente(id_cli int,id_cont int ,crc varchar,cpf_cont varchar,cnpj_cont varchar,nome varchar,senha varchar,sexo char,email varchar,telefone varchar)
language SQL
begin atomic
insert into tb_contador values (id_cli,id_cont,crc,cpf_cont,cnpj_cont,nome,senha,sexo,email,telefone );

end;