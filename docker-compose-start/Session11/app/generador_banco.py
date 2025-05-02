from dotenv import load_dotenv
import os
import threading
import time
import socket
import random
from datetime import datetime
import logging
from sqlalchemy import (
    create_engine, Column, Integer, String, DECIMAL, ForeignKey, TIMESTAMP
)
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[
        logging.FileHandler("banco.log"),
        logging.StreamHandler(),
    ],
)

# Cargar las variables de entorno
load_dotenv()

# Definir las variables de entorno
DB_USER = os.getenv("DB_USER", "admin")
DB_PASS = os.getenv("DB_PASS", "admin1234")
DB_HOST = os.getenv("DB_HOST", "localhost")
DB_NAME = os.getenv("DB_NAME", "banco")
RUN_TIME = int(os.getenv("RUN_TIME", "30"))

# Función para esperar a que PostgreSQL esté listo
def esperar_postgres(host, puerto):
    while True:
        try:
            with socket.create_connection((host, puerto), timeout=3):
                logging.info(f"Conexión exitosa a {host}:{puerto}")
                return
        except Exception:
            logging.info(f"Esperando a que PostgreSQL esté listo en {host}:{puerto}...")
            time.sleep(2)

# Esperar a que PostgreSQL esté listo
esperar_postgres(DB_HOST, 5432)

DATABASE_URL = f"postgresql://{DB_USER}:{DB_PASS}@{DB_HOST}/{DB_NAME}"
engine = create_engine(DATABASE_URL)
Base = declarative_base()
Session = sessionmaker(bind=engine)

class Cuenta(Base):
    __tablename__ = "cuentas"
    id_cuenta = Column(Integer, primary_key=True)
    nombre_cliente = Column(String, nullable=False)
    saldo = Column(DECIMAL, nullable=False)

class Transaccion(Base):
    __tablename__ = "transacciones"
    id_transaccion = Column(Integer, primary_key=True)
    id_cuenta = Column(Integer, ForeignKey("cuentas.id_cuenta"), nullable=False)
    tipo_transaccion = Column(String, nullable=False)
    monto = Column(DECIMAL, nullable=False)
    fecha_transaccion = Column(TIMESTAMP, nullable=False)

def generar_datos(tiempo_ejecucion):
    inicio_tiempo = time.time()
    session = Session()
    logging.info("Hilo de generación de datos iniciado.")

    while time.time() - inicio_tiempo < tiempo_ejecucion:
        try:
            nombre_cliente = f"Cliente {random.randint(1, 100)}"
            saldo = round(random.uniform(1000, 10000), 2)
            cuenta = Cuenta(nombre_cliente=nombre_cliente, saldo=saldo)
            session.add(cuenta)
            session.flush()

            tipo = random.choice(["deposito", "retiro"])
            monto = round(random.uniform(100, 1000), 2)

            if tipo == "retiro" and monto > cuenta.saldo:
                monto = cuenta.saldo

            transaccion = Transaccion(
                id_cuenta=cuenta.id_cuenta,
                tipo_transaccion=tipo,
                monto=monto,
                fecha_transaccion=datetime.now(),
            )
            session.add(transaccion)

            if tipo == "deposito":
                cuenta.saldo += monto
            elif tipo == "retiro":
                cuenta.saldo -= monto

            session.commit()
            logging.info(f"Cuenta {cuenta.id_cuenta} ({tipo} de {monto}) - Saldo final: {cuenta.saldo}")
            time.sleep(2)

        except Exception as e:
            logging.error(f"Error al insertar datos: {e}")
            session.rollback()

    session.close()
    logging.info("Hilo de generación de datos finalizado.")

def main():
    try:
        Base.metadata.create_all(engine)
        hilo = threading.Thread(target=generar_datos, args=(RUN_TIME,))
        hilo.start()
        hilo.join()
    except Exception as e:
        logging.error(f"Error en la ejecución principal: {e}")

if __name__ == "__main__":
    main()