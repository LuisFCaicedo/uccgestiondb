-- Crear tablas
CREATE TABLE IF NOT EXISTS cuentas (
    id_cuenta SERIAL PRIMARY KEY,
    nombre_cliente VARCHAR(255) NOT NULL,
    saldo DECIMAL NOT NULL
);

CREATE TABLE IF NOT EXISTS transacciones (
    id_transaccion SERIAL PRIMARY KEY,
    id_cuenta INTEGER NOT NULL REFERENCES cuentas(id_cuenta),
    tipo_transaccion VARCHAR(10) NOT NULL,
    monto DECIMAL NOT NULL,
    fecha_transaccion TIMESTAMP NOT NULL
);

-- Crear rol y usuario si no existen
DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'generador_datos') THEN
        CREATE ROLE generador_datos WITH LOGIN PASSWORD 'clave_segura';
    END IF;
    
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'admin') THEN
        CREATE USER admin WITH PASSWORD 'admin1234' IN ROLE generador_datos;
    END IF;
END
$$;

-- Permisos
GRANT CONNECT ON DATABASE banco TO generador_datos;
GRANT INSERT ON cuentas TO generador_datos;
GRANT INSERT ON transacciones TO generador_datos;
