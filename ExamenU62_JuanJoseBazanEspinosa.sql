/* Por Juan José Bazán Espinosa */

/* Ej 1 */

use GBDturRural2015;

drop procedure if exists casasCaras;

delimiter $$
create procedure casasCaras(in codzona int, in codcaracteristica int)
begin

    select casas.nomcasa as NombreCasa, casas.preciobase as PrecioBase -- , casas.codzona, caracteristicasdecasas.codcaracter, caracteristicas.numcaracter 

    from casas join caracteristicasdecasas on casas.codcasa = caracteristicasdecasas.codcasa
		join caracteristicas on caracteristicasdecasas.codcaracter = caracteristicas.numcaracter
    
    where (casas.codzona = codzona) and (caracteristicasdecasas.codcaracter = codcaracteristica)
    
    order by casas.preciobase desc
;
end $$
delimiter ;


/* Datos Introducios
insert into GBDturRural2015.caracteristicasdecasas
	(codcasa, codcaracter, tiene, observaciones)
    values
    (1,1, 1, null),
    (2,1, 1, null);
*/

call casasCaras(1, 1);

-- --------

/* Ej 2 */

drop procedure if exists listaCasas;

delimiter $$
create procedure listaCasas()
begin

    select concat_ws(' - ',casas.nomcasa, caracteristicasdecasas.codcaracter) as InfoCasa_Caracteristica
    from caracteristicasdecasas
		join casas on caracteristicasdecasas.codcasa = casas.codcasa  
    
    UNION
    
    select casas.nomcasa as InfoCasa
    from casas;
    
end $$
delimiter ;

call listaCasas();

-- --------


/* Ej 3 */

drop function if exists listadoCasasRutina;

delimiter $$
create function listadoCasasRutina(tipoCasa int)
returns int
deterministic
begin

return (select casas.codzona as ZONA, casas.nomcasa as CASA, concat('de ',casas.minpersonas,' a ',casas.maxpersonas) as ALOJAMIENTO_PARA
		from casas
		where casas.codtipocasa = tipoCasa
        );
end $$
delimiter ;

select listadoCasasRutina(1);





