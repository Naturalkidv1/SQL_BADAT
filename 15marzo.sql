/***************************************************EJER 25************************************************************/

USE `empresaclase`;

drop procedure if exists ejercicio25;

delimiter $$
create procedure ejercicio25()
begin

	select concat_ws(' ', empleados.nomem, empleados.ape1em, empleados.ape2em) as nombreempleado, 
	empleados.salarem*0.05 as gratifiaciones

	from dirigir
	join empleados on dirigir.numempdirec = empleados.numem

	order by empleados.nomem;

end $$
delimiter ;

call ejercicio25();

/**********************************************************************************************************************/