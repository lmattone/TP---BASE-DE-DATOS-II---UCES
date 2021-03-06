CREATE DATABASE BBDD3;

USE  BBDD3;

CREATE TABLE participante
(
id int auto_increment,
nombre varchar (50) not null,
apellido varchar (50) not null,
id_rol int,
constraint primary key (id)
);

CREATE TABLE rol(
id int,
descripcion varchar(150) not null,
constraint primary key(id)
);


CREATE TABLE proyecto(
id int auto_increment,
nombre varchar (50) not null,
costo_proyecto decimal (10,2),
costo_hora decimal (6,2),
pack_horas decimal(12,2)
constraint primary key (id)
);

CREATE TABLE horas_asignadas(
id_horas_asignadas int auto_increment,
id_proyecto int,
id_participante int,
horas_asignadas_proyecto decimal not null,
constraint primary key (id_horas_asignadas)
);

CREATE TABLE carga_horas(
id_carga_horas int auto_increment,
dia date,
hora decimal (5,2),
id_proyecto int,
id_participante int,
constraint primary key (id_carga_horas)
);

CREATE TABLE cliente(
id int auto_increment,
id_proyecto int,
constraint primary key (id)
);

CREATE TABLE facturacion(
id int auto_increment,
id_cliente int not null,
monto_factura decimal(10,2),
constraint primary key(id)
);

/*INSERT ROLES*/
INSERT INTO rol(id,descripcion) VALUES (1, 'Desarrollador');
INSERT INTO rol(id,descripcion)VALUES (2, 'Tester');
INSERT INTO rol(id,descripcion)VALUES (3, 'Administrador');
INSERT INTO rol(id,descripcion)VALUES(4, 'Devop');
INSERT INTO rol(id,descripcion)VALUES(5, 'Project Manager');

/*INSERT PARTICIPANTE*/
INSERT INTO participante(id, nombre, apellido, id_rol) VALUES(1, 'Leandro', 'Sanchez', 1);
INSERT INTO participante(id, nombre, apellido, id_rol)VALUES(2, 'Sandra', 'Martinez', 1);
INSERT INTO participante(id, nombre, apellido, id_rol)VALUES(3, 'José', 'Perez', 2);
INSERT INTO participante(id, nombre, apellido, id_rol)VALUES(4, 'Jesica', 'Gonzalez', 3);
INSERT INTO participante(id, nombre, apellido, id_rol)VALUES(5, 'María', 'Cosi', 3);
INSERT INTO participante(id, nombre, apellido, id_rol)VALUES(6, 'María', 'Matienzo', 4);
INSERT INTO participante(id, nombre, apellido, id_rol)VALUES(7, 'Sofia', 'Caras', 5);
                
/*INSERT PROYECTO*/
INSERT INTO proyecto(nombre, costo_proyecto, costo_hora, pack_horas)VALUES('La Libreria', 25000, 125, 200 );
INSERT INTO proyecto(nombre, costo_proyecto, costo_hora, pack_horas)VALUES('Consorcio San Martin 432', 55000, 220, 250 );
INSERT INTO proyecto(nombre, costo_proyecto, costo_hora, pack_horas)VALUES('Hotel Las Brisas', 150000, 428.57, 350 );

                    
/*INSERT HORAS ASIGNADAS*//*proyecto 1*/
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)VALUES(1, 1, 60.00);
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)VALUES(1, 2, 60.00);
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)VALUES(1, 3, 30.00);
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)VALUES(1, 4, 40.00);
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)VALUES(1, 7, 10.00);



SELECT * FROM PARTICIPANTE;
SELECT * FROM rol;
SELECT * FROM proyecto;
SELECT * FROM horas_asignadas;
SELECT * FROM carga_horas;

SHOW TABLES;

SELECT p.nombre, p.apellido, SUM(ch.hora),ha.horas_asignadas_proyecto, pr.nombre FROM participante p 
INNER JOIN carga_horas ch ON p.id=ch.id_participante
INNER JOIN proyecto pr ON pr.id=ch.id_proyecto
INNER JOIN horas_asignadas ha ON p.id=ha.id_participante
WHERE p.nombre='Maria' GROUP BY p.nombre,p.apellido, ha.horas_asignadas_proyecto, pr.nombre;



CREATE INDEX idx_nombre ON participante(nombre);
drop INDEX idx_nombre ON participante;

/*PREGUNTA 4 - Implementar el esquema creado en el TP hecho para el primer parcial. 
 Si no tiene datos, insertar datos y generar una consulta que involucre tres tablas, 
 involucrando juntas entre ellas, condiciones y opcionalmente agregaciones. Una vez realizada:
 Obtener el plan de ejecución y explicarlo
 Proponer un cambio sobre la consulta y/o las estructuras, para que haya impacto sobre el plan de ejecución*/


DESCRIBE
SELECT p.nombre, p.apellido, SUM(ch.hora) AS Horas_cargadas,ha.horas_asignadas_proyecto, pr.nombre FROM participante p 
INNER JOIN carga_horas ch ON p.id=ch.id_participante
INNER JOIN proyecto pr ON pr.id=ch.id_proyecto
INNER JOIN horas_asignadas ha ON p.id=ha.id_participante
WHERE pr.nombre='La Libreria' GROUP BY p.nombre,p.apellido, ha.horas_asignadas_proyecto, pr.nombre;

DESCRIBE
SELECT p.nombre, p.apellido, SUM(ch.hora) AS Horas_cargadas,ha.horas_asignadas_proyecto, pr.nombre FROM participante p 
INNER JOIN carga_horas ch ON p.id=ch.id_participante
INNER JOIN proyecto pr ON pr.id=ch.id_proyecto
INNER JOIN horas_asignadas ha ON p.id=ha.id_participante
WHERE p.nombre='Maria' GROUP BY p.nombre,p.apellido, ha.horas_asignadas_proyecto, pr.nombre;

CREATE INDEX idx_nombre ON proyecto(nombre);
drop INDEX idx_nombre ON proyecto;
describe participante;
 
