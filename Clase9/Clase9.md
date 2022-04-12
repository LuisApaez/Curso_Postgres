# Curso PostgreSQL

##### Autor: Luis Fernando Apáez Álvarez



##### Consultas

Sabemos que si utilizamos, por ejemplo, la siguiente sintaxis

```sql
SELECT * FROM empleados
```

se nos mostrará toda la información de nuestra tabla ``empleados``. Es decir, podemos traducir el código anterior a la siguiente instrucción: _selecciona todas las columnas de la tabla_ ``empleados``. De tal manera, cuando colocamos el ``*`` después del ``SELECT`` estamos dando la instrucción de ver todas las columnas de la tabla. Si sólo quisiéramos ver el nombre completo de los empleados (que abarcan las columnas ``nombre, app, apm``) escribimos

```sql
SELECT nombre, app, apm FROM empleados;
```

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase9\Captura1.PNG)

De tal manera, se nos mostrarán las columnas que deseemos de una tabla si las colocamos entre el ``SELECT`` y el ``FROM``. Si queremos ver todas las columnas de una tabla colocamos entonces el ``*``.

Ahora, podemos ver el resultado particular de una fila de una tabla. Supongamos que deseamos ver la información del empleado cuyo id de trabajador es el 857. Para ello escribimos

```sql
SELECT * FROM empleados WHERE id_empleados = 857;
```

que se "traduce" a : _selecciona todas las columnas de la tabla_ ``empleados``, _donde el_ ``id_empleados`` _es igual a 857_, y nos arroja

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase9\Captura2.PNG)

Podemos combinar lo aprendido escribiendo algo como

```sql
SELECT nombre, app, apm, horario FROM empleados WHERE id_empleados = 7; 
```

Además, podemos dar un poco de formato a las consultas. Por ejemplo, podemos concatenar columnas. Supongamos que es de nuestro interés ver el nombre completo de un empleado, pero no de la forma como lo hicimos antes, más bien visualizar el nombre completo junto y no en columnas por separado. Para ello usamos

```sql
-- Veamos el nombre completo del empleado con id igual a 1

SELECT nombre || ' ' || app || ' ' || apm FROM empleados WHERE id_empleados = 1;
```

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase9\Captura3.PNG)

donde los símbolos ``||`` indican concatenación, además ``' '`` hacen alusión a un espacio en blanco. Entonces, estamos concatenando el nombre con un espacio en blanco con el apellido paterno con un espacio con el apellido materno. Notamos que en la salida el nombre de la columna de nuestra consulta resultante es ``?column?`` pues de hecho, en la columna efectuada estamos combinando varias columnas de manera simultánea, por ello _postgres_ coloca de manera automática dicho nombre. Podemos cambiar esto y para ello utilizaremos lo que se conoce como **alias**.

###### Alias

Si bien todas las columnas de nuestras tablas poseen un nombre en concreto, cuando realizamos diversas consultas puede que los resultados arrojen nombres de columnas desconocidos, tales como ``?column?`` como el caso de la consulta anterior. Por ende, utilizamos los **alias** para nombrar o renombrar una o más columnas sólo en la consulta efectuada. Es decir, si consideramos la columna ``nombre`` de la tabla ``empleados``, podemos utilizar un alias para renombrarla, digamos ``Nombres``, no obstante, dicho renombre sólo será válido en la consulta que efectuemos, pues la etiqueta ``nombre`` siempre será asociada a dicha columna y no ``Nombres``. De tal manera, puede pensarse a un alias como un nombre o renombre temporal. 

Por ejemplo, de la consulta anterior podemos asignarle un alias a la columna ``?column?`` como sigue

```sql
SELECT nombre || ' ' || app || ' ' || apm AS nombre_completo 
	FROM empleados WHERE id_empleados = 1;
```

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase9\Captura4.PNG)

es decir, después de colocar la concatenación de las columnas hemos escrito ``AS`` seguido del alias que queremos asignarle a dicha columna. Notemos que, si volvemos a efectuar la consulta

```sql
SELECT nombre || ' ' || app || ' ' || apm FROM empleados WHERE id_empleados = 1;
```

nuevamente el nombre de la columna resultante de la consulta será ``?column?``.

###### Operador ``WHERE``

Hemos visto anteriormente que ``WHERE`` nos permite seleccionar una fila en particular de una tabla. Por ejemplo, podemos ver todas las ventas en las que intervino el empleado con id igual a 1, esto es

```sql
SELECT * FROM ventas WHERE id_empleado = 1;
```

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase9\Captura5.PNG)

Ahora bien, podemos utilizar ``WHERE`` no sólo asociándole el símbolo de igualdad (``id_empleado = 1``), de hecho, podemos utilizar ``WHERE`` con más símbolos de comparación. Por ejemplo, podemos ver todas las ventas en las cuales se vendieron más de 20 artículos

```sql
SELECT * FROM ventas WHERE cantidad > 20;
```

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase9\Captura6.PNG)

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase9\Captura7.PNG)

donde vemos las primeras ocho filas y las últimas 7. En total tenemos que hay 80 ventas en las cuales se vendieron más de 20 artículos. Así como se utilizó el operador ``>`` podemos usar ``<, <=`` y ``>=``. Adicionalmente tenemos el operador _distinto_ (``<>``), por ejemplo podemos hallar todas las ventas cuya cantidad sea distinta de 20:

```sql
SELECT * FROM ventas WHERE cantidad <> 20;
```



###### Operador``BETWEEN`` 

Podemos traducir la palabra _between_ al español como _entre_. Lo anterior nos dice cómo funciona el operador ``BETWEEN``, pues podemos hallar ciertos valores comprendidos _entre_ un rango de valores. Para utilizar la sentencia ``BETWEEN`` nos auxiliaremos también de la sentencia ``WHERE``.  Por ejemplo, podemos hallar todas las ventas en las cuales se han vendido **entre** los productos 8 y 20:

```sql
SELECT * FROM ventas WHERE id_producto_vendido BETWEEN 8 AND 20;
```

que se traduce como: _selecciona todas las ventas de la tabla_ ``ventas`` _donde el_ ``id_producto_vendido`` _está entre los valores 8 y 20_  

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase9\Captura8.PNG)

De forma similar podemos utilizar la sentencia ``NOT BETWEEN``. Por ejemplo, si queremos hallar los empleados que no ganan entre los 10000 y 40000 escribimos

```sql
SELECT * FROM empleados WHERE salario NOT BETWEEN 10000 AND 40000;
```

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase9\Captura9.PNG)

(sólo mostramos las primeras 8 filas, pero la consulta arrojó más)

###### Operador ``LIKE``

El operador ``LIKE`` nos permite realizar comparaciones exclusivas de cadenas de texto. Recordemos que en consultas como

```sql
SELECT * FROM empleados WHERE nombre = 'Luis';
```

al emplear ``nombre = 'Luis'`` estamos realizando una búsqueda exacta. Es decir, si fuera el caso que en nuestra tabla ``empleados`` tenemos un empleado con nombre ``'Lui'`` (que probablemente fue mal ingresado a la tabla ``empleados``), la consulta anterior no nos mostraría a dicho empleado. Ahora bien, el operador ``LIKE`` nos permite realizar búsquedas no exactas, es decir, nos permite comparar porciones de cadenas. 

Por ejemplo, en la tabla ``empleados``, tenemos que el nombre de dos empleados comienzan con _Lui_, estos son

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase9\Captura10.PNG)

Así, si nosotros escribiéramos

```sql
SELECT * FROM empleados WHERE nombre = 'Lui';
```

 el resultado de la consulta anterior sería vacía, es decir, no nos mostraría nada. Lo anterior debido a que estamos efectuando una búsqueda exacta. En cambio, al realizar una búsqueda que compare porciones de cadena podemos hallar a todos aquellos empleados cuyos nombres comiencen con _Lui_ y nos arrojen a los empleados que mostramos antes. Para ello escribimos

```sql
SELECT * FROM empleados WHERE nombre LIKE 'Lui%';
```

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase9\Captura10.PNG)

donde hemos colocado ``%`` después de ``'Lui`` pues estamos indicando que después de dicha palabra pueden variar los caracteres, como es el caso de _Luis_ y _Luise_. Entonces, podemos colocar ``'%is'`` después del ``LIKE`` para buscar todos aquellos nombres de los empleados que terminen en _is_

```sql
SELECT * FROM empleados WHERE nombre LIKE '%is';
```

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase9\Captura11.PNG)

También, podemos buscar todos aquellos nombres de los empleados que contienen en su nombre la palabra _arris_, como por ejemplo _Farris_:

```sql
SELECT * FROM empleados WHERE nombre LIKE '%arris%';
```

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase9\Captura12.PNG)

Otros ejemplos. Podemos hallar todos los nombres de los empleados que comienzan con la letra _N_

```sql
SELECT * FROM empleados WHERE nombre LIKE 'N%';
```

o todos los nombres que terminan en _s_

```sql
SELECT * FROM empleados WHERE nombre LIKE '%s';
```

o todos los nombres que contienen la letra o

```sql
SELECT * FROM empleados WHERE nombre LIKE '%o%';
```

etcétera.

De forma totalmente análoga también podemos:

Hallar todos los nombres de los empleados que **NO** comienzan con la letra _N_

```sql
SELECT * FROM empleados WHERE nombre NOT LIKE 'N%';
```

o todos los nombres que **NO** terminan en _s_

```sql
SELECT * FROM empleados WHERE nombre NOT LIKE '%s';
```

o todos los nombres que **NO** contienen la letra o

```sql
SELECT * FROM empleados WHERE nombre NOT LIKE '%o%';
```

Finalmente, dado que con ``%`` estamos sustituyendo en general cualquier tipo de caracteres en las búsquedas, por ejemplo en la búsqueda donde escribimos ``LIKE 'Lui%'`` después de la palabra _Lui_ y al escribir ``%`` estamos indicando que después puede ir cualquier cantidad de letras o caracteres, tenemos que ``_`` sustituirá tan sólo un carácter en especifico. Por ejemplo, si escribimos 

```sql
SELECT * FROM empleados WHERE nombre LIKE 'Lui_';
```

  estamos especificando que después de _Lui_ sólo debe ir un carácter, de tal manera en donde el nombre es _Luise_ quedará totalmente descartado puesto que después de _Lui_ va específicamente otros dos caracteres. 

De tal forma la consulta anterior sólo arroja

![](C:\Users\weeee\OneDrive\Datos adjuntos\Documentos\Documentos(A)\Softwares\SQL\PostgreSQL\Clase9\Captura13.PNG)



---

##### Ejercicios

1. Realiza 10 consultas empleando el operador ``WHERE`` en diferentes tablas y seleccionando sólo algunas columnas de la tabla en cuestión (es decir, no ocupes ``SELECT * FROM``, en su lugar ocupa algo como ``SELECT nombre, app, apm FROM``)
2.  Realiza 2 consultas utilizando el operador ``WHERE`` concatenando las columnas de las tablas que consultarás.
3.  Realiza 2 consultas utilizando el operador ``WHERE`` con operadores como ``<,>, <=, >=, <>``.
4. Realiza una consulta utilizando el operador ``WHERE`` junto con ``NOT BETWEEN``.
5. Realiza una consulta utilizando el operador ``WHERE`` junto con ``LIKE`` o ``NOT LIKE`` empleando en la comparación
   1. ``%`` al inicio
   2. ``%`` al final
   3. ``%  %`` para caracteres intermedios
   4. ``_`` al inicio
   5. ``_`` al final