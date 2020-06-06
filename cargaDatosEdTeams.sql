/*CARGAR DATOS EN LAS TABLAS, ejecutar todo junto*/
use elZapatoRoto;
INSERT INTO clientes VALUES('40984288','Gonzalo Monja','Argentina'),
						   ('40985112','Franco Argento','Argentina'),
						   ('28596541','Pepe Suvenir','Argentina'),
						   ('39985112','Julia Venegas','Argentina'),
						   ('38665112','Javier Tosiga','Argentina'),
						   ('35412112','Lara Valdez','Argentina');
INSERT INTO productos VALUES('zapatilla elsolsito','Zapatilla deportiva masculina'),
							('zapato elsolsito','Zapato informal masculino'),
							('zapatilla elcardo','Zapatillas femeninas deportivas'),
							('zapato nochebuena','Zapato formal masculino'),
							('ojotas redimension','Ojotas'),
							('sandalias butier','Sandalias masculinas'),
							('zapatillas deportivas abrunda','Zapatillas femeninas'),
							('zapato clasico homer','Zapato formal masculino');

INSERT INTO precios VALUES(150.75,1,'2020-02-01 00:00:00'),
						  (190,1,'2020-03-01 00:00:00'),
						  (125.50,2,'2020-02-01 00:00:00'),
						  (200,2,'2020-03-01 00:00:00'),
						  (90,3,'2020-02-01 00:00:00'),
						  (150,3,'2020-03-01 00:00:00'),
						  (140.25,4,'2020-02-01 00:00:00'),
						  (225.75,4,'2020-03-01 00:00:00'),
						  (100,5,'2020-02-01 00:00:00'),
						  (150,5,'2020-03-01 00:00:00'),
						  (215,6,'2020-02-01 00:00:00'),
						  (250,6,'2020-03-01 00:00:00'),
						  (450,7,'2020-02-01 00:00:00'),
						  (500,7,'2020-03-01 00:00:00'),
						  (65,8,'2020-02-01 00:00:00'),
						  (95,8,'2020-03-01 00:00:00');

INSERT INTO inventarios VALUES(1,1,'2020-02-01 00:00:00',5),
							  (2,1,'2020-02-01 00:00:00',25),
							  (3,1,'2020-02-01 00:00:00',13),
							  (4,1,'2020-02-01 00:00:00',2),
							  (5,1,'2020-02-01 00:00:00',15),
							  (6,1,'2020-02-01 00:00:00',12),
							  (7,1,'2020-02-01 00:00:00',8),
							  (8,1,'2020-02-01 00:00:00',10),
							  (1,0,'2020-02-04 16:00:00',1),
							  (5,0,'2020-02-04 16:00:00',1),
							  (3,0,'2020-02-04 16:00:00',1),
							  (8,0,'2020-02-05 17:00:00',1),
							  (5,0,'2020-02-07 10:00:00',1),
							  (4,0,'2020-02-07 10:00:00',1),
							  (4,0,'2020-02-10 16:30:00',1),
							  (5,0,'2020-02-12 09:00:00',1),
							  (2,0,'2020-03-05 16:00:00',1),
							  (8,0,'2020-03-12 08:00:00',1),
							  (6,0,'2020-03-15 15:15:00',2),
							  (2,0,'2020-03-15 15:00:00',1),
							  (5,0,'2020-03-15 12:15:00',1),
							  (1,0,'2020-03-15 12:15:00',1);

INSERT INTO facturacion VALUES(1,'2020-02-04 16:00:00',21,5),
							  (2,'2020-02-05 17:00:00',21,0),
							  (3,'2020-03-15 15:00:00',10.5,15),
							  (4,'2020-02-12 09:00:00',21,0),
							  (1,'2020-03-12 08:00:00',21,5),
							  (5,'2020-02-10 16:30:00',21,0),
							  (3,'2020-03-15 15:15:00',21,0),
							  (6,'2020-03-05 16:00:00',21,15),
							  (3,'2020-02-07 10:00:00',10.5,7.5),
							  (1,'2020-03-15 12:15:00',21,25);
INSERT INTO productosFacutacion VALUES(1,1,1),(1,5,1),(1,3,1),
									  (2,8,1),
									  (3,2,1),
									  (4,5,1),
									  (5,8,1),
									  (6,4,1),
									  (7,6,2),
									  (8,2,1),
									  (9,4,1),(9,5,1),
									  (10,5,1),(10,1,1);
