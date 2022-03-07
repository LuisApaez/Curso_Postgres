-- Consultamos la tabla empleados
SELECT * FROM empleados;

-- Definimos una restriccion del tipo check sobre la tabla empleados
ALTER TABLE empleados ADD CONSTRAINT ck_salario CHECK(salario < 65000); 

-- Veamos los empleados que ganan más de esta cifra
SELECT * FROM empleados WHERE salario > 65000;

-- Actualizamos el salario de estos últimos empleados
UPDATE empleados SET salario = 60000 WHERE id_empleados = 80; 


-- Probamos ingresando un nuevo empleado con un salario mayor a los 65000
INSERT INTO empleados(nombre, app, apm, puesto, salario, horario) 
VALUES('Jenny', 'López', 'López', 'Vendedor', 70000, '7:00-10:00'); 

-- eliminamos la restricción check sobre la columna salario
ALTER TABLE empleados DROP CONSTRAINT ck_salario;

-- Restricción not null sobre la columna puesto
ALTER TABLE empleados ALTER COLUMN puesto SET NOT NULL;

-- Intentamos registrar un nuevo empleado
INSERT INTO empleados(nombre, app, apm, salario, horario) VALUES('Jenny', 'López', 'López', 10000, '6:00-9:00');


-- Solución ejercicio 1:

-- Definición de la restricción check
ALTER TABLE productos ADD CONSTRAINT ck_nombre_productos 
CHECK(nombre_productos 
IN ('colores', 'goma', 'hojas', 'Cuaderno blanco', 'carpetas', 'lapiz',
	'Pluma negra', 'pluma', 'libreta', 'cartulinas'));

-- eliminamos la restricción anterior
ALTER TABLE productos DROP CONSTRAINT ck_nombre_productos;
