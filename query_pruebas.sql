USE GD1C2020


select * from LOS_BORBOTONES.TIPO_HABITACION

select * from gd_esquema.Maestra

select * from LOS_BORBOTONES.vuelo


select count(*),'0'+ltrim(str(month(factura_fecha)))+ltrim(str(year(factura_fecha))),
		 vuelo_aerolinea_codigo,
		 year(getdate())-year(cliente_fecha_nac),
		 factura_sucursal_id,
		 vuelo_avion_id,
		 butaca_tipo_butaca_codigo,
		 vuelo_ruta_aerea_id,
		 avg(pasaje_costo),
		 avg(pasaje_precio),
		 count(*),
		 sum(pasaje_precio)-sum(pasaje_costo)
from LOS_BORBOTONES.PASAJE
join LOS_BORBOTONES.FACTURA on factura_numero = pasaje_factura_numero
join LOS_BORBOTONES.VUELO on vuelo_codigo = pasaje_vuelo_codigo
join LOS_BORBOTONES.CLIENTE on cliente_id = factura_cliente_id
join LOS_BORBOTONES.BUTACA on butaca_id = pasaje_butaca_id
group by '0'+ltrim(str(month(factura_fecha)))+ltrim(str(year(factura_fecha))),
		 vuelo_aerolinea_codigo,
		 year(getdate())-year(cliente_fecha_nac),
		 factura_sucursal_id,
		 vuelo_avion_id,
		 butaca_tipo_butaca_codigo,
		 vuelo_ruta_aerea_id



select count(*),'0'+ltrim(str(month(factura_fecha)))+ltrim(str(year(factura_fecha))),
		 hotel_grupo_hotelario_codigo,
		 year(getdate())-year(cliente_fecha_nac),
		 factura_sucursal_id,
		 habitacion_tipo_habitacion_codigo,
		 avg(estadia_costo),
		 avg(estadia_precio),
		 count(*),
		 sum(estadia_precio)-sum(estadia_costo)
from LOS_BORBOTONES.ESTADIA
join LOS_BORBOTONES.FACTURA on factura_numero = estadia_factura_numero
join LOS_BORBOTONES.HOTEL on hotel_codigo = estadia_hotel_codigo
join LOS_BORBOTONES.CLIENTE on cliente_id = factura_cliente_id
join LOS_BORBOTONES.HABITACION on habitacion_numero = estadia_habitacion_numero and habitacion_hotel_codigo = estadia_hotel_codigo
group by '0'+ltrim(str(month(factura_fecha)))+ltrim(str(year(factura_fecha))),
		 hotel_grupo_hotelario_codigo,
		 year(getdate())-year(cliente_fecha_nac),
		 factura_sucursal_id,
		 habitacion_tipo_habitacion_codigo,






-- esta query te trae todos los pasajes que tienen que estar en la tabla de pasajes pero estan todos marcados como validos
DELETE FROM LOS_BORBOTONES.PASAJE

INSERT INTO LOS_BORBOTONES.PASAJE	
	SELECT P.PASAJE_CODIGO,
			P.PASAJE_COSTO,
			P.PASAJE_PRECIO,
			P.VUELO_CODIGO,
			B.BUTACA_ID,
			M.FACTURA_NRO,
			P.COMPRA_NUMERO,
			1 as pasaje_valido
	FROM gd_esquema.Maestra P
	JOIN LOS_BORBOTONES.TIPO_BUTACA ON P.BUTACA_TIPO = tipo_butaca_detalle
	JOIN LOS_BORBOTONES.BUTACA B ON B.butaca_tipo_butaca_codigo = tipo_butaca_codigo AND B.butaca_avion_id = P.AVION_IDENTIFICADOR AND B.butaca_numero = P.BUTACA_NUMERO
	LEFT JOIN gd_esquema.Maestra M ON M.pasaje_codigo = P.PASAJE_CODIGO and m.FACTURA_NRO is not null
	WHERE P.PASAJE_CODIGO IS NOT NULL AND P.FACTURA_NRO IS NULL
	ORDER BY m.FACTURA_FECHA desc;

UPDATE P SET P.pasaje_valido = 0
FROM LOS_BORBOTONES.PASAJE P
JOIN LOS_BORBOTONES.FACTURA F ON F.factura_numero = P.pasaje_factura_numero
WHERE P.pasaje_factura_numero IS NOT NULL AND (SELECT COUNT(*)
												FROM LOS_BORBOTONES.PASAJE R
												JOIN LOS_BORBOTONES.FACTURA G ON G.factura_numero = R.pasaje_factura_numero
												WHERE R.pasaje_vuelo_codigo = P.pasaje_vuelo_codigo 
													AND R.pasaje_butaca_id = P.pasaje_butaca_id 
													AND R.pasaje_codigo != P.pasaje_codigo 
													AND G.factura_numero IS NOT NULL) >= 1
													AND (SELECT G.factura_fecha
															FROM LOS_BORBOTONES.PASAJE R
															JOIN LOS_BORBOTONES.FACTURA G ON G.factura_numero = R.pasaje_factura_numero
															WHERE R.pasaje_vuelo_codigo = P.pasaje_vuelo_codigo 
																AND R.pasaje_butaca_id = P.pasaje_butaca_id 
																AND R.pasaje_codigo != P.pasaje_codigo) < F.factura_fecha


UPDATE P SET P.pasaje_valido = 0
FROM LOS_BORBOTONES.PASAJE P
WHERE P.pasaje_factura_numero IS NULL AND (SELECT COUNT(*)
											FROM LOS_BORBOTONES.PASAJE R
											WHERE R.pasaje_vuelo_codigo = P.pasaje_vuelo_codigo 
												AND R.pasaje_butaca_id = P.pasaje_butaca_id
												AND R.pasaje_codigo != P.pasaje_codigo 
												AND R.pasaje_factura_numero IS NOT NULL) >= 1

UPDATE P SET P.pasaje_valido = 0
FROM LOS_BORBOTONES.PASAJE P
JOIN LOS_BORBOTONES.COMPRA_EMPRESA_TURISMO ON P.pasaje_compra_numero = compra_empr_numero
WHERE P.pasaje_factura_numero IS NULL AND (SELECT COUNT(*)
											FROM LOS_BORBOTONES.PASAJE R
											WHERE R.pasaje_vuelo_codigo = P.pasaje_vuelo_codigo 
												AND R.pasaje_butaca_id = P.pasaje_butaca_id
												AND R.pasaje_codigo != P.pasaje_codigo 
												AND R.pasaje_factura_numero IS NULL) >= 1
											AND (SELECT pasaje_valido
													FROM LOS_BORBOTONES.PASAJE R
													WHERE R.pasaje_vuelo_codigo = P.pasaje_vuelo_codigo 
													AND R.pasaje_butaca_id = P.pasaje_butaca_id
													AND R.pasaje_codigo != P.pasaje_codigo 
													AND R.pasaje_factura_numero IS NULL) = 1


SELECT * FROM LOS_BORBOTONES.PASAJE LEFT JOIN LOS_BORBOTONES.FACTURA ON factura_numero = pasaje_factura_numero ORDER BY factura_fecha

SELECT * FROM LOS_BORBOTONES.PASAJE WHERE pasaje_vuelo_codigo = 6667 AND pasaje_butaca_id = 1830


SELECT PASAJE_CODIGO FROM gd_esquema.Maestra GROUP BY PASAJE_CODIGO HAVING COUNT(*)>2
SELECT PASAJE_CODIGO,
				PASAJE_COSTO,
				PASAJE_PRECIO,
				VUELO_CODIGO,
				BUTACA_NUMERO,
				BUTACA_TIPO,
				FACTURA_NRO,
				FACTURA_FECHA,
				COMPRA_NUMERO 
		FROM gd_esquema.Maestra
		WHERE PASAJE_CODIGO IS NOT NULL
		ORDER BY FACTURA_FECHA

SELECT PASAJE_CODIGO, VUELO_CODIGO, PASAJE_COSTO, PASAJE_PRECIO, BUTACA_NUMERO, BUTACA_TIPO, AVION_IDENTIFICADOR, FACTURA_NRO, FACTURA_FECHA, VUELO_FECHA_SALUDA, VUELO_FECHA_LLEGADA, CLIENTE_DNI, CLIENTE_APELLIDO
FROM GD1C2020.gd_esquema.Maestra m
WHERE PASAJE_CODIGO IS NOT NULL
ORDER BY VUELO_CODIGO, BUTACA_NUMERO, BUTACA_TIPO, PASAJE_CODIGO desc, FACTURA_FECHA desc

select BUTACA_NUMERO, BUTACA_TIPO, VUELO_CODIGO from gd_esquema.Maestra group by BUTACA_NUMERO, BUTACA_TIPO, VUELO_CODIGO having count(*) = 2 and distinct PASAJE_CODIGO


SELECT
	P.PASAJE_CODIGO,
	P.PASAJE_COSTO,
	P.PASAJE_PRECIO,
	P.VUELO_CODIGO,
	B.BUTACA_ID,
	FACTURA_NRO,
	P.COMPRA_NUMERO,
	1
FROM gd_esquema.Maestra P
JOIN LOS_BORBOTONES.TIPO_BUTACA ON P.BUTACA_TIPO = tipo_butaca_detalle
JOIN LOS_BORBOTONES.BUTACA B ON B.butaca_tipo_butaca_codigo = tipo_butaca_codigo AND B.butaca_avion_id = P.AVION_IDENTIFICADOR AND B.butaca_numero = P.BUTACA_NUMERO
WHERE P.PASAJE_CODIGO IS NOT NULL AND P.FACTURA_NRO IS NOT NULL
ORDER BY FACTURA_FECHA;

select * from LOS_BORBOTONES.FACTURA

SELECT P.PASAJE_CODIGO,
				P.PASAJE_COSTO,
				P.PASAJE_PRECIO,
				P.VUELO_CODIGO,
				B.BUTACA_ID,
				P.FACTURA_NRO,
				P.COMPRA_NUMERO,
				m.pasaje_factura_numero,
				(SELECT FACTURA_FECHA FROM LOS_BORBOTONES.FACTURA  WHERE factura_numero = M.pasaje_factura_numero) as fecha
		FROM gd_esquema.Maestra P
		JOIN LOS_BORBOTONES.TIPO_BUTACA ON P.BUTACA_TIPO = tipo_butaca_detalle
		JOIN LOS_BORBOTONES.BUTACA B ON B.butaca_tipo_butaca_codigo = tipo_butaca_codigo AND B.butaca_avion_id = P.AVION_IDENTIFICADOR AND B.butaca_numero = P.BUTACA_NUMERO
		LEFT JOIN LOS_BORBOTONES.PASAJE M ON M.pasaje_codigo = P.PASAJE_CODIGO
		WHERE P.PASAJE_CODIGO IS NOT NULL AND P.FACTURA_NRO IS NULL
		ORDER BY (SELECT FACTURA_FECHA FROM LOS_BORBOTONES.FACTURA WHERE factura_numero = M.pasaje_factura_numero);

select PASAJE_CODIGO, VUELO_CODIGO,BUTACA_NUMERO, BUTACA_TIPO ,count(*) from gd_esquema.Maestra where PASAJE_CODIGO is not null and FACTURA_NRO is null group by PASAJE_CODIGO,VUELO_CODIGO,BUTACA_NUMERO, BUTACA_TIPO

SELECT PASAJE_CODIGO, VUELO_CODIGO, PASAJE_COSTO, PASAJE_PRECIO, BUTACA_NUMERO, BUTACA_TIPO, AVION_IDENTIFICADOR, FACTURA_NRO, FACTURA_FECHA, VUELO_FECHA_SALUDA, VUELO_FECHA_LLEGADA, CLIENTE_DNI, CLIENTE_APELLIDO FROM GD1C2020.gd_esquema.Maestra
WHERE PASAJE_CODIGO IS NOT NULL AND FACTURA_NRO IS NOT NULL
ORDER BY VUELO_CODIGO, BUTACA_NUMERO, BUTACA_TIPO, PASAJE_CODIGO DESC, FACTURA_FECHA DESC


SELECT DISTINCT PASAJE_CODIGO, VUELO_CODIGO, PASAJE_COSTO, PASAJE_PRECIO, BUTACA_NUMERO, BUTACA_TIPO, AVION_IDENTIFICADOR, FACTURA_NRO, VUELO_FECHA_SALUDA, VUELO_FECHA_LLEGADA, CLIENTE_DNI, CLIENTE_APELLIDO FROM GD1C2020.gd_esquema.Maestra
WHERE PASAJE_CODIGO IS NOT NULL
ORDER BY PASAJE_CODIGO

select COMPRA_NUMERO, COUNT(*) from gd_esquema.Maestra GROUP BY COMPRA_NUMERO

SELECT * FROM LOS_BORBOTONES.PASAJE where pasaje_valido = 0

select count(*) from gd_esquema.Maestra where PASAJE_CODIGO is not null and FACTURA_NRO is null

select * from gd_esquema.Maestra where VUELO_CODIGO = 8099 order by BUTACA_NUMERO

select BUTACA_NUMERO, BUTACA_TIPO, VUELO_CODIGO,count(*) from gd_esquema.Maestra where PASAJE_CODIGO is not null group by BUTACA_NUMERO, BUTACA_TIPO, VUELO_CODIGO having count(*)>2

select PASAJE_CODIGO, VUELO_CODIGO, BUTACA_TIPO, BUTACA_NUMERO from gd_esquema.Maestra

-- Me trae aquellos DNI repetidos m�s de una vez
SELECT CLIENTE_DNI, COUNT(*) FROM gd_esquema.Maestra
GROUP BY CLIENTE_DNI
HAVING COUNT(*) > 1

-- Me trae dos personas distintas con el mismo DNI
SELECT CLIENTE_DNI, CLIENTE_APELLIDO, CLIENTE_NOMBRE FROM gd_esquema.Maestra
WHERE CLIENTE_DNI = '65334031'

SELECT ESTADIA_CODIGO, COUNT(*) FROM gd_esquema.Maestra
GROUP BY ESTADIA_CODIGO
HAVING COUNT(*) > 0
ORDER BY COUNT(*)

SELECT AVION_IDENTIFICADOR, AVION_MODELO, COUNT(*), VUELO_CODIGO FROM GD1C2020.gd_esquema.Maestra
GROUP BY AVION_IDENTIFICADOR, AVION_MODELO, VUELO_CODIGO
HAVING COUNT(*) > 1
ORDER BY VUELO_CODIGO

SELECT  DISTINCT RUTA_AEREA_CODIGO, RUTA_AEREA_CIU_ORIG, RUTA_AEREA_CIU_DEST FROM gd_esquema.Maestra
WHERE RUTA_AEREA_CODIGO IS NOT NULL
ORDER BY RUTA_AEREA_CODIGO

SELECT DISTINCT RUTA_AEREA_CODIGO, COUNT(*) FROM gd_esquema.Maestra
GROUP BY RUTA_AEREA_CODIGO

SELECT BUTACA_NUMERO, BUTACA_TIPO, VUELO_CODIGO, AVION_IDENTIFICADOR, AVION_MODELO, FACTURA_NRO FROM gd_esquema.Maestra

-- Me trae todos los clientes diferentes
SELECT  CLIENTE_APELLIDO, CLIENTE_NOMBRE, CLIENTE_DNI, CLIENTE_FECHA_NAC, CLIENTE_MAIL, CLIENTE_TELEFONO
FROM gd_esquema.Maestra C
WHERE C.CLIENTE_DNI IS NOT NULL
GROUP BY C.CLIENTE_APELLIDO, C.CLIENTE_NOMBRE, C.CLIENTE_DNI, C.CLIENTE_FECHA_NAC, C.CLIENTE_MAIL, C.CLIENTE_TELEFONO
ORDER BY C.CLIENTE_DNI

-- Me trae todas las sucursales diferentes
SELECT SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TELEFONO FROM gd_esquema.Maestra
WHERE SUCURSAL_DIR IS NOT NULL
GROUP BY SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TELEFONO
ORDER BY SUCURSAL_MAIL

-- Me trae Grupos Hotelarios
SELECT EMPRESA_RAZON_SOCIAL
FROM gd_esquema.Maestra
WHERE ESTADIA_CODIGO IS NOT NULL
GROUP BY EMPRESA_RAZON_SOCIAL

-- Me trae Aerolineas
SELECT EMPRESA_RAZON_SOCIAL
FROM gd_esquema.Maestra
WHERE PASAJE_CODIGO IS NOT NULL
GROUP BY EMPRESA_RAZON_SOCIAL
ORDER BY EMPRESA_RAZON_SOCIAL

-- Me trae las distintas ciudades de origen
SELECT DISTINCT RUTA_AEREA_CIU_ORIG
FROM gd_esquema.Maestra
WHERE RUTA_AEREA_CIU_ORIG IS NOT NULL
ORDER BY RUTA_AEREA_CIU_ORIG

-- Me trae las distintas ciudades de destino
SELECT DISTINCT RUTA_AEREA_CIU_DEST
FROM gd_esquema.Maestra
WHERE RUTA_AEREA_CIU_DEST IS NOT NULL
ORDER BY RUTA_AEREA_CIU_DEST

-- Me trae los distintos tipos de habitacion con su codigo (5 tipos)
SELECT TIPO_HABITACION_CODIGO, TIPO_HABITACION_DESC FROM GD1C2020.gd_esquema.Maestra
WHERE TIPO_HABITACION_CODIGO IS NOT NULL
GROUP BY TIPO_HABITACION_CODIGO, TIPO_HABITACION_DESC
ORDER BY 1

-- Operaciones con HOTELES. Tanto compras como ventas
SELECT * FROM GD1C2020.gd_esquema.Maestra
WHERE HOTEL_CALLE IS NOT NULL

--- Me trae los distintos aviones y su modelo --- 
SELECT AVION_IDENTIFICADOR, AVION_MODELO FROM GD1C2020.gd_esquema.Maestra
WHERE AVION_IDENTIFICADOR IS NOT NULL
GROUP BY AVION_IDENTIFICADOR, AVION_MODELO
ORDER BY AVION_IDENTIFICADOR

--- Me trae los distintos tipos de butaca ---
SELECT DISTINCT BUTACA_TIPO FROM GD1C2020.gd_esquema.Maestra
WHERE BUTACA_TIPO IS NOT NULL
ORDER BY BUTACA_TIPO

-- Posible migracion para Hoteles
SELECT HOTEL_CALLE, HOTEL_NRO_CALLE, HOTEL_CANTIDAD_ESTRELLAS, grupo_hotelario_codigo
FROM gd_esquema.Maestra JOIN LOS_BORBOTONES.GRUPO_HOTELARIO ON EMPRESA_RAZON_SOCIAL = grupo_hotelario_razon_social
WHERE EMPRESA_RAZON_SOCIAL IS NOT NULL AND HOTEL_CALLE IS NOT NULL
GROUP BY HOTEL_CALLE, HOTEL_NRO_CALLE, HOTEL_CANTIDAD_ESTRELLAS, grupo_hotelario_codigo
ORDER BY grupo_hotelario_codigo, HOTEL_CALLE

SELECT DISTINCT HOTEL_CALLE, HOTEL_NRO_CALLE, EMPRESA_RAZON_SOCIAL FROM GD1C2020.gd_esquema.Maestra
WHERE HOTEL_CALLE IS NOT NULL
ORDER BY 3
go

------------------------------ RUTAS AEREAS ------------------------------ 

CREATE FUNCTION LOS_BORBOTONES.get_codigo_ciudad_by_detalle_ciudad(@detalleCiudad NVARCHAR(255))
RETURNS INT
BEGIN
	RETURN (SELECT ciudad_codigo FROM LOS_BORBOTONES.CIUDAD WHERE ciudad_detalle = @detalleCiudad)
END
GO

-- Posible codigo para migracion Rutas Aereas
SELECT RA.RUTA_AEREA_CODIGO, C1.ciudad_codigo, C2.ciudad_codigo
FROM GD1C2020.gd_esquema.Maestra RA 
	INNER JOIN LOS_BORBOTONES.CIUDAD C1 ON RA.RUTA_AEREA_CIU_ORIG = C1.ciudad_detalle
	INNER JOIN LOS_BORBOTONES.CIUDAD C2 ON RA.RUTA_AEREA_CIU_DEST = C2.ciudad_detalle
WHERE RUTA_AEREA_CODIGO IS NOT NULL
GROUP BY RA.RUTA_AEREA_CODIGO, C1.ciudad_codigo, C2.ciudad_codigo
ORDER BY RA.RUTA_AEREA_CODIGO

SELECT RA.RUTA_AEREA_CODIGO, (SELECT ciudad_codigo FROM LOS_BORBOTONES.CIUDAD WHERE ciudad_detalle = RA.RUTA_AEREA_CIU_ORIG), (SELECT ciudad_codigo FROM LOS_BORBOTONES.CIUDAD WHERE ciudad_detalle = RA.RUTA_AEREA_CIU_DEST)
FROM GD1C2020.gd_esquema.Maestra RA 
WHERE RUTA_AEREA_CODIGO IS NOT NULL
GROUP BY RA.RUTA_AEREA_CODIGO, RA.RUTA_AEREA_CIU_ORIG, RA.RUTA_AEREA_CIU_DEST
ORDER BY RA.RUTA_AEREA_CODIGO

SELECT RA.RUTA_AEREA_CODIGO, LOS_BORBOTONES.get_codigo_ciudad_by_detalle_ciudad(RA.RUTA_AEREA_CIU_ORIG), LOS_BORBOTONES.get_codigo_ciudad_by_detalle_ciudad(RA.RUTA_AEREA_CIU_DEST)
FROM GD1C2020.gd_esquema.Maestra RA 
WHERE RUTA_AEREA_CODIGO IS NOT NULL
GROUP BY RA.RUTA_AEREA_CODIGO, RA.RUTA_AEREA_CIU_ORIG, RA.RUTA_AEREA_CIU_DEST
ORDER BY RA.RUTA_AEREA_CODIGO


------------------------------ BUTACAS ------------------------------ 

SELECT DISTINCT BUTACA_NUMERO, BUTACA_TIPO, AVION_IDENTIFICADOR FROM GD1C2020.gd_esquema.Maestra
WHERE BUTACA_NUMERO IS NOT NULL
ORDER BY AVION_IDENTIFICADOR, BUTACA_NUMERO, BUTACA_TIPO

-- Ejemplo de codigo para migracion BUTACA
SELECT CONCAT('N�', CONVERT(nvarchar, M.BUTACA_NUMERO), ' - ', 'T', CONVERT(nvarchar, TB.tipo_butaca_codigo), ' - ', A.avion_id), M.BUTACA_NUMERO, TB.tipo_butaca_codigo, A.avion_id
FROM GD1C2020.gd_esquema.Maestra M
	INNER JOIN GD1C2020.LOS_BORBOTONES.AVION A ON M.AVION_IDENTIFICADOR = A.avion_id
	INNER JOIN GD1C2020.LOS_BORBOTONES.TIPO_BUTACA TB ON M.BUTACA_TIPO = TB.tipo_butaca_detalle
WHERE M.BUTACA_NUMERO IS NOT NULL
GROUP BY M.BUTACA_NUMERO, TB.tipo_butaca_codigo, A.avion_id
ORDER BY A.avion_id, M.BUTACA_NUMERO, TB.tipo_butaca_codigo

-- Ejemplo de codigo para BUTACA_ID
SELECT CONCAT(CONVERT(nvarchar, BUTACA_NUMERO),' - ' , BUTACA_TIPO,' - ' , AVION_IDENTIFICADOR) , BUTACA_NUMERO, BUTACA_TIPO, AVION_IDENTIFICADOR FROM GD1C2020.gd_esquema.Maestra
WHERE BUTACA_NUMERO IS NOT NULL
GROUP BY BUTACA_NUMERO, BUTACA_TIPO, AVION_IDENTIFICADOR
ORDER BY BUTACA_NUMERO, BUTACA_TIPO, AVION_IDENTIFICADOR


------------------------------ VUELOS ------------------------------ 

-- Me trae 4750 vuelos diferentes
SELECT DISTINCT VUELO_CODIGO, VUELO_FECHA_SALUDA, VUELO_FECHA_LLEGADA, AVION_IDENTIFICADOR, RUTA_AEREA_CODIGO, RUTA_AEREA_CIU_ORIG, RUTA_AEREA_CIU_DEST, EMPRESA_RAZON_SOCIAL FROM GD1C2020.gd_esquema.Maestra
WHERE VUELO_CODIGO IS NOT NULL
ORDER BY VUELO_CODIGO

-- PRIMER INTENTO MIGRACION VUELOS
SELECT M.VUELO_CODIGO, M.VUELO_FECHA_SALUDA, M.VUELO_FECHA_LLEGADA, A.avion_id, RA.ruta_aerea_codigo, RA.ruta_aerea_ciu_origen, RA.ruta_aerea_ciu_destino, AE.aerolinea_codigo
FROM GD1C2020.gd_esquema.Maestra M
	INNER JOIN GD1C2020.LOS_BORBOTONES.AVION A ON M.AVION_IDENTIFICADOR = A.avion_id
	INNER JOIN GD1C2020.LOS_BORBOTONES.RUTA_AEREA RA ON M.RUTA_AEREA_CODIGO = RA.ruta_aerea_codigo -- AND M.RUTA_AEREA_CIU_ORIG = RA.ruta_aerea_ciu_origen AND M.RUTA_AEREA_CIU_DEST = RA.ruta_aerea_ciu_destino
	INNER JOIN GD1C2020.LOS_BORBOTONES.AEROLINEA AE ON M.EMPRESA_RAZON_SOCIAL = AE.aerolinea_razon_social
WHERE M.VUELO_CODIGO IS NOT NULL
GROUP BY M.VUELO_CODIGO, M.VUELO_FECHA_SALUDA, M.VUELO_FECHA_LLEGADA, A.avion_id, RA.ruta_aerea_codigo, RA.ruta_aerea_ciu_origen, RA.ruta_aerea_ciu_destino, AE.aerolinea_codigo
ORDER BY M.VUELO_CODIGO, M.VUELO_FECHA_SALUDA

-- SEGUNDO INTENTO MIGRACION VUELOS
SELECT M.VUELO_CODIGO, M.VUELO_FECHA_SALUDA, M.VUELO_FECHA_LLEGADA, M.AVION_IDENTIFICADOR, M.RUTA_AEREA_CODIGO, (SELECT ciudad_codigo FROM LOS_BORBOTONES.CIUDAD WHERE ciudad_detalle = M.RUTA_AEREA_CIU_ORIG), (SELECT ciudad_codigo FROM LOS_BORBOTONES.CIUDAD WHERE ciudad_detalle = M.RUTA_AEREA_CIU_DEST), AE.aerolinea_codigo
FROM GD1C2020.gd_esquema.Maestra M
	INNER JOIN GD1C2020.LOS_BORBOTONES.AEROLINEA AE ON M.EMPRESA_RAZON_SOCIAL = AE.aerolinea_razon_social
WHERE M.VUELO_CODIGO IS NOT NULL
GROUP BY M.VUELO_CODIGO, M.VUELO_FECHA_SALUDA, M.VUELO_FECHA_LLEGADA, M.AVION_IDENTIFICADOR, M.RUTA_AEREA_CODIGO, M.RUTA_AEREA_CIU_ORIG, M.RUTA_AEREA_CIU_DEST, AE.aerolinea_codigo
ORDER BY M.VUELO_CODIGO, M.VUELO_FECHA_SALUDA


------------------------------ HABITACIONES ------------------------------ 

-- Me trae 424 habitaciones diferentes en total (entre todos los hoteles)
SELECT DISTINCT HABITACION_FRENTE,HABITACION_NUMERO,HABITACION_PISO,HOTEL_NRO_CALLE,HOTEL_CALLE FROM gd_esquema.Maestra
WHERE HOTEL_CALLE IS NOT NULL
ORDER BY HOTEL_CALLE, HABITACION_NUMERO

-- Posible migracion para tabla HABITACION
SELECT M.HABITACION_NUMERO, H.hotel_codigo, M.HABITACION_PISO, M.HABITACION_FRENTE, M.HABITACION_COSTO, M.HABITACION_PRECIO, TH.tipo_habitacion_codigo
FROM GD1C2020.gd_esquema.Maestra M
	INNER JOIN GD1C2020.LOS_BORBOTONES.TIPO_HABITACION TH ON M.TIPO_HABITACION_CODIGO = TH.tipo_habitacion_codigo
	INNER JOIN GD1C2020.LOS_BORBOTONES.HOTEL H ON M.HOTEL_CALLE = H.hotel_calle AND M.HOTEL_NRO_CALLE = H.hotel_nro_calle
WHERE H.hotel_codigo IS NOT NULL
--WHERE M.HOTEL_CALLE IS NOT NULL
GROUP BY M.HABITACION_NUMERO, H.hotel_codigo, M.HABITACION_PISO, M.HABITACION_FRENTE, M.HABITACION_COSTO, M.HABITACION_PRECIO, TH.tipo_habitacion_codigo
ORDER BY H.hotel_codigo, M.HABITACION_NUMERO

/* Para comprobar que la migracion de HABITACIONES es correcta
SELECT * FROM GD1C2020.LOS_BORBOTONES.HOTEL

SELECT HABITACION_NUMERO, HOTEL_CALLE, HOTEL_NRO_CALLE, HABITACION_PISO, HABITACION_FRENTE, TIPO_HABITACION_CODIGO, EMPRESA_RAZON_SOCIAL
FROM GD1C2020.gd_esquema.Maestra
WHERE HOTEL_CALLE IS NOT NULL
GROUP BY HABITACION_NUMERO, HOTEL_CALLE, HOTEL_NRO_CALLE, HABITACION_PISO, HABITACION_FRENTE, TIPO_HABITACION_CODIGO, EMPRESA_RAZON_SOCIAL
ORDER BY EMPRESA_RAZON_SOCIAL, HOTEL_CALLE, HABITACION_NUMERO
*/


------------------------------ COMPRAS ------------------------------ 

-- Me trae 20438 compras diferentes
SELECT DISTINCT COMPRA_NUMERO FROM GD1C2020.gd_esquema.Maestra

-- Migracion tabla COMPRA
SELECT COMPRA_NUMERO, COMPRA_FECHA FROM GD1C2020.gd_esquema.Maestra
GROUP BY COMPRA_NUMERO, COMPRA_FECHA
ORDER BY COMPRA_FECHA, COMPRA_NUMERO


------------------------------ ESTADIAS ------------------------------

SELECT COMPRA_NUMERO, COMPRA_FECHA, ESTADIA_CODIGO, ESTADIA_FECHA_INI, ESTADIA_CANTIDAD_NOCHES, HOTEL_CALLE, HOTEL_NRO_CALLE, HOTEL_CANTIDAD_ESTRELLAS, EMPRESA_RAZON_SOCIAL FROM GD1C2020.gd_esquema.Maestra
WHERE COMPRA_NUMERO IS NOT NULL AND ESTADIA_CODIGO IS NOT NULL AND FACTURA_NRO IS NULL
ORDER BY ESTADIA_CODIGO

SELECT DISTINCT ESTADIA_CODIGO, ESTADIA_FECHA_INI, ESTADIA_CANTIDAD_NOCHES, HOTEL_CALLE, HOTEL_NRO_CALLE, HABITACION_NUMERO, TIPO_HABITACION_DESC, FACTURA_NRO, CLIENTE_DNI, CLIENTE_FECHA_NAC FROM GD1C2020.gd_esquema.Maestra
WHERE FACTURA_NRO IS NOT NULL AND ESTADIA_CODIGO IS NOT NULL
ORDER BY ESTADIA_CODIGO, CLIENTE_DNI

SELECT DISTINCT COMPRA_NUMERO FROM GD1C2020.gd_esquema.Maestra
WHERE ESTADIA_CODIGO IS NOT NULL AND COMPRA_NUMERO IS NOT NULL AND FACTURA_NRO IS NULL

-- Posible migracion ESTADIA
SELECT	M.ESTADIA_CODIGO,
		M.ESTADIA_FECHA_INI,
		DATEADD(DAY, M.ESTADIA_CANTIDAD_NOCHES, M.ESTADIA_FECHA_INI),
		(SELECT hotel_codigo FROM GD1C2020.LOS_BORBOTONES.HOTEL WHERE hotel_calle = M.HOTEL_CALLE AND hotel_nro_calle = M.HOTEL_NRO_CALLE),
		M.HABITACION_NUMERO,
		(M.HABITACION_PRECIO * M.ESTADIA_CANTIDAD_NOCHES),
		M.FACTURA_NRO,
		M.COMPRA_NUMERO
FROM GD1C2020.gd_esquema.Maestra M
WHERE M.ESTADIA_CODIGO IS NOT NULL AND FACTURA_NRO IS NOT NULL
ORDER BY M.ESTADIA_CODIGO


------------------------------ PRUEBAS DE LAS MIGRACIONES ------------------------------ 

-- Me trae todos los clientes de TABLA CLIENTE CREADA -- 237522 clientes diferentes
SELECT * FROM GD1C2020.LOS_BORBOTONES.CLIENTE

-- Me trae todas las sucursales de TABLA SUCURSAL CREADA -- 6 sucursales
SELECT * FROM GD1C2020.LOS_BORBOTONES.SUCURSAL

-- Me trae todas las aerolineas de TABLA AEROLINEA CREADA -- 13 aerolineas diferentes
SELECT * FROM GD1C2020.LOS_BORBOTONES.AEROLINEA

-- Me trae todos los aviones y sus modelos de TABLA AVION CREADA --  33 aviones diferentes
SELECT * FROM GD1C2020.LOS_BORBOTONES.AVION

-- Me trae todas las ciudades de TABLA CIUDAD CREADA -- 38 ciudades diferentes
SELECT * FROM GD1C2020.LOS_BORBOTONES.CIUDAD

-- Me trae todas las rutas aereas de TABLA RUTA AEREA CREADA -- 74 rutas aereas diferentes (codigo, ciu_origen, ciu_destino)
SELECT * FROM GD1C2020.LOS_BORBOTONES.RUTA_AEREA

-- Me trae todos los tipos de butaca de TABLA TIPO_BUTACA CREADA -- 4 tipos de butaca diferentes
SELECT * FROM GD1C2020.LOS_BORBOTONES.TIPO_BUTACA

-- Me trae todas las butacas de TABLA BUTACA CREADA -- 2034 butacas diferentes
SELECT * FROM GD1C2020.LOS_BORBOTONES.BUTACA

-- Me trae todos los tipos de grupos hotelarios de TABLA GRUPOS_HOTELARIOS CREADA -- 9 grupos hotelarios distintos
SELECT * FROM GD1C2020.LOS_BORBOTONES.GRUPO_HOTELARIO

-- Me trae todos los hoteles de TABLA HOTEL CREADA -- 20 hoteles diferentes
SELECT * FROM GD1C2020.LOS_BORBOTONES.HOTEL

-- Me trae todos los tipos de habitacion de TABLA TIPO_HABITACION CREADA -- 5 tipos de habitacion diferentes
SELECT * FROM GD1C2020.LOS_BORBOTONES.TIPO_HABITACION

-- Me trae todas las habitaciones de TABLA HABITACION CREADA -- 424 habitaciones diferentes entre todos los hoteles
-- Me las guarda diferente a como resuelve la consulta originalmente. Originalmente es primero todas las HAB de UN HOTEL, y hace LA HAB 0 de TODOS los HOTELES
SELECT * FROM GD1C2020.LOS_BORBOTONES.HABITACION

-- Me trae todos los diferentes vuelos DE TABLA VUELO CREADA -- 4750 vuelos diferentes
SELECT * FROM GD1C2020.LOS_BORBOTONES.VUELO

-- Me trae todas las compras de TABLA COMPRA CREADA -- 20438 compras diferentes
-- Me las trae ordenadas por COMPRA_NUMERO en vez de COMPRA_FECHA (RARO, en el script y la consulta de prueba se ordena primero por FECHA y despues NUMERO)
SELECT * FROM GD1C2020.LOS_BORBOTONES.COMPRA_EMPRESA_TURISMO

-- Me trae todas las diferentes estadias de TABLA ESTADIA CREADA -- XX estadias diferentes
SELECT * FROM GD1C2020.LOS_BORBOTONES.ESTADIA