/*Prepara un procedimiento almacenado que ejecute la consulta del apartado 1 y otro que ejecute la del apartado 5.
Prepara un procedimiento almacenado que ejecute la consulta del apartado 2 de forma que nos sirva para averiguar la extensión del empleado que deseemos en cada caso.
Prepara un procedimiento almacenado que ejecute la consulta del apartado 3 y otro para la del apartado 4 de forma que nos sirva para averiguar el nombre de aquellos que tengan el número de hijos que deseemos en cada caso.
Prepara un procedimiento almacenado que, dado el nombre de un centro de trabajo, nos devuelva su dirección.
Prepara un procedimiento almacenado que ejecute la consulta del apartado 7 de forma que nos sirva para averiguar, dada una cantidad, el nombre de los departamentos que tienen un presupuesto superior a dicha cantidad.
Prepara un procedimiento almacenado que ejecute la consulta del apartado 8 de forma que nos sirva para averiguar, dada una cantidad, el nombre de los departamentos que tienen un presupuesto igual o superior a dicha cantidad.
Prepara un procedimiento almacenado que ejecute la consulta del apartado 9 de forma que nos sirva para averiguar, dada una fecha, el nombre completo y en una sola columna de los empleados que llevan trabajando con nosotros desde esa fecha.
Prepara un procedimiento almacenado que ejecute la consulta del apartado 10 de forma que nos sirva para averiguar, dadas dos fechas, el nombre completo y en una sola columna de los empleados que comenzaron a trabajar con nosotros en el periodo de tiempo comprendido entre esas dos fechas.
Prepara un procedimiento almacenado que ejecute la consulta del apartado 10 de forma que nos sirva para averiguar, dadas dos fechas, el nombre completo y en una sola columna de los empleados que comenzaron a trabajar con nosotros fuera del periodo de tiempo comprendido entre esas dos fechas.*/

-- Ejemplo

USE `empresaclase`;

delimiter $$
drop procedure ejemloProcedure $$
create procedure ejemloProcedure
	(in depto int, in fecha date)
begin
	select *
    from empleados
    where numde = depto
		and fecinem <= fecha;
end $$

delimiter ;

call ejemloProcedure(120, '1990/1/1');


-- Ejercicio 11

delimiter $$
drop procedure if exists ejercicio11 $$
create procedure ejercicio11
	()
begin
	select *
    from empleados;
    select concat_ws('',nomem,ape1em,ape2em)
	from empleados
	where comisem is null;
end $$

delimiter ;

call ejercicio11();

-- Ejercicio 12

delimiter $$
drop procedure if exists ejercicio12 $$
create procedure ejercicio12
	(in nombre varchar(20) , in apell varchar(20) )
begin
	select extelem
	from empleados
	where nomem=nombre and ape1em=apell;
end $$

delimiter ;

call ejercicio12('Juan','López');

-- Ejercicio 13

delimiter $$
drop procedure if exists ejercicio13 $$
create procedure ejercicio13
	(in hijomin int , in hijomax int)
begin
	select concat_ws('',nomem,ape1em,ape2em) -- select nomem, ape1em, ape2em
	from empleados
	where numhiem > hijomin;
	select concat_ws('',nomem,ape1em,ape2em) 
	from empleados
	where numhiem >= hijomin and numhiem <= hijomax;
end $$

delimiter ;

call ejercicio13(1,5);

-- Ejercicio 14

delimiter $$
drop procedure if exists ejercicio14 $$
create procedure ejercicio14
	(in nombrece varchar(60))
begin
	select dirce
    from centros
    where nomce = nombrece;
end $$

delimiter ;

call ejercicio14(' Sede Central');

-- Ejercicio 15

delimiter $$
drop procedure if exists ejercicio15 $$
create procedure ejercicio15
	(in presupuesto decimal(10,2))
begin
	select nomde
	from departamentos
	where presude > presupuesto;
end $$

delimiter ;

call ejercicio15(7000);

-- Ejercicio 16

delimiter $$
drop procedure if exists ejercicio16 $$
create procedure ejercicio16
	(in presupuesto decimal(10,2))
begin
	select nomde
	from departamentos
	where presude >= presupuesto;
end $$

delimiter ;

call ejercicio16(7000);

-- Ejercicio 17

delimiter $$
drop procedure if exists ejercicio17 $$
create procedure ejercicio17
	(in fecha date)
begin
	select concat_ws(' ',nomem,ape1em,ape2em)
	from empleados
	where fecinem <= fecha;
end $$

delimiter ;

call ejercicio17('2021-2-14');

-- Ejercicio 18

delimiter $$
drop procedure if exists ejercicio18 $$
create procedure ejercicio18
	(in fechamin date, in fechamax date)
begin
	select concat_ws(' ',nomem,ape1em,ape2em)
	from empleados
	where fecinem >= fechamin and fecinem <= fechamax;
end $$

delimiter ;

call ejercicio18('2001-2-14', '2021-2-14');

-- Ejercicio 19

delimiter $$
drop procedure if exists ejercicio19 $$
create procedure ejercicio19
	(in fechamin date, in fechamax date)
begin
	select concat_ws(' ',nomem,ape1em,ape2em)
	from empleados
	where fecinem <= fechamin or fecinem >= fechamax;
end $$

delimiter ;

call ejercicio19('2001-2-14', '2021-2-14');