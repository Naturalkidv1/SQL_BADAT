create database probando;
use probando;

/*
varias líneas de comentario
*/

-- una sola línea de comentario

-- definicion de tabla1

create table tabla1
(
	codt1 int not null,
    dest1 varchar(20) not null default 'descripción de campo',
    constraint pk_tabla1 primary key (codt1)
);

create table tabla2
(
	codt2 int not null,
    dest2 varchar(20) not null default 'descripción de campo',
	codt1 int null,
    constraint pk_tabla2 primary key (codt2),
    constraint fk_tabla2_tabla1 foreign key (codt1) references tabla1 (codt1)
		on delete no action on update cascade
);
-- on delete y on update tiene "no action", "cascade", "set null"

create table TRel2
(
	codt1 int not null,
    codt2 int not null,
    fechaRel2 date not null,
    constraint fk_tabla3_tabla1 foreign key (codt1) references tabla1 (codt1)
		on delete no action on update cascade,
    constraint fk_tabla3_tabla2 foreign key (codt2) references tabla2 (codt2)
		on delete no action on update cascade,
    constraint pk_tabla3 primary key (codt1, codt2)
);
