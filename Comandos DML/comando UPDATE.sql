/*COMANDO UPDATE*/
/*se utiliza para actualizar registros en una tabla*/
/*1. completar datos que no se habian podido obtener
  2. corregir errores en los datos
  3. actualizar datos que pueden cambiar
El comando update trabaja sobre 1 solo registro, sobre un grupo
de registros o sobre toda la tabla
*/
/*SINTAXIS GENERAL
UPDATE nombre_tabla SET campo1=valor1,campo2=valor2,
     campo3=valor,.....,campon=valorn
WHERE condicion(es) --opcional
SIN EMBARGO´para utilizar un update sin la clausula where
debemos estar muy seguros de lo que se está haciendo
*/
update generos set nombre='Informática'
where codigo='G04';   

update generos set nombre='Contabilidad'
where nombre='';
  
update generos set nombre='Administración'
where nombre='';

update generos set nombre='Electrónica'
where nombre='';

/*actualizar valores nulos*/
update generos set nombre='Quimica'
where nombre=null;

update generos set nombre='Quimica'
where nombre is null;

/*alcance para toda la tabla*/
update generos set nombre='Medicina y Enfermería';

/*en que escenario se puede utilizar un update
sin where? */
alter table generos add column estado char(1);
update generos set estado='A';

update generos set codigo='G50'
WHERE codigo='G10';

update generos set codigo='G51'
WHERE codigo='G03';
Error Code: 1451. Cannot delete or update a 
parent row: a foreign key constraint fails 
(`biblioteca`.`libros`, CONSTRAINT 
`FK_generos_libros` FOREIGN KEY (`genero`) 
REFERENCES `generos` (`codigo`))

update generos set codigo='G51'
WHERE codigo='G04';

/*despues de configurar la llave foranea
para actualizar en cascada*/
update generos set codigo='G98'
WHERE codigo='G01';