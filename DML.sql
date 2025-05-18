call agregar_fabricante("Asus");
call agregar_fabricante("Lenovo");
call agregar_fabricante("Hewlett-Packard");
call agregar_fabricante("Samsung");
call agregar_fabricante("Seagate");
call agregar_fabricante("Crucial");
call agregar_fabricante("Gigabyte");
call agregar_fabricante("Huawei");
call agregar_fabricante("Xiaomi");

call agregar_producto("Disco duro SATA3 1TB",86.99,5);
call agregar_producto("Memoria RAM DDR4 8GB",120,6);
call agregar_producto("Disco SSD 1 TB",150.99,4);
call agregar_producto("GeForce GTX 1050Ti",185,7);
call agregar_producto("GeForce GTX 1080 Xtreme",755,6);
call agregar_producto("Monitor 24 LED Full HD",202,1);
call agregar_producto("Monitor 27 LED Full HD",245.99,1);
call agregar_producto("Portátil Yoga 520",559,2);
call agregar_producto("Portátil Ideapd 320",444,2);
call agregar_producto("Impresora HP Deskjet 3720",59.99,3);
call agregar_producto("Impresora HP Laserjet Pro M26nw",180,3);

-- JOIN
-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
select nombre from producto;
-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio
FROM producto;
-- 3. Lista todas las columnas de la tabla producto
SELECT *
FROM producto;
-- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT
    nombre,
    precio AS euros,
    precio * 1.08 AS USD
FROM
    producto;
-- 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares
    SELECT
    nombre AS "nombre de producto",
    precio AS euros,
    precio * 1.08 AS dólares
FROM
    producto;
-- 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT
    UPPER(nombre) AS nombre_mayuscula,
    precio
FROM
    producto;
-- 7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT
    LOWER(nombre) AS nombre_minuscula,
    precio
FROM
    producto;
-- 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT
    nombre,
    UPPER(LEFT(nombre, 2)) AS dos_primeras_letras_mayuscula
FROM
    fabricante;
-- 9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT
    nombre,
    ROUND(precio) AS precio_redondeado
FROM
    producto;
-- 10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal
SELECT
    nombre,
    TRUNCATE(precio, 0) AS precio_truncado
FROM
    producto;
-- 11. Lista el identificador de los fabricantes que tienen productos en la tabla producto
 SELECT DISTINCT f.codigo AS id_fabricante
FROM fabricante f
INNER JOIN producto p ON f.codigo = p.codigo_fabricante;
-- 12. Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos
select distinct codigo_fabricante from producto;
-- 13. Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre AS nombre_fabricante
FROM fabricante
ORDER BY nombre ASC;
-- 14.Lista los nombres de los fabricantes ordenados de forma descendente
SELECT nombre AS nombre_fabricante
FROM fabricante
ORDER BY nombre desc;
-- 15.Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente
SELECT nombre AS nombre_producto, precio
FROM producto
ORDER BY nombre ASC, precio DESC;
-- 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select * from fabricante limit 5;
-- 17.Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT *
FROM fabricante
LIMIT 2 OFFSET 3;
-- 18. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio
from producto 
order by precio asc limit 1;
-- 19. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio
from producto 
order by precio desc limit 1;
-- 20.Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
SELECT p.nombre AS nombre_producto
FROM producto p
INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.codigo = 2;
-- 21. Lista el nombre de los productos que tienen un precio menor o igual a 120€
SELECT nombre 
FROM producto
where precio <= 120;
-- 22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€
SELECT nombre 
FROM producto
where precio >= 400;
-- 23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€
SELECT nombre 
FROM producto
where precio < 400;
-- 24. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT nombre, precio
FROM producto
WHERE precio >= 80 AND precio <= 300;
-- 25. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN
SELECT nombre, precio
FROM producto
WHERE precio BETWEEN 60 AND 200;
-- 26. Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6
select *
from producto
where precio > 200 and codigo_fabricante =6;
-- 27. . Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT *
FROM producto
WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;
-- 28. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.

SELECT *
FROM producto
WHERE codigo_fabricante IN (1, 3, 5);
-- 29. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
select nombre, precio*100 as centimos
from producto;
-- 30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S
SELECT nombre
FROM fabricante
WHERE nombre LIKE 'S%';
-- 31. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S
SELECT nombre
FROM fabricante
WHERE nombre LIKE 'S%';
-- 32. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e
SELECT nombre
FROM fabricante
WHERE nombre LIKE '%e';
-- 33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre
FROM fabricante
WHERE LENGTH(nombre) = 4;
-- 34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT nombre
FROM producto
WHERE nombre like "%Portátil%";
-- 35. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT nombre
FROM producto
WHERE nombre like "%Monitor%" and precio <215;
-- 36. 36. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT nombre, precio
FROM producto
WHERE precio >= 180
ORDER BY precio DESC, nombre ASC;


-- 1.1.4 Consultas multitabla (Composición interna)
-- 1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
select p.nombre as nombre_producto,p.precio,
f.nombre as nombre_fabricante
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo;
-- 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
select p.nombre as nombre_producto,p.precio,
f.nombre as nombre_fabricante
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
order by nombre_fabricante asc;
-- 3. Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.
select p.codigo as codigo_producto,
p.nombre as nombre_producto,
f.codigo as codigo_fabricante,
f.nombre as nombre_fabricante
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo;
-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato
select p.nombre as nombre_producto,
p.precio,
f.nombre as nombre_fabricante
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
order by precio asc limit 1;
-- 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro
select p.nombre as nombre_producto,
p.precio,
f.nombre as nombre_fabricante
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
order by precio desc limit 1;
-- 6. Devuelve una lista de todos los productos del fabricante Lenovo
select p.codigo,
p.nombre as nombre_producto,
p.precio,
p.codigo_fabricante
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = "Lenovo";
-- 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€
select p.codigo,
p.nombre as nombre_producto,
p.precio,
p.codigo_fabricante
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = "Crucial"and p.precio >200;
-- 8. Devuelve un listado con todos los productos de los fabricantes Asus, HewlettPackardy Seagate. Sin utilizar el operador IN
select p.codigo,
p.nombre as nombre_producto,
p.precio,
p.codigo_fabricante
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = "Asus" or f.nombre = "Hewlett-Packard" or f.nombre = "Seagate";
-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, HewlettPackardy Seagate. Utilizando el operador IN
select p.codigo,
p.nombre as nombre_producto,
p.precio,
p.codigo_fabricante
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre in ("Asus", "Hewlett-Packard","Seagate");
-- 10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e
select p.nombre, p.precio
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre like ("%e");
-- 11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre
select p.nombre, p.precio
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre like ("%w%");
-- 12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
select p.nombre as nombre_producto,
 p.precio, f.nombre as nombre_fabricante
from producto p
inner join fabricante f on f.codigo = p.codigo_fabricante
where p.precio >= 180
order by 
p.precio desc,
p.nombre asc;
-- 13. Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
select distinct f.codigo as codigo_fabricante,
f.nombre as nombre_fabricante
from fabricante f
inner join producto p on p.codigo_fabricante = f.codigo;


-- 1.1.5 Consultas multitabla (Composición externa)
-- 1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados
select f.nombre as nombre_fabricante,
p.nombre as nombre_producto
from
    producto p
right join
    fabricante f on p.codigo_fabricante = f.codigo;
-- 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
select f.nombre as nombre_fabricante,
p.nombre as nombre_producto
from 
producto p
right join 
fabricante f on p.codigo_fabricante = f.codigo
where p.nombre is null;
-- 3. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta
-- rta: en esta base de datos si, por que no se prohibio el uso de datos null en la creacion de las tablas y al no haberlo hecho se permite que en la insercion de datos puedan quedar campos sin ingresar datos.


-- 1.1.6 Consultas resumen
-- 1.Calcula el número total de productos que hay en la tabla productos
select count(*) as total_productos
from producto;
-- 2.Calcula el número total de fabricantes que hay en la tabla fabricante.
select count(*) as total_fabricantes
from fabricante;
-- 3.Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.
select count(distinct codigo_fabricante) as total_fabricantes_distintos
from producto;
-- 4.Calcula la media del precio de todos los productos.
select avg(precio) as media_precio
from producto;
-- 5.Calcula el precio más barato de todos los productos
select min(precio) as mas_eco
from producto;
-- 6.Calcula el precio más caro de todos los productos
select max(precio) as mas_caro
from producto;
-- 7.Lista el nombre y el precio del producto más barato
select nombre as nombre_producto,
min(precio) as mas_eco
from producto;
-- 8.Lista el nombre y el precio del producto más caro.
select nombre as nombre_producto,
max(precio) as mas_caro
from producto;
-- 9.Calcula la suma de los precios de todos los productos.
select sum(precio) as total_productos
from producto;
-- 10. calcula el número de productos que tiene el fabricante asus.
select count(p.codigo) as total_productos_asus
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = 'asus';

-- 11. calcula la media del precio de todos los productos del fabricante asus.
select avg(p.precio) as media_precio_asus
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = 'asus';

-- 12. calcula el precio más barato de todos los productos del fabricante asus.
select min(p.precio) as precio_minimo_asus
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = 'asus';

-- 13. calcula el precio más caro de todos los productos del fabricante asus.
select max(p.precio) as precio_maximo_asus
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = 'asus';

-- 14. calcula la suma de todos los productos del fabricante asus.
select sum(p.precio) as suma_precios_asus
from producto p
join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = 'asus';

-- 15. muestra el precio máximo, precio mínimo, precio medio y el número total de
-- productos que tiene el fabricante crucial.
select
    max(p.precio) as precio_maximo_crucial,
    min(p.precio) as precio_minimo_crucial,
    avg(p.precio) as precio_medio_crucial,
    count(p.codigo) as total_productos_crucial
from
    producto p
join
    fabricante f on p.codigo_fabricante = f.codigo
where
    f.nombre = 'crucial';

-- 16. muestra el número total de productos que tiene cada uno de los fabricantes. el
-- listado también debe incluir los fabricantes que no tienen ningún producto. el
-- resultado mostrará dos columnas, una con el nombre del fabricante y otra con el
-- número de productos que tiene. ordene el resultado descendentemente por el
-- número de productos.
select
    f.nombre as nombre_fabricante,
    count(p.codigo) as total_productos
from
    fabricante f
left join
    producto p on f.codigo = p.codigo_fabricante
group by
    f.nombre
order by
    total_productos desc;

-- 17. muestra el precio máximo, precio mínimo y precio medio de los productos de cada
-- uno de los fabricantes. el resultado mostrará el nombre del fabricante junto con los
-- datos que se solicitan.
select
    f.nombre as nombre_fabricante,
    max(p.precio) as precio_maximo,
    min(p.precio) as precio_minimo,
    avg(p.precio) as precio_medio
from
    fabricante f
join
    producto p on f.codigo = p.codigo_fabricante
group by
    f.nombre;

-- 18. muestra el precio máximo, precio mínimo, precio medio y el número total de
-- productos de los fabricantes que tienen un precio medio superior a 200€. no es
-- necesario mostrar el nombre del fabricante, con el identificador del fabricante es
-- suficiente.
select
    p.codigo_fabricante,
    max(p.precio) as precio_maximo,
    min(p.precio) as precio_minimo,
    avg(p.precio) as precio_medio,
    count(p.codigo) as total_productos
from
    producto p
group by
    p.codigo_fabricante
having
    avg(p.precio) > 200;

-- 19. muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo,
-- precio medio y el número total de productos de los fabricantes que tienen un precio
-- medio superior a 200€. es necesario mostrar el nombre del fabricante.
select
    f.nombre as nombre_fabricante,
    max(p.precio) as precio_maximo,
    min(p.precio) as precio_minimo,
    avg(p.precio) as precio_medio,
    count(p.codigo) as total_productos
from
    fabricante f
join
    producto p on f.codigo = p.codigo_fabricante
group by
    f.nombre
having
    avg(p.precio) > 200;

-- 20. calcula el número de productos que tienen un precio mayor o igual a 180€.
select count(*) as total_productos_mayor_o_igual_180
from producto
where precio >= 180;

-- 21. calcula el número de productos que tiene cada fabricante con un precio mayor o
-- igual a 180€.
select
    f.nombre as nombre_fabricante,
    count(p.codigo) as total_productos_mayor_o_igual_180
from
    fabricante f
join
    producto p on f.codigo = p.codigo_fabricante
where
    p.precio >= 180
group by
    f.nombre;

-- 22. lista el precio medio los productos de cada fabricante, mostrando solamente el
-- identificador del fabricante.
select
    p.codigo_fabricante,
    avg(p.precio) as precio_medio
from
    producto p
group by
    p.codigo_fabricante;

-- 23. lista el precio medio los productos de cada fabricante, mostrando solamente el
-- nombre del fabricante.
select
    f.nombre as nombre_fabricante,
    avg(p.precio) as precio_medio
from
    fabricante f
join
    producto p on f.codigo = p.codigo_fabricante
group by
    f.nombre;

-- 24. lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o
-- igual a 150€.
select
    f.nombre as nombre_fabricante
from
    fabricante f
join
    producto p on f.codigo = p.codigo_fabricante
group by
    f.nombre
having
    avg(p.precio) >= 150;

-- 25. devuelve un listado con los nombres de los fabricantes que tienen 2 o más
-- productos.
select
    f.nombre as nombre_fabricante
from
    fabricante f
join
    producto p on f.codigo = p.codigo_fabricante
group by
    f.nombre
having
    count(p.codigo) >= 2;

-- 26. devuelve un listado con los nombres de los fabricantes y el número de productos que
-- tiene cada uno con un precio superior o igual a 220 €. no es necesario mostrar el
-- nombre de los fabricantes que no tienen productos que cumplan la condición.
select
    f.nombre as nombre,
    count(p.codigo) as total
from
    fabricante f
join
    producto p on f.codigo = p.codigo_fabricante
where
    p.precio >= 220
group by
    f.nombre;

-- 27. devuelve un listado con los nombres de los fabricantes y el número de productos que
-- tiene cada uno con un precio superior o igual a 220 €. el listado debe mostrar el
-- nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene
-- productos con un precio superior o igual a 220€ deberá aparecer en el listado con un
-- valor igual a 0 en el número de productos.
select
    f.nombre as nombre,
    count(case when p.precio >= 220 then p.codigo end) as total
from
    fabricante f
left join
    producto p on f.codigo = p.codigo_fabricante
group by
    f.nombre;

-- 28. devuelve un listado con los nombres de los fabricantes donde la suma del precio de
-- todos sus productos es superior a 1000 €.
select
    f.nombre as nombre_fabricante
from
    fabricante f
join
    producto p on f.codigo = p.codigo_fabricante
group by
    f.nombre
having
    sum(p.precio) > 1000;

-- 29. devuelve un listado con el nombre del producto más caro que tiene cada fabricante.
-- el resultado debe tener tres columnas: nombre del producto, precio y nombre del
-- fabricante. el resultado tiene que estar ordenado alfabéticamente de menor a mayor
-- por el nombre del fabricante.
select
    p.nombre as nombre_producto,
    p.precio,
    f.nombre as nombre_fabricante
from
    producto p
join
    fabricante f on p.codigo_fabricante = f.codigo
where
    (p.codigo_fabricante, p.precio) in (
        select
            codigo_fabricante,
            max(precio)
        from
            producto
        group by
            codigo_fabricante
    )
order by
    nombre_fabricante asc;

-- 1.1.7 subconsultas (en la cláusula where)
-- 1.1.7.1 con operadores básicos de comparación
-- 1. devuelve todos los productos del fabricante lenovo. (sin utilizar inner join).
select
    nombre as nombre_producto,
    precio,
    codigo_fabricante
from
    producto
where
    codigo_fabricante = (select codigo from fabricante where nombre = 'lenovo');

-- 2. devuelve todos los datos de los productos que tienen el mismo precio que el
-- producto más caro del fabricante lenovo. (sin utilizar inner join).
select
    p1.*
from
    producto p1
where
    p1.precio = (
        select
            max(p2.precio)
        from
            producto p2
        where
            p2.codigo_fabricante = (
                select
                    codigo
                from
                    fabricante
                where
                    nombre = 'lenovo'
            )
    );

-- 3. lista el nombre del producto más caro del fabricante lenovo.
select
    p.nombre as nombre_producto
from
    producto p
where
    p.codigo_fabricante = (select codigo from fabricante where nombre = 'lenovo')
order by
    p.precio desc
limit 1;

-- 4. lista el nombre del producto más barato del fabricante hewlett-packard.
select
    p.nombre as nombre_producto
from
    producto p
where
    p.codigo_fabricante = (select codigo from fabricante where nombre = 'hewlett-packard')
order by
    p.precio asc
limit 1;

-- 5. devuelve todos los productos de la base de datos que tienen un precio mayor o igual
-- al producto más caro del fabricante lenovo.
select
    p1.*
from
    producto p1
where
    p1.precio >= (
        select
            max(p2.precio)
        from
            producto p2
        where
            p2.codigo_fabricante = (
                select
                    codigo
                from
                    fabricante
                where
                    nombre = 'lenovo'
            )
    );

-- 6. lista todos los productos del fabricante asus que tienen un precio superior al precio
-- medio de todos sus productos.
select
    p1.nombre as nombre_producto,
    p1.precio
from
    producto p1
where
    p1.codigo_fabricante = (select codigo from fabricante where nombre = 'asus')
    and p1.precio > (
        select
            avg(p2.precio)
        from
            producto p2
        where
            p2.codigo_fabricante = (select codigo from fabricante where nombre = 'asus')
    );

-- 1.1.7.2 subconsultas con all y any
-- 7. devuelve el producto más caro que existe en la tabla producto sin hacer uso de max,
-- order by ni limit.
select
    nombre as nombre_producto,
    precio
from
    producto
where
    precio >= all (select precio from producto);

-- 8. devuelve el producto más barato que existe en la tabla producto sin hacer uso de
-- min, order by ni limit.
select
    nombre as nombre_producto,
    precio
from
    producto
where
    precio <= all (select precio from producto);

-- 9. devuelve los nombres de los fabricantes que tienen productos asociados. (utilizando
-- all o any).
select distinct
    f.nombre as nombre_fabricante
from
    fabricante f
where
    f.codigo = any (select distinct codigo_fabricante from producto where codigo_fabricante is not null);

-- 10. devuelve los nombres de los fabricantes que no tienen productos asociados.
-- (utilizando all o any).
select distinct
    f.nombre as nombre_fabricante
from
    fabricante f
where
    f.codigo <> all (select distinct codigo_fabricante from producto where codigo_fabricante is not null);

-- 1.1.7.3 subconsultas con in y not in
-- 11. devuelve los nombres de los fabricantes que tienen productos asociados. (utilizando
-- in o not in).
select distinct
    f.nombre as nombre_fabricante
from
    fabricante f
where
    f.codigo in (select distinct codigo_fabricante from producto where codigo_fabricante is not null);

-- 12. devuelve los nombres de los fabricantes que no tienen productos asociados.
-- (utilizando in o not in).
select distinct
    f.nombre as nombre_fabricante
from
    fabricante f
where
    f.codigo not in (select distinct codigo_fabricante from producto where codigo_fabricante is not null);

-- 1.1.7.4 subconsultas con exists y not exists
-- 13. devuelve los nombres de los fabricantes que tienen productos asociados. (utilizando
-- exists o not exists).
select distinct
    f.nombre as nombre_fabricante
from
    fabricante f
where
    exists (select 1 from producto p where p.codigo_fabricante = f.codigo);

-- 14. devuelve los nombres de los fabricantes que no tienen productos asociados.
-- (utilizando exists o not exists).
select distinct
    f.nombre as nombre_fabricante
from
    fabricante f
where
    not exists (select 1 from producto p where p.codigo_fabricante = f.codigo);

-- 1.1.7.5 subconsultas correlacionadas
-- 15. lista el nombre de cada fabricante con el nombre y el precio de su producto más
-- caro.
select
    f.nombre as nombre_fabricante,
    (select p.nombre from producto p where p.codigo_fabricante = f.codigo order by p.precio desc limit 1) as nombre_producto_mas_caro,
    (select p.precio from producto p where p.codigo_fabricante = f.codigo order by p.precio desc limit 1) as precio_producto_mas_caro
from
    fabricante f;

-- 16. devuelve un listado de todos los productos que tienen un precio mayor o igual a la
-- media de todos los productos de su mismo fabricante.
select
    p1.nombre as nombre_producto,
    p1.precio,
    f.nombre as nombre_fabricante
from
    producto p1
join
    fabricante f on p1.codigo_fabricante = f.codigo
where
    p1.precio >= (select avg(p2.precio) from producto p2 where p2.codigo_fabricante = p1.codigo_fabricante);

-- 17. lista el nombre del producto más caro del fabricante lenovo.
select
    p.nombre as nombre_producto
from
    producto p
where
    p.codigo_fabricante = (select codigo from fabricante where nombre = 'lenovo')
order by
    p.precio desc
limit 1;

-- 1.1.8 subconsultas (en la cláusula having)
-- 18. devuelve un listado con todos los nombres de los fabricantes que tienen el mismo
-- número de productos que el fabricante lenovo.
select
    f.nombre as nombre_fabricante
from
    fabricante f
join
    producto p on f.codigo = p.codigo_fabricante
group by
    f.nombre
having
    count(p.codigo) = (select count(*) from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'lenovo'));