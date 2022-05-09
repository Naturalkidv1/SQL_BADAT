/** Obtener el número de alumnos matriculados en cada materia y la nota media de la materia **/

use GBDgestionaTests;

select materias.nommateria, count(alumnos.nomalum), avg(matriculas.nota)

from materias 
	join matriculas on materias.codmateria=matriculas.codmateria 
	join alumnos on matriculas.numexped=alumnos.numexped

group by materias.nommateria;