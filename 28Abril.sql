/*



*/

use empresaclase;

delimiter $$
DROP PROCEDURE IF exists pruebaCursor $$
create procedure pruebaCursor()
begin
-- CALL pruebaCursor();
DECLARE numdepto int DEFAULT 0;
DECLARE nomdepto, nomcentro, nomcentroaux VARCHAR(100) DEFAULT '';
DECLARE presupuesto decimal(12,2) DEFAULT 0.00;
DECLARE fin_cursor BOOLEAN default 0;

declare curDeptos cursor for
							select numde, nomde, presude, nomce
							from departamentos join centros on departamentos.numce = centros.numce
                            order by nomce;

DECLARE continue HANDLER FOR SQLSTATE '02000'
	-- BEGIN
		SET fin_cursor = 1;
   --  END;

drop table if exists listado;
create temporary table listado
(filalistado varchar(500));

OPEN curDeptos;
FETCH curDeptos INTO numdepto, nomdepto, presupuesto,nomcentro;

WHILE fin_cursor = 0 DO
BEGIN
if nomcentro <> nomcentroaux then
begin
	insert into listado
	values
	(concat('centro de trabajo: ', nomcentro)),
	('num.depto      nombre                  presupuesto');
    set nomcentroaux = nomcentro;
end; 
end if;

insert into listado
values
(concat(numdepto, '     	      ',nomdepto,'             ', presupuesto));



FETCH curDeptos INTO numdepto, nomdepto, presupuesto,nomcentro;
END;
END WHILE;

CLOSE curDeptos;

select * from listado;
 
drop table listado;

end $$
delimiter ;

CALL pruebaCursor();