-- Inserciones de empleados
INSERT INTO empleados(nombre, app, apm, puesto, salario, horario) 
	VALUES ('Luis', 'Apáez', 'Álvarez', 'Cajero', 8500.0, '6:00-14:00'); 
	
-- Consulta básica
SELECT * FROM empleados;

-- Otra insercion
INSERT INTO empleados(nombre, app, apm, horario) 
	VALUES ('Zed', 'Ocaña', 'López', '6:00-13:00');
	
-- Otra consulta
SELECT * FROM empleados;

-- Realizamos una actualización de datos
UPDATE empleados 
SET puesto = 'Vigilante',
	salario = 12500.5
WHERE id_empleados = 2;

-- Otra consulta
SELECT * FROM empleados;

-- Insercion sin sentido
INSERT INTO empleados(nombre, app, apm, puesto, salario, horario) 
	VALUES('ññ', 'ñ', 'uwu', 'ñe', 2.5, 'ññ');
	
-- Otra consulta
SELECT * FROM empleados;

-- Eliminamos la fila en la tabla empleados que no tiene sentido
DELETE FROM empleados WHERE id_empleados = 3;

-- Otra consulta
SELECT * FROM empleados;

-- Solución ejercicio 1
ALTER TABLE productos ADD COLUMN nombre_productos VARCHAR;


