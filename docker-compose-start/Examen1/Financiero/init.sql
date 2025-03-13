-- Crear la base de datos y las tablas
CREATE DATABASE bank_db;
 
-- Conectar a la base de datos
\c bank_db;
 
-- Crear tabla de clientes
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    saldo DECIMAL(10, 2)
);
 
-- Crear tabla de transacciones
CREATE TABLE transacciones (
    transaccion_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    tipo VARCHAR(50),
    monto DECIMAL(10, 2),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
 
-- Agregar algunos datos de ejemplo
INSERT INTO clientes (nombre, saldo) VALUES ('Juan Perez', 1500.00);
INSERT INTO clientes (nombre, saldo) VALUES ('Ana Garcia', 2500.00);
 
-- Realizar una transacción
INSERT INTO transacciones (cliente_id, tipo, monto) VALUES (1, 'retiro', 200.00);
 
-- Consultar el saldo de un cliente
SELECT nombre, saldo FROM clientes WHERE cliente_id = 1;
