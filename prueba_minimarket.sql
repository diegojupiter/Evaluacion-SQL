CREATE SCHEMA prueba_minimarket;

USE prueba_minimarket;

#Crecion de tablas 
CREATE TABLE Productos(
	id_producto INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre_producto VARCHAR(50),
    precio_producto FLOAT,
    stock INTEGER
);

CREATE TABLE Proveedores(
id_proveedor INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre_proveedor VARCHAR(30),
direccion_proveedor VARCHAR(100),
fono_proveedor VARCHAR(20)
);

#tabla relacional
CREATE TABLE Producto_Proveedor(
id_producto_proveedor INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_producto INTEGER NOT NULL,
id_proveedor INTEGER NOT NULL,
FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

CREATE TABLE Ventas (
id_venta INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
fecha_venta DATE,
monto_total FLOAT,
num_boleta INTEGER,
anio_venta INTEGER,
id_cliente INTEGER NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

#tabla relacional
CREATE TABLE Producto_Venta(
id_producto_venta INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_producto INTEGER NOT NULL,
id_venta INTEGER NOT NULL,
FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta)
);

CREATE TABLE Clientes(
id_cliente INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre_cliente VARCHAR(30),
direccion_cliente VARCHAR(50),
medio_pago VARCHAR(20)
);

CREATE TABLE Informe_Ganancias(
id_informe_ganacias INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
anio INTEGER,
ganancias_anuales FLOAT,
id_venta INTEGER NOT NULL,
FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta)
);

CREATE TABLE Compras(
id_compra INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
fecha_compra DATE,
total_compra FLOAT,
id_proveedor INTEGER NOT NULL,
FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

#poblar atributos de tablas 

INSERT INTO Productos(nombre_producto, precio_producto, stock) 
VALUES ("Aceite Maravilla", 3000, 23),
("Leche Entera", 1200, 45),
("Coca Cola 3L", 2500, 300),
("Queso 1K",5400, 12),
("Azucar 1K", 1000, 120),
("Servilletas 300u", 2500, 70),
("Six pack G Triton", 1800, 53),
("Confort 24u", 4100, 93)
;

INSERT INTO Proveedores(nombre_proveedor, direccion_proveedor, fono_proveedor) 
VALUES ("Carlitos SA", "Las garrapatas #3345", "+569 37264857"),
("Gaseosas Ociosas", "Las mojojojo #4455", "+569 10364582"),
("Tata bajame SA", "Los programadores #404", "+569 3276547")
;

INSERT INTO Ventas(fecha_venta, monto_venta, num_boleta, anio_venta, id_cliente)
VALUES ('2023-03-15', 18100, 1, 2023, 01),
('2023-03-15', 19900, 2, 2023, 02),
('2023-03-15', 26100, 3, 2023, 03),
('2023-03-15', 37100, 4, 2023, 02),
('2023-03-15', 11600, 2, 2023, 01),
('2023-03-15', 53500, 2, 2023, 03)
;

INSERT INTO Clientes(nombre_cliente, direccion_cliente, medio_pago)
VALUES ("Marcos Rojas", "Las Calilas #2323", "Efectivo"),
("Marcos Bolados", "Av Vista Hermosa #1313", "Debito"),
("Vicente Pizarro", "Pje Los Cracks #1312", "Credito")
;

INSERT INTO Compras(fecha_compra, total_compra, id_proveedor)
VALUES ('2023-03-12', 135000, 1),
('2023-03-12', 240000, 2),
('2023-03-12', 196500, 1),
('2023-03-12', 226500, 3),
('2023-03-12', 61000, 1),
('2023-03-12', 256000, 2),
('2023-03-12', 94000, 3)
;

INSERT INTO Informe_Ganancias(anio, ganancias_nuales, id_venta)
VALUES (2023, 166300, 01)
;

INSERT INTO Producto_Proveedor(id_producto, id_proveedor)
VALUES (1,1),
(3,2),
(2,2),
(6,1),
(1,3)
;

INSERT INTO Producto_Venta(id_producto, id_venta)
VALUES (1,1),
(2,1),
(1,2),
(1,3),
(5,2)
;

SELECT * FROM Proveedores;
SELECT * FROM Clientes;
SELECT * FROM Compras;
SELECT Proveedores.nombre_proveedor, Compras.total_compra
FROM Proveedores JOIN Compras ON Proveedores.id_proveedor = Compras.id_proveedor;


