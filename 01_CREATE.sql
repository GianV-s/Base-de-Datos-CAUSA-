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



