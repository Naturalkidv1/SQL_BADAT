update empleados
set salarem = salarem *1.1
	where fecnam >= '1970/1/1' and fecnam <= '1979/12/31' and numde = 120;
    
update empleados
set salarem = salarem *1.1
	where (fecnam < '1970/1/1' or fecnam > '1979/12/31') and numde = 120;