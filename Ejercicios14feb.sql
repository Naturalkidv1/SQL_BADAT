/*Obtener todos los datos de todos los empleados.
Obtener la extensión telefónica de “Juan López”.
Obtener el nombre completo de los empleados que tienen más de un hijo.
Obtener el nombre completo y en una sola columna de los empleados que tienen entre 1 y 3 hijos.
Obtener el nombre completo y en una sola columna de los empleados sin comisión.
Obtener la dirección del centro de trabajo “Sede Central”.
Obtener el nombre de los departamentos que tienen más de 6000 € de presupuesto.
Obtener el nombre de los departamentos que tienen de presupuesto 6000 € o más.
Obtener el nombre completo y en una sola columna de los empleados que llevan trabajando en nuestra empresa más de 1 año. (Añade filas nuevas para poder comprobar que tu consulta funciona).
Obtener el nombre completo y en una sola columna de los empleados que llevan trabajando en nuestra empresa entre 1 y tres años. (Añade filas nuevas para poder comprobar que tu consulta funciona).*/

-- Ejercicio 1
select *
from empleados;

-- Ejercicio 2
select extelem
from empleados
where nomem='Juan' and ape1em='López';

-- Ejercicio 3
select concat_ws('',nomem,ape1em,ape2em) -- select nomem, ape1em, ape2em
from empleados
where numhiem > 1;

-- Ejercicio 4
select concat_ws('',nomem,ape1em,ape2em) 
from empleados
where numhiem >= 1 and numhiem <= 3;

-- Ejercicio 5
select concat_ws('',nomem,ape1em,ape2em)
from empleados
where comisem is null;

-- Ejercicio 6 Obtener la dirección del centro de trabajo “Sede Central”.
select dirce
from centros
where nomce = ' Sede Central';

-- Ejercicio 7 Obtener el nombre de los departamentos que tienen más de 6000 € de presupuesto.
-- ¿cuando el ejercicio no nos pide explicitamente en una columna, está mal usar concat? no
select nomde
from departamentos
where presude > 6000;

-- Ejercicio 8 Obtener el nombre de los departamentos que tienen de presupuesto 6000 € o más.
select nomde
from departamentos
where presude >= 6000;

-- Ejercicio 9 Obtener el nombre completo y en una sola columna de los empleados que llevan trabajando en nuestra empresa más de 1 año.
select concat_ws(' ',nomem,ape1em,ape2em)
from empleados
where fecinem <= '2021-2-14';

-- Ejercicio 10 Obtener el nombre completo y en una sola columna de los empleados que llevan trabajando en nuestra empresa entre 1 y tres años. 
select concat_ws(' ',nomem,ape1em,ape2em)
from empleados
where fecinem >= '2001-2-14' and fecinem <= '2010-2-14';
-- where fecinem between '2001-2-14' and '2010-2-14';