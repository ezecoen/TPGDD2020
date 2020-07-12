USE GD1C2020
GO

------------------------------ DROP DE LAS TABLAS ------------------------------
/*
IF OBJECT_ID('LOS_BORBOTONES.DIMENSION_CLIENTE') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.DIMENSION_CLIENTE;
GO
*/
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

------------------------------ DROP DEL SCHEMA ------------------------------

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'LOS_BORBOTONES')
  	BEGIN
    	EXEC ('CREATE SCHEMA LOS_BORBOTONES');
  	END
GO

------------------------------ CREACION DE TABLAS ------------------------------

------------------------ DIMENSIONES ------------------------
/*
CREATE TABLE LOS_BORBOTONES.DIMENSION_CLIENTE (
	dim_cliente_id INT,
	dim_cliente_apellido nvarchar(255),
	dim_cliente_nombre nvarchar(255),
	dim_cliente_dni decimal (18,0),
	dim_cliente_fecha_nac datetime2(3),
	dim_cliente_mail nvarchar(255),
	dim_cliente_telefono decimal(18,0)
)
*/

CREATE TABLE LOS_BORBOTONES.DIMENSION_SUCURSAL (
	dim_sucursal_id INT,
	dim_sucursal_direccion nvarchar(255),
	dim_sucursal_mail nvarchar(255),
	dim_sucursal_telefono decimal(18,0)
)

CREATE TABLE LOS_BORBOTONES.DIMENSION_TIPO_HABITACION (
	dim_tipo_habitacion_codigo decimal(18,0),
	dim_tipo_habitacion_detalle nvarchar(255)
)

CREATE TABLE LOS_BORBOTONES.DIMENSION_TIPO_BUTACA (
	dim_tipo_butaca_codigo INT,
	dim_tipo_butaca_detalle nvarchar(255)
)

CREATE TABLE LOS_BORBOTONES.DIMENSION_AVION (
	dim_avion_id nvarchar(50),
	dim_avion_modelo nvarchar(50)
)

CREATE TABLE LOS_BORBOTONES.DIMENSION_RUTA_AEREA (
	dim_ruta_aerea_id INT,
	dim_ruta_aerea_codigo decimal(18,0),
	dim_ruta_aerea_ciu_origen INT,
	dim_ruta_aerea_ciu_dest INT
)

CREATE TABLE LOS_BORBOTONES.DIMENSION_AEROLINEA (
	dim_aerolinea_codigo INT,
	dim_aerolinea_razon_social nvarchar(255)
)

CREATE TABLE LOS_BORBOTONES.DIMENSION_GRUPO_HOTELARIO (
	dim_grupo_hotelario_codigo INT,
	dim_grupo_hotelario_razon_social nvarchar(255)
)

------------------------ HECHOS ------------------------

CREATE TABLE LOS_BORBOTONES.HECHO_PASAJE (
	hecho_pasaje_mes_anio nvarchar(6),
	hecho_pasaje_aerolinea_codigo INT,
	hecho_pasaje_edad_cliente INT,
	hecho_pasaje_sucursal_id INT,
	hecho_pasaje_avion_id nvarchar(255),
	hecho_pasaje_tipo_butaca_codigo INT,
	hecho_pasaje_ruta_aerea_id INT,
	hecho_pasaje_costo_compra_promedio decimal(18,0),
	hecho_pasaje_precio_venta_promedio decimal(18,0),
	hecho_pasaje_cantidad_pasajes_vendidos INT,
	hecho_pasaje_ganancia decimal(18,0)
)

CREATE TABLE LOS_BORBOTONES.HECHO_ESTADIA (
	hecho_estadia_mes_anio nvarchar(6),
	hecho_estadia_grupo_hotelario_codigo INT,
	hecho_estadia_edad_cliente INT,
	hecho_estadia_sucursal_id INT,
	hecho_estadia_tipo_habitacion_codigo decimal(18,0),
	hecho_estadia_cant_estrellas_promedio decimal(1,0),
	hecho_estadia_cantidad_camas INT,
	hecho_estadia_cantidad_habitaciones_vendidas INT,
	hecho_estadia_costo_compra_promedio decimal(18,0),
	hecho_estadia_precio_venta_promedio decimal(18,0),
	hecho_estadia_ganancia decimal(18,0)
)

------------------------------ CREANDO PRIMARY KEY ------------------------------

ALTER TABLE LOS_BORBOTONES.DIMENSION_SUCURSAL ADD CONSTRAINT  PK_DIMENSION_SUCURSAL_ID PRIMARY KEY (dim_sucursal_id);
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
ALTER TABLE LOS_BORBOTONES.HECHO_PASAJE ADD CONSTRAINT FK_HECHO_PASAJE_SUCURSAL_ID FOREIGN KEY (hecho_pasaje_sucursal_id) REFERENCES LOS_BORBOTONES_SUCURSAL(dim_sucursal_id);
ALTER TABLE LOS_BORBOTONES.HECHO_PASAJE ADD CONSTRAINT FK_HECHO_PASAJE_AVION_ID FOREIGN KEY (hecho_pasaje_avion_id) REFERENCES LOS_BORBOTONES.DIMENSION_AVION(dim_avion_id);
ALTER TABLE LOS_BORBOTONES.HECHO_PASAJE ADD CONSTRAINT FK_HECHO_PASAJE_TIPO_BUTACA_CODIGO FOREIGN KEY (hecho_pasaje_tipo_butaca_codigo) REFERENCES LOS_BORBOTONES.DIMENSION_TIPO_BUTACA(dim_tipo_butaca_codigo);
ALTER TABLE LOS_BORBOTONES.HECHO_PASAJE ADD CONSTRAINT FK_HECHO_PASAJE_RUTA_AEREA_ID FOREIGN KEY (hecho_pasaje_ruta_aerea_id) REFERENCES LOS_BORBOTONES.DIMENSION_RUTA_AEREA(dim_ruta_aerea_id);

ALTER TABLE LOS_BORBOTONES.HECHO_ESTADIA ADD CONSTRAINT FK_HECHO_ESTADIA_GRUPO_HOTELARIO_CODIGO FOREIGN KEY (hecho_estadia_grupo_hotelario_codigo) REFERENCES LOS_BORBOTONES.DIMENSION_GRUPO_HOTELARIO(dim_grupo_hotelario_codigo);
ALTER TABLE LOS_BORBOTONES.HECHO_ESTADIA ADD CONSTRAINT FK_HECHO_ESTADIA_SUCURSAL_ID FOREIGN KEY (hecho_estadia_sucursal_id) REFERENCES LOS_BORBOTONES.DIMENSION_SUCURSAL(dim_sucursal_id);
ALTER TABLE LOS_BORBOTONES.HECHO_ESTADIA ADD CONSTRAINT FK_HECHO_ESTADIA_TIPO_HABITACION_CODIGO FOREIGN KEY (hecho_estadia_tipo_habitacion_codigo) REFERENCES LOS_BORBOTONES.DIMENSION_TIPO_HABITACION(dim_tipo_habitacion_codigo);
GO

------------------------------ MIGRACIÓN ------------------------------

