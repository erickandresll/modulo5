-- Creación base de datos, usuarios y permisos de usuario. 

CREATE DATABASE telovendo_nose;
CREATE USER 'erickandresll'@'localhost' IDENTIFIED BY '12341234';
GRANT ALL PRIVILEGES ON telovendo_nose.* TO 'erickandresll'@'localhost';
FLUSH PRIVILEGES;

-- la tabla de "los usuarios".
CREATE TABLE los_usuarios (
	id_el_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    clave VARCHAR(50),
    huso_horario VARCHAR(20) DEFAULT 'UTC-3',
    genero VARCHAR(10), -- no he preguntado si acá se puede escoger opciones, como M o F.
    elfono VARCHAR(20)
);

-- la tabla de los ingresos
CREATE TABLE los_ingresos (
	id_ingreso INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT, 
    fechahora_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (id_usuarios) REFERENCES los_usuarios(id_el_usuario)
);

-- acá modifico el horario
ALTER TABLE los_usuarios MODIFY huso_horario VARCHAR(20) DEFAULT 'UTC-2';

-- creacion de usuarios (no me da para pensar mucho los nombres)
INSERT INTO los_usuarios (id_el_usuario, nombre, apellido, contraseña, género, telefono_contacto)
VALUES ('1','Usuario1', 'Apellido1', '123456', 'Masculino', '1234567890'),
       ('2','Usuario2', 'Apellido2', 'abcdef', 'Femenino', '0987654321'),
       ('3','Usuario3', 'Apellido3', 'qwerty', 'Otro', '9876543210'),
       ('4','Usuario4', 'Apellido4', 'password', 'Femenino', '5678901234'),
       ('5','Usuario5', 'Apellido5', 'pass123', 'Masculino', '0123456789'),
       ('6','Usuario6', 'Apellido6', 'abc123', 'Otro', '5432109876'),
       ('7','Usuario7', 'Apellido7', 'qwerty123', 'Femenino', '8765432109'),
       ('8','Usuario8', 'Apellido8', '123abc', 'Masculino', '2345678901');

-- datos de ingresos
INSERT INTO los_ingresos (id_ingreso, id_usuario, fechahora_iongreso)
VALUES ('11', '1', '13-10-2023 18:30'),
	   ('12', '5', '14-10-2023 17:20'),
       ('13', '3', '16-10-2023 11:10'),
       ('14', '3', '09-10-2023 16:20'),
       ('15', '6', '08-10-2023 12:30'),
       ('16', '2', '17-10-2023 18:40'),
       ('17', '4', '18-10-2023 19:50'),
       ('18', '4', '14-10-2023 10:40');
       
-- Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?
-- son optimos en los casos de los id que necesitan que se incrementen los números y además de 
-- declararlos como primary key. Por otra parte los varchar en los casos que los caracteres 
-- sean alfanumericos. Por último en caso de fecha hora utilizar como default el 
-- current_timestamp para que mantenga la hora y fecha actual. 


-- nueva tabla de contactos
CREATE TABLE los_contactos (
	id_contactos INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    celular VARCHAR(20),
    correo VARCHAR(50),
    FOREIGN KEY (id_usuarios) REFERENCES los_usuarios(id_usuario)
);

-- modificar columna de celular
ALTER TABLE los_usuarios ADD COLUMN id_contacto INT AFTER celular;

