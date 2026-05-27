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

-- TABLA 3
INSERT INTO CATEGORIA (id_categoria, nombre, descripcion) VALUES
(1, 'Lacteos', 'Productos derivados de la leche'),
(2, 'Bebidas', 'Gaseosas, jugos y agua'),
(3, 'Snacks', 'Piqueos y golosinas'),
(4, 'Limpieza', 'Productos de limpieza para el hogar'),
(5, 'Tecnologia', 'Accesorios y dispositivos electronicos');
-- TABLA 4: PRODUCTO
INSERT INTO PRODUCTO (id_producto, nombre, descripcion, precio, peso, id_categoria) VALUES
(1, 'Leche Gloria', 'Leche evaporada entera', 4.50, 0.40, 1),
(2, 'Coca Cola 1L', 'Gaseosa Coca Cola', 5.00, 1.00, 2),
(3, 'Papas Lays', 'Papas fritas clasicas', 3.50, 0.15, 3),
(4, 'Detergente Ariel', 'Detergente en polvo', 18.00, 1.50, 4),
(5, 'Mouse Logitech', 'Mouse inalambrico', 45.00, 0.20, 5);



  
(4, 'Detergente Ariel', 'Detergente en polvo', 18.00, 1.50, 4),
(5, 'Mouse Logitech', 'Mouse inalambrico', 45.00, 0.20, 5);
