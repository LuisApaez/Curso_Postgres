-- Consultamos la tabla empleados
SELECT * FROM empleados
SELECT nombre, app, apm FROM empleados;

-- Ejemplo de concatenacion
SELECT nombre || ' ' || app || ' ' || apm FROM empleados WHERE id_empleados = 1;

-- Ejemplo de alias
SELECT nombre || ' ' || app || ' ' || apm AS nombre_completo 
	FROM empleados WHERE id_empleados = 1;
	
-- Operador WHERE
SELECT * FROM ventas WHERE cantidad > 20;

-- Operador BETWEEN
SELECT * FROM ventas WHERE id_producto_vendido BETWEEN 8 AND 20;

-- Operador LIKE
SELECT * FROM empleados WHERE nombre LIKE 'Lui%';
SELECT * FROM empleados WHERE nombre LIKE '%is';
SELECT * FROM empleados WHERE nombre LIKE '%arris%';

-- Operador NOT LIKE
SELECT * FROM empleados WHERE nombre NOT LIKE 'N%';

-- Comparaciones con _
SELECT * FROM empleados WHERE nombre LIKE 'Lui_';
