create function consul_extrato_cont()
returns table(
id_extrato int,data_ini date, data_fim date,movimentacao varchar,valor numeric,classificacao varchar,desc_movi varchar
)
language SQL
begin atomic
select id_extrato,data_ini,data_fim,movimentacao,valor,classificacao,desc_movi from tb_extrato;

end;

