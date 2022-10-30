create table tb_contador(
id_cont int,
crc varchar(15),
cpf_cont varchar(15) NOT NULL,
cnpj_cont varchar(18),
nome varchar(15) NOT NULL,
senha varchar(12) NOT NULL,
sexo char(1) NOT NULL,
email varchar(30) NOT NULL,
razao_social varchar(30) NOT NULL,
telefone varchar(20) NOT NULL,
CONSTRAINT pk_tb_contador_crc primary key (id_cont)
);


create table tb_cliente(
id_cli int,
id_cont int NOT NULL,
cnpj varchar(18) NOT NULL,
cpf varchar(15) NOT NULL, 
nome varchar(30)NOT NULL,
senha varchar(12)NOT NULL,
sexo char(1) NOT NULL,
email varchar(30) NOT NULL,
telefone varchar(20) NOT NULL,
constraint pk_tb_cliente_id_cli primary key(id_cli),
constraint fk_tb_cliente_crc_id_cont foreign key (id_cont) 
	references tb_contador (id_cont)
);

create table tb_conta(
nmr_banco integer NOT NULL,
nmr_conta integer,
id_cli int not null,
tip_conta varchar(30) NOT NULL,
saldo numeric(10,2) NOT NULL,
constraint pk_tb_conta_nmr_conta primary key (nmr_conta),
constraint fk_tb_conta_nmr_banco foreign key (nmr_banco) 
	references tb_banco(nmr_banco),
constraint fk_tb_conta_id_cli foreign key (id_cli) 
	references tb_cliente(id_cli)
);


create table tb_extrato(
id_extrato int,
data_ini date not null,
data_fim date not null,
nmr_banco int not null,
id_cli int not null,
cnpj_cpf_rec varchar(18) not null,
valor numeric(10,2) not null,
movimentacao varchar(30) not null,
classificacao varchar(30) not null,
desc_movi varchar(30) not null,
	constraint pk_tb_extrato_id_extrato primary key (id_extrato),
constraint fk_tb_extrato_nmr_banco foreign key (nmr_banco)
	references tb_banco(nmr_banco),
constraint fk_tb_extrato_id_cli foreign key (id_cli)
	references tb_cliente(id_cli)
);


create table tb_banco(
nmr_agencia int,
nmr_banco int,
nome_banco varchar(30) not null,
cnpj_banco varchar(18) not null,
constraint pk_tb_banco_nmr_banco_nmr_agencia primary key(nmr_banco)
);