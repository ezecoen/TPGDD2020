USE GD1C2020

SELECT CLIENTE_DNI, COUNT(*) FROM gd_esquema.Maestra
GROUP BY CLIENTE_DNI
HAVING COUNT(*) > 1

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

SELECT SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TELEFONO FROM gd_esquema.Maestra
WHERE SUCURSAL_DIR IS NOT NULL
GROUP BY SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TELEFONO
ORDER BY SUCURSAL_MAIL

select EMPRESA_RAZON_SOCIAL
from gd_esquema.Maestra
where ESTADIA_CODIGO is not null
group by EMPRESA_RAZON_SOCIAL

select EMPRESA_RAZON_SOCIAL
from gd_esquema.Maestra
where PASAJE_CODIGO is not null
group by EMPRESA_RAZON_SOCIAL
order by EMPRESA_RAZON_SOCIAL

SELECT DISTINCT RUTA_AEREA_CIU_ORIG
FROM gd_esquema.Maestra
WHERE RUTA_AEREA_CIU_ORIG IS NOT NULL
ORDER BY RUTA_AEREA_CIU_ORIG

SELECT DISTINCT RUTA_AEREA_CIU_DEST
FROM gd_esquema.Maestra
WHERE RUTA_AEREA_CIU_DEST IS NOT NULL
ORDER BY RUTA_AEREA_CIU_DEST

-- Me trae los distintos tipos de habitacion con su codigo (5 tipos)
SELECT TIPO_HABITACION_CODIGO, TIPO_HABITACION_DESC FROM GD1C2020.gd_esquema.Maestra
WHERE TIPO_HABITACION_CODIGO IS NOT NULL
GROUP BY TIPO_HABITACION_CODIGO, TIPO_HABITACION_DESC
ORDER BY 1

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

-- Posible codigo para migracion Rutas Aereas
SELECT RA.RUTA_AEREA_CODIGO, C1.ciudad_codigo, C2.ciudad_codigo
FROM GD1C2020.gd_esquema.Maestra RA 
	INNER JOIN LOS_BORBOTONES.CIUDAD C1 ON RA.RUTA_AEREA_CIU_ORIG = C1.ciudad_detalle
	INNER JOIN LOS_BORBOTONES.CIUDAD C2 ON RA.RUTA_AEREA_CIU_DEST = C2.ciudad_detalle
WHERE RUTA_AEREA_CODIGO IS NOT NULL
GROUP BY RA.RUTA_AEREA_CODIGO, C1.ciudad_codigo, C2.ciudad_codigo
ORDER BY RA.RUTA_AEREA_CODIGO

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

-- Me trae 4750 vuelos diferentes
SELECT DISTINCT VUELO_CODIGO, VUELO_FECHA_SALUDA, VUELO_FECHA_LLEGADA, AVION_IDENTIFICADOR, RUTA_AEREA_CODIGO, RUTA_AEREA_CIU_ORIG, RUTA_AEREA_CIU_DEST, EMPRESA_RAZON_SOCIAL FROM GD1C2020.gd_esquema.Maestra
WHERE VUELO_CODIGO IS NOT NULL
ORDER BY VUELO_CODIGO

-- PRIMER INTENTO MIGRACION VUELOS
SELECT M.VUELO_CODIGO, M.VUELO_FECHA_SALUDA, M.VUELO_FECHA_LLEGADA, A.avion_id, RA.ruta_aerea_codigo, RA.ruta_aerea_ciu_origen, RA.ruta_aerea_ciu_destino, AE.aerolinea_codigo
FROM GD1C2020.gd_esquema.Maestra M
	INNER JOIN GD1C2020.LOS_BORBOTONES.AVION A ON M.AVION_IDENTIFICADOR = A.avion_id
	INNER JOIN GD1C2020.LOS_BORBOTONES.RUTA_AEREA RA ON M.RUTA_AEREA_CODIGO = RA.ruta_aerea_codigo AND M.RUTA_AEREA_CIU_ORIG = RA.ruta_aerea_ciu_origen AND M.RUTA_AEREA_CIU_DEST = RA.ruta_aerea_ciu_destino
	INNER JOIN GD1C2020.LOS_BORBOTONES.AEROLINEA AE ON M.EMPRESA_RAZON_SOCIAL = AE.aerolinea_razon_social
WHERE M.VUELO_CODIGO IS NOT NULL
GROUP BY M.VUELO_CODIGO, M.VUELO_FECHA_SALUDA, M.VUELO_FECHA_LLEGADA, A.avion_id, RA.ruta_aerea_codigo, RA.ruta_aerea_ciu_origen, RA.ruta_aerea_ciu_destino, AE.aerolinea_codigo
ORDER BY M.VUELO_CODIGO, M.VUELO_FECHA_SALUDA

-- Me trae 424 habitaciones diferentes en total (entre todos los hoteles)
SELECT DISTINCT HABITACION_FRENTE,HABITACION_NUMERO,HABITACION_PISO,HOTEL_NRO_CALLE,HOTEL_CALLE FROM gd_esquema.Maestra
WHERE HOTEL_CALLE IS NOT NULL
ORDER BY HOTEL_CALLE, HABITACION_NUMERO

-- Posible migracion para tabla HABITACION
SELECT M.HABITACION_NUMERO, H.hotel_codigo, M.HABITACION_PISO, M.HABITACION_FRENTE, M.HABITACION_COSTO, M.HABITACION_PRECIO, TH.tipo_habitacion_codigo
FROM GD1C2020.gd_esquema.Maestra M
	INNER JOIN GD1C2020.LOS_BORBOTONES.TIPO_HABITACION TH ON M.TIPO_HABITACION_CODIGO = TH.tipo_habitacion_codigo
	INNER JOIN GD1C2020.LOS_BORBOTONES.HOTEL H ON M.HOTEL_CALLE = H.hotel_calle AND M.HOTEL_NRO_CALLE = H.hotel_nro_calle
WHERE M.HOTEL_CALLE IS NOT NULL
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

-- Me trae 20438 compras diferentes
SELECT DISTINCT COMPRA_NUMERO FROM GD1C2020.gd_esquema.Maestra

-- Migracion tabla COMPRA
SELECT COMPRA_NUMERO, COMPRA_FECHA FROM GD1C2020.gd_esquema.Maestra
GROUP BY COMPRA_NUMERO, COMPRA_FECHA
ORDER BY COMPRA_FECHA, COMPRA_NUMERO

 
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

-- Me trae todas las compras de TABLA COMPRA CREADA -- 20438 compras diferentes
-- Me las trae ordenadas por COMPRA_NUMERO en vez de COMPRA_FECHA (RARO, en el script y la consulta de prueba se ordena primero por FECHA y despues NUMERO)
SELECT * FROM GD1C2020.LOS_BORBOTONES.COMPRA_EMPRESA_TURISMO