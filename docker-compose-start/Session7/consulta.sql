SELECT producto_id, nombre, 
       (SELECT SUM(cantidad) FROM ventas.pedido_productos WHERE producto_id = p.producto_id) AS total_vendidos
FROM ventas.productos p
ORDER BY total_vendidos DESC;


SELECT cliente_id, nombre, 
       (SELECT COUNT(*) FROM ventas.pedidos WHERE cliente_id = c.cliente_id) AS total_pedidos,
       (SELECT SUM(total) FROM ventas.pedidos WHERE cliente_id = c.cliente_id) AS total_gastado
FROM clientes.clientes c;

