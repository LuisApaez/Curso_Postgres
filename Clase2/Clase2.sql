-- Tabla productos
CREATE TABLE productos(
	id_productos SERIAL,
	cantidad_almacen INT,
	precio REAL);
	
-- Tabla empleados
CREATE TABLE empleados(
	id_empleados SERIAL,
	nombre VARCHAR,
	app VARCHAR,	-- apellido paterno
	apm VARCHAR,	-- apellido materno
	puesto VARCHAR,
	salario REAL	-- note que en la última columna no ponemos una coma al final
	);
	
-- Tabla ventas
CREATE TABLE ventas(
	id_ventas SERIAL,
    producto_vendido VARCHAR,
    cantidad INT,
    total REAL,
    empleado VARCHAR	-- empleado involucrado en la venta
);