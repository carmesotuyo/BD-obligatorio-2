--Datos de CATEGORIA
insert into CATEGORIA values (01, 'Fortnite');
insert into CATEGORIA values (02, 'LoL');
insert into CATEGORIA values (03, 'Dota 2');
insert into CATEGORIA values (04, 'Musica');

--Datos de USUARIO
insert into USUARIO values ('carmesotuyo@hotmail.com', 'Carmela', 'carmesotuyo', DATE '1995-12-27');
insert into USUARIO values ('pepito@hotmail.com', 'Pepito', 'pepito22', DATE '1997-04-18');
insert into USUARIO values ('juanita@hotmail.com', 'Juanita', 'juanita22', DATE '2000-09-03');
insert into USUARIO values ('maria@hotmail.com', 'Maria', 'maria22', DATE '1990-10-12');
insert into USUARIO values ('pedro@hotmail.com', 'Pedro', 'pedro22', DATE '1994-11-06');
insert into USUARIO values ('ali@hotmail.com', 'Ali', 'ali', DATE '1999-07-14');
insert into USUARIO values ('julio@hotmail.com', 'Julio', 'julio', DATE '1960-05-23');
insert into USUARIO values ('rosita@hotmail.com', 'Rosita', 'rosita', DATE '1950-02-17');
insert into USUARIO values ('fulano@hotmail.com', 'Fulano', 'fulano', DATE '2008-09-24');

--Datos de CONTENIDO
insert into CONTENIDO values ('01', 'Titulo1', DATE '2022-05-01', 'carmesotuyo@hotmail.com', 01, 'PRIVADO');
insert into CONTENIDO values ('02', 'Titulo2', DATE '2021-05-01', 'carmesotuyo@hotmail.com', 01, 'PRIVADO');
insert into CONTENIDO values ('03', 'Titulo3', DATE '2022-05-01', 'pepito@hotmail.com', 04, 'PUBLICO');
insert into CONTENIDO values ('04', 'Titulo4', DATE '2022-05-31', 'pepito@hotmail.com', 01, 'PRIVADO');
insert into CONTENIDO values ('05', 'Titulo5', DATE '2022-05-31', 'juanita@hotmail.com', 04, 'PUBLICO');
insert into CONTENIDO values ('06', 'Titulo6', DATE '2022-06-05', 'juanita@hotmail.com', 01, 'PRIVADO');
insert into CONTENIDO values ('07', 'Titulo7', DATE '2021-05-31', 'maria@hotmail.com', 04, 'PUBLICO');
insert into CONTENIDO values ('08', 'Titulo8', DATE '2021-08-05', 'maria@hotmail.com', 04, 'PRIVADO');
insert into CONTENIDO values ('09', 'Titulo9', DATE '2021-08-05', 'pepito@hotmail.com', 04, 'PRIVADO');
insert into CONTENIDO values ('10', 'Titulo10', DATE '2020-05-31', 'juanita@hotmail.com', 02, 'PUBLICO');
insert into CONTENIDO values ('11', 'Titulo11', DATE '2019-08-05', 'maria@hotmail.com', 02, 'PRIVADO');
insert into CONTENIDO values ('12', 'Titulo12', DATE '2020-05-31', 'pepito@hotmail.com', 02, 'PUBLICO');
insert into CONTENIDO values ('13', 'Titulo13', DATE '2022-06-05', 'maria@hotmail.com', 02, 'PUBLICO');
insert into CONTENIDO values ('14', 'Titulo14', DATE '2019-08-05', 'pepito@hotmail.com', 03, 'PUBLICO');
insert into CONTENIDO values ('15', 'Titulo15', DATE '2019-08-06', 'pepito@hotmail.com', 01, 'PUBLICO');
insert into CONTENIDO values ('16', 'Titulo16', DATE '2019-04-05', 'fulano@hotmail.com', 01, 'PUBLICO');
insert into CONTENIDO values ('17', 'Titulo17', DATE '2019-04-06', 'fulano@hotmail.com', 02, 'PUBLICO');
insert into CONTENIDO values ('18', 'Titulo18', DATE '2019-04-07', 'fulano@hotmail.com', 03, 'PUBLICO');
insert into CONTENIDO values ('19', 'Titulo19', DATE '2019-04-08', 'fulano@hotmail.com', 04, 'PUBLICO');
insert into CONTENIDO values ('20', 'Titulo20', DATE '2019-04-08', 'juanita@hotmail.com', 03, 'PUBLICO');

--Datos de VISUALIZACION
insert into VISUALIZACION values ('09', 'maria@hotmail.com', DATE '2022-05-05');
insert into VISUALIZACION values ('08', 'juanita@hotmail.com', DATE '2021-05-05');
insert into VISUALIZACION values ('10', 'maria@hotmail.com', DATE '2021-03-05');
insert into VISUALIZACION values ('13', 'juanita@hotmail.com', DATE '2022-06-05');
insert into VISUALIZACION values ('13', 'pepito@hotmail.com', DATE '2022-03-05');
insert into VISUALIZACION values ('20', 'rosita@hotmail.com', DATE '2022-04-01');
insert into VISUALIZACION values ('20', 'rosita@hotmail.com', DATE '2022-04-30');
insert into VISUALIZACION values ('20', 'rosita@hotmail.com', DATE '2022-03-31');
insert into VISUALIZACION values ('20', 'rosita@hotmail.com', DATE '2022-05-01');
insert into VISUALIZACION values ('20', 'pepito@hotmail.com', DATE '2022-04-01');
insert into VISUALIZACION values ('20', 'pepito@hotmail.com', DATE '2022-04-30');

--Datos de DONACION
insert into DONACION values ('juanita@hotmail.com', 'pepito@hotmail.com', DATE '2022-03-05', DATE '2022-03-06', 100, 'PENDIENTE');
insert into DONACION values ('maria@hotmail.com', 'pepito@hotmail.com', DATE '2021-10-11', DATE '2021-10-12', 200, 'PENDIENTE');
insert into DONACION values ('pepito@hotmail.com', 'maria@hotmail.com', DATE '2021-10-11', DATE '2021-10-12', 200, 'APROBADA');
insert into DONACION values ('pepito@hotmail.com', 'maria@hotmail.com', DATE '2021-10-12', DATE '2021-10-13', 400, 'PENDIENTE');
insert into DONACION values ('maria@hotmail.com', 'juanita@hotmail.com', DATE '2020-10-11', DATE '2020-10-12', 200, 'PENDIENTE');
insert into DONACION values ('pepito@hotmail.com', 'juanita@hotmail.com', DATE '2020-10-11', DATE '2020-10-12', 300, 'PENDIENTE');
insert into DONACION values ('juanita@hotmail.com', 'maria@hotmail.com', DATE '2021-10-11', DATE '2021-10-12', 200, 'PENDIENTE');
insert into DONACION values ('pepito@hotmail.com', 'juanita@hotmail.com', DATE '2022-10-11', DATE '2022-10-12', 300, 'APROBADA');
insert into DONACION values ('julio@hotmail.com', 'juanita@hotmail.com', DATE '2020-10-11', DATE '2020-10-12', 400, 'APROBADA');
insert into DONACION values ('ali@hotmail.com', 'juanita@hotmail.com', DATE '2020-10-11', DATE '2020-10-12', 400, 'APROBADA');
insert into DONACION values ('pepito@hotmail.com', 'julio@hotmail.com', DATE '2019-10-11', DATE '2019-10-12', 200, 'PENDIENTE');
insert into DONACION values ('pepito@hotmail.com', 'ali@hotmail.com', DATE '2019-10-11', DATE '2019-10-12', 200, 'PENDIENTE');
insert into DONACION values ('ali@hotmail.com', 'julio@hotmail.com', DATE '2018-10-11', DATE '2018-10-12', 200, 'APROBADA');
