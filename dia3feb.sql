insert into reservas
	(codreserva, codcliente, codcasa, fecreserva, pagocuenta, feciniestancia, diasestancia, fecanulacion, observaciones)
    values
    (3501,520, 315, 2022-2-3, 100, 22-8-5, 7, null, null);
    
-- --------------

    update caracteristicasdecasas
    set tiene = 1
    where codcaracter = 17;
    
    update caracteristicasdecasas
    set tiene = 1
    where codcaracter = 3;
    
    update caracteristicasdecasas
    set tiene = 1
    where codcaracter = 5;

-- ------------------




