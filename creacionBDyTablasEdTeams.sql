	/*SGDB: SQLSERVER*/

	/*CREAR BASE DE DATOS, EJECUTAR SOLO ESTA LINEA*/
	CREATE DATABASE elZapatoRoto;



	/*crear tablas, ejecutar todo lo que esta debajo del comentario junto o por partes*/
	USE elZapatoRoto;
	
	CREATE TABLE productos(
		producto_id INT IDENTITY(1,1) PRIMARY KEY,
		nombre VARCHAR(50) NOT NULL,	
		presentacion VARCHAR(255) DEFAULT(NULL)
	);
	CREATE TABLE precios(
		precio_id INT IDENTITY(1,1) PRIMARY KEY,
		precio DECIMAL NOT NULL,
		producto_id int NOT NULL,
		fecha DATETIME DEFAULT(GETDATE())
		FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
	);
	CREATE TABLE clientes(
		cliente_id INT IDENTITY(1,1) PRIMARY KEY,
		identificacion VARCHAR(50) NOT NULL,	
		nombre VARCHAR(50) NOT NULL,
		pais VARCHAR(50) NOT NULL
	);
	CREATE TABLE inventarios(
		inventario_id INT IDENTITY(1,1) PRIMARY KEY,
		producto_id INT NOT NULL,	
		movimiento bit NOT NULL,
		fecha DATETIME NOT NULL,
		cantidad DECIMAL NOT NULL,
		FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
	);
	CREATE TABLE facturacion(
		factura_id int IDENTITY(1,1) PRIMARY KEY,
		cliente_id int NOT NULL,
		fecha DATETIME NOT NULL DEFAULT(GETDATE()),
		porcentajeImpuesto DECIMAL NOT NULL,
		porcentajeDescuento DECIMAL DEFAULT(0)
		FOREIGN KEY(cliente_id) REFERENCES clientes(cliente_id)
	);
	CREATE TABLE productosFacutacion(
		productoFacturacion_id INT IDENTITY(1,1) PRIMARY KEY,
		factura_id INT NOT NULL,	
		producto_id INT NOT NULL,
		cantidad INT NOT NULL,
		FOREIGN KEY (factura_id) REFERENCES facturacion(factura_id),
		FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
	);
