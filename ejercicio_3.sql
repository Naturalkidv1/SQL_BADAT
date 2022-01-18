/*
PRODUCTOS: (^(refprod,*numcat) descripc, precio, fecingreso, salario, comision, numhijos, nommep)
CATEGORIAS: (^numcat, nomcategor, proveedor)
VENTAS: (^codventa, fecventa, cliente *[refprod,numcat])
LIN_VENTAS: (^(*(codventa), *(refprod,numcat), cantidad))
*/

create database ejercicio3;
use ejercicio3;

create table categorias
(
	numCat int not null,
    nomCategor varchar(60) not null,
    proveedor varchar(60) null,
    
    constraint pk_categorias primary key (numCat)
);

create table productos
(
	refProd int not null,
    numCat int not null,
    descripc varchar(60) null,
    precio decimal(6,2) null,
    fecIngreso date not null,
    salario decimal(6,2) null,
    comision decimal(6,2) null,
    numHijos tinyint unsigned null,
    nomEmp varchar(60) not null,
    
    constraint fk_categorias_productos foreign key (numCat) references categorias (numCat)
		on delete no action on update cascade,
	constraint pk_productos primary key (refProd, numCat)
);

create table ventas
(
	codVenta int not null,
    fecVenta date not null,
    cliente varchar(60) not null,
    refProd int not null,
    numCat int not null,
    
    constraint pk_ventas primary key (codVenta),
    constraint fk_productos_ventas foreign key (refProd, numCat) references productos (refProd, numCat)
		on delete no action on update cascade
    
);
-- LIN_VENTAS: (^(*(codventa), *(refprod,numcat), cantidad))
create table LIN_VENTAS
(
	codVenta int not null,
    refProd int not null,
    numCat int not null,
    cantidad int not null,
    
    constraint fk_ventas_linventas foreign key (codVenta) references ventas (codVenta),
    constraint fk_productos_linventas foreign key (refProd, numCat) references productos (refProd, numCat)
		on delete no action on update cascade,
	constraint pk_linventas primary key (codVenta, refProd, numCat, cantidad)
);





