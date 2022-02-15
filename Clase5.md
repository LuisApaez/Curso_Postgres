# Curso PostgreSQL

#### Autor: Luis Fernando Apáez Álvarez



##### Llaves primarias

Desde las primeras clases hablamos sobre la importancia de tener un identificador en cada tabla de nuestra base de datos. Dijimos que la mayoría de las tablas deberían tener un ``id`` como identificador pues de esta forma optimizaríamos nuestra base de datos. 

Ahora, veamos propiamente a lo que hace alusión este identificador del que hablamos.

En cada tabla de nuestra base de datos debemos poder identificar de **manera única** cada fila dentro de ella. Para ello nos basaremos en una columna (o conjunto de columnas) que logren realizar esta unicidad de la que hablamos. Así, a dicha columna (o conjunto de columnas) la denominaremos como **llave primaria** (o primary key), donde en la mayoría de los casos (no en todos) será el identificador ``id`` al que asignaremos como llave primaria.

Por ejemplo, considerando la siguiente tabla

| id_empleados | nombre | app     | apm     | puesto    | salario | horario     |
| ------------ | ------ | ------- | ------- | --------- | ------- | ----------- |
| 50           | Pedro  | López   | López   | Vigilante | 12500.5 | 00:00-12:00 |
| 100          | Lupe   | López   | Ocaña   | Cajero    | 9500.0  | 6:00-13:00  |
| 175          | Pedro  | Álvarez | Cabello | Cajero    | 9500.0  | 6:00-13:00  |

vemos que la columna ``nombre`` no puede ser llave primaria pues no identifica de manera única a cada fila de la tabla, pues vemos que hay dos entradas con el mismo valor ``Pedro`` dentro de esta columna. De la misma forma, las columnas ``app, apm, puesto, salario`` y ``horario`` no pueden ser llaves primarias. Vemos que claramente la columna ``id_empleados`` identifica de manera única cada fila de la tabla ``empleados`` por lo que definiremos a dicha columna como **llave primaria**.

Cabe aclarar que considerando las columnas ``nombre, app`` y ``apm`` podríamos tener también una lleva primaria, no obstante, se elige la que este conformada por el menor número de columnas.

Tenemos dos opciones para definir una **llave primaria**:

* Opción 1: definir la llave primaria cuando estamos creando la tabla en cuestión.

Por ejemplo, si apenas estamos creando la tabla empleados y escribimos

```sql
CREATE TABLE empleados(
    id_empleados INT, 
    nombre VARCHAR,
    app VARCHAR,
    apm VARCHAR,
    puesto VARCHAR,
    salario real,
    horario VARCHAR
);
```

como deseamos que ``id_empleados`` sea la llave primaria entonces agregamos adicionalmente

```sql
CREATE TABLE empleados(
    id_empleados INT, 
    nombre VARCHAR,
    app VARCHAR,
    apm VARCHAR,
    puesto VARCHAR,
    salario real,
    horario VARCHAR
    
    -- Agregamos la definicion de la llave primaria
    primary key(id_empleados)
);
```

Con lo anterior garantizamos que cada valor de la columna ``id_empleados`` sea único. Así, por ejemplo, si en algún momento queremos cambiar el valor del ``id_empleados`` de algún empleado y colocamos un número que ya está registrado, entonces _postgres_ nos arrojará un error debido a la definición de llave primaria en esta columna. De igual forma al momento de ingresar un empleado nuevo, si le asignamos un ``id_empleados`` que ya existe previamente, de igual manera _postgres_ nos arrojará un error. Además, al ser llave primaria esta columna no permite valores nulos.

* Opción 2 (recomendable)

Definiremos la llave primaria en una tabla que ya está almacenada en nuestra base de datos. Por ejemplo, dado que nosotros ya tenemos almacenada la tabla ``empleados`` en la base de datos, trabajaremos con esta opción para definir como llave primaria a la columna ``id_empleados``. Para ello escribimos

```sql
ALTER TABLE empleados ADD CONSTRAINT pk_empleados_id_empleados
  PRIMARY KEY (id_empleados);
```

donde después de escribir ``ADD CONSTRAINT`` pusimos ``pk_empleados_id_empleados`` el cual es el nombre que le hemos asignado a dicha llave primaria. La convención es poner ``pk_`` (primary key) después el nombre de la tabla ``pk_empleados`` y finalmente el nombre de la columna que será la llave primaria ``pk_empleados_id_empleados``. Finalmente, después de escribir ``PRIMARY KEY`` entre paréntesis indicamos la columna (o columnas) que serán la llave primaria de dicha tabla.

Una vez que ya hemos ejecutado el código veremos en la parte del menú de la izquierda que la llave primaria que hemos definido aparece en la parte de ``constraints``

![]Clase5/Captura1.PNG)

Si deseáramos eliminar una llave primaria utilizaríamos la siguiente sintaxis

```sql
ALTER TABLE <<nombre tabla>> DROP CONSTRAINT <<nombre llave primaria>>;
```

De tal manera, si quisiéramos eliminar la llave primaria que acabamos de definir escribiríamos algo como

```sql
ALTER TABLE empleados DROP CONSTRAINT pk_empleados_id_empleados;
```

 

---

##### Ejercicio

Definir una llave primaria en cada una de las tablas que tienes almacenadas en tu base de datos (referente al proyecto de la papelería)
