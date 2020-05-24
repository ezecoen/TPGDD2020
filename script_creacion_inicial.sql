USE GD1C2020
GO

/* BORRO TABLAS SI EXISTEN */

IF OBJECT_ID('LOS_BORBOTONES.CLIENTE') IS NOT NULL
DROP TABLE LOS_BORBOTONES.CLIENTE;

IF OBJECT_ID('LOS_BORBOTONES.SUCURSAL') IS NOT NULL
DROP TABLE LOS_BORBOTONES.SUCURSAL;

IF OBJECT_ID('LOS_BORBOTONES.AEROLINEA') IS NOT NULL
DROP TABLE LOS_BORBOTONES.AEROLINEA;

IF OBJECT_ID('LOS_BORBOTONES.VUELO') IS NOT NULL
DROP TABLE LOS_BORBOTONES.VUELO;

IF OBJECT_ID('LOS_BORBOTONES.RUTA_AEREA') IS NOT NULL
DROP TABLE LOS_BORBOTONES.RUTA_AEREA;

IF OBJECT_ID('LOS_BORBOTONES.AVION') IS NOT NULL
DROP TABLE LOS_BORBOTONES.AVION;

IF OBJECT_ID('LOS_BORBOTONES.BUTACA') IS NOT NULL
DROP TABLE LOS_BORBOTONES.BUTACA;

IF OBJECT_ID('LOS_BORBOTONES.TIPO_BUTACA') IS NOT NULL
DROP TABLE LOS_BORBOTONES.TIPO_BUTACA;

IF OBJECT_ID('LOS_BORBOTONES.GRUPO_HOTELARIO') IS NOT NULL
DROP TABLE LOS_BORBOTONES.GRUPO_HOTELARIO;

IF OBJECT_ID('LOS_BORBOTONES.HOTEL') IS NOT NULL
DROP TABLE LOS_BORBOTONES.HOTEL;

IF OBJECT_ID('LOS_BORBOTONES.HABITACION') IS NOT NULL
DROP TABLE LOS_BORBOTONES.HABITACION;

IF OBJECT_ID('LOS_BORBOTONES.TIPO_HABITACION') IS NOT NULL
DROP TABLE LOS_BORBOTONES.TIPO_HABITACION;

IF OBJECT_ID('LOS_BORBOTONES.PASAJE') IS NOT NULL
DROP TABLE LOS_BORBOTONES.PASAJE;

IF OBJECT_ID('LOS_BORBOTONES.ESTADIA') IS NOT NULL
DROP TABLE LOS_BORBOTONES.ESTADIA;

IF OBJECT_ID('LOS_BORBOTONES.FACTURA') IS NOT NULL
DROP TABLE LOS_BORBOTONES.FACTURA;

IF OBJECT_ID('LOS_BORBOTONES.COMPRA_EMPRESA_TURISMO') IS NOT NULL
DROP TABLE LOS_BORBOTONES.COMPRA_EMPRESA_TURISMO;

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'LOS_BORBOTONES')
  BEGIN
    EXEC ('CREATE SCHEMA LOS_BORBOTONES');
  END
GO

/* CREO TABLAS (FALTAR�A LA TABLA CIUDAD) */

CREATE TABLE LOS_BORBOTONES.CLIENTE (
		cliente_apellido nvarchar(255),
		cliente_nombre nvarchar(255),
		cliente_dni decimal (18,0),
		cliente_fecha_nac datetime2(3),
		cliente_mail nvarchar(255),
		cliente_telefono decimal(18,0)
)

CREATE TABLE LOS_BORBOTONES.SUCURSAL (

		sucursal_id decimal(18,0),
		sucursal_direccion nvarchar(255),
		sucursal_mail nvarchar(255),
		sucursal_telefono decimal(18,0)
)

CREATE TABLE LOS_BORBOTONES.AEROLINEA (
		aerolinea_codigo nvarchar(255),
		aerolinea_razon_social nvarchar(255)
)

CREATE TABLE LOS_BORBOTONES.VUELO (
		vuelo_codigo decimal(18,0),
		vuelo_fecha_salida datetime2(3),
		vuelo_fecha_llegada datetime2(3),
		vuelo_avion_id nvarchar(50),
		vuelo_ruta_aerea_codigo decimal(18,0),
		vuelo_ruta_aerea_ciu_origen nvarchar(255),
		vuelo_ruta_aerea_ciu_destino nvarchar(255),
		vuelo_aerolinea_codigo nvarchar(255)
)

CREATE TABLE LOS_BORBOTONES.RUTA_AEREA (
		ruta_aerea_codigo decimal(18,0),
		ruta_aerea_ciu_origen nvarchar(255),
		ruta_aerea_ciu_destino nvarchar(255)
)

CREATE TABLE LOS_BORBOTONES.AVION (
		avion_id nvarchar(50),
		avion_modelo nvarchar(50)
)

CREATE TABLE LOS_BORBOTONES.BUTACA (
		butaca_id nvarchar(255),
		butaca_numero decimal(18,0),
		butaca_tipo_butaca_codigo nvarchar(50),
		butaca_avion_id nvarchar(50)
)

CREATE TABLE LOS_BORBOTONES.TIPO_BUTACA (
		tipo_butaca_codigo nvarchar(50),
		tipo_butaca_detalle nvarchar(50)
)

CREATE TABLE LOS_BORBOTONES.GRUPO_HOTELARIO (
		grupo_hotelario_codigo nvarchar(255),
		grupo_hotelario_razon_social nvarchar(255)
)

CREATE TABLE LOS_BORBOTONES.HOTEL (
		hotel_codigo nvarchar(255),
		hotel_calle nvarchar(50),
		hotel_nro_calle decimal(18,0),
		hotel_cantidad_estrellas decimal(18,0),
		hotel_grupo_hotelario_codigo nvarchar(255)
)

CREATE TABLE LOS_BORBOTONES.HABITACION (
		habitacion_numero decimal(18,0),
		habitacion_codigo_hotel nvarchar(255),
		habitacion_piso decimal(18,0),
		habitacion_frente nvarchar(50),
		habitacion_costo decimal(18,2),
		habitacion_precio decimal(18,2),
		habitacion_tipo_habitacion_codigo decimal(18,0)
)

CREATE TABLE LOS_BORBOTONES.TIPO_HABITACION (
		tipo_habitacion_codigo decimal(18,0),
		tipo_habitacion_detalle nvarchar(255)
)

CREATE TABLE LOS_BORBOTONES.PASAJE (
		pasaje_codigo decimal(18,0),
		pasaje_costo decimal(18,2),
		pasaje_precio decimal(18,2),
		pasaje_vuelo_codigo decimal(18,0),
		pasaje_butaca_id nvarchar(255),
		pasaje_factura_numero decimal(18,0),
		pasaje_compra_numero decimal(18,0)
)

CREATE TABLE LOS_BORBOTONES.ESTADIA (
		estadia_codigo decimal(18,0),
		estadia_fecha_inicial datetime2(3),
		estadia_cantidad_noches decimal(18,0),
		estadia_hotel_codigo nvarchar(255),
		estadia_habitacion_numero decimal(18,0),
		estadia_precio decimal(18,2)
)

CREATE TABLE LOS_BORBOTONES.FACTURA (
		factura_fecha datetime2(3),
		factura_numero decimal(18,0),
		factura_cliente_dni decimal(18,0),
		factura_sucursal_id decimal(18,0)
)

CREATE TABLE LOS_BORBOTONES.COMPRA_EMPRESA_TURISMO (
		compra_empr_numero decimal(18,0),
		compra_empr_fecha datetime2(3)
)