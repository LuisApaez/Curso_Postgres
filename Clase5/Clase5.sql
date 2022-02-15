-- Definimos la llave primaria de la tabla empleados
ALTER TABLE empleados ADD CONSTRAINT pk_empleados_id_empleados
  PRIMARY KEY (id_empleados);
  
  
-- Solución parcial al ejercicio de clase

-- Definimos la llave primaria de la tabla empleados
ALTER TABLE productos ADD CONSTRAINT pk_productos_id_productos
  PRIMARY KEY (id_productos);
  
-- Definimos la llave primaria de la tabla empleados
ALTER TABLE ventas ADD CONSTRAINT pk_ventas_id_ventas
  PRIMARY KEY (id_ventas);