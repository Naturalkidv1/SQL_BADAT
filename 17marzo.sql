
/************************************************EJER 13*******************************************/
-- Por Juan José y Miguel
/*Obtener por orden alfabético los nombres y los salarios de los empleados del depto. 111 que tienen comisión, 
si hay alguno de ellos cuya comisión supere al 15% de su salario. (Miguel y JJ)
*/

use empresaclase;
drop procedure if exists ejercicio13;

delimiter $$
create procedure ejercicio13()
begin

    select concat_ws(' ', nomem, ape1em, ape2em) as nomEmpleado, salarem as salarioEmpleado -- , comisem, numde

    from empleados
    
    where numde=111 and (comisem is not null or comisem <> 0) 
		and salarem*0.15 < any(	select comisem 
								from empleados)

    order by nomem;

end $$
delimiter ;

call ejercicio13();
/**************************************************************************************************/
