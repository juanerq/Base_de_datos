/*COMANDO DELETE*/
/*se utiliza para eliminar registros de una tabla*/
/* existen 2 tipos de eliminaciones en las BD*/
/* 1. Eliminación Física: Los registros 
       DESAPARECEN  de la base de datos. este
       tipo de eliminación se implementa
       con una sentencia DELETE.
       NO SIEMPRE se pueden eliminar los registros
       de una tabla. generalmente depende de la
       INTEGRIDAD REFERENCIAL
   2. Eliminación Lógica. Los registros se
      CONSERVAN guardando el historial de datos
      y cambiando de estado a uno de los campos
      de la tabla. este tipo de elimnación
      se implementa con una sentencia UPDATE*/
/* 
/*SINTAXIS GENERAL
 DELETE FROM nombre_tabla
 WHERE condicion(es) -->opcional
 SIN EMBARGO para utilizar el comando DELETE
 sin el where debemos estar MUY SEGUROS de 
 lo que estamos haciendo*/
 DELETE from generos
 where codigo='G06';
 
 DELETE from generos;
 /*no puedo borrar por la FK, pero requiero
 restaurar mis generos. que hago?
 UNA POSIBLE SOLUCION ES*/
 
 /*PASO 1 ELIMINO LA RELACIÓN*/
 alter table libros drop foreign key 
 FK_generos_libros;
 
 /*PASO 2. ELIMINAR LOS REGISTROS DE LA TABLA
  OJOOOOOO-> PARTIENDO DEL HECHO QUE EXISTE UN
  BACKUP*/
  delete from generos;

/*PASO 3. RESTAURAR LOS DATOS DESDE EL BACKUP*/
/* importar desde un archivo CSV= COMMA SEPARATOR VALUE
archivo de texto en formato excel
o importar desde excel, o desde otra fuente de datos
*/

 /*PASO 4 CREAR NUEVAMENTE LA RELACIÓN*/
 alter table libros add foreign key 
 FK_generos_libros (genero) 
 references generos(codigo);

DELETE FROM generos where 
codigo='G02';
Error Code: 1451. Cannot delete or update 
a parent row: a foreign key constraint fails 
(`biblioteca`.`libros_autores`, CONSTRAINT 
`FK_idlibro_Libros_autores` 
FOREIGN KEY (`idlibro`) REFERENCES `libros` 
(`idlibro`))

/*ALGO FUNDAMENTAL EN LAS BD ES
CONSERVAR LA HISTORIA DE LOS DATOS*/
Cannot delete or update a parent row: a foreign 
key constraint fails 
(`biblioteca`.`prestamos`, CONSTRAINT 
`FK_libro_prestamos` FOREIGN KEY (`libro`) 
REFERENCES `libros` (`idlibro`))	0.078 sec

