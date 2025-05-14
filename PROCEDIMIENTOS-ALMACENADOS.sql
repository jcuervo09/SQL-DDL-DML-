-- procesos
USE `sql-ddl-dml`;
DROP procedure IF EXISTS `agregar_fabricante`;

USE `sql-ddl-dml`;
DROP procedure IF EXISTS `sql-ddl-dml`.`agregar_fabricante`;
;

DELIMITER $$
USE `sql-ddl-dml`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_fabricante`(
in nom varchar(100)
)
BEGIN
	insert into fabricante (nombre)
    values(nom);
END$$

DELIMITER ;
;

USE `sql-ddl-dml`;
DROP procedure IF EXISTS `agregar_producto`;

DELIMITER $$
USE `sql-ddl-dml`$$
CREATE PROCEDURE `agregar_producto` (
in nom varchar(100),
in pre double,
in codf int(10)
)
BEGIN
	insert into producto(nombre,precio,codigo_fabricante)
    values (nom,pre,codf);
END$$

DELIMITER ;

