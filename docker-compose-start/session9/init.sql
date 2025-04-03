-- Crear las tablas necesarias
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE ventas (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(id),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE detalles_venta (
    id SERIAL PRIMARY KEY,
    venta_id INT REFERENCES ventas(id) ON DELETE CASCADE,
    producto_id INT REFERENCES productos(id),
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL
);

-- Insertar datos de prueba
INSERT INTO clientes (nombre, email) VALUES
('Luis Caicedo', 'luis@caicedo.com'),
('Anngely Caicedo', 'anngely@caicedo.com'),
('Alen Caicedo', 'alen@caicedo.com');

INSERT INTO productos (nombre, precio) VALUES
('Laptop', 1200.00),
('Mouse', 25.00),
('Teclado', 45.00),
('Monitor', 300.00);

-- Registrar ventas con transacciones
BEGIN;
INSERT INTO ventas (cliente_id) VALUES (1) RETURNING id INTO temp_venta;
INSERT INTO detalles_venta (venta_id, producto_id, cantidad, precio_unitario)
VALUES (temp_venta, 1, 1, 1200.00), (temp_venta, 2, 2, 25.00);
COMMIT;

BEGIN;
INSERT INTO ventas (cliente_id) VALUES (2) RETURNING id INTO temp_venta;
INSERT INTO detalles_venta (venta_id, producto_id, cantidad, precio_unitario)
VALUES (temp_venta, 3, 1, 45.00), (temp_venta, 4, 1, 300.00);
COMMIT;

-- Consultas de agregación y resumen de ventas
SELECT c.nombre, COUNT(v.id) AS total_compras, SUM(dv.cantidad * dv.precio_unitario) AS total_gastado
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
JOIN detalles_venta dv ON v.id = dv.venta_id
GROUP BY c.id;

-- Consultar productos más vendidos
SELECT p.nombre, SUM(dv.cantidad) AS total_vendido
FROM productos p
JOIN detalles_venta dv ON p.id = dv.producto_id
GROUP BY p.id
ORDER BY total_vendido DESC
LIMIT 5;

-- Consultar clientes que hayan realizado compras
SELECT DISTINCT c.*
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id;
