/*funciones nativas en SQL*/
/*función between 
nos permite evaluar un campo en un rango de valores
*/
select * from detallesfac 
where cantidad between 10 and 30;

select * from detallesfac 
where vtotal between 100000 and 200000;

select * from detallesfac 
where fecha between '2021-02-05' and '2021-02-08'

/*la función beetwen se pueden implementar con tipos de 
datos char. hay que tener cuidado al evaluar rangos
donde el tipo de dato char almacene números*/

select * from pacientes
where numero between '1' and '35'

select * from pacientes
where nombre1 between 'A' and 'GU'

/*FUNCIÓN LIKE ->> SE PARECE A
esta función se utiliza para buscar una cadena en un
campo. es ideal para las búsquedas desde nuestras
aplicaciones
*/
select * from detallesfac
where descripcion like 'CONSULTA%'


select * from detallesfac
where descripcion like '%CONTROL%ENFERMERIA%'

/*FUNCIÓN substr
esta función se utiliza para extraer una cantidad de 
caracteres de un campo, teniendo en cuenta 3 parámetros
parametro 1: es el campo o texto sobre el cual voy a
		     realizar la extracción
parametro 2: es la posición inicial donde se empieza
             a extraer la cadena
parametro 3: es la cantidad de caracteres a extraer
             desde la posición inicial, incluida esa
			posición
*/
select descripcion,substr(descripcion,5,10)
from detallesfac
 
T E R A P I A    F I  S  I   C    A
1 2 3 4 5 6 7 8  9 10 11 12  13  14

/*ALIAS DE CAMPOS.
es renombrar el nombre original del campo o darle
nombre a un campo generado al utilizar una o mas
funciones nativas o calculos*/
select descripcion as nombre,
substr(descripcion,5,10) as texto
from detallesfac

/*********************************************/
select * from detallesfac
where (contrato='161' or contrato='081' 
or contrato='070' or contrato='069'
or contrato='077' or contrato='009')

/*clausula in
se utiliza para hallar la pertenencia de un campo
sobre un conjunto de valores específico*/
select * from detallesfac
where contrato in('161','081','070','069','077','009')

select * from detallesfac
where cantidad in(1,5,10,12);

/*función count
se utiliza para contar registros. devuelve
1 solo registro con la cantidad de registros
que cumplen las condiciones.
la función count recieb un parametro de forma
obligatoria.*/

select count(*) as cantidad from detallesfac
where tipodoc='CC' and cantidad>=10

/*funciones para extraer los componentes de una fecha.
cada función recibe la fecha como parámetro
y DEVUELVE UN VALOR NUMÉRICO*/
 
select fecha,
year(fecha) as anio,month(fecha) as mes,
day(fecha) as dia,hour(fecha) as hora,
minute(fecha) as minutos, second(fecha) as segundos
from detallesfac

select now() as fecha_hora

