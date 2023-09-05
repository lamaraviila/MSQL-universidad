create database db_universidad;
USE db_universidad;
create table departamento(
id_departamento int primary key not null,
nom_departamento varchar(50) not null
);
CREATE TABLE profesor(
id_profesor int primary key not null,
nif varchar(9) not null,
nombre varchar(25) not null,
apellido1 varchar(50) not null,
apellido2 varchar(50) not null,
ciudad varchar(25) not null,
dirección varchar(50) not null,
teléfono varchar(50) not null,
fecha_nacimiento date not null,
sexo enum('masculino', 'femenino') not null,
cod_departamento int not null,
foreign key(cod_departamento)references departamento(id_departamento)
);
CREATE TABLE grado(
id_grado int primary key not null,
nom_grado varchar(100) not null
);
CREATE TABLE asignatura(
id_asignatura int primary key not null,
nombre varchar(100) not null,
codigo varchar(20)not null,
creditos float,
curso int not null,
semestre int not null,
cod_profesor int not null,
cod_grado int not null,
foreign key(cod_profesor)references profesor(id_profesor),
foreign key(cod_grado)references grado(id_grado)
);
CREATE TABLE alumno(
id int primary key not null,
nif varchar(9) not null,
nombre varchar(25) not null,
apellido1 varchar(50) not null,
apellido2 varchar(50) not null,
ciudad varchar(25) not null,
dirección varchar(100) not null,
teléfono varchar(10) not null,
fecha_nacimiento date not null,
sexo enum('masculino','femenino')
);
CREATE TABLE curso_escolar(
id_escolar int primary key not null,
id_curso_escolar int not null,
año_escolar varchar(12) not null,
fecha_inicio date not null,
fecha_fin date not null
);
CREATE TABLE alumno_se_matricula_asignatura(
id_alumno int primary key not null,
cod_asignatura int not null,
cod_escolar int not null,
foreign key(cod_asignatura)references asignatura(id_asignatura),
foreign key(cod_escolar)references curso_escolar(id_escolar)  
);

select * from departamento;
insert into departamento(id_departamento, nom_departamento)values
(1, 'Quindio'),(2, 'Valle del Cauca'),(3, 'Caqueta'),(4, 'Meta'),(5, 'Antioquia');
select * from profesor;
insert into profesor(id_profesor, nombre, apellido1, apellido2, ciudad, dirección, teléfono, fecha_nacimiento, sexo, cod_departamento)values
(1, 'Juan', 'Pérez', 'Gómez', 'Armenia', 'Calle 150 #124-54', '1111111111', '1990-05-15', 'Masculino', 1),
(2, 'María', 'García', 'Rodríguez', 'Popayan', 'Carrera 200 #150-65', '2222222222', '1985-03-20', 'Femenino', 2),
(3, 'Luis', 'Martínez', 'Hernández', 'Cali', 'Avenida 135 #77-34', '3333333333', '1992-09-10', 'Masculino', 3),
(4, 'Ana', 'Fernández', 'López', 'Bogota','Calle 100 #90-85','4444444444', '1988-07-25', 'Femenino', 4),
(5, 'Carlos', 'Sánchez', 'Pérez', 'Manizales', 'Carrera 185 #25-64', '5555555555', '1991-11-05', 'Masculino', 5);
select * from grado;
insert into grado(id_grado, nom_grado)values
(1, 'Primer Grado'),
(2, 'Segundo Grado'),
(3, 'Tercer Grado'),
(4, 'Cuarto Grado'),
(5, 'Quinto Grado');
select * from asignatura; 
insert into asignatura(id_asignatura, nombre, codigo, creditos, curso, semestre, cod_profesor, cod_grado)values
(1, 'Matemáticas', 'MAT101', 4, 'Matemáticas Avanzadas', 1, 1, 1),
(2, 'Historia', 'HIS201', 3, 'Historia Mundial', 2, 2, 2),
(3, 'Biología', 'BIO301', 4, 'Biología Celular', 3, 3, 3),
(4, 'Literatura', 'LIT401', 3, 'Literatura Clásica', 4, 4, 4),
(5, 'Física', 'FIS501', 4, 'Física Moderna', 5, 5, 5);
select * from alumno;
insert into alumno(id, nombre, apellido1, apellido2, ciudad, dirección, teléfono, fecha_nacimiento, sexo)values
(1, 'Juan', 'Pérez', 'Gómez', 'Armenia', 'Calle 123', '123456789', '1998-05-15', 'Masculino'),
(2, 'María', 'García', 'Rodríguez', 'Popayan', 'Avenida 456', '987654321', '1999-03-20', 'Femenino'),
(3, 'Luis', 'Martínez', 'Hernández', 'Cali', 'Carrera 789', '555123456', '1997-09-10', 'Masculino'),
(4, 'Ana', 'Fernández', 'López', 'Buga', 'Calle 456', '789987654', '2000-07-25', 'Femenino'),
(5, 'Carlos', 'Sánchez', 'Pérez', 'Palmira', 'Avenida 789', '111222333', '1998-11-05', 'Masculino');
select * from curso_escolar;
insert into curso_escolar(id_escolar, año_escolar, fecha_inicio, fecha_fin)values
(1, '2022-2023', '2022-09-01', '2023-06-30'),
(2, '2023-2024', '2023-09-01', '2024-06-30'),
(3, '2024-2025', '2024-09-01', '2025-06-30'),
(4, '2025-2026', '2025-09-01', '2026-06-30'),
(5, '2026-2027', '2026-09-01', '2027-06-30');
select * from alumno_se_matricula_asignatura;
insert into  alumno_se_matricula_asignatura(id_alumno, cod_asignatura, cod_escolar)values
(1, 1, 1),(2, 2, 2),(3, 3, 3),(4, 4, 4),(5, 5, 5);
drop database db_universidad;
drop table alumno_se_matricula_asignatura;
alter table curso_escolar drop column id_curso_escolar;
describe asignatura;
alter table curso_escolar
change column id_curso_escolar año_escolar VARCHAR(10) NOT NULL;
delete from curso_escolar where id_escolar = 2;
ALTER TABLE profesor
ADD constraint fk_departamento_profesor
foreign key(cod_departamento)references departamento(id_departamento);

ALTER TABLE asignatura ADD CONSTRAINT fk_asignatura_profesor
FOREIGN KEY (cod_profesor) REFERENCES profesor(id_profesor);
