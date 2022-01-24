create database simulacion;

create table tipoCasos
(
	idTipoCaso int not null,
    desTipoCaso varchar(60) not null,
    constraint pk_tipoCasos primary key (idTipoCaso)
    
);

create table casos
(
	idCaso int not null,
    idTipoCaso int not null,
    desCaso varchar(60) not null,
    presupuesto double(7,2) unsigned,
    constraint fk_tipoCasos_casos foreign key (idTipoCaso) references tipoCasos (idTipoCaso)
		on delete no action on update cascade,
    constraint pk_casos primary key (idCaso, idTipoCaso)
    -- 
    
);

create table clientela
(
	idCliente int not null,
    desClient varchar(60) not null,
    estadoCivil enum('S','C','D','V'),
    constraint pk_clientela primary key (idCliente),
    codSujeto int not null,
    constraint fk_sujeto_clientela foreign key (codSujeto) references sujetos (codSujeto)
		on delete no action on update cascade
    
);


create table abogados
(
	idAbogado int not null,
    desAbogado varchar(60) not null,
    numColeg char(6) not null,
    codSujeto int not null,
    constraint pk_abogados primary key (idAbogado),
    constraint fk_sujeto_abogados foreign key (codSujeto) references sujetos (codSujeto)
		on delete no action on update no action
    
);

-- De los sujetos, conocemos su nombre y apellidos (máximo 20 carácteres cada uno), dni, direccion postal y electrónica 
-- (no debe repetirse, es decir cada sujeto tendrá una diferente) y su teléfono de contacto. 
-- usar unique

create table sujetos
(
	idSujeto int not null,
    nomSujeto varchar(20) not null,
    apell1Sujeto varchar(20) not null,
    apell2Sujeto varchar(20) null,
    dni char(9) not null,
    dirPostal char(5) not null,
    dirElec varchar(60) not null unique,
    telContact char(9) not null, 
    constraint pk_sujetos primary key (idSujeto)
    
    -- constraint dirElec_unique unique (dirElec)
);


-- Relaciones

