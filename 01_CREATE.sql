CREATE TABLE PERSONA (
  id_persona INTEGER PRIMARY KEY,
  dni INTEGER NOT NULL UNIQUE,
  nombre_cliente VARCHAR(100) NOT NULL UNIQUE,
  fecha_nacimiento DATE NOT NULL,
  telefono VARCHAR(12) NOT NULL UNIQUE
);

CREATE TABLE EMPRESA (
  id_empresa INTEGER PRIMARY KEY,
  nombre_cliente VARCHAR(100) NOT NULL UNIQUE,
  categoria INTEGER NOT NULL,
  ruc INTEGER NOT NULL UNIQUE,
  iva REAL NOT NULL,
  telefono VARCHAR(12) NOT NULL UNIQUE
);

CREATE TABLE METODO_PAGO (
  id_metodo INTEGER PRIMARY KEY,
  tipo INTEGER NOT NULL
);

CREATE TABLE FACTURA (
  id_factura INTEGER PRIMARY KEY,
  monto INTEGER NOT NULL,
  fecha_emision DATE NOT NULL,
  id_empresa INTEGER, 
  id_detalle INTEGER, 
  id_metodo INTEGER,
  FOREIGN KEY (id_empresa) REFERENCES EMPRESA(id_empresa),
  FOREIGN KEY (id_detalle) REFERENCES DETALLE_PEDIDO(id_detalle),
  FOREIGN KEY (id_metodo) REFERENCES METODO_PAGO(id_metodo)
);

CREATE TABLE BOLETA (
  id_boleta INTEGER PRIMARY KEY,
  monto INTEGER NOT NULL,
  fecha_emision DATE NOT NULL,
  id_persona INTEGER, 
  id_detalle INTEGER, 
  id_metodo INTEGER,
  FOREIGN KEY (id_persona) REFERENCES PERSONA(id_persona),
  FOREIGN KEY (id_detalle) REFERENCES DETALLE_PEDIDO(id_detalle),
  FOREIGN KEY (id_metodo) REFERENCES METODO_PAGO(id_metodo)
);

CREATE TABLE DIRECCION (
  id_direccion INTEGER PRIMARY KEY,
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

CREATE TABLE DETALLE_PEDIDO (
  id_detalle INTEGER PRIMARY KEY,
  cantidad INTEGER NOT NULL,
  precio_unitario REAL NOT NULL,
  precio_final REAL NOT NULL,
  total REAL NOT NULL,
  id_descuento INTEGER,
  id_producto INTEGER,
  FOREIGN KEY (id_descuento) REFERENCES DESCUENTO(id_descuento),
  FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);


CREATE TABLE DEVOLUCION (
  id_devolucion INTEGER PRIMARY KEY,
  estado VARCHAR(50) NOT NULL,
  fecha_registro DATE NOT NULL,
  descripcion VARCHAR(300) NOT NULL
);


CREATE TABLE ESTADO_ENVIO (
  id_estado INTEGER PRIMARY KEY,
  repartidor VARCHAR(100) NOT NULL,
  estado VARCHAR(50) NOT NULL
);



