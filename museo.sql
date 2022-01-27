/*
tipoObras
artistas
estilos
obras
salas
seguridad
restauradores
empleados
RESTAURACIONES: fecInRest, fecFinRest, observaciones
*/

create database museo;
use museo;

create table tipoObras
(
codtipoObra int unsigned not null,
destipoObra varchar(60) null,
constraint pk_tipoObras primary key (codtipoObra)
);

create table artistas
(
codartistas int unsigned not null,
nomartistas varchar(60) not null,
constraint pk_artistas primary key (codartistas)
);

create table estilos
(
codestilos int unsigned not null,
nomestilos varchar(60) not null,
desestilos varchar(60) not null,
constraint pk_estilos primary key (codestilos)
);

create table salas
(
codsalas int unsigned not null,
numsalas int not null,
nomsalas varchar(60) not null,
constraint pk_salas primary key (codsalas)
);

create table seguridad
(
codseguridad int unsigned not null,
codsalas int unsigned not null,
nomseguridad varchar(60) not null,
constraint fk_salas_seguridad foreign key (codsalas) references salas (codsalas)
	on delete no action on update cascade,
constraint pk_seguridad primary key (codseguridad, codsalas)
);

alter table seguridad
	drop primary key,
    add constraint pk_seguridad primary key (codseguridad),
    add codturnos int unsigned not null,
    add constraint fk_turnos_seguridad foreign key (codturnos) references turnos (codturno)
    ;

create table restauradores
(
codrestauradores int unsigned not null,
nomrestauradores varchar(60),
constraint pk_restauradores primary key (codrestauradores)
);

create table obras
(
codobras int unsigned not null,
-- fk que fungen como pk
codtipoObra int unsigned not null,
codartistas int unsigned not null,
codestilos int unsigned not null,
codsalas int unsigned not null,
--
nomobras varchar(60) not null,
desobras varchar(60) not null,
-- fk
codrestauradores int unsigned not null,
-- relaciones
constraint fk_tipoObra_obra foreign key (codtipoObra) references tipoObras (codtipoObra)
	on delete no action on update cascade,
constraint fk_artistas_obra foreign key (codartistas) references artistas (codartistas)
	on delete no action on update cascade,
constraint fk_estilos_obra foreign key (codestilos) references estilos (codestilos)
	on delete no action on update cascade,
constraint fk_salas_obra foreign key (codsalas) references salas (codsalas)
	on delete no action on update cascade,
    
constraint pk_obras primary key (codobras),

constraint fk_restauradores_obra foreign key (codrestauradores) references restauradores (codrestauradores)
	on delete no action on update cascade

);

create table RESTAURACIONES
(
codobras int unsigned not null,

codrestauradores int unsigned not null,

fecInRest date not null,
fecFinRest date not null,
observaciones varchar(60) not null,
--
constraint fk_restauradores_RESTAURACIONES foreign key (codrestauradores) references restauradores (codrestauradores)
	on delete no action on update cascade,
constraint fk_obras_RESTAURACIONES foreign key (codobras) references obras (codobras)
	on delete no action on update cascade,

constraint pk_RESTAURACIONES primary key (codobras, codrestauradores)

);

create table turnos
(
	codturno int unsigned not null,
    descripcion varchar(80),
    horaIn time,
    horaFin time,
    constraint pk_turnos primary key (codturno)
);

 create table VIG
(
	codturno int unsigned not null,
    codsalas int unsigned not null,
    codseguridad int unsigned not null,
    
    fecInTurno date not null,
    fecFinTurno date not null,
    
    constraint fk_salas_VIG foreign key (codsalas) references salas (codsalas)
		on delete no action on update cascade,
	constraint fk_turno_VIG foreign key (codturno) references turnos (codturno)
		on delete no action on update cascade,
	constraint fk_seguridad_VIG foreign key (codseguridad) references seguridad (codseguridad)
		on delete no action on update cascade,
        
	constraint pk_VIG primary key (codsalas, codturno, codseguridad)
);

-- implementación de "empleados"

 create table empleados
 (
	codempleado int unsigned not null,
    nomempleado varchar(60) not null,
    edadempleado tinyint unsigned not null,
    
    constraint pk_empleados primary key (codempleado)
 );
 
 
 alter table restauradores
	
    add codempleado int unsigned not null,
    add constraint fk_restauradores_empleados foreign key (codempleado) references empleados (codempleado)
		on delete no action on update cascade;
    
    ;

 alter table  seguridad
	
    add codempleado int unsigned not null,
	add constraint fk_seguridad_empleados foreign key (codempleado) references empleados (codempleado)
		on delete no action on update cascade;
    
    ;

-- de aquí en adelante, actualizaremos las tabalas de seguridad y restauradores para acomodarlas a las exigencias

alter table restauradores
	
	drop index fk_restauradores_empleados,
    drop foreign key fk_restauradores_empleados, 
    add constraint fk_empleados_restauradores foreign key (codempleado) references empleados (codempleado) 
		on delete cascade on update cascade;
        
	-- el on delete pasa a cascada para que cuando se borre empleado se borre esta
    
    ;
    
alter table  seguridad
	
	
    -- drop index fk_empleados_seguridad,
    -- drop foreign key fk_seguridad_empleados,
    -- drop foreign key fk_empleados_seguridad,
	add constraint fk_empleados_seguridad foreign key (codempleado) references empleados (codempleado) 
		on delete cascade on update cascade;
    
    ;


-- 


create table deptos
(
	numdepto int unsigned not null,
	nomdepto varchar(20),
    constraint pk_deptos primary key (numdepto)
);

alter table empleados
	add numdepto int unsigned not null,
    add constraint fk_empleados_deptos foreign key (numdepto) references deptos (numdepto)
		on delete no action on update cascade;
        
alter table seguridad
	add numdepto int unsigned not null,
    add constraint fk_seguridad_deptos foreign key (numdepto) references deptos (numdepto)
		on delete no action on update cascade;
        
-- Ejercicio 5
--
alter table empleados
	add jubilacion date default null after nomempleado;
--
create table obrasmasbuscadas
(
	codobras int,
    nomobra varchar(60),
    codautor int unsigned,
    constraint	pk_obrasmasbuscadas primary key (codobras),
    constraint fk_obrasmasbuscadas_artistas foreign key (codautor) references artistas (codartistas)
		on delete no action on update cascade
);

alter table obrasmasbuscadas
	-- drop index pk_obrasmasbuscadas,
    -- drop primary key,
    -- modify codautor int unsigned after codobras,
    add constraint pk_obrasmasbuscadas primary key(codobras, codautor);
    
--
alter table obrasmasbuscadas

	add estilo varchar(30),
    add codtipoObra int unsigned,
    add constraint fk_obrasmasbuscadas_tipoObra foreign key (codtipoObra) references tipoObras (codtipoObra)
		on delete no action on update cascade,
    add valorEstimado decimal(12,2);

--
alter table obrasmasbuscadas

	drop foreign key fk_obrasmasbuscadas_tipoObra,
    drop index fk_obrasmasbuscadas_tipoObra,
    drop foreign key fk_obrasmasbuscadas_artistas,
	drop index fk_obrasmasbuscadas_artistas;
    
    
    
/* 
.Cuando haya obras en una sala, no se podrá modificar el código de sala 
-- on update no action
.Si borramos un artista, sus obras quedarán sin artista
-- on delete set null
.Cuando asignamos un empleado de seguridad a una sala, ya no se podrá modificar el codigo empleado
de seguridad
-- on update no action 
.Si modificamos los estilos, las obras asociadas a dicho estilo, se quedarán sin estilo asociado
-- on update set null
.Cuando eliminamos un tipo de obra, las obras asociadas quedarán sin tipo
-- on delete set null
.Cuando modificamos el código de un empleado, desaparecerán los restaurantes asociados
-- [NO SE PUEDE HACER] 
.Cuando eliminamos el código de un empleado, desaparecerán los restaurantes asociados
-- on delete cascade
*/
