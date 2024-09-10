
CREATE DATABASE ticketwizard;

use ticketwizard;

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(255) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    domicilio VARCHAR(255),
    edad INT,
    fecha_nacimiento DATE,
    saldo DECIMAL(10, 2) DEFAULT 0.00
);


CREATE TABLE Domicilio (
    id_domicilio INT AUTO_INCREMENT PRIMARY KEY,
    calle VARCHAR(255),
    numero_exterior VARCHAR(10),
    colonia VARCHAR(100),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Evento (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha DATE NOT NULL,
    localidad VARCHAR(255) NOT NULL
);

CREATE TABLE Boleto (
    id_boleto INT AUTO_INCREMENT PRIMARY KEY,
    num_serie CHAR(8) UNIQUE NOT NULL,
    fila VARCHAR(10),
    asiento VARCHAR(10),
    precio DECIMAL(10, 2) NOT NULL,
    estado_adquisicion ENUM('reventa', 'directo') NOT NULL,
    id_usuario INT, 
    id_evento INT, 
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento)
);

CREATE TABLE Transaccion (
    id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
    num_transaccion VARCHAR(20) UNIQUE NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    fecha_hora_adquisicion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_usuario INT,
    id_boleto INT, 
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_boleto) REFERENCES Boleto(id_boleto)
);

