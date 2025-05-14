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