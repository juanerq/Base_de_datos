/*leslie*/
create schema biblioteca;
use biblioteca;

create table libros(
idlibro int primary key not null auto_increment,
titulo char(150),
autor int(11),
genero char(3),
estado char (1),
paginas int,
editorial char(3),
precio float
);
 
create table autores(
idautor int(11) primary key not null auto_increment,
nombre char(100),
pais_autor char(3)
);

create table generos(
codigo char(3) primary key not null,
nombre char(50)
 );
 
 create table editoriales (
 codigo char(3) primary key not null,
 nombre char(50)
 );
/* 
alter table libros add foreign key FK_autor_libros (autor)
 references autores (idautor);
alter table libros add foreign key FK_genero_libros (genero)
 references generos (codigo);
 alter table libros add foreign key FK_editorial_libros (editorial)
 references editoriales (codigo);
*/
alter table libros add foreign key FK_autor_libros (autor)
 references autores (idautor),
add foreign key FK_genero_libros (genero)
 references generos (codigo),
 add foreign key FK_editorial_libros (editorial)
 references editoriales (codigo);



 create table usuarios(
 idusuario int primary key not null auto_increment,
 nombres char(80),
 email varchar(100),
 password varchar(100),
 estado char(1)
 );
 
 create table prestamos (
 idprestamo int primary key not null auto_increment,
 fecha datetime,
 fecha_entrega date,
 libro int,
 usuario int(11),
 estado tinyint,  /*1=Activo, 2=Cerrado, 3=cancelado*/
 fecha_recibido datetime
 );
 
 alter table prestamos add foreign key FK_libro_prestamos (libro)
 references libros (idlibro),
 add foreign key FK_usuario_prestamos (usuario)
 references usuarios (idusuario);
 
 
 /*comandos Drop*/
 /* los comandos DROP se utilizan para ELIMINAR
 algo de la estructura de la base de datos*/
 /*UTILIZAR CON MUCHA PRUDENCIA*/
 
 CREATE SCHEMA PRUEBA;
 use prueba;
 create table ejemplo
 (id int primary key,
  nombre char(20)
  );
 
 /*eliminar una tabla*/
 drop table ejemplo;
 /*eliminar una base de datos*/
 DROP DATABASE PRUEBA;
 
 /*Si un libro puede ser escrito por varios autores, 
 ¿qué modificaciones habría que hacerle al diseño 
 de la base de datos?*/

 /*Paso 1. eliminar relaciones en una base de datos*/
  alter table libros drop foreign key `FK_autores_libros`;
/* Paso 2. eliminar un campo de una tabla*/
alter table libros drop column autor;

/*Paso 3. crear tabla puente*/
Create table libros_autores
(idregistro int primary key not null auto_increment,
 idlibro int,
 idautor int,
 foreign key FK_idlibro_Libros_autores (idlibro)
 references libros(idlibro),
 foreign key FK_idautor_Libros_autores (idautor)
 references autores(idautor)
 );
 
/*agregar un campo en una tabla de la base de datos*/
alter table autores add column pais int;

create table paises
( idpais int primary key not null auto_increment,
  nombre char(50)
);

alter table autores add foreign key (pais)
references paises(idpais);
  

 
 create table pais_autor (
 codigo char(3) primary key not null,
 nombre char(50)
 );
 alter table autores add foreign key FK_pais_autores (pais_autor)
 references pais_autor (codigo);
 