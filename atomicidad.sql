start transaction;
	insert into facturas
    (codfact, fecha, codcli)
    values
    (399,2021-2-9, 15);
    insert into detallefact
		(codfact, codprod, cantidad)
	values
    (399, 12, 5),
    (399,8,2);
    
    update productos
    set stock = stock -5
    where codprod = 12;
    
    update productos
    set stock = stock -2
    where codprod = 8;
    
commit;

start transaction;
	update productos
		set stock = stock +5
	where codprod =12;
    update productos
		set stock = stock +2
	where codprod =8;
    delete from detallefact
    where codfact = 399;
    delete from facturas
    where codfact = 399;
    
commit;