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
-- 10.Calcula el número de productos que tiene el fabricante Asus.
