CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    correo VARCHAR(100)
);

INSERT INTO clientes (nombre_cliente, correo) VALUES
('Juan Perez', 'juan@ucc.com'),
('Luis Caicedo', 'ana@ucc.com'),
('Diana Viafara', 'carlos@ucc.com');

CREATE INDEX idx_nombre_cliente ON clientes(nombre_cliente);
