-- Crear la base de datos y las tablas
CREATE DATABASE airport_db;
 
-- Conectar a la base de datos
\c airport_db;
 
-- Crear tabla de vuelos
CREATE TABLE vuelos (
    vuelo_id SERIAL PRIMARY KEY,
    numero_vuelo VARCHAR(10),
    origen VARCHAR(100),
    destino VARCHAR(100),
    fecha_salida TIMESTAMP,
    capacidad INT
);
 
-- Crear tabla de pasajeros
CREATE TABLE pasajeros (
    pasajero_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    documento_identidad VARCHAR(20)
);
 
-- Crear tabla de reservas
CREATE TABLE reservas (
    reserva_id SERIAL PRIMARY KEY,
    pasajero_id INT REFERENCES pasajeros(pasajero_id),
    vuelo_id INT REFERENCES vuelos(vuelo_id),
    fecha_reserva TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50)
);
 
-- Agregar algunos datos de ejemplo
INSERT INTO vuelos (numero_vuelo, origen, destino, fecha_salida, capacidad) 
VALUES ('AA101', 'Madrid', 'New York', '2025-07-15 10:00:00', 200);
 
INSERT INTO pasajeros (nombre, documento_identidad) 
VALUES ('Carlos Ruiz', 'X12345678');
 
-- Hacer una reserva para un pasajero
INSERT INTO reservas (pasajero_id, vuelo_id, estado) 
VALUES (1, 1, 'reservado');
 
-- Consultar la disponibilidad de un vuelo
SELECT numero_vuelo, origen, destino, capacidad - COUNT(reserva_id) AS asientos_disponibles
FROM vuelos
LEFT JOIN reservas ON vuelos.vuelo_id = reservas.vuelo_id
GROUP BY vuelos.vuelo_id;