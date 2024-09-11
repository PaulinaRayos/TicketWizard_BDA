CREATE DATABASE ticketwizard;

use ticketwizard;

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(255) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    domicilio VARCHAR(255),
    edad INT,
    fecha_nacimiento DATE,
    saldo DECIMAL(10, 2) DEFAULT 0.00
)AUTO_INCREMENT = 1;


CREATE TABLE Domicilios (
    id_domicilio INT AUTO_INCREMENT PRIMARY KEY,
    calle VARCHAR(255),
    numero_exterior VARCHAR(10),
    colonia VARCHAR(100),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
)AUTO_INCREMENT = 1;

CREATE TABLE Eventos (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha DATE NOT NULL,
    localidad VARCHAR(255) NOT NULL,
    capacidad INT NOT NULL,
    venue VARCHAR(255) NOT NULL
)AUTO_INCREMENT = 1;

CREATE TABLE Boletos (
    id_boleto INT AUTO_INCREMENT PRIMARY KEY,
    num_serie CHAR(8) UNIQUE NOT NULL,
    fila VARCHAR(10),
    asiento VARCHAR(10),
    precio DECIMAL(10, 2) NOT NULL,
    estado_adquisicion ENUM('reventa', 'directo') NOT NULL,
    id_usuario INT, 
    id_evento INT, 
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_evento) REFERENCES Eventos(id_evento)
)AUTO_INCREMENT = 1;

CREATE TABLE Transacciones (
    id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
    num_transaccion VARCHAR(20) UNIQUE NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    fecha_hora_adquisicion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_usuario INT,
    id_boleto INT, 
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_boleto) REFERENCES Boletos(id_boleto)
)AUTO_INCREMENT = 1;

DELIMITER //

CREATE TRIGGER actualizar_usuario_saldo
AFTER INSERT ON Transacciones
FOR EACH ROW
BEGIN
    UPDATE Usuarios
    SET saldo = saldo + NEW.monto
    WHERE id_usuario = NEW.id_usuario;
END //

DELIMITER ;

