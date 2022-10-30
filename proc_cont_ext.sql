create procedure cont_ext(data_ini date,data_fim date,nome varchar,cpf varchar,cnpj varchar)
language sql
BEGIN ATOMIC

SELECT ex.id_extrato,ex.data_ini, ex.data_fim,c.cpf varchar,c.cnpj,c.nome,ex.movimentacao,ex.valor,
ex.classificacao,ex.desc_movi
from tb_cliente c
inner join consul_extrato_cont() ex on c.id_cli = ex.id_extrato;

end;
