CREATE DATABASE db_proyecto;
USE db_proyecto;

-- CREACIÓN TABLAS /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE tbl_telef_alumno(
    id_telefono int(7) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    numero char (9),
    matricula int(7) NULL
);

CREATE TABLE tbl_alumno(
    matricula int(7) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dni_alumno char(9) NULL,
    nombre_alumno varchar(18) NULL,
    apellido1 varchar(30) NULL,
    apellido2 varchar(30) NULL,
    fecha_nacimiento date NULL,
    correo varchar(50) NULL,
    contrasena varchar(15) NULL,
    foto varchar(254) NULL,
    userType ENUM('alumno')
);

CREATE TABLE tbl_alumno_assignatura(
    id_alumno_assignatura int(7) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_alumno int(7) NULL,
    id_assignatura int(7) NULL
);

CREATE TABLE tbl_assignatura(
    id_assignatura int(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre_assignatura varchar(70) NULL,
    id_ciclo int(3)
);

CREATE TABLE tbl_assignatura_clase(
    id_assignatura_clase int(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_assignatura int(7) NULL,
    id_clase int(7) NULL
);

CREATE TABLE tbl_assignatura_educador(
    id_assignatura_educador int(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_assignatura int(4) NULL,
    id_educador int(5) NULL
);

CREATE TABLE tbl_educador(
    id_educador int(4)  NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dni_educador char(9) NULL,
    nombre_educador varchar(18) NULL,
    apellido varchar(25) NULL,
    fecha_nacimiento date NULL,
    correo_educador varchar(50) NULL,
    contrasena varchar(15) NULL,
    telefono char(9) NULL,
    deptno int(3) NULL,
    foto varchar(254) NULL,
    userType ENUM('profesor','administrador')
);

CREATE TABLE tbl_deptno(
    id_deptno int(3) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre_deptno varchar(30) NULL
);

CREATE TABLE tbl_ciclo(
    id_ciclo int(3) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre_ciclo varchar(25) NULL
);

CREATE TABLE tbl_clase(
    id_clase int(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre_clase varchar(30) NULL
);

CREATE TABLE tbl_uf(
    id_uf int(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(70) NULL,
    id_assignatura int(3) NULL
);

CREATE TABLE tbl_curso(
    id_curso int(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre_curso varchar(5) NULL,
    id_ciclo int(4)
);

-- CREATE TABLE tbl_educador_clase(
--     id_educador_clase int(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
--     id_educador int(4),
--     id_clase int(4)
-- );

-- CREATE TABLE tbl_ciclo_clase(
--     id_ciclo_clase int(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
--     id_ciclo int(4) NULL,
--     id_clase int(4) NULL
-- );
-- CREATE TABLE tbl_assignatura_aula(
--     id_assignatura_aula int(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
--     id_assignatura int(4) NULL,
--     id_aula int(3) NULL
-- );

-- CREATE TABLE tbl_aula(
--     id_aula int(3) NOT NULL PRIMARY KEY AUTO_INCREMENT,
--     nombre_aula varchar(3) NULL
-- );
-- ALTER TABLES ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ALTER TABLE tbl_telef_alumno
ADD CONSTRAINT id_telef_alu
FOREIGN KEY (matricula)
REFERENCES tbl_alumno(matricula);

ALTER TABLE tbl_alumno_assignatura
ADD CONSTRAINT id_alu_assignatura
FOREIGN KEY (id_alumno)
REFERENCES tbl_alumno(matricula);

ALTER TABLE tbl_alumno_assignatura
ADD CONSTRAINT id_alumno_assignatura
FOREIGN KEY (id_assignatura)
REFERENCES tbl_assignatura(id_assignatura);

ALTER TABLE tbl_assignatura_educador
ADD CONSTRAINT id_assignatura_edu
FOREIGN KEY (id_assignatura)
REFERENCES tbl_assignatura(id_assignatura);

ALTER TABLE tbl_assignatura_educador
ADD CONSTRAINT id_edu_assig
FOREIGN KEY (id_educador)
REFERENCES tbl_educador(id_educador);

ALTER TABLE tbl_assignatura_clase
ADD CONSTRAINT id_assignatura_clase
FOREIGN KEY (id_assignatura)
REFERENCES tbl_assignatura(id_assignatura);

ALTER TABLE tbl_assignatura_clase
ADD CONSTRAINT id_assig_clase
FOREIGN KEY (id_clase)
REFERENCES tbl_clase(id_clase);

ALTER TABLE tbl_curso
ADD CONSTRAINT id_curso
FOREIGN KEY (id_ciclo)
REFERENCES tbl_ciclo(id_ciclo);

ALTER TABLE tbl_uf
ADD CONSTRAINT id_uf
FOREIGN KEY (id_assignatura)
REFERENCES tbl_assignatura(id_assignatura);

ALTER TABLE tbl_educador
ADD CONSTRAINT id_deptno
FOREIGN KEY (deptno)
REFERENCES tbl_deptno(id_deptno);


-- ALTER TABLE tbl_ciclo
-- ADD CONSTRAINT id_ciclo
-- FOREIGN KEY (deptno)
-- REFERENCES tbl_deptno(id_deptno);

-- ALTER TABLE tbl_educador_clase
-- ADD CONSTRAINT id_edu_clase
-- FOREIGN KEY (id_educador)
-- REFERENCES tbl_educador(id_educador);

-- ALTER TABLE tbl_educador_clase
-- ADD CONSTRAINT id_edu_classe
-- FOREIGN KEY (id_clase)
-- REFERENCES tbl_clase(id_clase);

-- ALTER TABLE tbl_assignatura_aula
-- ADD CONSTRAINT id_assignatura_aula
-- FOREIGN KEY (id_assignatura)
-- REFERENCES tbl_assignatura(id_assignatura);

-- ALTER TABLE tbl_assignatura_aula
-- ADD CONSTRAINT id_aula_assignatura
-- FOREIGN KEY (id_aula)
-- REFERENCES tbl_aula(id_aula);

-- ALTER TABLE tbl_clase
-- ADD CONSTRAINT id_clase
-- FOREIGN KEY (id_clase)
-- REFERENCES tbl_ciclo(id_ciclo);

-- ALTER TABLE tbl_educador
-- ADD CONSTRAINT id_educ_clase
-- FOREIGN KEY (clase)
-- REFERENCES tbl_clase(id_clase);
-- INSERTS/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- tbl_alumno
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('34036710E','Guillem','Abad','González','24/05/07','gabad@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/GuillemAbad.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('44931606W','Eric','Alcazar','Contreras','07/01/01','ealcazar@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/EricAlcazar.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('01257139M','Joan','Becerril','Hermida','26/05/04','jbecerril@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/JoanBecerril.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('62968066T','Alberto','Bermejo','Núñez','27/05/04','abermejo@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/AlbertoBermejo.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('59399610V','Sergio','Callejas','Martos','28/05/04','scallejas@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/SergioCallejas.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('22223841E','Julio César','Carrillo','Rocha','29/05/04','jccarrillo@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/jpegHombre.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('25250096Y','Dylan','Castles','Cazalla','30/05/04','dcastles@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/DylanCastles.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('99580574G','Marc','Colomé','Cuenca','31/03/04','mcolome@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/MarcColome.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('05019450E','Daniel','Font','Capilla','01/01/04','dfont@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/DaniFont.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('34637619X','Rafael David','Garcia','Fernandez Del Rincon','02/02/04','rdgarcia@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/RafaelGarcia.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('14931926G','Oriol','Godoy','Morote','03/05/04','ogodoy@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/OriolGodoy.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('35047461S','Adrián','Herráez','Arenas','04/05/04','aherraez@escolapradells.com','qweQWE112','https://www.pradells.com/FOTOS/ASIX1/AdrianHerraez.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('29628295V','Oriol','Larrazabal','Teixidó','05/05/04','olarrazabal@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/OriolLarrazabal.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('63748740P','Iker','Luna','Cruz','11/11/04','iluna@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/IkerLuna.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('76978085Y','Luca','Lusuardi','Masip','07/08/04','llusuardi@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/LucaLusuardi.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('76289746B','Carla','Maldonado','Benedicto','08/08/03','cmaldonado@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/DefaultMujer.jpg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('86478089K','Jheferson','Mamani','Rojas','09/03/04','jmamani@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/DefaultHombre.jpg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('85291598P','Marc','Martínez','Méndez','10/09/04','mmartinez@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/MarcMartinez.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('43292132Z','Christian','Monrabal','Donis','11/09/04','cmonrabal@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/ChristianMonrabal.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('75672567Z','Pol Marc','Montero','Roca','12/12/04','pmmontro@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/PolMarcMontero.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('57815640B','Ivan','Moreno','Ruiz','13/10/04','imoreno@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/IvanMoreno.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('71221683K','Aina','Orozco','González','14/10/04','aorozco@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/AinaOrozco.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('Z2961384R','Mario','Palamari','15/01/03','mpalamari@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/MarioPalamari.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('57140796X','Erik','Peñas','Andrea','16/06/02','epenas@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/ErikPeñas.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('11374128F','Juan Carlos','Prado','García','17/06/04','jprado@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/JuanCarlos.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('96369574B','Sergi','Rafael','Sánchez','17/06/04','srafael@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/SergiRafael.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('Z1441443S','Manav Kumar','Sharma','18/06/04','mksharma@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/ManavKumar.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('04726785D','Francesc','Soto','Alfonso','19/05/04','fsoto@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/FrancescSoto.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('65217500B','Julia','Suarez','Dueso','20/07/02','jsuarez@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/DefaultMujer.jpg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('01743587A','Adrián','Vázquez','Pascuas','21/02/04','avazquez@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/AdrianVazquez.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('29344054X','Àlex','Ventura','Reynés','22/02/04','aventura@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/AlezVentura.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('Y9188927G','Ming','Zhou','23/02/04','mzhou@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/ASIX1/MingZhou.jpeg','alumno');

INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('12345678A','Iker','Amador','Moreno','18/06/06','iamador@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/IkerAmador.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('87654321B','Pablo','Collado','Molina','18/06/06','pcollado@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/PabloCollado.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('23456789C','Marc','García','Bardales','18/06/06','mgarcia@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/MarcGarcia.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('34567890D','Izan','Izquierdo','García','18/06/06','iizquierdo@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/IzanIzquierdo.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('45678901E','Brix','Marcus','Ruamero','18/06/05','mruamero@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/BrixMarcus.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('56789012F','Xavi','Martínez','Bou','18/06/06','xmartinez@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/XaviMartinez.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('67890123G','Víctor','Merino','Saceda','18/06/06','vmerino@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/VictorMerino.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('78901234H','Sergio','Martínez','Rivodigo','18/06/06','smartinez@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/SergioMartiniez.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('89012345I','Joel','Vicente','Conrado','18/06/06','jvicente@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/VictorMerino.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('90123456J','Wilson','Albarracín','18/06/06','walbarracin@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/JoelVicente.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('01234567K','Javier','Vazques','Baños','18/06/06','jvazques@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/JavierVazques.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('34567890L','Jorge','Alcade','Garcia','18/06/06','jalcade@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/JorgeAlcalde.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('67890123M','Pol','Garcia','Sagristà','18/06/05','pgarcia@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/PolGarcia.jpeg','alumno');

INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('Z6909677E','Wilson','Albarracín','24/05/01','walbarracin@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/WilsonAlbarracin.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('30327916R','Jorge','Alcade','García','08/03/03','jalcade@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/JorgeAlcalde.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('26683593M','Oriol','Casas','Tello','28/07/02','ocasas@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/OriolCasas.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('50710083M','Manel','García','Moreno','08/04/01','mgarcia@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/ManelGarcia.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('08995354P','Pol','García','Sagristà','12/12/02','pgarcia@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/PolGarcia.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('02475498P','Victor','García','Tirado','04/02/03',' vgarcia@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/VictorGarcia.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('48177372P','Sergio','León','Rodríguez','25/05/02','sleon@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/SergioLeon.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('X8711821L','Jinqan','Lin','31/03/03','jlin@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/JiqanLin.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('39190988T','Sergi','Marín','Ribes','01/01/03','smarin@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/SergiMarin.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('91734727D','Sergio','Martínez','Rivodigo','02/02/03','smartinez@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/SergioMartinez.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('93837194T','Marc','Ortiz','González','03/05/02','mortiz@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/MarcOrtiz.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('56015235T','Ian','Romero','Sanabria','04/05/01','iromero@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/IanRomero.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('98924113D','Hugo','Sánchez','Ruiz','05/05/02','hsanchez@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/HugoSanchez.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('04951391C','Javier','Vazquez','Baños','11/11/03','jvazquez@escolapradells.com','qweQWE123','https://www.pradells.com/FOTOS/SMX1/JavierVazquez.jpeg','alumno');
INSERT INTO tbl_alumno (dni_alumno,nombre_alumno,apellido1,apellido2,fecha_nacimiento,correo,contrasena,foto,userType) VALUES ('63972664G','Joel','Vicente','Conrado','07/08/02','jvicente@escolapradells.com','qweQWE133','https://www.pradells.com/FOTOS/SMX1/JoelVicente.jpeg','alumno');

-- tbl_deptno
INSERT INTO tbl_deptno (nombre_deptno) VALUES ('Informatica');
INSERT INTO tbl_deptno (nombre_deptno) VALUES ('Deportes');
INSERT INTO tbl_deptno (nombre_deptno) VALUES ('Bachillerato');
INSERT INTO tbl_deptno (nombre_deptno) VALUES ('Empresa y FOL');
INSERT INTO tbl_deptno (nombre_deptno) VALUES ('Administración y finanzas');
INSERT INTO tbl_deptno (nombre_deptno) VALUES ('Administrador');

-- tbl_educador
INSERT INTO tbl_educador(dni_educador,nombre_educador,apellido,fecha_nacimiento,correo_educador,contrasena,telefono,deptno,foto,userType) VALUES ('03666596M','Gerard','Orobitg','76/05/24','gerard.orobitg@escolapradells.com','asdASD123','615718087',1,'https://www.pradells.com/FOTOS/PROFESSORES/GerardOrobitg.jpeg','profesor');
INSERT INTO tbl_educador(dni_educador,nombre_educador,apellido,fecha_nacimiento,correo_educador,contrasena,telefono,deptno,foto,userType) VALUES ('47972054B','Sergio','Jimenez','80/01/07','sergio.jimenez@escolapradells.com','asdASD123','661320815',1,'https://www.pradells.com/FOTOS/DefaultHombre.jpg','profesor');
INSERT INTO tbl_educador(dni_educador,nombre_educador,apellido,fecha_nacimiento,correo_educador,contrasena,telefono,deptno,foto,userType) VALUES ('20502723V','Nuria','Garres','84/05/26','nuria.garres@escolapradells.com','asdASD123','603227828',1,'https://www.pradells.com/FOTOS/PROFESSORES/NuriaGarres.jpeg','profesor');
INSERT INTO tbl_educador(dni_educador,nombre_educador,apellido,fecha_nacimiento,correo_educador,contrasena,telefono,deptno,foto,userType) VALUES ('72588423D','Agnes','Plans','74/05/27','agnes.plans@escolapradells.com','asdASD123','625256582',1,'https://www.pradells.com/FOTOS/PROFESSORES/AgnesPlans.jpeg','profesor');
INSERT INTO tbl_educador(dni_educador,nombre_educador,apellido,fecha_nacimiento,correo_educador,contrasena,telefono,deptno,foto,userType) VALUES ('27067867H','Miguel','Delgado','82/05/28','miguel.delgado@escolapradells.com','asdASD123','686970437',4,'https://www.pradells.com/FOTOS/PROFESSORES/MiguelDelgado.jpeg','profesor');
INSERT INTO tbl_educador(dni_educador,nombre_educador,apellido,fecha_nacimiento,correo_educador,contrasena,telefono,deptno,foto,userType) VALUES ('17788984W','Alberto','de Santos','70/05/29','alberto.desantos@escolapradells.com','asdASD123','649504715',1,'https://www.pradells.com/FOTOS/PROFESSORES/AlbertoDeSantos.jpeg','profesor');
INSERT INTO tbl_educador(dni_educador,nombre_educador,apellido,fecha_nacimiento,correo_educador,contrasena,telefono,deptno,foto,userType) VALUES ('76069808E','Ignasi','Romero','76/05/30','ignasi.romero@escolapradells.com','asdASD123','600830846',1,'https://www.pradells.com/FOTOS/PROFESSORES/IgnasiRomero.jpeg','profesor');
INSERT INTO tbl_educador(dni_educador,nombre_educador,apellido,fecha_nacimiento,correo_educador,contrasena,telefono,deptno,foto,userType) VALUES ('76069808E','Pedro','Blanco','77/05/20','pedro.blanco@escolapradells.com','asdASD123','600830842',1,'https://www.pradells.com/FOTOS/PedroBlanco.jpg','profesor');
INSERT INTO tbl_educador(dni_educador,nombre_educador,apellido,fecha_nacimiento,correo_educador,contrasena,telefono,deptno,foto,userType) VALUES ('84611834D','Sergio','Velasco','76/05/30','sergio.velasco@escolapradells.com','asdASD123','600830846',1,'https://www.pradells.com/FOTOS/SergioVelasco.jpg','profesor');
INSERT INTO tbl_educador(dni_educador,nombre_educador,apellido,fecha_nacimiento,correo_educador,contrasena,telefono,deptno,foto,userType) VALUES ('36312830Q','Fatima','Martinez','90/05/30','fatima.martinez@escolapradells.com','asdASD123','610810456',1,'https://www.pradells.com/FOTOS/PROFESSORES/FatimaMartinez.jpeg','profesor');
INSERT INTO tbl_educador(dni_educador,nombre_educador,apellido,fecha_nacimiento,correo_educador,contrasena,telefono,deptno,foto,userType) VALUES ('45639370X','Olga','Fernandez','73/05/30','olga.fernandez@escolapradells.com','asdASD123','603830376',5,'https://www.pradells.com/FOTOS/PROFESSORES/OlgaFernandez.jpeg','profesor');
INSERT INTO tbl_educador(dni_educador,nombre_educador,apellido,fecha_nacimiento,correo_educador,contrasena,telefono,deptno,foto,userType) VALUES ('79763595D','Richard','Owens','70/02/21','richard.owens@escolapradells.com','asdASD123','64530377',6,'https://www.pradells.com/FOTOS/PROFESSORES/DefaultHombre.jpeg','administrador');
-- tbl_assignatura
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Muntatge i manteniment dequips',1);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Sistemes operatius monolloc',1);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Aplicacions ofimàtiques',1);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Sistemes operatius en xarxa',1);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Xarxes locals',1);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Seguretat informàtica',1);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Serveis de xarxa',1);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Aplicacions web',1);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Formació i orientació laboral',1);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Empresa i iniciativa emprenedora',1);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Anglès',1);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Síntesi',1);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('FCT',1);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('FCT',2);

INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Implantació de sistemes operatius',2);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Gestió de bases de dades',2);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Programació bàsica',2);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Llenguatges de marques i sistemes de gestió informació',2);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Fonaments de maquinari',2);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Administració de sistemes operatius',2);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Planificació i administració de xarxes',2);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Serveis de xarxa e Internet',2);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Implantació aplicacions web',2);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Administració de sistemes gestors de bases de dades',2);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Seguretat i alta disponibilitat',2);
INSERT INTO tbl_assignatura (nombre_assignatura,id_ciclo) VALUES ('Projecte administració de sistemes informàtics en xarxa',2);

-- tbl_assignatura_educador
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (1,2);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (1,6);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (1,15);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (1,21);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (1,23);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (2,14);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (2,16);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (2,24);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (3,3);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (3,5);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (3,14);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (3,20);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (4,15);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (4,23);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (5,9);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (5,10);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (6,4);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (6,17);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (7,8);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (7,16);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (7,22);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (8,7);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (8,13);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (8,1);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (9,5);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (9,14);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (10,16);
INSERT INTO tbl_assignatura_educador(id_educador,id_assignatura) VALUES (11,13);

-- tbl_telef_alumno
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('692716265',1);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('674508955',2);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('758012600',3);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('666396332',4);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('652878377',5);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('638788732',6);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('695938300',7);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('669916987',8);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('660466143',9);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('676030270',10);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('679931365',11);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('683832454',12);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('687733546',13);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('691634638',14);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('695535730',15);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('699436822',16);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('703337914',17);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('707239006',18);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('711140098',19);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('715041190',20);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('652118314',21);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('617190519',22);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('630357842',23);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('656824386',24);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('686433076',25);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('652118314',26);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('652118314',27);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('652348623',28);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('610511755',29);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('633421234',30);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('610218207',31);
INSERT INTO tbl_telef_alumno(numero,matricula) VALUES ('610218202',32);

-- tbl_ciclo
INSERT INTO tbl_ciclo (nombre_ciclo) VALUES ('SMX') ;
INSERT INTO tbl_ciclo (nombre_ciclo) VALUES ('ASIX');
INSERT INTO tbl_ciclo (nombre_ciclo) VALUES ('EAS') ;
INSERT INTO tbl_ciclo (nombre_ciclo) VALUES ('DAW') ;
INSERT INTO tbl_ciclo (nombre_ciclo) VALUES ('BTEC') ;
INSERT INTO tbl_ciclo (nombre_ciclo) VALUES ('BSOC') ;

-- tbl_curso
INSERT INTO tbl_curso (nombre_curso,id_ciclo) VALUES ('SMX1',1);
INSERT INTO tbl_curso (nombre_curso,id_ciclo) VALUES ('SMX2',1);
INSERT INTO tbl_curso (nombre_curso,id_ciclo) VALUES ('ASIX1',2);
INSERT INTO tbl_curso (nombre_curso,id_ciclo) VALUES ('ASIX2',2);
INSERT INTO tbl_curso (nombre_curso,id_ciclo) VALUES ('EAS1',3);
INSERT INTO tbl_curso (nombre_curso,id_ciclo) VALUES ('EAS2',3);
INSERT INTO tbl_curso (nombre_curso,id_ciclo) VALUES ('DAW2',4);
INSERT INTO tbl_curso (nombre_curso,id_ciclo) VALUES ('BTEC',5);
INSERT INTO tbl_curso (nombre_curso,id_ciclo) VALUES ('BSOC',6);


-- smx 22
-- asix1 19 
-- asix2 21
-- tbl_clase
INSERT INTO tbl_clase(nombre_clase) VALUES('101');
INSERT INTO tbl_clase(nombre_clase) VALUES('102');
INSERT INTO tbl_clase(nombre_clase) VALUES('103');
INSERT INTO tbl_clase(nombre_clase) VALUES('104');
INSERT INTO tbl_clase(nombre_clase) VALUES('105');
INSERT INTO tbl_clase(nombre_clase) VALUES('106');
INSERT INTO tbl_clase(nombre_clase) VALUES('107');
INSERT INTO tbl_clase(nombre_clase) VALUES('108');
INSERT INTO tbl_clase(nombre_clase) VALUES('201');
INSERT INTO tbl_clase(nombre_clase) VALUES('202');
INSERT INTO tbl_clase(nombre_clase) VALUES('203');
INSERT INTO tbl_clase(nombre_clase) VALUES('204');
INSERT INTO tbl_clase(nombre_clase) VALUES('205');
INSERT INTO tbl_clase(nombre_clase) VALUES('206');
INSERT INTO tbl_clase(nombre_clase) VALUES('207');
INSERT INTO tbl_clase(nombre_clase) VALUES('208');
INSERT INTO tbl_clase(nombre_clase) VALUES('301');
INSERT INTO tbl_clase(nombre_clase) VALUES('302');
INSERT INTO tbl_clase(nombre_clase) VALUES('303');
INSERT INTO tbl_clase(nombre_clase) VALUES('304');
INSERT INTO tbl_clase(nombre_clase) VALUES('305');
INSERT INTO tbl_clase(nombre_clase) VALUES('306');
INSERT INTO tbl_clase(nombre_clase) VALUES('307');
INSERT INTO tbl_clase(nombre_clase) VALUES('308');
INSERT INTO tbl_clase(nombre_clase) VALUES('401');
INSERT INTO tbl_clase(nombre_clase) VALUES('402');
INSERT INTO tbl_clase(nombre_clase) VALUES('403');
INSERT INTO tbl_clase(nombre_clase) VALUES('404');
INSERT INTO tbl_clase(nombre_clase) VALUES('405');
INSERT INTO tbl_clase(nombre_clase) VALUES('406');

-- tbl_assignatura_clase
-- smx
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(1,22);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(2,22);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(3,22);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(4,22);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(5,22);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(6,22);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(7,22);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(8,22);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(9,22);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(10,22);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(11,22);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(12,22);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(13,22);
-- asix1
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(9,19);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(10,19);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(14,19);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(15,19);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(16,19);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(17,19);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(21,19);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(23,19);
-- asix2
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(13,21);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(14,21);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(15,21);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(18,21);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(19,21);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(20,21);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(21,21);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(22,21);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(24,21);
INSERT INTO tbl_assignatura_clase(id_assignatura,id_clase) VALUES(25,21);


-- tbl_ciclo_clase
-- INSERT INTO tbl_ciclo_clase(id_ciclo,id_clase) VALUES (1,23);
-- INSERT INTO tbl_ciclo_clase(id_ciclo,id_clase) VALUES (2,19);
-- INSERT INTO tbl_ciclo_clase(id_ciclo,id_clase) VALUES (2,22);
-- INSERT INTO tbl_ciclo_clase(id_ciclo,id_clase) VALUES (3,5);
-- INSERT INTO tbl_ciclo_clase(id_ciclo,id_clase) VALUES (4,19);
-- INSERT INTO tbl_ciclo_clase(id_ciclo,id_clase) VALUES (5,26);
-- INSERT INTO tbl_ciclo_clase(id_ciclo,id_clase) VALUES (6,27);

-- tbl_educador_clase
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (1,19);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (1,22);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (1,23);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (2,22);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (2,23);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (3,19);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (3,22);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (3,23);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (4,19);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (4,22);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (4,23);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (5,19);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (5,23);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (6,19);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (6,22);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (6,23);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (7,19);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (7,23);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (8,22);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (8,23);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (9,19);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (9,22);
-- INSERT INTO tbl_educador_clase(id_educador,id_clase) VALUES (10,19);

-- tbl_alumno_assignatura
-- alumnosASIX1
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (1,9);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (1,10);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (1,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (1,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (1,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (1,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (1,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (1,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (2,9);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (2,10);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (2,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (2,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (2,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (2,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (2,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (2,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (3,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (3,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (3,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (3,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (3,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (3,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (4,9);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (4,10);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (4,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (4,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (4,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (4,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (4,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (4,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (5,9);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (5,10);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (5,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (5,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (5,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (5,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (5,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (5,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (6,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (6,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (6,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (6,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (6,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (6,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (7,9);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (7,10);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (7,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (7,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (7,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (7,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (7,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (7,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (8,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (8,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (8,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (8,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (8,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (8,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (9,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (9,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (9,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (9,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (9,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (9,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (10,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (10,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (10,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (10,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (10,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (10,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (11,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (11,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (11,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (11,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (11,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (11,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (12,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (12,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (12,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (12,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (12,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (12,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (13,9);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (13,10);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (13,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (13,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (13,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (13,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (13,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (13,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (14,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (14,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (14,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (14,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (14,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (14,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (15,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (15,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (15,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (15,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (15,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (15,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (16,9);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (16,10);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (16,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (16,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (16,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (16,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (16,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (16,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (17,9);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (17,10);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (17,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (17,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (17,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (17,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (17,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (17,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (18,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (18,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (18,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (18,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (18,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (18,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (19,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (19,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (19,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (19,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (19,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (19,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (20,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (20,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (20,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (20,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (20,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (20,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (21,9);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (21,10);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (21,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (21,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (21,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (21,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (21,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (21,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (22,9);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (22,10);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (22,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (22,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (22,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (22,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (22,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (22,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (23,9);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (23,10);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (23,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (23,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (23,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (23,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (23,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (23,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (24,9);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (24,10);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (24,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (24,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (24,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (24,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (24,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (24,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (25,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (25,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (25,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (25,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (25,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (25,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (26,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (26,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (26,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (26,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (26,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (26,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (27,9);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (27,10);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (27,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (27,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (27,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (27,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (27,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (27,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (28,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (28,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (28,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (28,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (28,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (28,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (29,9);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (29,10);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (29,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (29,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (29,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (29,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (29,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (29,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (30,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (30,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (30,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (30,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (30,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (30,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (31,9);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (31,10);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (31,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (31,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (31,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (31,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (31,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (31,23);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (32,9);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (32,10);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (32,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (32,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (32,16);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (32,17);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (32,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (32,23);
-- alumnosASIX2
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (33,13);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (33,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (33,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (33,18);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (33,19);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (33,20);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (33,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (33,22);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (33,24);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (33,25);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (34,13);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (34,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (34,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (34,18);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (34,19);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (34,20);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (34,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (34,22);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (34,24);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (34,25);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (35,13);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (35,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (35,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (35,18);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (35,19);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (35,20);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (35,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (35,22);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (35,24);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (35,25);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (36,13);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (36,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (36,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (36,18);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (36,19);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (36,20);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (36,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (36,22);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (36,24);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (36,25);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (37,13);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (37,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (37,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (37,18);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (37,19);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (37,20);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (37,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (37,22);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (37,24);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (37,25);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (38,13);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (38,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (38,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (38,18);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (38,19);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (38,20);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (38,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (38,22);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (38,24);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (38,25);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (39,13);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (39,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (39,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (39,18);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (39,19);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (39,20);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (39,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (39,22);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (39,24);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (39,25);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (40,13);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (40,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (40,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (40,18);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (40,19);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (40,20);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (40,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (40,22);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (40,24);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (40,25);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (41,13);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (41,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (41,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (41,18);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (41,19);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (41,20);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (41,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (41,22);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (41,24);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (41,25);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (42,13);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (42,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (42,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (42,18);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (42,19);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (42,20);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (42,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (42,22);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (42,24);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (42,25);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (43,13);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (43,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (43,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (43,18);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (43,19);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (43,20);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (43,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (43,22);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (43,24);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (43,25);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (44,13);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (44,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (44,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (44,18);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (44,19);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (44,20);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (44,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (44,22);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (44,24);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (44,25);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (45,13);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (45,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (45,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (45,18);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (45,19);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (45,20);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (45,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (45,22);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (45,24);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (45,25);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (46,13);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (46,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (46,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (46,18);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (46,19);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (46,20);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (46,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (46,22);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (46,24);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (46,25);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (47,13);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (47,14);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (47,15);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (47,18);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (47,19);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (47,20);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (47,21);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (47,22);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (47,24);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (47,25);
-- alumnosSMX2
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (48,4);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (48,4);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (48,6);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (48,7);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (48,8);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (48,11);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (48,12);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (48,13);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (49,4);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (49,6);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (49,7);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (49,8);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (49,11);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (49,12);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (49,13);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (50,4);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (50,6);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (50,7);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (50,8);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (50,11);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (50,12);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (50,13);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (51,4);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (51,6);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (51,7);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (51,8);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (51,11);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (51,12);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (51,13);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (52,4);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (52,6);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (52,7);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (52,8);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (52,11);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (52,12);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (52,13);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (53,4);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (53,6);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (53,7);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (53,8);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (53,11);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (53,12);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (53,13);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (54,4);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (54,6);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (54,7);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (54,8);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (54,11);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (54,12);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (54,13);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (55,4);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (55,6);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (55,7);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (55,8);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (55,11);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (55,12);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (55,13);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (56,4);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (56,6);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (56,7);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (56,8);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (56,11);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (56,12);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (56,13);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (57,4);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (57,6);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (57,7);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (57,8);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (57,11);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (57,12);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (57,13);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (58,4);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (58,6);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (58,7);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (58,8);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (58,11);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (58,12);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (58,13);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (59,4);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (59,6);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (59,7);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (59,8);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (59,11);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (59,12);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (59,13);

INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (60,4);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (60,6);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (60,7);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (60,8);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (60,11);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (60,12);
INSERT INTO tbl_alumno_assignatura (id_alumno,id_assignatura) VALUES (60,13);

-- tbl_uf
-- asix
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Instalacio,configuracio i explotacio del sistema informatic',14);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Gestió de la informació i de recursos en xarxa',14);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Implantació de programaci específic',14);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Seguretat,rendiment i recursos',14);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Introducció a les bases de dades',15);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Llenguatges SQL: DML i DDL',15);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Assegurament de la informació',15);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Programació estructurada',16);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Programació modular',16);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Fonaments de gestió de fitxers',16);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Programació amb XML',17);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Ambits aplicació de XML',17);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Sistemes de gestió informació empresarial',17);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Arquitectura de sistemes',18);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Instalació,configuració i recuperació de programari',18);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Implantació i manteniment de CPD',18);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Administració avançada de sistemes operatius',19);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Automatització de tasques i llenguatges de guions',19);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Introducció a les xarxes',20);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Administració de dispositius de xarxa',20);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Administració avançada de xarxes',20);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Serveis de noms i configuració automàtica (DNS i DHCP)',21);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Serveis Web i de transferència de fitxers',21);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Correu electrònic i missatgeria',21);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Serveis daudio i video',21);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Llenguatges de guions de servidor',22);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Implantació de gestors de continguts',22);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Llenguatges SQL: DCL i extensió procediment',23);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Seguretat física,lògica i legislació',24);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Seguretat activa i accés remot',24);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Tallafocs i servidors intermediaris',24);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Alta disponibilitat',24);
-- empresa y fol en smx
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Sintesi FreeEnterprise',25);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Sintesi Seguretat',25);
-- fcts=13

-- smx
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Electricitat a ordinador',1);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Components un equip microinformàtic',1);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Muntatge un equip microinformàtic',1);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Noves tendències de muntatge',1);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Manteniment equips microinformàtics',1);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Instalació de programari',1);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Introducció als sistemes operatius',2);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Sistemes operatius propietaris',2);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Sistemes operatius lliures',2);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Aplicacions ofimàtiques i atenció a usuari',3);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('El correu i agenda electrònica',3);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Processadors de text',3);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Fulls de càlcul',3);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Bases de dades',3);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Imatge i vídeo Presentacions',3);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Sistemes operatius propietaris en xarxa',4);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Sistemes operatius lliures en xarxa',4);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Compartició de recursos i seguretat',4);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Integració de sistemes operatius',4);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Introducció a les xarxes locals',5);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Configuració de commutadors i encaminadors',5);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Resolució incidències en xarxes locals',5);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Seguretat passiva.',6);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Còpies de seguretat',6);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Legislació de seguretat i protecció de dades',6);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Seguretat activa.',6);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Tallafocs i monitoratge de xarxes',6);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Configuració de la xarxa (DNS i DHCP)',7);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Correu electrònic i transmissió arxius',7);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Servidor web i proxy',7);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Accés a sistemes remots',7);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Ofimàtica i eines web',8);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Gestors arxius web',8);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Gestors de continguts',8);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Portals web aprenentatge',8);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Fonaments HTML i fulls estil',8);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Incorporació al treball',9);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Prevenció de riscos laborals',9);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Empresa i iniciativa emprenedora',10);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Anglès',11);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Síntesi Web',12);
INSERT INTO tbl_uf(nombre,id_assignatura) VALUES ('Sintesi',12);
-- fcts = 13



-- -- tbl_assignatura_aula
-- INSERT INTO tbl_assignatura_aula (id_aula,id_assignatura) VALUES (17,1);
-- INSERT INTO tbl_assignatura_aula (id_aula,id_assignatura) VALUES (17,2);
-- INSERT INTO tbl_assignatura_aula (id_aula,id_assignatura) VALUES (17,3);
-- INSERT INTO tbl_assignatura_aula (id_aula,id_assignatura) VALUES (17,4);
-- INSERT INTO tbl_assignatura_aula (id_aula,id_assignatura) VALUES (17,5);
-- INSERT INTO tbl_assignatura_aula (id_aula,id_assignatura) VALUES (17,6);
-- INSERT INTO tbl_assignatura_aula (id_aula,id_assignatura) VALUES (17,7);
-- INSERT INTO tbl_assignatura_aula (id_aula,id_assignatura) VALUES (17,8);
-- INSERT INTO tbl_assignatura_aula (id_aula,id_assignatura) VALUES (19,1);
-- INSERT INTO tbl_assignatura_aula (id_aula,id_assignatura) VALUES (19,6);
-- INSERT INTO tbl_assignatura_aula (id_aula,id_assignatura) VALUES (19,7);
-- INSERT INTO tbl_assignatura_aula (id_aula,id_assignatura) VALUES (23,1);
-- INSERT INTO tbl_assignatura_aula (id_aula,id_assignatura) VALUES (23,2);
-- INSERT INTO tbl_assignatura_aula (id_aula,id_assignatura) VALUES (23,3);
-- INSERT INTO tbl_assignatura_aula (id_aula,id_assignatura) VALUES (23,4);
-- INSERT INTO tbl_assignatura_aula (id_aula,id_assignatura) VALUES (23,5);
-- INSERT INTO tbl_assignatura_aula (id_aula,id_assignatura) VALUES (23,6);
-- INSERT INTO tbl_assignatura_aula (id_aula,id_assignatura) VALUES (23,7);
-- INSERT INTO tbl_assignatura_aula (id_aula,id_assignatura) VALUES (23,8);