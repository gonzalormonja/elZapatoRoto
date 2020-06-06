/*Consulta la facturación de un cliente en específico.*/
SELECT 
	facturacion.factura_id,
	facturacion.fecha,
	clientes.identificacion,
	clientes.nombre,
	tmp.productos as productos,
	SUM(tmp.precio) AS subTotal,
	SUM(tmp.precio)*(facturacion.porcentajeImpuesto/100) as impuestos,
	SUM(tmp.precio)*(facturacion.porcentajeDescuento/100) as descuento,
		SUM(tmp.precio) +
		SUM(tmp.precio)*(facturacion.porcentajeImpuesto/100)-
		SUM(tmp.precio)*(facturacion.porcentajeDescuento/100)
	as total
FROM facturacion
INNER JOIN clientes ON facturacion.cliente_id=clientes.cliente_id
INNER JOIN (
			/*genero una tabla intermedia para poder obtener los valores de los precios y los productos de cada factura*/
			select 
				pf.factura_id,
				stuff (
					(SELECT 
						','+ p2.nombre 
					from productos p2 
					inner join productosFacutacion pf2 on pf2.producto_id=p2.producto_id 
					where pf2.factura_id=f.factura_id 
					for xml path('')),1,1,''
				) 
				as productos,
				(select 
					precios.precio 
				from precios 
				where precios.producto_id=pf.producto_id 
					  AND fecha= (select
									max(pr.fecha)
								  from precios pr 
								  where pr.producto_id=pf.producto_id 
								  AND precios.producto_id=pr.producto_id 
								  AND pr.fecha<f.fecha)
				) AS precio
			from productosFacutacion pf 
			inner join productos prod on prod.producto_id=pf.producto_id
			inner join facturacion f on f.factura_id=pf.factura_id
			where f.factura_id=f.factura_id
) as tmp on facturacion.factura_id=tmp.factura_id
WHERE clientes.identificacion=
/*COLOCAR ACA EL CLIENTE A CONSULTAR ->*/'40984288'
GROUP BY facturacion.factura_id,
	facturacion.fecha,
	clientes.identificacion,
	clientes.nombre,
	porcentajeDescuento,
	porcentajeImpuesto,
	tmp.productos;


/*Consulta la facturación de un producto en específico.*/
SELECT 
	productos.producto_id,
	productos.nombre,
	facturacion.factura_id,
	facturacion.fecha,
	clientes.identificacion,
	clientes.nombre,
	tmp.precio*(facturacion.porcentajeImpuesto/100) as impuestos,
	tmp.precio*(facturacion.porcentajeDescuento/100) as descuento,
	tmp.precio+tmp.precio*(facturacion.porcentajeImpuesto/100)-tmp.precio*(facturacion.porcentajeDescuento/100) as total
FROM facturacion
INNER JOIN clientes ON facturacion.cliente_id=clientes.cliente_id
INNER JOIN productosFacutacion ON facturacion.factura_id=productosFacutacion.factura_id
INNER JOIN productos on productos.producto_id=productosFacutacion.producto_id
INNER JOIN (
			/*GENERO UNA TABLA INTERMEDIA PARA CONSULTAR LOS PRECIOS DE LOS PRODUCTOS EN CADA FACTURA REGISTRADA EN SU FECHA*/
			select 
				pf.factura_id,
				pf.producto_id,
				(select 
					precios.precio 
				from precios 
				where precios.producto_id=pf.producto_id 
					  AND fecha=(select 
									max(pr.fecha) 
								from precios pr 
								where pr.producto_id=pf.producto_id 
								AND precios.producto_id=pr.producto_id 
								AND pr.fecha<f.fecha)
				) AS precio
			from productosFacutacion pf 
			inner join facturacion f on f.factura_id=pf.factura_id
			where f.factura_id=f.factura_id
) as tmp on tmp.producto_id=productos.producto_id AND tmp.factura_id=facturacion.factura_id
WHERE productos.producto_id=
/*COLOCAR ACA EL PRODUCTO A CONSULTAR ->*/'1';


/*Consulta la facturación de un rango de fechas.*/
SELECT
	facturacion.factura_id,
	facturacion.fecha,
	clientes.identificacion,
	clientes.nombre,
	tmp.productos as productos,
	SUM(tmp.precio) AS subTotal,
	SUM(tmp.precio)*(facturacion.porcentajeImpuesto/100) as impuestos,
	SUM(tmp.precio)*(facturacion.porcentajeDescuento/100) as descuento,
		SUM(tmp.precio) +
		SUM(tmp.precio)*(facturacion.porcentajeImpuesto/100)-
		SUM(tmp.precio)*(facturacion.porcentajeDescuento/100)
	as total
FROM facturacion
INNER JOIN clientes ON facturacion.cliente_id=clientes.cliente_id
INNER JOIN (
			/*GENERO UNA TABLA INTERMEDIA PARA CONSULTAR LOS PRECIOS Y LOS NOMBRES DE LOS PRODUCTOS EN CADA FACTURA REGISTRADA EN SU FECHA*/
			select 
				pf.factura_id,
				pf.producto_id,
				stuff (
					(SELECT 
						','+ p2.nombre 
					from productos p2 
					inner join productosFacutacion pf2 on pf2.producto_id=p2.producto_id 
					where pf2.factura_id=f.factura_id 
					for xml path('')),1,1,''
				) 
				as productos,
				(select precios.precio from precios where precios.producto_id=pf.producto_id AND 
				fecha=
					(select 
						max(pr.fecha) 
					from precios pr 
					where pr.producto_id=pf.producto_id AND precios.producto_id=pr.producto_id 
						  AND pr.fecha<f.fecha)
				) AS precio
			from productosFacutacion pf 
			inner join facturacion f on f.factura_id=pf.factura_id
			where f.factura_id=f.factura_id
) as tmp on tmp.factura_id=facturacion.factura_id
WHERE facturacion.fecha between
/*COLOCA LAS FECHAS A CONSULTAR ACA ->*/'2020-02-01' and '2020-04-01'
GROUP BY 
	facturacion.factura_id,
	facturacion.fecha,
	clientes.identificacion,
	clientes.nombre,
	porcentajeDescuento,
	porcentajeImpuesto,
	tmp.productos
order by facturacion.fecha DESC;



/*De la facturación, consulta los clientes únicos*/
SELECT 
	distinct c.identificacion,c.nombre 
from clientes c 
inner join facturacion f on f.cliente_id=c.cliente_id;
