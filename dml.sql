INSERT INTO categorias (descripcion, estado) VALUES
("Categoria1", 1),
("Categoria2", 2),
("Categoria3", 1);

INSERT INTO productos (nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado) VALUES
("producto1", 1, "aaaaaaaa", 125.60, 12, 1),
("producto2", 2, "aaaaaaab", 25.32, 12, 1),
("producto3", 3, "aaaaaabb", 4658.70, 12, 1),
("producto4", 3, "aaaaabbb", 26498.60, 12, 1),
("producto5", 2, "aaaabbbb", 12.05, 12, 1),
("producto6", 1, "aaabbbbb", 205.00, 12, 1),
("producto7", 1, "aabbbbbb", 484.60, 12, 1),
("producto8", 2, "abbbbbbb", 906.12, 12, 1),
("producto9", 3, "bbbbbbbb", 87.45, 12, 1),
("producto10", 3, "cbbbbbbb", 65.99, 12, 1);

INSERT INTO clientes (id_cliente, nombre, apellidos, celular, direccion, correo_electronico) VALUES
("100123", "Jhon", "Roa", "3159628", "carrera 2 50", "jhon@roa.com"),
("200456", "Joel", "Leon", "45168542", "calle 69 420", "joel@leon.com"),
("300789", "Jairo", "Marin", "3141585", "carrera 12 21", "jairo@marin.com"),
("400741", "Juan", "Rojas", "3654592", "circunvalar 24 509", "juan@rojas.com"),
("500852", "Maria", "Aguilera", "4251685", "diagonal 15 123", "maria@aguilera.com"),
("600963", "Danna", "Jaimes", "4632569", "circunvalar 11 36", "danna@jaimes.com"),
("700159", "Elizabeth", "Ospina", "48651859", "calle 21 70", "elizabeth@ospina.com"),
("800753", "Lorena", "Gutierrez", "65498746", "carrera 6 30", "lorena@gutierrez.com"),
("900459", "Ximena", "Angarita", "65137984", "carrera 90 15", "ximena@angarita.com");

INSERT INTO compras (id_cliente, fecha, medio_pago, comentario, estado) VALUES
("900459", "2024-06-12", 'D', "Cuidado con el perro", 'e'),
("600963", "2022-12-08", 'C', "Paquete fragil", 'c'),
("500852", "2019-04-26", 'C', "Este lado arriba", 'e'),
("200456", "2021-08-30", 'C', "Contraentrega", 'e'),
("200456", "2024-07-02", 'E', "Contraentrega", 'x');

INSERT INTO compras_productos (id_compra, id_producto, cantidad, total, estado) VALUES
(5, 3, 5, 23850.70, 2),
(3, 7, 4, 2000.00, 1),
(4, 2, 3, 485.45, 1),
(3, 4, 4, 45698.10, 2),
(1, 1, 2, 251.20, 1);

