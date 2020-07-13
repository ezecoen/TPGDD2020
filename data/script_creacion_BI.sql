USE GD1C2020
GO

------------------------------ DROP DE LAS FOREIGN KEY ------------------------------

ALTER TABLE LOS_BORBOTONES.HECHO_PASAJE DROP CONSTRAINT FK_HECHO_PASAJE_AEROLINEA_CODIGO 
ALTER TABLE LOS_BORBOTONES.HECHO_PASAJE DROP CONSTRAINT FK_HECHO_PASAJE_SUCURSAL_ID
ALTER TABLE LOS_BORBOTONES.HECHO_PASAJE DROP CONSTRAINT FK_HECHO_PASAJE_AVION_ID 
ALTER TABLE LOS_BORBOTONES.HECHO_PASAJE DROP CONSTRAINT FK_HECHO_PASAJE_TIPO_BUTACA_CODIGO 
ALTER TABLE LOS_BORBOTONES.HECHO_PASAJE DROP CONSTRAINT FK_HECHO_PASAJE_RUTA_AEREA_ID 
ALTER TABLE LOS_BORBOTONES.HECHO_ESTADIA DROP CONSTRAINT FK_HECHO_ESTADIA_GRUPO_HOTELARIO_CODIGO 
ALTER TABLE LOS_BORBOTONES.HECHO_ESTADIA DROP CONSTRAINT FK_HECHO_ESTADIA_SUCURSAL_ID 
ALTER TABLE LOS_BORBOTONES.HECHO_ESTADIA DROP CONSTRAINT FK_HECHO_ESTADIA_TIPO_HABITACION_CODIGO 
GO

---------------------------- DROP DE LAS PRIMARY KEY ------------------------------

ALTER TABLE LOS_BORBOTONES.DIMENSION_SUCURSAL DROP CONSTRAINT PK_DIMENSION_SUCURSAL_ID 
ALTER TABLE LOS_BORBOTONES.DIMENSION_TIPO_HABITACION DROP CONSTRAINT  PK_DIMENSION_TIPO_HABITACION_CODIGO 
ALTER TABLE LOS_BORBOTONES.DIMENSION_TIPO_BUTACA DROP CONSTRAINT  PK_DIMENSION_TIPO_BUTACA_CODIGO 
ALTER TABLE LOS_BORBOTONES.DIMENSION_AVION DROP CONSTRAINT  PK_DIMENSION_AVION_ID 
ALTER TABLE LOS_BORBOTONES.DIMENSION_RUTA_AEREA DROP CONSTRAINT  PK_DIMENSION_RUTA_AEREA_ID 
ALTER TABLE LOS_BORBOTONES.DIMENSION_AEROLINEA DROP CONSTRAINT  PK_DIMENSION_AEROLINEA_CODIGO
ALTER TABLE LOS_BORBOTONES.DIMENSION_GRUPO_HOTELARIO DROP CONSTRAINT  PK_DIMENSION_GRUPO_HOTELARIO_CODIGO 
ALTER TABLE LOS_BORBOTONES.HECHO_PASAJE DROP CONSTRAINT  PK_HECHO_PASAJE 
ALTER TABLE LOS_BORBOTONES.HECHO_ESTADIA DROP CONSTRAINT  PK_HECHO_ESTADIA 
GO

------------------------------ DROP DE LAS TABLAS ------------------------------

IF OBJECT_ID('LOS_BORBOTONES.DIMENSION_TIPO_HABITACION') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.DIMENSION_TIPO_HABITACION;
GO

IF OBJECT_ID('LOS_BORBOTONES.DIMENSION_TIPO_BUTACA') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.DIMENSION_TIPO_BUTACA;
GO

IF OBJECT_ID('LOS_BORBOTONES.DIMENSION_AVION') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.DIMENSION_AVION;
GO

IF OBJECT_ID('LOS_BORBOTONES.DIMENSION_RUTA_AEREA') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.DIMENSION_RUTA_AEREA;
GO

IF OBJECT_ID('LOS_BORBOTONES.DIMENSION_AEROLINEA') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.DIMENSION_AEROLINEA;
GO

IF OBJECT_ID('LOS_BORBOTONES.DIMENSION_GRUPO_HOTELARIO') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.DIMENSION_GRUPO_HOTELARIO;
GO

IF OBJECT_ID('LOS_BORBOTONES.DIMENSION_SUCURSAL') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.DIMENSION_SUCURSAL;
GO

IF OBJECT_ID('LOS_BORBOTONES.HECHO_PASAJE') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.HECHO_PASAJE;
GO

IF OBJECT_ID('LOS_BORBOTONES.HECHO_ESTADIA') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.HECHO_ESTADIA;
GO

--------------------------- DROP DE LAS FUNCIONES -------------------------------

IF OBJECT_ID('LOS_BORBOTONES.cantidad_camas_vendidas') IS NOT NULL
	DROP FUNCTION LOS_BORBOTONES.cantidad_camas_vendidas;
GO

------------------------------ DROP DEL SCHEMA ------------------------------

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'LOS_BORBOTONES')
  	BEGIN
    	EXEC ('CREATE SCHEMA LOS_BORBOTONES');
  	END
GO

------------------------------ CREACION DE TABLAS ------------------------------

------------------------ DIMENSIONES ------------------------

CREATE TABLE LOS_BORBOTONES.DIMENSION_SUCURSAL (
	dim_sucursal_id INT not null,
	dim_sucursal_direccion nvarchar(255),
	dim_sucursal_mail nvarchar(255),
	dim_sucursal_telefono decimal(18,0)
)

CREATE TABLE LOS_BORBOTONES.DIMENSION_TIPO_HABITACION (
	dim_tipo_habitacion_codigo decimal(18,0) not null,
	dim_tipo_habitacion_detalle nvarchar(255)
)

CREATE TABLE LOS_BORBOTONES.DIMENSION_TIPO_BUTACA (
	dim_tipo_butaca_codigo INT not null,
	dim_tipo_butaca_detalle nvarchar(255)
)

CREATE TABLE LOS_BORBOTONES.DIMENSION_AVION (
	dim_avion_id nvarchar(50) not null,
	dim_avion_modelo nvarchar(50)
)

CREATE TABLE LOS_BORBOTONES.DIMENSION_RUTA_AEREA (
	dim_ruta_aerea_id INT not null,
	dim_ruta_aerea_codigo decimal(18,0),
	dim_ruta_aerea_ciu_origen INT,
	dim_ruta_aerea_ciu_dest INT
)

CREATE TABLE LOS_BORBOTONES.DIMENSION_AEROLINEA (
	dim_aerolinea_codigo INT not null,
	dim_aerolinea_razon_social nvarchar(255)
)

CREATE TABLE LOS_BORBOTONES.DIMENSION_GRUPO_HOTELARIO (
	dim_grupo_hotelario_codigo INT not null,
	dim_grupo_hotelario_razon_social nvarchar(255)
)

------------------------ TABLAS DE HECHOS ------------------------

CREATE TABLE LOS_BORBOTONES.HECHO_PASAJE (
	hecho_pasaje_mes_anio nvarchar(6) not null,
	hecho_pasaje_aerolinea_codigo INT not null,
	hecho_pasaje_edad_cliente INT not null,
	hecho_pasaje_sucursal_id INT not null,
	hecho_pasaje_avion_id nvarchar(50) not null,
	hecho_pasaje_tipo_butaca_codigo INT not null,
	hecho_pasaje_ruta_aerea_id INT not null,
	hecho_pasaje_costo_compra_promedio decimal(18,0),
	hecho_pasaje_precio_venta_promedio decimal(18,0),
	hecho_pasaje_cantidad_pasajes_vendidos INT,
	hecho_pasaje_ganancia decimal(18,0)
)

CREATE TABLE LOS_BORBOTONES.HECHO_ESTADIA (
	hecho_estadia_mes_anio nvarchar(6) not null,
	hecho_estadia_grupo_hotelario_codigo INT not null,
	hecho_estadia_edad_cliente INT not null,
	hecho_estadia_sucursal_id INT not null,
	hecho_estadia_tipo_habitacion_codigo decimal(18,0) not null,
	hecho_estadia_cant_estrellas_promedio decimal(1,0),
	hecho_estadia_cantidad_camas INT,
	hecho_estadia_cantidad_habitaciones_vendidas INT,
	hecho_estadia_costo_compra_promedio decimal(18,0),
	hecho_estadia_precio_venta_promedio decimal(18,0),
	hecho_estadia_ganancia decimal(18,0)
)

------------------------------ CREANDO PRIMARY KEY ------------------------------

ALTER TABLE LOS_BORBOTONES.DIMENSION_SUCURSAL ADD CONSTRAINT PK_DIMENSION_SUCURSAL_ID PRIMARY KEY (dim_sucursal_id);
ALTER TABLE LOS_BORBOTONES.DIMENSION_TIPO_HABITACION ADD CONSTRAINT  PK_DIMENSION_TIPO_HABITACION_CODIGO PRIMARY KEY (dim_tipo_habitacion_codigo);
ALTER TABLE LOS_BORBOTONES.DIMENSION_TIPO_BUTACA ADD CONSTRAINT  PK_DIMENSION_TIPO_BUTACA_CODIGO PRIMARY KEY (dim_tipo_butaca_codigo);
ALTER TABLE LOS_BORBOTONES.DIMENSION_AVION ADD CONSTRAINT  PK_DIMENSION_AVION_ID PRIMARY KEY (dim_avion_id);
ALTER TABLE LOS_BORBOTONES.DIMENSION_RUTA_AEREA ADD CONSTRAINT  PK_DIMENSION_RUTA_AEREA_ID PRIMARY KEY (dim_ruta_aerea_id);
ALTER TABLE LOS_BORBOTONES.DIMENSION_AEROLINEA ADD CONSTRAINT  PK_DIMENSION_AEROLINEA_CODIGO PRIMARY KEY (dim_aerolinea_codigo);
ALTER TABLE LOS_BORBOTONES.DIMENSION_GRUPO_HOTELARIO ADD CONSTRAINT  PK_DIMENSION_GRUPO_HOTELARIO_CODIGO PRIMARY KEY (dim_grupo_hotelario_codigo);
ALTER TABLE LOS_BORBOTONES.HECHO_PASAJE ADD CONSTRAINT  PK_HECHO_PASAJE PRIMARY KEY (hecho_pasaje_mes_anio, hecho_pasaje_aerolinea_codigo, hecho_pasaje_edad_cliente, hecho_pasaje_sucursal_id, hecho_pasaje_avion_id, hecho_pasaje_tipo_butaca_codigo, hecho_pasaje_ruta_aerea_id);
ALTER TABLE LOS_BORBOTONES.HECHO_ESTADIA ADD CONSTRAINT  PK_HECHO_ESTADIA PRIMARY KEY (hecho_estadia_mes_anio, hecho_estadia_grupo_hotelario_codigo, hecho_estadia_edad_cliente, hecho_estadia_sucursal_id, hecho_estadia_tipo_habitacion_codigo);
GO

------------------------------ CREANDO FOREIGN KEY ------------------------------

ALTER TABLE LOS_BORBOTONES.HECHO_PASAJE ADD CONSTRAINT FK_HECHO_PASAJE_AEROLINEA_CODIGO FOREIGN KEY (hecho_pasaje_aerolinea_codigo) REFERENCES LOS_BORBOTONES.DIMENSION_AEROLINEA(dim_aerolinea_codigo);
ALTER TABLE LOS_BORBOTONES.HECHO_PASAJE ADD CONSTRAINT FK_HECHO_PASAJE_SUCURSAL_ID FOREIGN KEY (hecho_pasaje_sucursal_id) REFERENCES LOS_BORBOTONES.DIMENSION_SUCURSAL(dim_sucursal_id);
ALTER TABLE LOS_BORBOTONES.HECHO_PASAJE ADD CONSTRAINT FK_HECHO_PASAJE_AVION_ID FOREIGN KEY (hecho_pasaje_avion_id) REFERENCES LOS_BORBOTONES.DIMENSION_AVION(dim_avion_id);
ALTER TABLE LOS_BORBOTONES.HECHO_PASAJE ADD CONSTRAINT FK_HECHO_PASAJE_TIPO_BUTACA_CODIGO FOREIGN KEY (hecho_pasaje_tipo_butaca_codigo) REFERENCES LOS_BORBOTONES.DIMENSION_TIPO_BUTACA(dim_tipo_butaca_codigo);
ALTER TABLE LOS_BORBOTONES.HECHO_PASAJE ADD CONSTRAINT FK_HECHO_PASAJE_RUTA_AEREA_ID FOREIGN KEY (hecho_pasaje_ruta_aerea_id) REFERENCES LOS_BORBOTONES.DIMENSION_RUTA_AEREA(dim_ruta_aerea_id);

ALTER TABLE LOS_BORBOTONES.HECHO_ESTADIA ADD CONSTRAINT FK_HECHO_ESTADIA_GRUPO_HOTELARIO_CODIGO FOREIGN KEY (hecho_estadia_grupo_hotelario_codigo) REFERENCES LOS_BORBOTONES.DIMENSION_GRUPO_HOTELARIO(dim_grupo_hotelario_codigo);
ALTER TABLE LOS_BORBOTONES.HECHO_ESTADIA ADD CONSTRAINT FK_HECHO_ESTADIA_SUCURSAL_ID FOREIGN KEY (hecho_estadia_sucursal_id) REFERENCES LOS_BORBOTONES.DIMENSION_SUCURSAL(dim_sucursal_id);
ALTER TABLE LOS_BORBOTONES.HECHO_ESTADIA ADD CONSTRAINT FK_HECHO_ESTADIA_TIPO_HABITACION_CODIGO FOREIGN KEY (hecho_estadia_tipo_habitacion_codigo) REFERENCES LOS_BORBOTONES.DIMENSION_TIPO_HABITACION(dim_tipo_habitacion_codigo);
GO

------------------------------- FUNCIONES --------------------------------------

CREATE FUNCTION LOS_BORBOTONES.cantidad_camas_vendidas (@tipo_habitacion_codigo decimal(18,0))
RETURNS INT
AS
BEGIN
	RETURN (SELECT
		CASE tipo_habitacion_detalle 
		WHEN  'Base Simple' THEN 1
		WHEN 'King' THEN 1
		WHEN 'Base Doble' THEN 2
		WHEN 'Base Triple' THEN 3
		WHEN 'Base Cuadruple' THEN 4
		ELSE 0
		END
	FROM LOS_BORBOTONES.TIPO_HABITACION
	WHERE tipo_habitacion_codigo = @tipo_habitacion_codigo)
END
GO



------------------------------ MIGRACION ---------------------------------------

----------- MIGRACION DE LAS TABLAS DE DIMENSIONES -----------------------------

INSERT INTO LOS_BORBOTONES.DIMENSION_SUCURSAL (dim_sucursal_id, dim_sucursal_direccion, dim_sucursal_mail, dim_sucursal_telefono)
	select
		sucursal_id,
		sucursal_direccion,
		sucursal_mail,
		sucursal_telefono
	from LOS_BORBOTONES.SUCURSAL


INSERT INTO LOS_BORBOTONES.DIMENSION_AEROLINEA(dim_aerolinea_codigo, dim_aerolinea_razon_social)
	select
		aerolinea_codigo,
		aerolinea_razon_social
	from LOS_BORBOTONES.AEROLINEA


INSERT INTO LOS_BORBOTONES.DIMENSION_RUTA_AEREA(dim_ruta_aerea_id, dim_ruta_aerea_codigo, dim_ruta_aerea_ciu_origen, dim_ruta_aerea_ciu_dest)
	select
		ruta_aerea_id,
		ruta_aerea_codigo,
		ruta_aerea_ciu_origen,
		ruta_aerea_ciu_destino
	from LOS_BORBOTONES.RUTA_AEREA


INSERT INTO LOS_BORBOTONES.DIMENSION_TIPO_BUTACA(dim_tipo_butaca_codigo, dim_tipo_butaca_detalle)
	select
		tipo_butaca_codigo,
		tipo_butaca_detalle
	from LOS_BORBOTONES.TIPO_BUTACA


INSERT INTO LOS_BORBOTONES.DIMENSION_AVION(dim_avion_id, dim_avion_modelo)
	select
		avion_id,
		avion_modelo
	from LOS_BORBOTONES.AVION


INSERT INTO LOS_BORBOTONES.DIMENSION_GRUPO_HOTELARIO(dim_grupo_hotelario_codigo, dim_grupo_hotelario_razon_social)
	select
		grupo_hotelario_codigo,
		grupo_hotelario_razon_social
	from LOS_BORBOTONES.GRUPO_HOTELARIO


INSERT INTO LOS_BORBOTONES.DIMENSION_TIPO_HABITACION(dim_tipo_habitacion_codigo,dim_tipo_habitacion_detalle)
	select
		tipo_habitacion_codigo,
		tipo_habitacion_detalle
	from LOS_BORBOTONES.TIPO_HABITACION


---------- MIGRACION A LA TABLA DE HECHOS DE PASAJES ---------------------------

INSERT INTO LOS_BORBOTONES.HECHO_PASAJE(
		hecho_pasaje_mes_anio,
		hecho_pasaje_aerolinea_codigo,
		hecho_pasaje_edad_cliente,
		hecho_pasaje_sucursal_id,
		hecho_pasaje_avion_id,
		hecho_pasaje_tipo_butaca_codigo,
		hecho_pasaje_ruta_aerea_id,
		hecho_pasaje_costo_compra_promedio,
		hecho_pasaje_precio_venta_promedio,
		hecho_pasaje_cantidad_pasajes_vendidos,
		hecho_pasaje_ganancia)
	select '0'+ltrim(str(month(factura_fecha)))+ltrim(str(year(factura_fecha))),
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
	where pasaje_valido = 1
	group by '0'+ltrim(str(month(factura_fecha)))+ltrim(str(year(factura_fecha))),
		vuelo_aerolinea_codigo,
		year(getdate())-year(cliente_fecha_nac),
		factura_sucursal_id,
		vuelo_avion_id,
		butaca_tipo_butaca_codigo,
		vuelo_ruta_aerea_id


---------- MIGRACION A LA TABLA DE HECHOS DE ESTADIAS ---------------------------

INSERT INTO LOS_BORBOTONES.HECHO_ESTADIA(
		hecho_estadia_mes_anio,
		hecho_estadia_grupo_hotelario_codigo,
		hecho_estadia_edad_cliente,
		hecho_estadia_sucursal_id,
		hecho_estadia_tipo_habitacion_codigo,
		hecho_estadia_cant_estrellas_promedio,
		hecho_estadia_cantidad_camas,
		hecho_estadia_costo_compra_promedio,
		hecho_estadia_precio_venta_promedio,
		hecho_estadia_cantidad_habitaciones_vendidas,
		hecho_estadia_ganancia)
	select '0'+ltrim(str(month(factura_fecha)))+ltrim(str(year(factura_fecha))),
		hotel_grupo_hotelario_codigo,
		year(getdate())-year(cliente_fecha_nac),
		factura_sucursal_id,
		habitacion_tipo_habitacion_codigo,
		avg(hotel_cantidad_estrellas),
		LOS_BORBOTONES.cantidad_camas_vendidas(habitacion_tipo_habitacion_codigo),
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
		habitacion_tipo_habitacion_codigo
