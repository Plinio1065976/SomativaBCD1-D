create database Hogwarts_University;

use Hogwarts_University;


create table usuarios(
	id bigint not null auto_increment,
    name varchar (150) not null,
    email varchar (150) not null,
    senha varchar (150) not null,
    nascimento date,
    ocupacaofk bigint not null,
    date datetime not null default now(),
    foreign key (ocupacaofk) references ocupacao(id),
    primary key (id)
);

create table ocupacao(
	id bigint not null auto_increment,
    cargo varchar (150) not null,
    nivelfk bigint not null,
    foreign key (nivelfk) references nivel(id),
    primary key (id)
);

create table nivel(
	id bigint not null auto_increment,
    nivel varchar (150) not null,
    primary key (id)
);

create table ambiente(
	id bigint not null auto_increment,
    name varchar (150) not null,
    bloco enum ("A","B","C","D") not null,
    lotacao bigint not null,
    check_listfk bigint,
	foreign key (check_listfk) references check_list(id),
    primary key (id)
);

create table itens(
	id bigint not null auto_increment,
    name varchar (150) not null,
    primary key (id)
);

create table check_list(
	id bigint not null auto_increment,
	itensfk bigint not null,
    foreign key (itensfk) references itens(id),
    primary key (id)
);

create table reserva(
	id bigint not null auto_increment,
    name varchar (150) not null,
    bloco enum ("A","B","C","D") not null,
    lotacao bigint not null,
    check_listfk bigint,
	reservafk bigint,
    foreign key (check_listfk) references check_list(id),
    foreign key (reservafk) references agendamento(id),
    primary key (id)
);

create table agendamento(
	id bigint not null auto_increment,
    evento varchar (150) not null,
    data_inicio date,
    data_termino date,
	ambientefk bigint not null,
    foreign key (ambientefk) references ambiente(id),
    primary key (id)
);