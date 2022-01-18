create database probando2;
use probando2;

/*
EMPLEADOS:(^(numepleado), extelefon, fecnacim, fecingreso, salario, comision, numhijos, nomemp, *[numdepto,numcentro])
DEPTOS: (^(numdepto,*numcentro), presupuesto, nomdepto)
CENTROS: (^(numcentro), nomcentro, dirreccion)
DIR: (^(*numempleado,*[numdpeto,numcentro], fecindir, fecfindir))
DEP: (^(*[numdpeto,numcentro]))
*/

create table centro
(
	numCentro int not null,
    nomCentro varchar(60) not null,
    dirreccion varchar(120) not null,
    constraint pk_centro primary key (numCentro)
);

create table if not exists deptos
(
	numDepto int not null,
    numCentro int not null,
    presupuesto decimal (10,2),
    nomDepto varchar(60) not null,
    constraint fk_deptos_centro foreign key (numCentro) references centro (numCentro)
		on delete no action on update cascade,
	constraint pk_deptos primary key (numDepto, numCentro),
    deptodepen int not null,
    centrodepen int not null,
    constraint fk_deptos_deptos foreign key (deptodepen, centrodepen) references deptos (numDepto, numCentro)
		on delete no action on update cascade
    
);

create table empleados
(
	numEmpleado int not null,
    exTelefon char(3) null,
    fecNacim date not null,
    fecIngreso date not null,
    salario decimal (7,2),
    comision decimal (4,2),
    numHijos tinyint unsigned,
    nomEmp varchar(20) not null,
    numDepto int not null,
    numCentro int not null,
    constraint pk_empleados primary key (numEmpleado),
    constraint fk_empleados_deptos foreign key (numDepto, numCentro) references deptos (numDepto, numCentro)
		on delete no action on update cascade
);

create table DIR
(
    numEmpleado int not null,
    numDepto int not null,
    numCentro int not null,
    fecInDir date not null,
    fecFinDir date not null,
    constraint fk_DIR_empleado foreign key (numEmpleado) references empleados (numEmpleado)
		on delete no action on update cascade,
    constraint fk_DIR_deptos foreign key (numDepto, numCentro) references deptos (numDepto, numCentro)
		on delete no action on update cascade,
	constraint pk_DIR primary key (numEmpleado, numDepto, numCentro, fecInDir, fecFinDir)
);