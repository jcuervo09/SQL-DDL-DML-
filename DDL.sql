create table fabricante (
codigo INT(10) PRIMARY KEY AUTO_INCREMENT,
nombre varchar(100)
);
create table producto (
codigo INT(10) PRIMARY KEY AUTO_INCREMENT,
nombre varchar(100),
precio double,
codigo_fabricante int(10),
FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);