-- Tabla clientes
CREATE TABLE clientes (
  cliente_id SERIAL PRIMARY KEY,
  nombre_cliente VARCHAR(100)
);

-- Tabla productos
CREATE TABLE productos (
  producto_id SERIAL PRIMARY KEY,
  nombre_producto VARCHAR(100)
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

-- Insertar datos en productos
INSERT INTO productos (nombre_producto) VALUES
('Cemento'), ('Ladrillo'), ('Madera');

-- Insertar datos en ventas
INSERT INTO ventas (cliente_id, producto_id, cantidad) VALUES
(1, 2, 50),  -- Juan Pérez compró 50 Ladrillos
(2, 1, 10),  -- Ana Gómez compró 10 Cemento
(3, 3, 25);  -- Pedro Martínez compró 25 Madera
