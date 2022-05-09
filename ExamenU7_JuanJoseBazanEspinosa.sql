USE GBDgestionaTests;


delimiter $$
DROP PROCEDURE IF exists e7Examen $$
create procedure e7Examen(in curso char(6))
begin

-- CALL e7Examen();
DECLARE nommateria, nommateriaaux varchar(60) DEFAULT '';
-- DECLARE codtest int(11) DEFAULT NOT NULL ;
-- DECLARE codmateria int(11) DEFAULT NULL;
DECLARE descrip varchar(30) DEFAULT NULL;
DECLARE numpreg int(11) DEFAULT NOT NULL;
DECLARE diasdesdelapubli datetime;


DECLARE fin_cursor BOOLEAN default 0;

declare curMateria cursor for
							select materias.nommateria as nombreMateria, tests.descrip as descripcionTest, 
                            preguntas.numpreg as numPreguntas
							from materias
                            join tests on materias.codmateria = tests.codtest
                            join preguntas on materias.codmateria = preguntas.codtest
                            order by nommateria;
DECLARE continue HANDLER FOR SQLSTATE '02000'
	-- BEGIN
		SET fin_cursor = 1;
   --  END;

drop table if exists listado;
create temporary table listado
(filalistado varchar(500));

OPEN curMateria;
FETCH curMateria INTO nommateria, descrip, numpreg;

WHILE fin_cursor = 0 DO
BEGIN
if nommateria <> nommateriaaux then
begin
	insert into listado
	values
	(concat('Materia: ', nommateria)),
	('Test          Núm. preguntas test');
    set nommateriaaux = nommateria;
end; 
end if;

insert into listado
values
(concat(descrip, '     	      ',numpreg));


FETCH curMateria INTO nommateria, descrip, numpreg;


END;


END WHILE;

insert into listado
values
(concat('           Media de nombre de la materia           ')); -- avg(sum(numpreg))))



CLOSE curMateria;

select * from listado;
 
drop table listado;

end $$
delimiter ;

-- USE GBDgestionaTests;
CALL e7Examen('1ESO');

-- select cursomateria from materias;
-- select fecpublic from tests;

