/* obtener el numero de preguntas de cada test */

select tests.codtest as CodTests, count(preguntas.numpreg) as NumPreguntas
from tests
	join preguntas on tests.codtest = preguntas.codtest
group by tests.codtest