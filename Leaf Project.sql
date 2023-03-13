create database leafproject;
use leafproject;

create table usuario(
idUsuario int primary key auto_increment,
nome varchar(15) not null,
sobrenome varchar(50) not null,
email varchar(30) not null,
senha varchar(15) not null,
telefone varchar(15),
cpf char(15) unique
);

create table empresa(
idEmpresa int primary key auto_increment,
razaoSocial varchar(40) not null,
CNPJ char(25) not null,
email varchar(30) not null,
telefone varchar(15)
);

create table planta(
idPlanta int primary key auto_increment,
tipoPlanta varchar(30), constraint chkEspecie
	check (tipoPlanta like 'alface%'),
diasDesenvolvimento int,
areaMetro float,
tempoLuz float
);

create table sensor(
idSensor int primary key auto_increment,
tipoSensor varchar(10), constraint chkTipo 
	check (tipoSensor in ('LDR')),
qtdSensor int,
condicao varchar(10), constraint chkCondicao
	check (condicao in ('ativado', 'desativado', 'manutencao'))
);

create table dadosSensor(
idDados int primary key auto_increment,
resistencia float not null,
hrCaptacao datetime default current_timestamp
);

create table endereco(
idEndereco int primary key auto_increment,
logradouro varchar(50), 
complemento varchar(20),
bairro varchar(40),
CEP CHAR(9),
cidade VARCHAR(40),
UF CHAR(2)
    );
    
    
insert into usuario (nome, sobrenome, telefone, email, senha, cpf) values
('João', 'Silva', '(11) 9999-8888', 'joao.silva@email.com', 'senha123', '111.222.333-44'),
('Maria', 'Santos', '(21) 98888-7777', 'maria.santos@email.com', 'abc123', '222.333.444-55'),
('Pedro', 'Ferreira', '(31) 97777-6666', 'pedro.ferreira@email.com', 'senha456', '333.444.555-66'),
('Ana', 'Costa', '(41) 96666-5555', 'ana.costa@email.com', 'def456', '444.555.666-77'),
('Carlos', 'Oliveira', '(51) 95555-4444', 'carlos.oliveira@email.com', 'senha789', '555.666.777-88'),
('Mariana', 'Rocha', '(61) 94444-3333', 'mariana.rocha@email.com', 'ghi789', '666.777.888-99'),
('Lucas', 'Pereira', '(71) 93333-2222', 'lucas.pereira@email.com', 'senhaabc', '777.888.999-00'),
('Isabela', 'Souza', '(81) 92222-1111', 'isabela.souza@email.com', 'jkl123', '888.999.000-11'),
('Rafael', 'Alves', '(91) 91111-0000', 'rafael.alves@email.com', 'mno345', '999.000.111-22'),
('Fernanda', 'Lima', '(32) 98888-7777', 'fernanda.lima@email.com', 'pqr678', '000.111.222-33');

insert into empresa (razaoSocial, CNPJ, email, telefone) values
('Tecno S.A.', '62.869.609/0001-43', 'contato@tecnosa.com', '(11) 1234-5678'),
('Vivax Ltda.', '09.877.495/0001-12', 'atendimento@vivax.com.br', '(21) 9876-5432'),
('Florestal Brasil S.A.', '28.377.064/0001-58', 'contato@florestalbrasil.com', '(31) 5556-4760'),
('Inovação Tecnológica Ltda.', '34.231.568/0001-54', 'contato@inovatec.com', '(41) 1251-1851'),
('Nacional Transportes S.A.', '92.345.678/0001-10', 'sac@nacionaltransportes.com', '(51) 2987-2259'),
('Maxi Comércio Ltda.', '06.958.321/0001-75', 'atendimento@maxicomercio.com', '(85) 9330-0317');

insert into planta (tipoPlanta, diasDesenvolvimento, areaMetro, tempoLuz) values
('Alface Americana', 60, 50.9, 12),
('Alface Crespa', 50, 33, 10),
('Alface Lisa', 55, 71.2, 11),
('Alface Romana', 65, 10, 13);

insert into sensor(tipoSensor, qtdSensor, condicao) values
('LDR', 10, 'ativado'),
('LDR', 5, 'desativado'),
('LDR', 3, 'manutencao'),
('LDR', 7, 'ativado'),
('LDR', 2, 'manutencao'),
('LDR', 4, 'desativado'),
('LDR', 8, 'ativado');

insert into dadosSensor (resistencia) values 
(350.5),
(400.2),
(250.3),
(320.1),
(275.8),
(450.0),
(390.7);

insert into endereco (logradouro, complemento, bairro, CEP, cidade, UF) values
('Rua A', 'Apto 101', 'Centro', '12345-678', 'São Paulo', 'SP'),
('Rua B', 'Casa 102', 'Jardim', '23456-789', 'Rio de Janeiro', 'RJ'),
('Rua C', 'Sala 201', 'Barra Funda', '34567-890', 'São Paulo', 'SP'),
('Avenida D', 'Loja 10', 'Lagoa', '45678-901', 'Belo Horizonte', 'MG'),
('Rua E', 'Casa 202', 'Jardim', '56789-012', 'Porto Alegre', 'RS'),
('Rua F', 'Casa 301', 'Centro', '67890-123', 'Salvador', 'BA'),
('Rua G', 'Loja 15', 'Boa Vista', '78901-234', 'Curitiba', 'PR'),
('Rua H', 'Casa 402', 'Centro', '89012-345', 'Recife', 'PE'),
('Avenida I', 'Sala 501', 'Itaim Bibi', '90123-456', 'São Paulo', 'SP'),
('Rua J', 'Casa 502', 'Santana', '01234-567', 'São Paulo', 'SP');

desc usuario;
desc empresa;
desc sensor;
desc dadosSensor;
desc endereco;


select * from usuario;
select * from usuario where idUsuario = 5;
select * from usuario where sobrenome = 'Silva';
select * from usuario where cpf is not null;
select * from usuario where telefone is not null;

select * from empresa;
select * from empresa where idEmpresa = 3;
select * from empresa where CNPJ like '%23%';


select * from planta;
select * from planta where idPlanta = 2;
select * from planta where tipoPlanta like '%ro%';
select * from planta where areaMetro < 50;

select * from sensor;
select * from sensor where idSensor = 7;
select * from sensor where condicao = 'desativado';

select * from dadosSensor;
select * from dadosSensor where idDados = 1;
select * from dadosSensor where resistencia < 360;

select * from endereco;
select * from endereco where idEndereco = 9;
select * from endereco where cidade = 'São Paulo';
select * from endereco where CEP like '%45%';
