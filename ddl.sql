DROP DATABASE IF EXISTS compras_juan;
CREATE DATABASE compras_juan;
USE compras_juan;

CREATE TABLE categorias (
    id_categoria INT UNSIGNED AUTO_INCREMENT,
    descripcion VARCHAR(45),
    estado TINYINT,
    CONSTRAINT pk_id_categoria PRIMARY KEY (id_categoria)
);

CREATE TABLE clientes (
    id_cliente VARCHAR(20) UNIQUE,
    nombre VARCHAR(40),
    apellidos VARCHAR(100),
    celular DECIMAL(10,2),
    direccion VARCHAR(80),
    correo_electronico VARCHAR(70),
    CONSTRAINT pk_id_cliente PRIMARY KEY (id_cliente)
);

CREATE TABLE compras (
    id_compra INT UNSIGNED AUTO_INCREMENT,
    id_cliente VARCHAR(20),
    fecha DATETIME DEFAULT (CURDATE()),
    medio_pago CHAR(1),
    comentario VARCHAR(300),
    estado CHAR(1),
    CONSTRAINT pk_id_compra PRIMARY KEY (id_compra)
);

CREATE TABLE productos (
    id_producto INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    id_categoria INT UNSIGNED,
    codigo_barras VARCHAR(150),
    precio_venta DECIMAL(16,2),
    cantidad_stock INT UNSIGNED,
    estado TINYINT,
    CONSTRAINT pk_id_producto PRIMARY KEY (id_producto),
    CONSTRAINT fk_id_categoria_producto FOREIGN KEY (id_categoria)
    REFERENCES categorias (id_categoria)
);

CREATE TABLE compras_productos (
    id_compra INT UNSIGNED,
    id_producto INT UNSIGNED,
    cantidad INT UNSIGNED,
    total DECIMAL(16,2) UNSIGNED,
    estado TINYINT,
    CONSTRAINT pk_id_compra_producto_compose PRIMARY KEY (id_compra, id_producto),
    CONSTRAINT fk_id_compra_producto_compra FOREIGN KEY (id_compra)
    REFERENCES compras (id_compra),
    CONSTRAINT fk_id_compra_producto_producto FOREIGN KEY (id_producto)
    REFERENCES productos (id_producto)
);

