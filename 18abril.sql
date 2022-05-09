use ventapromoscompleta;

/*
Lo siento Eva, no creo que puedas evaluarme este ejercicio ya que pediste expresamente una función
------
Prepara una función que, dado el código de una venta, devuelva el importe de dicha venta
*/

drop procedure if exists importeVenta;

delimiter $$
create procedure importeVenta(in codigoventa int)
begin

    select SUM(precioventa) as PrecioVenta

    from detalleventa
    
    where codventa = codigoventa;

end $$
delimiter ;

call importeVenta(3);

/*
Obtén un listado de las ventas de este año en el que se muestre el código de la venta, la fecha de la venta,
el nombre y apellidos del cliente de la venta y el importe de la venta (utiliza la función del apartado anterior).
*/

drop procedure if exists importeVenta2;

delimiter $$
create procedure importeVenta2(in codigoventa int)
begin

    select codventa, fecventa, concat_ws(' ', nomcli, ape1cli, ape2cli) as DetalleVenta

    from ventas join clientes on ventas.codcli = clientes.codcli 
    where year(fecventa) = year(curdate());

end $$
delimiter ;

call importeVenta2(1);