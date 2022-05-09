/** Obtener el número de materias matriculadas de cada alumno**/

select alumnos.numexped, concat_ws(' ', alumnos.nomalum, alumnos.ape1alum, alumnos.ape2alum) as nombreAlumno, count(materias.codmateria)
from alumnos 
	join matriculas on alumnos.numexped = matriculas.numexped
    join materias on alumnos.numexped = materias.codmateria
group by alumnos.numexped;