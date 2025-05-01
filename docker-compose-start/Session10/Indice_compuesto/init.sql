CREATE TABLE clientes (
  id SERIAL PRIMARY KEY,
  nombre_cliente VARCHAR(255),
  direccion_cliente VARCHAR(255)
);

INSERT INTO clientes (nombre_cliente, direccion_cliente) VALUES 
  ('Juan Pérez', 'Calle 123'),
  ('Ana Gómez', 'Avenida 456'),
  ('Pedro Martínez', 'Calle 789');

CREATE INDEX idx_nombre_direccion ON clientes(nombre_cliente, direccion_cliente);
