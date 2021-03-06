/*INSERCION DE DATOS*/

/*INSERT ROLES*/
INSERT INTO rol(id,descripcion) VALUES (1,'Desarrollador');
INSERT INTO rol(id,descripcion)  VALUES (2,'Tester');
INSERT INTO rol(id,descripcion)  VALUES (3,'Administrador');
INSERT INTO rol(id,descripcion)  VALUES (4,'Devop');
INSERT INTO rol(id,descripcion)  VALUES (5,'Project Manager');


/*INSERT PARTICIPANTE*/
INSERT INTO participante (id, nombre, apellido, id_rol) VALUES (1, 'Leandro', 'Sanchez',1);
INSERT INTO participante (id, nombre, apellido, id_rol) VALUES (2, 'Sandra', 'Martinez',1);
INSERT INTO participante (id, nombre, apellido, id_rol) VALUES (3, 'José', 'Perez',2);
INSERT INTO participante (id, nombre, apellido, id_rol) VALUES (4, 'Jesica', 'Gonzalez',3);
INSERT INTO participante (id, nombre, apellido, id_rol) VALUES (5, 'María', 'Cosi',3);
INSERT INTO participante (id, nombre, apellido, id_rol) VALUES (6, 'María', 'Matienzo',4);
INSERT INTO participante (id, nombre, apellido, id_rol) VALUES (7, 'Sofia', 'Caras',5);


/*INSERT PROYECTO*/
INSERT INTO proyecto (nombre, costo_proyecto, costo_hora, pack_horas) VALUES ('La Libreria', 25000, 125, 200 );
INSERT INTO proyecto (nombre, costo_proyecto, costo_hora, pack_horas) VALUES ('Consorcio San Martin 432', 55000, 220, 250 );
INSERT INTO proyecto (nombre, costo_proyecto, costo_hora, pack_horas) VALUES ('Hotel Las Brisas', 150000, 428.57, 350 );



/*INSERT HORAS ASIGNADAS*/
/*proyecto 1*/
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)
VALUES
(1,1,60.00);
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)
VALUES
(1,2,60.00);
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)
VALUES
(1,3,30.00);
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)
VALUES
(1,4,40.00);
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)
VALUES
(1,7,10.00);
/*INFORMACION PARA EL SEGUNDO PARCIAL*/
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)
VALUES
(2,3,60.00);
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)
VALUES
(2,4,80.00);
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)
VALUES
(3,5,40.00);
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)
VALUES
(3,6,50.00);
INSERT INTO horas_asignadas(id_proyecto,id_participante, horas_asignadas_proyecto)
VALUES
(3,7,10.00);
SELECT * FROM horas_asignadas;

/*prueba carga horas*/
call RendicionHoras
('20210921',5,8,1,1);
call RendicionHoras
('20210901',20,8,1,1);
/*Insercion de horas para el SEGUNDO PARCIAL*/
call RendicionHoras
('20210912',15,8,2,3);
call RendicionHoras
('20210920',10,9,2,4);
call RendicionHoras
('20211101',15,8,3,5);
call RendicionHoras
('20210912',12,8,3,6);
call RendicionHoras
('20210807',15,8,3,7);
call RendicionHoras
('20210807',15,8,1,5);
call RendicionHoras
('20210807',15,8,2,6);

/*prueba liquidaciòn mensual*/
call CalcularLiquidacionMensual
(5,1,1,09);
call CalcularLiquidacionMensual
(4,1,1,09);

/*prueba diferencia de horas*/
call CalcularDiferencia
(5,1,2021);







