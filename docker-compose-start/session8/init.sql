-- Crear tabla de pasajeros
CREATE TABLE Pasajeros (
    Pasajero_ID INT PRIMARY KEY,
    Pasajero_Nombre VARCHAR(100),
    Pasajero_Direccion VARCHAR(100)
);
-- Crear tabla Estado Checkin
CREATE TABLE Estado_Checkin (
    Estado_ID INT PRIMARY KEY,
    Estado_Checkin VARCHAR(50)
);
-- Crear tabla vuelos
CREATE TABLE Vuelos (
    Vuelo_ID INT PRIMARY KEY,
    Vuelo_Numero VARCHAR(50),
    Vuelo_Fecha DATE,
    Asiento VARCHAR(10),
    Total_Fee DECIMAL(10, 2),
    Pasajero_ID INT,
    Estado_ID INT,
    FOREIGN KEY (Pasajero_ID) REFERENCES Pasajeros(Pasajero_ID),
    FOREIGN KEY (Estado_ID) REFERENCES Estado_Checkin(Estado_ID)
);
INSERT INTO Pasajeros (Pasajero_ID, Pasajero_Nombre, Pasajero_Direccion) VALUES
(1, 'Juan Pérez', 'Calle 123'),
(2, 'Ana García', 'Calle 456'),
(3, 'Carlos López', 'Calle 789');

INSERT INTO Estado_Checkin (Estado_ID, Estado_Checkin) VALUES
(1, 'Confirmado'),
(2, 'No Confirmado');

INSERT INTO Vuelos (Vuelo_ID, Vuelo_Numero, Vuelo_Fecha, Asiento, Total_Fee, Pasajero_ID, Estado_ID) VALUES
(1, 'AA101', '2025-07-01', '12A', 50.00, 1, 1),
(2, 'AA101', '2025-07-01', '12B', 50.00, 1, 1),
(3, 'BA202', '2025-07-02', '1A', 45.00, 2, 1),
(4, 'BA202', '2025-07-02', '1B', 45.00, 2, 1),
(5, 'UA303', '2025-07-03', '8A', 50.00, 3, 2);