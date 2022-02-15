
insert into centros
	(numce, nomce, dirce)
values
    (10,'Sede Central', 'C. Alcala, 820, Madrid'),
    (20,'Relacion Con Clientes', 'C. Atocha, 405, Madrid');
insert into deptos
	(numde, numce, nomde, presude, deptodepen)
values
    (100,10, 'DIRECCIÓN GENERAL' ,129000, null),
    (110,20, 'DIRECCIÓN COMERCIAL' ,100000, 100),
    (111,20, 'SECTOR INDUSTRIAL' ,90000, 110),
    (112,20, 'SECTOR SERVICIOS' ,175000, 110),
    (120,10, 'ORGANIZACION' ,50000, 100),
    (121,10, 'PERSONAL' ,74000, 120),
    (122,10, 'PROCESO DE DATOS' ,68000, 120),
    (130,10, 'FINANZAS' ,85000, 100);
    
insert into empleados
	(numem, numde, extelem, fecnaem, fecinem, salarem, comisem, numhiem, nomem, ape1em, ape2em)
values
    (250,100, 250, '1954-07-12', '1976-07-12', 3123, 110, 2, 'LUCIANO', 'TEROL', null),
    (260,100, 220, '1960-09-10', '1979-09-10', 1896, null, 0, 'JULIO', 'PEREZ', 'SANCHEZ'),
    (180,110, 505, '1971-02-11', '1998-02-11', 1967, null, 5, 'JUANA', 'RODRIGUEZ', 'PEREZ'),
    (390,110, 500, '1966-02-19', '1986-10-08', 1435, null, 0, 'AUGUSTO', 'GARCIA', 'RUIZ'),
    (330,112, 850, '1949-03-01', '1972-03-01', 998.76, 100, 6, 'ANTONIO', 'LOPEZ', null),
    (290,120, 910, '1962-10-08', '1981-10-08', 865, 50, 2, 'PILAR', 'GALVEZ', 'GÓMEZ'),
    (150,121, 340, '1972-01-15', '2001-01-15', 856, null, 0, 'JULIA', 'VARGAS', null),
	(350,122, 610, '1949-09-10', '1984-09-10', 864, null, 3, 'OCTAVIO', 'GARCIA', null),
	(310,130, 480, '1971-01-15', '1993-01-15', 1125, null, 3, 'LAVINIA', 'SANZ', null);
    
    