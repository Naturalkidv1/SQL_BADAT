-- Ejercicio 5
/*Prepara un procedimiento que muestre el importe total de las ventas por meses de un año dado.*/

use ventapromoscompleta;

drop procedure if exists ejercicio5;

delimiter $$
create procedure ejercicio5(in anio int)
begin

    select sum(detalleventa.precioventa) as ventaTotales

    from detalleventa join ventas on detalleventa.codventa = ventas.codventa
    
    where month(fecventa) = 5 and year(fecventa) = anio;


end $$
delimiter ;

call ejercicio5(2012);