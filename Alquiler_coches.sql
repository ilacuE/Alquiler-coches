-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS alquileres_db;

-- Usar la base de datos
USE alquileres_db;

-- Verificar si las tablas ya existen
DROP TABLE IF EXISTS SeHace;
DROP TABLE IF EXISTS Usa;
DROP TABLE IF EXISTS Realiza;
DROP TABLE IF EXISTS VehiculoOcupado;
DROP TABLE IF EXISTS VehiculoDisponible;
DROP TABLE IF EXISTS Vehiculo;
DROP TABLE IF EXISTS Reserva;
DROP TABLE IF EXISTS Locales;
DROP TABLE IF EXISTS Cliente;

-- Crear las tablas
CREATE TABLE IF NOT EXISTS Cliente (
    dni VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(100),
    email VARCHAR(50),
    ciudad VARCHAR(50),
    fecha_nacimiento DATE,
    telefono VARCHAR(20),
    descuento DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS Locales (
    local_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20),
    direccion VARCHAR(50),
    codigo_postal VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS Reserva (
    reserva_id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_alta DATE,
    fecha_baja DATE,
    precio DECIMAL(10,2),
    local_id INT,
    FOREIGN KEY (local_id) REFERENCES Locales(local_id)
);

CREATE TABLE IF NOT EXISTS Vehiculo (
    matricula VARCHAR(15) PRIMARY KEY,
    tipo VARCHAR(20),
    precio_dia DECIMAL(10,2),
    color VARCHAR(20),
    local_id INT,
    FOREIGN KEY (local_id) REFERENCES Locales(local_id)
);

CREATE TABLE IF NOT EXISTS Realiza (
    realiza_id INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(20),
    reserva_id INT,
    FOREIGN KEY (dni) REFERENCES Cliente(dni),
    FOREIGN KEY (reserva_id) REFERENCES Reserva(reserva_id)
);

CREATE TABLE IF NOT EXISTS Usa (
    usa_id INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(20),
    matricula VARCHAR(15),
    FOREIGN KEY (dni) REFERENCES Cliente(dni),
    FOREIGN KEY (matricula) REFERENCES Vehiculo(matricula)
);

CREATE TABLE IF NOT EXISTS SeHace (
    sehace_id INT AUTO_INCREMENT PRIMARY KEY,
    reserva_id INT,
    matricula VARCHAR(15),
    FOREIGN KEY (reserva_id) REFERENCES Reserva(reserva_id),
    FOREIGN KEY (matricula) REFERENCES Vehiculo(matricula)
);

CREATE TABLE IF NOT EXISTS VehiculoDisponible (
    matricula_disponible VARCHAR(15) PRIMARY KEY,
    ultima_reserva DATE,
    FOREIGN KEY (matricula_disponible) REFERENCES Vehiculo(matricula)
);

CREATE TABLE IF NOT EXISTS VehiculoOcupado (
    matricula_ocupado VARCHAR(15) PRIMARY KEY,
    fecha_disponibilidad DATE,
    FOREIGN KEY (matricula_ocupado) REFERENCES Vehiculo(matricula)
);

-- Insertar datos de ejemplo
INSERT INTO Cliente (dni, nombre, apellidos, email, ciudad, fecha_nacimiento, telefono, descuento) VALUES
('12345678B', 'Juan', 'García', 'juan@ejemplo.com', 'Zaragoza', '1990-05-15', '612345678', 5.00),
('98765432C', 'María', 'López', 'maria@ejemplo.com', 'Barcelona', '1992-08-20', '698765432', 5.50),
('12349876D', 'Marcos', 'Ezquerra', 'marcos@ejemplo.com', 'Zaragoza', '1993-11-25', '612348765', 6.00),
('98762345R', 'Marta', 'Clavero', 'marta@ejemplo.com', 'Madrid', '1995-02-28', '698762345', 5.50),
('21436587S', 'Mario', 'Orgaz', 'mario@ejemplo.com', 'Zaragoza', '1998-04-01', '612345678', 5.00);

INSERT INTO Locales (nombre, direccion, codigo_postal) VALUES
('Alquileres', 'Calle Alfonso, 7', '50103'),
('Rapido', 'Calle Pascual Albero, 6', '50002'),
('Coches y más', 'Calle Estrella, 8', '50214'),
('Vehículos', 'Calle Asalto, 2', '50017'),
('Sencillo', 'Calle Asín y Palacios, 6', '50340');

INSERT INTO Reserva (fecha_alta, fecha_baja, precio, local_id) VALUES
('2024-04-01', '2024-04-03', 100, 1), 
('2024-04-10', '2024-04-13', 100, 2), 
('2024-04-15', '2024-04-18', 155, 3),
('2024-04-21', '2024-04-24', 150, 4), 
('2024-04-28', '2024-04-29', 102, 5);

INSERT INTO Vehiculo (matricula, tipo, precio_dia, color, local_id) VALUES
('3408MDK', 'Coche', 50, 'Blanco', 1),
('2573DRT', 'Coche', 55, 'Gris', 2),
('6834FTB', 'Moto', 40, 'Rojo', 3),
('6739GSV', 'Coche', 52, 'Gris', 4),
('4256KJS', 'Moto', 43, 'Negro', 5);

INSERT INTO Realiza (dni, reserva_id) VALUES
('12345678B', 1),
('98765432C', 2),
('12349876D', 3);

INSERT INTO Usa (dni, matricula) VALUES
('12345678B', '3408MDK'),
('98765432C', '2573DRT'),
('12349876D', '6834FTB');

INSERT INTO SeHace (reserva_id, matricula) VALUES
(1, '3408MDK'),
(2, '2573DRT'),
(3, '6834FTB');

INSERT INTO VehiculoDisponible (matricula_disponible, ultima_reserva) VALUES
('3408MDK', '2024-04-10'),
('2573DRT', '2024-04-14'),
('6834FTB', '2024-04-21');

-- Eliminar el usuario existente si lo hay
DROP USER IF EXISTS 'admin'@'localhost';
DROP USER IF EXISTS 'viewer'@'localhost';

-- Usuarios y permisos
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON alquileres_db.* TO 'admin'@'localhost';

CREATE USER 'viewer'@'localhost' IDENTIFIED BY 'viewer';
GRANT SELECT ON alquileres_db.* TO 'viewer'@'localhost';
