/*SQL*/
/*STRUCTURED QUERY LANGUAGE*/
/*tipos de comandos
  DDL = DATA DEFINITION LANGUAGE   (ESTRUCTURA)
  DML = DATA MANIPULATION LANGUAGE (DATOS) */
 
 /*COMANDOS DDL*/
 create schema citas_medicas;
 use citas_medicas;
 
 /*crear tablas*/
 /*sintaxis general
 create table nombre_tabla
 ( nombre_campo1 tipo_dedato caracteristicas-->opcionales,
   nombre_campo2 tipo_dedato caracteristicas-->opcionales,
   nombre_campo3 tipo_dedato caracteristicas-->opcionales,
   ....,
   nombre_campon tipo_dedato caracteristicas-->opcionales
);  */

create table especialidades
( codigo char(3) primary key not null,
  nombre char(60),
  nivel tinyint
);

create table medicos
( idmedico int primary key not null auto_increment,
  documento char(15),
  regmedico char(20),
  nombres char(40),
  apellidos char(40),
  direccion varchar(100),
  telefono char(30),
  especialidad char(3),
  firma varchar(100),
  foreign key FK_especialidad_medicos (especialidad) 
  references especialidades(codigo)
  );
 
create table servicios
( codigo char(10) primary key not null,
  nombre varchar(300),
  estado tinyint
);

create table manuales
( codigo char(2) primary key not null,
  nombre char(50),
  base float,
  anno float
);

create table tarifas
( idregistro int primary key not null auto_increment,
  codmanual char(2),
  codservicio char(10),
  valor float
);

/*comando para alterar la estructura de las tablas
 DESPUÈS de haberlas creado*/
 /* alter table nombre_tabla tipo_operacion accion*/
 /* tipo de operacion
     add   -- agregar campos, indices, FK, etc
     modify -- modificar algo en la estructura
     change -- cambiar el nombre de los atributos
     drop   -- eliminar algo de la estructura
*/
alter table tarifas add foreign key FK_codmanual_tarifas
(codmanual) references manuales(codigo),
add foreign key FK_codservicio_tarifas (codservicio) 
references servicios(codigo);

create table eps
( codigo char(6) primary key not null,
  nombre char(80),
  direccion varchar(100),
  telefono char(30),
  contacto varchar(50),
  tipoentidad char(10),
  manual char(2)
  );

alter table eps add foreign key FK_manual_eps (manual)
references manuales(codigo);
