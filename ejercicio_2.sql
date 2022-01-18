
/*
PROFESORES: (^(numprof,*numdepto), despacho, fecnacim, fecingreso, sueldo, nomprof *(profdepen, deptodepen))
DEPTOS: (^numdepto, presupuesto, nomdepto, ubicacion)
ASIGNATURAS: (^numasigna, nomasigna, curso, *[numprof,numdepto])
IMPARTEN: (^*(numasigna),*(numprof,numdepto), anio_acad, grupo))
*/

create database ejercicio2;
use ejercicio2;

create table deptos
(
	numDepto int not null,
    presupuesto decimal (6,2) null,
    nomDepto varchar(60) null,
    ubicacion varchar(60) null,
    
    constraint pk_deptos primary key (numDepto)
);

create table profesores
(
	numProf int not null,
    numDepto int not null,
	despacho int null,
	fecNacim date null,
	fecIngreso date not null,
	sueldo decimal(6,2) null,
	nomProf varchar(60) null,
    -- Desde aquí
    constraint fk_deptos_centros foreign key (numDepto) references deptos (numDepto)
		on delete no action on update cascade,
	constraint pk_profesores primary key (numProf, numDepto),
    
    profDepen int not null,
    deptoDepen int not null,
    
    constraint fk_profesores_profesores foreign key (profDepen, deptoDepen) references profesores (numProf, numDepto)
		on delete no action on update cascade
	-- Hasta aquí, está mal, la correción es:
    /*
    constraint fk_deptos_centros foreign key (numDepto) references deptos (numDepto)
		on delete no action on update cascade,
	constraint pk_profesores primary key (numProf),
    
    profDepen int not null,
    
    constraint fk_profesores_profesores foreign key (profDepen) references profesores (numProf)
		on delete no action on update cascade
    */
);

create table asignaturas
(
	numAsigna int not null,
    nomAsigna varchar(60) not null,
    curso varchar(60) null,
    numProf int not null,
    numDepto int not null,
    
    constraint pk_asignaturas primary key (numAsigna),
    constraint fk_profesores_asignaturas foreign key (numProf, numDepto) references profesores (numProf, numDepto)
		on delete no action on update cascade
);

create table IMPARTEN
(
	numAsigna int not null,
    numProf int not null,
    numDepto int not null,
    anio_acad date not null, -- hasta aquí es pk
    grupo varchar(60) not null,
    
    constraint	fk_asignaturas_imparten foreign key (numAsigna) references asignaturas (numAsigna)
		on delete no action on update cascade,
	constraint fk_profesores_imparten foreign key (numProf, numDepto) references profesores (numProf, numDepto)
		on delete no action on update cascade,
	constraint pk_imparten primary key (numAsigna, numProf, numDepto, anio_acad, grupo)
);

use ejercicio2;
alter table IMPARTEN
	drop primary key,
    add constraint pk_impartir_new primary key (numAsigna, numProf, anio_acad);













