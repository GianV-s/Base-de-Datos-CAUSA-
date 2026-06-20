-- TABLA 1: PERSONA
CREATE TABLE PERSONA (
 id_persona SERIAL PRIMARY KEY,
 dni VARCHAR(8) NOT NULL UNIQUE,
 nombre_cliente VARCHAR(100) NOT NULL UNIQUE,
 fecha_nacimiento DATE NOT NULL,
 telefono VARCHAR(12) NOT NULL UNIQUE
);

-- TABLA 2: EMPRESA
CREATE TABLE EMPRESA (
 id_empresa SERIAL PRIMARY KEY,
 nombre_cliente VARCHAR(100) NOT NULL UNIQUE,
 categoria INTEGER NOT NULL,
 ruc VARCHAR(11) NOT NULL UNIQUE,
 iva REAL NOT NULL,
 telefono VARCHAR(12) NOT NULL UNIQUE
);

-- TABLA 3: METODO_PAGO
CREATE TABLE METODO_PAGO (
 id_metodo VARCHAR(3) PRIMARY KEY,
 tipo INTEGER NOT NULL
);

-- TABLA 4: CATEGORIA
CREATE TABLE CATEGORIA (
  id_categoria INTEGER PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(300) NOT NULL
);

-- TABLA 5: PRODUCTO
CREATE TABLE PRODUCTO (
  id_producto INTEGER PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(300) NOT NULL,
  precio REAL NOT NULL,
  peso REAL NOT NULL,
  id_categoria INTEGER,
  FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);

-- TABLA 6: DESCUENTO
CREATE TABLE DESCUENTO (
  id_descuento INTEGER PRIMARY KEY,
  descuento REAL NOT NULL,
  fecha_limite DATE NOT NULL,
  estado VARCHAR(50) NOT NULL
);

-- TABLA 7: ESTADO_ENVIO
CREATE TABLE ESTADO_ENVIO (
  id_estado INTEGER PRIMARY KEY,
  repartidor VARCHAR(100) NOT NULL,
  estado VARCHAR(50) NOT NULL
);

-- TABLA 8: ALMACEN
CREATE TABLE ALMACEN (
    id_almacen INTEGER PRIMARY KEY,
    nombre_almacen VARCHAR(100) NOT NULL,
    direccion_fisica VARCHAR(200) NOT NULL,
    capacidad_total INTEGER NOT NULL,
    tipo_almacen VARCHAR(50) NOT NULL
);

-- TABLA 9: STOCK
CREATE TABLE STOCK ( 
    id_stock INTEGER PRIMARY KEY,
    cantidad_disponible INTEGER NOT NULL,
    maximo INTEGER NOT NULL,
    id_producto INTEGER,
    id_almacen INTEGER,
    FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto),
    FOREIGN KEY (id_almacen) REFERENCES ALMACEN(id_almacen)
);

-- TABLA 10: CLIENTE
CREATE TABLE CLIENTE ( 
    id_cliente SERIAL PRIMARY KEY,
    telefono_contacto VARCHAR(20) NOT NULL,
    id_persona INTEGER UNIQUE,
    id_empresa INTEGER UNIQUE,
    FOREIGN KEY (id_persona) REFERENCES PERSONA(id_persona),
    FOREIGN KEY (id_empresa) REFERENCES EMPRESA(id_empresa)
);

-- TABLA 11: RESEÑA
CREATE TABLE RESEÑA ( 
    id_reseña INTEGER PRIMARY KEY,
    puntuacion INTEGER NOT NULL,
    descripcion VARCHAR(300) NOT NULL,
    id_producto INTEGER,
    id_cliente INTEGER,
    FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

-- TABLA 12: PEDIDO
CREATE TABLE PEDIDO ( 
    id_pedido SERIAL PRIMARY KEY,
    fecha_pedido DATE NOT NULL,
    fecha_entrega_est DATE NOT NULL,
    cantidad INTEGER NOT NULL,
    id_cliente INTEGER NOT NULL,
    id_metodo VARCHAR(3) NOT NULL,
    id_estado_envio INTEGER,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_metodo) REFERENCES METODO_PAGO(id_metodo),
    FOREIGN KEY (id_estado_envio) REFERENCES ESTADO_ENVIO(id_estado)
);

-- TABLA 13: COMPROBANTE
CREATE TABLE COMPROBANTE ( 
    id_comprobante SERIAL PRIMARY KEY,
    monto REAL NOT NULL,
    fecha_emision DATE NOT NULL,
    id_pedido INTEGER UNIQUE,
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido)
);

-- TABLA 14: DETALLE_PEDIDO
CREATE TABLE DETALLE_PEDIDO (
  id_detalle INTEGER PRIMARY KEY,
  cantidad INTEGER NOT NULL,
  precio_unitario REAL NOT NULL,
  precio_final REAL NOT NULL,
  total REAL NOT NULL,
  id_descuento INTEGER,
  id_producto INTEGER,
  id_pedido INTEGER, 
  FOREIGN KEY (id_descuento) REFERENCES DESCUENTO(id_descuento),
  FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto),
  FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido)
);

-- TABLA 15: DEVOLUCION
CREATE TABLE DEVOLUCION (
  id_devolucion INTEGER PRIMARY KEY,
  estado VARCHAR(50) NOT NULL,
  fecha_registro DATE NOT NULL,
  descripcion VARCHAR(300) NOT NULL,
  id_pedido INTEGER, 
  FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido) 
);

-- TABLA 16: FACTURA
CREATE TABLE FACTURA (
 id_factura SERIAL PRIMARY KEY,
 monto INTEGER NOT NULL,
 fecha_emision DATE NOT NULL,
 id_empresa INTEGER, 
 id_detalle INTEGER, 
 id_metodo VARCHAR(3),
 id_comprobante INTEGER, 
 FOREIGN KEY (id_empresa) REFERENCES EMPRESA(id_empresa),
 FOREIGN KEY (id_detalle) REFERENCES DETALLE_PEDIDO(id_detalle),
 FOREIGN KEY (id_metodo) REFERENCES METODO_PAGO(id_metodo),
 FOREIGN KEY (id_comprobante) REFERENCES COMPROBANTE(id_comprobante) 
);

-- TABLA 17: BOLETA
CREATE TABLE BOLETA (
 id_boleta SERIAL PRIMARY KEY,
 monto INTEGER NOT NULL,
 fecha_emision DATE NOT NULL,
 id_persona INTEGER, 
 id_detalle INTEGER, 
 id_metodo VARCHAR(3),
 id_comprobante INTEGER,
 FOREIGN KEY (id_persona) REFERENCES PERSONA(id_persona),
 FOREIGN KEY (id_detalle) REFERENCES DETALLE_PEDIDO(id_detalle),
 FOREIGN KEY (id_metodo) REFERENCES METODO_PAGO(id_metodo),
 FOREIGN KEY (id_comprobante) REFERENCES COMPROBANTE(id_comprobante) 
);

-- TABLA 18: DIRECCION
CREATE TABLE DIRECCION (
 id_direccion SERIAL PRIMARY KEY,
 pais VARCHAR(100) NOT NULL,
 ciudad VARCHAR(100) NOT NULL,
 distrito VARCHAR(100) NOT NULL,
 calle VARCHAR(100) NOT NULL,
 notas_adicionales VARCHAR(500) NOT NULL,
 id_persona INTEGER,
 id_empresa INTEGER,
 FOREIGN KEY (id_persona) REFERENCES PERSONA(id_persona),
 FOREIGN KEY (id_empresa) REFERENCES EMPRESA(id_empresa)
);


-- ==========================================
-- INSERCIÓN DE DATOS (POBLADO)
-- ==========================================

-- TABLA 1: PERSONA
INSERT INTO PERSONA (dni, nombre_cliente, fecha_nacimiento, telefono) VALUES
('11111211', 'JUAN LOPEZ', '2000-5-1', '959555559'),
('11111121', 'FERNANDO LOPEZ', '2000-6-1', '959959959'),
('11111111', 'ANTONIO SMITH', '2000-5-15', '959959759'),
('21111111', 'ROBERTO BOLUARTE', '2006-5-1', '939959959'), 
('11131111', 'ALAN CASTILLO', '2010-5-1', '959959359');

-- TABLA 2: EMPRESA (0: minorista 1: mayorista)
INSERT INTO EMPRESA (nombre_cliente, categoria, ruc, iva, telefono) VALUES 
('COMERCIAL BENAVIDES S.A.C.', 1, '20123456789', 0.13, '987654321'),
('ALMACENES SAN JORGE E.I.R.L.', 1, '20987654321', 0.13, '912345678'),
('TIENDA EL ROSAL', 0, '10456789123', 0.18, '955667788'),
('DISTRIBUIDORA NORTE S.A.', 1, '20555666777', 0.12, '944332211'),
('MINIMARKET MI CASITA', 0, '10222333444', 0.15, '999888777');

-- TABLA 4: CATEGORIA
INSERT INTO CATEGORIA (id_categoria, nombre, descripcion) VALUES
(1, 'Lacteos', 'Productos derivados de la leche'),
(2, 'Bebidas', 'Gaseosas, jugos y agua'),
(3, 'Snacks', 'Piqueos y golosinas'),
(4, 'Limpieza', 'Productos de limpieza para el hogar'),
(5, 'Tecnologia', 'Accesorios y dispositivos electronicos');

-- TABLA 5: PRODUCTO
INSERT INTO PRODUCTO (id_producto, nombre, descripcion, precio, peso, id_categoria) VALUES
(1, 'Leche Gloria', 'Leche evaporada entera', 4.50, 0.40, 1),
(2, 'Coca Cola 1L', 'Gaseosa Coca Cola', 5.00, 1.00, 2),
(3, 'Papas Lays', 'Papas fritas clasicas', 3.50, 0.15, 3),
(4, 'Detergente Ariel', 'Detergente en polvo', 18.00, 1.50, 4),
(5, 'Mouse Logitech', 'Mouse inalambrico', 45.00, 0.20, 5);

-- TABLA 3: METODO_PAGO
INSERT INTO METODO_PAGO (id_metodo, tipo) VALUES
('EF1', 1),
('TA2', 2),
('TR3', 3);

-- TABLA 6: DESCUENTO
INSERT INTO DESCUENTO (id_descuento, descuento, fecha_limite, estado) VALUES
(1, 0.10, '2026-12-31', 'Activo'),
(2, 0.05, '2026-07-15', 'Activo'),
(3, 0.00, '2030-01-01', 'Sin Descuento');

-- TABLA 7: ESTADO_ENVIO
INSERT INTO ESTADO_ENVIO (id_estado, repartidor, estado) VALUES
(1, 'Carlos Mendoza', 'En camino'),
(2, 'Ana Torres', 'Entregado'),
(3, 'Luis Delgado', 'Pendiente');

-- TABLA 8: ALMACEN
INSERT INTO ALMACEN (id_almacen, nombre_almacen, direccion_fisica, capacidad_total, tipo_almacen) VALUES
(1, 'Almacen Central', 'Av. Aviacion 1420', 10000, 'Principal'),
(2, 'Almacen Norte', 'Panamericana Norte Km 15', 5000, 'Secundario');

-- TABLA 9: STOCK
INSERT INTO STOCK (id_stock, cantidad_disponible, maximo, id_producto, id_almacen) VALUES
(1, 150, 500, 1, 1),
(2, 200, 600, 2, 1),
(3, 80, 300, 3, 2),
(4, 40, 150, 4, 1),
(5, 25, 100, 5, 2);

-- TABLA 10: CLIENTE
INSERT INTO CLIENTE (telefono_contacto, id_persona, id_empresa) VALUES
('959555559', 1, NULL),
('959959959', 2, NULL),
('987654321', NULL, 1),
('912345678', NULL, 2);

-- TABLA 11: RESEÑA
INSERT INTO RESEÑA (id_reseña, puntuacion, descripcion, id_producto, id_cliente) VALUES
(1, 5, 'Excelente calidad, el producto llego intacto.', 1, 1),
(2, 4, 'Buen precio y cumple su funcion perfectamente.', 5, 2);

-- TABLA 12: PEDIDO
INSERT INTO PEDIDO (fecha_pedido, fecha_entrega_est, cantidad, id_cliente, id_metodo, id_estado_envio) VALUES
('2026-06-15', '2026-06-20', 12, 1, 'EF1', 1),
('2026-06-16', '2026-06-18', 5, 3, 'TA2', 2);

-- TABLA 13: COMPROBANTE
INSERT INTO COMPROBANTE (monto, fecha_emision, id_pedido) VALUES
(54.00, '2026-06-15', 1),
(225.00, '2026-06-16', 2);

-- TABLA 14: DETALLE_PEDIDO
INSERT INTO DETALLE_PEDIDO (id_detalle, cantidad, precio_unitario, precio_final, total, id_descuento, id_producto, id_pedido) VALUES
(1, 12, 4.50, 4.50, 54.00, 3, 1, 1),
(2, 5, 45.00, 45.00, 225.00, 3, 5, 2);

-- TABLA 15: DEVOLUCION
INSERT INTO DEVOLUCION (id_devolucion, estado, fecha_registro, descripcion, id_pedido) VALUES
(1, 'Procesado', '2026-06-18', '2 unidades de leche vencidas, se aplico cambio.', 1);

-- TABLA 16: FACTURA
INSERT INTO FACTURA (monto, fecha_emision, id_empresa, id_detalle, id_metodo, id_comprobante) VALUES
(225, '2026-06-16', 1, 2, 'TA2', 2);

-- TABLA 17: BOLETA
INSERT INTO BOLETA (monto, fecha_emision, id_persona, id_detalle, id_metodo, id_comprobante) VALUES
(54, '2026-06-15', 1, 1, 'EF1', 1);

-- TABLA 18: DIRECCION
INSERT INTO DIRECCION (pais, ciudad, distrito, calle, notas_adicionales, id_persona, id_empresa) VALUES
('Peru', 'Lima', 'Miraflores', 'Av. Larco 456', 'Piso 3, Oficina 301', 1, NULL),
('Peru', 'Arequipa', 'Cayma', 'Calle Melgar 112', 'Frente a la plaza principal', NULL, 1);
