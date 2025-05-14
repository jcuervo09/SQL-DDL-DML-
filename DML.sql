call agregar_fabricante("Asus");
call agregar_fabricante("Lenovo");
call agregar_fabricante("Hewlett-Packard");
call agregar_fabricante("Samsung");
call agregar_fabricante("Seagate");
call agregar_fabricante("Crucial");
call agregar_fabricante("Gigabyte");
call agregar_fabricante("Huawei");
call agregar_fabricante("Xiaomi");

call agregar_producto("Disco duro SATA3 1TB",86.99,6);
call agregar_producto("Memoria RAM DDR4 8GB",120,7);
call agregar_producto("Disco SSD 1 TB",150.99,5);
call agregar_producto("GeForce GTX 1050Ti",185,8);
call agregar_producto("GeForce GTX 1080 Xtreme",755,7);
call agregar_producto("Monitor 24 LED Full HD",202,1);
call agregar_producto("Monitor 27 LED Full HD",245.99,1);
call agregar_producto("Portátil Yoga 520",559,2);
call agregar_producto("Portátil Ideapd 320",444,2);
call agregar_producto("Impresora HP Deskjet 3720",59.99,3);
call agregar_producto("Impresora HP Laserjet Pro M26nw",180,3);

-- JOIN
-- 1. Lista el nombre de todos los productos que hay en la tabla producto.

select nombre from producto;
