/* Obtener el número de alumnos matricualdos en cada materia, la nota media y el número de expediente cno la nota más aalta en la materia */

select materias.nommateria as Materia, 
count(alumnos.nomalum) as NomAlum, 
avg(matriculas.nota) as NotaMedia,
	(select m.numexped
    from matriculas as m
	where m.nota = max(matriculas.nota) and m.codmateria = matriculas.codmateria

    ) as ExpedienteConNotaMax

from materias 
	join matriculas on materias.codmateria = matriculas.codmateria
	join alumnos on matriculas.numexped = alumnos.numexped

group by materias.codmateria;
    