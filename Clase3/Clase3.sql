-- Creamos una tabla de prueba
CREATE TABLE prueba(
	id_prueba SERIAL,
	nombre_prueba VARCHAR,
	fecha DATE
);

-- Procedemos a eliminarla
DROP TABLE prueba;

-- Agregando un columnas nuevas
ALTER TABLE empleados ADD COLUMN horario VARCHAR;
ALTER TABLE empleados ADD COLUMN prueba DATE;

-- Eliminando una columna
ALTER TABLE empleados DROP COLUMN prueba; 

