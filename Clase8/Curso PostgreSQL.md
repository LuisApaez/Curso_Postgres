# Curso PostgreSQL

##### Autor: Luis Fernando Apáez Álvarez



##### Inserciones

Una vez que hicimos el laborioso proceso de ingresar las 1000 inserciones en la tabla ``empleados``, repetiremos el proceso ahora para las tablas ``productos`` y ``ventas``. Recordemos que las últimas inserciones deben ser en aquellas tablas que tienen definidas llaves foráneas, pues en varias de sus columnas tendremos que los registros dependen de registros previos en otras tablas, como es el caso de la tabla ``ventas``.



###### Tabla ``productos``

Comenzamos por ver la estructura de esta tabla

```sql
SELECT * FROM productos;
```

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase8\Captura1.PNG)

Después generamos los datos en mockaroo, en este caso no serán 1000 inserciones, nos bastarán con generar sólo 100 productos de diferentes marcas

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase8\Captura2.PNG)

es importante ser cauteloso a la hora de generar los datos. Después abrimos la consola _psql_ y realizamos la conexión con _postgres_

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase8\Captura3.PNG)

no olvides que en ``Database [postgres]:`` debes colocar el nombre de la base de datos que almacena la tabla ``productos``. Luego, vamos a símbolos del sistema para ejecutar las inserciones

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase8\Captura4.PNG)

una vez ingresada la contraseña tendremos

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase8\Captura5.PNG)

que las inserciones se han ejecutado. Comprobamos yendo a _pgAdmin_, recuerda que antes de realizar la consulta debe refrescar (_refresh_) la tabla o el esquema público

```sql
SELECT * FROM productos;
```

Primeras 8 filas

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase8\Captura6.PNG)

últimas filas

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase8\Captura7.PNG)

Notamos que la información, en la mayoría de los casos, no tiene sentido, pero el punto es tener datos para trabajar con ellos. 

Finalizamos realizando las inserciones de la tabla ``ventas``, en ella de igual forma sólo efectuaremos 100 inserciones.

###### Inserciones ``ventas``

Comenzamos por

```sql
SELECT * FROM ventas;
```

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase8\Captura8.PNG)

Hay un detalle en esta tabla. En realidad, de inicio, no construimos bien la tabla ``ventas`` pues la columna ``cantidad`` está de más. La razón es que, de acuerdo a lo que aprenderemos después, podemos calcular el ``total`` de la venta a partir de la columna ``precio`` de la tabla ``productos`` y de la columna ``cantidad`` de la tabla ``ventas``. De tal manera, no es necesario incluir dicha columna en esta tabla. Así, procedemos a eliminar dicha columna. Para ello escribimos

```sql
-- Eliminamos la columna total
ALTER TABLE ventas DROP COLUMN total;

-- Vemos los cambios
SELECT * FROM ventas;
```

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase8\Captura9.PNG)

Ahora, tenemos otro problema proveniente de la tabla ``empleados``. Si has estado realizando los ejercicios que se dejan en clase, entonces seguramente eliminaste alguna fila de la tabla ``empleados``. Aunque se haya eliminado una fila en dicha tabla, el índice generado en automático por el tipo de dato ``SERIAL`` continúa almacenado en dicha tabla, de tal manera, la fila siguiente a la fila eliminada tendrá como id el número sucesor de la fila eliminada. Por ejemplo, en mi caso

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase8\Captura10.PNG)

eliminé la fila 3, no obstante, el índice del ``id_empleados`` excluye de la numeración al número 3. Ahora bien, el problema radica en la columna ``id_empleado`` de la tabla ``ventas`` pues, si ingresamos en dicha columna el número 3, entonces _postgres_ nos arrojará un error referencial debido a la llave foránea definida en dicha columna. Para resolver el problema

* Ingresamos en mockaroo una fórmula (código) para que se excluya el número 3.

De donde

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase8\Captura11.PNG)

y en la fórmula escribimos

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase8\Captura13.PNG)

Una vez descargado el archivo vamos a símbolos del sistema para efectuar las inserciones

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase8\Captura14.PNG)

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase8\Captura15.PNG)

y vemos en _pgAdmin_ la actualización de la tabla ``ventas``

```sql
SELECT * FROM ventas;
```

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase8\Captura16.PNG)

y los últimos registros

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase8\Captura17.PNG)

---

##### Ejercicio

De las tablas adicionales que creaste (es decir aquellas tablas que no son ``empleados, productos, ventas``) en la base de datos (referente al proyecto). Crea las inserciones pertinentes como se ha hecho en estas dos últimas clases.