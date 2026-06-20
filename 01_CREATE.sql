CREATE TABLE PERSONA (
 id_persona SERIAL PRIMARY KEY,
 dni VARCHAR(8) NOT NULL UNIQUE,
 nombre_cliente VARCHAR(100) NOT NULL UNIQUE,
 fecha_nacimiento DATE NOT NULL,
 telefono VARCHAR(12) NOT NULL UNIQUE
);

CREATE TABLE EMPRESA (
 id_empresa SERIAL PRIMARY KEY,
 nombre_cliente VARCHAR(100) NOT NULL UNIQUE,
 categoria INTEGER NOT NULL,
 ruc VARCHAR(11) NOT NULL UNIQUE,
 iva REAL NOT NULL,
 telefono VARCHAR(12) NOT NULL UNIQUE
);

CREATE TABLE METODO_PAGO (
 id_metodo VARCHAR(3) PRIMARY KEY,
 tipo INTEGER NOT NULL
);

CREATE TABLE CATEGORIA (
  id_categoria INTEGER PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(300) NOT NULL
);

CREATE TABLE PRODUCTO (
  id_producto INTEGER PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(300) NOT NULL,
  precio REAL NOT NULL,
  peso REAL NOT NULL,
  id_categoria INTEGER,
  FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);

CREATE TABLE DESCUENTO (
  id_descuento INTEGER PRIMARY KEY,
  descuento REAL NOT NULL,
  fecha_limite DATE NOT NULL,
  estado VARCHAR(50) NOT NULL
);

CREATE TABLE ESTADO_ENVIO (
  id_estado INTEGER PRIMARY KEY,
  repartidor VARCHAR(100) NOT NULL,
  estado VARCHAR(50) NOT NULL
);

CREATE TABLE ALMACEN (
    id_almacen INTEGER PRIMARY KEY,
    nombre_almacen VARCHAR(100) NOT NULL,
    direccion_fisica VARCHAR(200) NOT NULL,
    capacidad_total INTEGER NOT NULL,
    tipo_almacen VARCHAR(50) NOT NULL
);

CREATE TABLE STOCK ( 
    id_stock INTEGER PRIMARY KEY,
    cantidad_disponible INTEGER NOT NULL,
    maximo INTEGER NOT NULL,
    id_producto INTEGER,
    id_almacen INTEGER,
    FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto),
    FOREIGN KEY (id_almacen) REFERENCES ALMACEN(id_almacen)
);

CREATE TABLE CLIENTE ( 
    id_cliente SERIAL PRIMARY KEY,
    telefono_contacto VARCHAR(20) NOT NULL,
    id_persona INTEGER UNIQUE,
    id_empresa INTEGER UNIQUE,
    FOREIGN KEY (id_persona) REFERENCES PERSONA(id_persona),
    FOREIGN KEY (id_empresa) REFERENCES EMPRESA(id_empresa)
);

CREATE TABLE RESEÑA ( 
    id_reseña INTEGER PRIMARY KEY,
    puntuacion INTEGER NOT NULL,
    descripcion VARCHAR(300) NOT NULL,
    id_producto INTEGER,
    id_cliente INTEGER,
    FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

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

CREATE TABLE COMPROBANTE ( 
    id_comprobante SERIAL PRIMARY KEY,
    monto REAL NOT NULL,
    fecha_emision DATE NOT NULL,
    id_pedido INTEGER UNIQUE,
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido)
);

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

CREATE TABLE DEVOLUCION (
  id_devolucion INTEGER PRIMARY KEY,
  estado VARCHAR(50) NOT NULL,
  fecha_registro DATE NOT NULL,
  descripcion VARCHAR(300) NOT NULL,
  id_pedido INTEGER, 
  FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido) 
);

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
