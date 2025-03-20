-- Crear tabla de productos
CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (categorias_id) REFERENCES productos(producto_id) ON DELETE CASCADE
);
-- Crear tabla de Categogias
CREATE TABLE categorias (
    categorias_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);
-- Crear tabla de Clientes
CREATE TABLE clientes (
    clientes_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(100) NOT NULL
);
-- Crear tabla de ventas
CREATE TABLE ventas (
    venta_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(clientes_id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id) ON DELETE CASCADE
);
-- Crear el esquema para ventas
CREATE SCHEMA ventas;
-- Crear tabla de Productos
CREATE TABLE ventas.productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);
CREATE TABLE ventas.pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes.clientes(cliente_id) ON DELETE CASCADE
);
-- Crear tabla intermedia Pedido_Productos para relación muchos a muchos
CREATE TABLE ventas.pedido_productos (
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    PRIMARY KEY (pedido_id, producto_id),
    FOREIGN KEY (pedido_id) REFERENCES ventas.pedidos(pedido_id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES ventas.productos(producto_id) ON DELETE CASCADE
);
-- Crear el esquema para clientes
CREATE SCHEMA clientes;

CREATE TABLE clientes.clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(100) UNIQUE NOT NULL
);
-- Crear tabla de Direcciones
CREATE TABLE clientes.direcciones (
    direccion_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    calle VARCHAR(255) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    codigo_postal VARCHAR(20) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes.clientes(cliente_id) ON DELETE CASCADE
);