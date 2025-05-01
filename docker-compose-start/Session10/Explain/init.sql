CREATE TABLE clientes (
  id SERIAL PRIMARY KEY,
  nombre_cliente VARCHAR(255)
);

CREATE INDEX idx_nombre_cliente ON clientes (nombre_cliente);

INSERT INTO clientes (nombre_cliente) VALUES 
  ('Juan Pérez'),
  ('Luis Caicedo'),
  ('Alen Caicedo');
