-- Ingresamos algunos datos
INSERT INTO productos(nombre_productos, cantidad_almacen, precio) VALUES('Pluma negra', 1000, 0.5);
INSERT INTO productos(nombre_productos, cantidad_almacen, precio) VALUES('Cuaderno blanco', 800, 20.9);

-- Consultamos
SELECT * FROM productos;
SELECT * FROM empleados;

-- Inserciones en la tabla ventas
INSERT INTO ventas(producto_vendido, cantidad, total, empleado) VALUES('Pluma negra', 10, 5, 'Luis');
INSERT INTO ventas(producto_vendido, cantidad, total, empleado) VALUES('Engrapadora', 1, 55.5, 'Zed');

-- Consultamos
SELECT * FROM ventas;

-- Eliminamos la tabla ventas
DROP TABLE ventas;

-- Creamos la tabla ventas
CREATE TABLE ventas(
	id_ventas SERIAL,
	id_producto_vendido INT,
	cantidad INT,
	total INT,
	id_empleado INT,
	PRIMARY KEY(id_ventas)
);

-- Definición llaves foráneas

-- FK (llave foránea) entre la tabla ventas y empleados
ALTER TABLE ventas ADD CONSTRAINT fk_ventas_id_empleado_id_empleados
	FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleados);
	
-- FK entre la tabla ventas y productos
ALTER TABLE ventas ADD CONSTRAINT fk_ventas_id_producto_vendido_id_productos
	FOREIGN KEY (id_producto_vendido) REFERENCES productos(id_productos);
	
-- Inserciones en la tabla ventas
INSERT INTO ventas(id_producto_vendido, cantidad, total, id_empleado) VALUES(1, 10, 5, 1);
INSERT INTO ventas(id_producto_vendido, cantidad, total, id_empleado) VALUES(1, 100, 50, 2);

-- Consultamos
SELECT * FROM ventas;


-- Otra inserción
INSERT INTO ventas(id_producto_vendido, cantidad, total, id_empleado) VALUES(3, 100, 50, 2);