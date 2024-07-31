# EXAMEN J2 SQL

_Juan Diego Rojas Aguilar_

## Indice

- ERD
- Consultas Basicas

### Consultas Basicas

1. Consultar todos los productos y sus categorias.

```sql
SELECT p.nombre, p.codigo_barras, p.precio_venta, p.cantidad_stock AS stock, c.descripcion AS `categoria`
FROM productos AS p
LEFT JOIN categorias AS c USING (id_categoria);
```

2. Consultar todas las compras y los clientes que las realizaron.

```sql
SELECT c.fecha, c.medio_pago, c.estado, CONCAT(cl.nombre, ' ', cl.apellidos) AS `cliente`, cl.correo_electronico
FROM compras AS c
JOIN clientes AS cl USING (id_cliente);
```

3. Consultar los productos comprados en una compra especifica.

```sql
SELECT cp.id_compra, p.nombre, cp.cantidad, cp.total, c.fecha, c.medio_pago
FROM compras_productos AS cp
JOIN productos AS p USING (id_producto)
JOIN compras AS c USING (id_compra)
WHERE c.id_compra = 1;
```

4. Agregar un nuevo producto.

```sql
INSERT INTO productos (nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado) VALUES
("Nuevo prod", 1, "prodnuv01", 52.67, 9, 2);
```

5. Actualizar el stock de un producto.

```sql
UPDATE productos
SET cantidad_stock = 5
WHERE id_producto = 2;
```
6. Consultar todas las compras de un cliente especifico.

```sql
SELECT fecha, medio_pago, estado
FROM compras
WHERE id_cliente = '500852';
```

7. Consultar todos los clientes y sus correos electronicos.

```sql
SELECT id_cliente, CONCAT(nombre, ' ', apellidos) AS `nombre cliente`, correo_electronico
FROM clientes;
```

8. Consultar la cantidad total de productos comprados en cada compra.

```sql
SELECT c.id_compra, c.id_cliente, SUM(cp.cantidad) AS `cantidad de items`
FROM compras AS c
JOIN compras_productos AS cp USING(id_compra)
GROUP BY(c.id_compra);
```

9. Consultar las compras relizadas en un rango de fechas.

```sql
SELECT id_compra, id_cliente, fecha, medio_pago, comentario, estado
FROM compras
WHERE MONTH(fecha) = MONTH(DATE_SUB(CURDATE(), INTERVAL 1 MONTH));
```

### Consultas usando funciones agregadas.

1. Contar la cantidad de productos por categoria

```sql
SELECT c.descripcion, COUNT(p.id_categoria) AS ocurrencias
FROM categorias AS c
JOIN productos AS p USING(id_categoria)
GROUP BY (c.descripcion)
ORDER BY COUNT(p.id_categoria) DESC;
```

2. Calcular el precio total de ventas por cada cliente.

```sql
SELECT cl.id_cliente, SUM(cp.total), COUNT(cp.id_compra) AS ocurrencias
FROM clientes AS cl
JOIN compras AS c USING (id_cliente)
JOIN compras_productos AS cp USING (id_compra)
GROUP BY (cl.id_cliente);
```

3. Calcular el precio promedio de los productos por categoria.

```sql
SELECT c.descripcion, AVG(p.precio_venta) AS promedio
FROM categorias AS c
JOIN productos AS p USING(id_categoria)
GROUP BY (c.descripcion);
```

4. Encontrar la fecha de la primera y la ultima compra registrada.

```sql
SELECT MIN(fecha) AS `fecha inicial`, MAX(fecha) AS `fecha final`
FROM compras;
```

5. Calcular el ingreso total por ventas.

```sql
SELECT SUM(total) AS `Ingreso total`
FROM compras_productos;
```

6. Contar la cantidad de compras realizadas por cada medio de pago.

```sql
SELECT medio_pago, COUNT(medio_pago) AS ocurrencias
FROM compras
GROUP BY (medio_pago);
```

7. Calcular el total de productos vendidos por cada categoria.

```sql
SELECT c.descripcion, COUNT(p.id_categoria) AS ocurrencias
FROM categorias AS c
JOIN productos AS p USING (id_categoria)
GROUP BY (c.descripcion);
```
8. Obtener el promedio de cantidad de productos comprados por compra.

```sql
SELECT id_compra, SUM(cantidad) AS `cantidad de productos`
FROM compras_productos
GROUP BY (id_compra);
```

9. Encontrar los productos con el stock mas bajo.

```sql
SELECT nombre, codigo_barras, precio_venta, cantidad_stock
FROM productos
ORDER BY cantidad_stock ASC;
```

10. Calcular el total de productos comprados y el total gastado por cliente.

```sql
SELECT c.id_cliente, SUM(cp.cantidad), SUM(cp.total)
FROM clientes AS c
JOIN compras AS cm USING(id_cliente)
JOIN compras_productos AS cp USING(id_compra)
GROUP BY (c.id_cliente);
```

### Consultas usando JOIN

1. Consultar todos los productos con sus categorias.

```sql
SELECT p.nombre, p.precio_venta, p.cantidad_stock, c.descripcion
FROM productos AS p
LEFT JOIN categorias AS c USING (id_categoria);
```

2. Consultar todas las compras y los clientes que las realizaron

```sql
SELECT c.id_cliente, cp.cantidad, cp.total
FROM clientes AS c
JOIN compras as b USING (id_cliente)
JOIN compras_productos AS cp USING (id_compra);
```

3. Consultar los productos comprados en cada compra.

```sql
SELECT cp.id_compra, GROUP_CONCAT(p.nombre) AS `productos`, cp.total
FROM compras_productos AS cp
JOIN productos AS p USING (id_producto)
GROUP BY cp.id_compra, cp.total;
```

4. Consultar las compras realizadas por un cliente especifico.

```sql
SELECT c.id_cliente, compras.*
FROM clientes AS c
JOIN compras USING (id_cliente)
WHERE c.id_cliente = '500852';
```

5. Consultar el total gastado por cada cliente.

```sql
SELECT c.id_cliente, SUM(cp.total)
FROM clientes AS c
JOIN compras AS b USING(id_cliente)
JOIN compras_productos AS cp USING(id_compra)
GROUP BY c.id_cliente
ORDER BY SUM(cp.total) DESC;
```

6. Consultar el stock disponible de productos y su categoria.

```sql
SELECT p.nombre, p.cantidad_stock, c.descripcion
FROM productos AS p
LEFT JOIN categorias AS c USING(id_categoria);
```

7. Consultar los detalles de compras junto con la informacion del cliente y del producto.

```sql
SELECT c.id_cliente, c.fecha, cp.total, GROUP_CONCAT(p.nombre)
FROM compras AS c
JOIN compras_productos AS cp USING (id_compra)
JOIN productos AS p USING(id_producto)
GROUP BY c.id_cliente, c.fecha, cp.total;
```

8. Consultar los productos que han sido comprados por mas de una cantidad especifica.

```sql
SELECT p.nombre, SUM(cp.cantidad) AS ocurrencias
FROM productos AS p
JOIN compras_productos AS cp USING (id_producto)
GROUP BY p.nombre
HAVING SUM(cp.cantidad) > 4;
```

9. Consultar la cantidad de productos vendidos por categoria.

```sql
SELECT SUM(cp.cantidad) AS ocurrencias, c.descripcion AS `categoria`
FROM productos AS p
JOIN compras_productos AS cp USING (id_producto)
JOIN categorias AS c USING (id_categoria)
GROUP BY c.descripcion;
```

10. Consultar los clientes que han realizado compras en un rango de fechas especifico.

```sql
SELECT cl.id_cliente, IFNULL(SUM(cp.id_compra), 0) AS "cantidad compras"
FROM clientes AS cl
JOIN compras AS c USING(id_cliente)
JOIN compras_productos AS cp USING(id_compra)
GROUP BY cl.id_cliente
HAVING c.fecha BETWEEN CURDATE() AND '2022-05-01';
```

11. Consultar el total gastado por cada cliente junto con la cantidad total de productos comprados.

```sql
SELECT cl.id_cliente, SUM(cp.cantidad) AS `cantidad total`, SUM(cp.total) `total gastado`
FROM clientes AS cl
JOIN compras USING (id_cliente)
JOIN compras_productos AS cp USING (id_compra)
GROUP BY cl.id_cliente;
```
