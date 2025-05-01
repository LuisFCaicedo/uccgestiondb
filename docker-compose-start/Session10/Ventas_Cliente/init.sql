-- Tabla clientes
CREATE TABLE clientes (
  cliente_id SERIAL PRIMARY KEY,
  nombre_cliente VARCHAR(100)
);

-- Tabla productos
CREATE TABLE productos (
  producto_id SERIAL PRIMARY KEY,
  nombre_producto VARCHAR(100),
  precio NUMERIC(10,2)
);

-- Tabla ventas
CREATE TABLE ventas (
  venta_id SERIAL PRIMARY KEY,
  cliente_id INT REFERENCES clientes(cliente_id),
  producto_id INT REFERENCES productos(producto_id),
  cantidad INT
);

-- Insertar datos en clientes
INSERT INTO clientes (nombre_cliente) VALUES
('Juan Pérez'), ('Ana Gómez'), ('Pedro Martínez');

-- Insertar datos en productos (ahora con precio)
INSERT INTO productos (nombre_producto, precio) VALUES
('Cemento', 25000.00),
('Ladrillo', 500.00),
('Madera', 12000.00);

-- Insertar datos en ventas
INSERT INTO ventas (cliente_id, producto_id, cantidad) VALUES
(1, 2, 50),  -- Juan Pérez compró 50 Ladrillos
(2, 1, 10),  -- Ana Gómez compró 10 Cemento
(3, 3, 25);  -- Pedro Martínez compró 25 Madera

-- Crear vista de total de ventas por cliente
CREATE VIEW ventas_por_cliente AS
SELECT 
  c.nombre_cliente, 
  SUM(v.cantidad * p.precio) AS total_ventas
FROM clientes c
INNER JOIN ventas v ON c.cliente_id = v.cliente_id
INNER JOIN productos p ON v.producto_id = p.producto_id
GROUP BY c.nombre_cliente;
