-- eventos

delimiter $$

create event llamadaDomiciliaciones
on schedule
	every 1 day
    starts '2022/5/10 02:00:00'
    ends '2022/5/10 02:00:00' + interval 1 year
do
	begin
		call domiciliaciones();
	end $$

delimiter ;

-- triggers

delimiter $$
create trigger compruebaEdad
	before insert
    on empleados
for each row
begin
	if date_add(fecnaem, interval 16 year) > curdate() then
		-- no contratar (no hacer el insert)
		signal sqlstate '45000'
			set message_text = 'El empleado no tiene la edad apropiada';
    end if;
end $$

delimiter ;

-- trigger sobre gestión de test
-- la fecha de publicacion no sea anterior a la fecha de creacion