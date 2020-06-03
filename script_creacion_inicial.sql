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

IF OBJECT_ID('LOS_BORBOTONES.CIUDAD') IS NOT NULL
DROP TABLE LOS_BORBOTONES.CIUDAD;

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

/* CREO TABLAS */

CREATE TABLE LOS_BORBOTONES.CLIENTE (
		cliente_id INT IDENTITY(1,1) NOT NULL,
		cliente_apellido nvarchar(255),
		cliente_nombre nvarchar(255),
		cliente_dni decimal (18,0),
		cliente_fecha_nac datetime2(3),
		cliente_mail nvarchar(255),
		cliente_telefono decimal(18,0)
)

CREATE TABLE LOS_BORBOTONES.SUCURSAL (

		sucursal_id INT IDENTITY(2,1) NOT NULL,
		sucursal_direccion nvarchar(255),
		sucursal_mail nvarchar(255),
		sucursal_telefono decimal(18,0)
)

CREATE TABLE LOS_BORBOTONES.AEROLINEA (
		aerolinea_codigo INT IDENTITY(1,1) NOT NULL,
		aerolinea_razon_social nvarchar(255)
)

CREATE TABLE LOS_BORBOTONES.AVION (
		avion_id nvarchar(50) NOT NULL,
		avion_modelo nvarchar(50)
)

CREATE TABLE LOS_BORBOTONES.VUELO (
		vuelo_codigo decimal(19,0) NOT NULL,
		vuelo_fecha_salida datetime2(3),
		vuelo_fecha_llegada datetime2(3),
		vuelo_avion_id nvarchar(50),
		vuelo_ruta_aerea_codigo decimal(18,0),
		vuelo_ruta_aerea_ciu_origen nvarchar(255),
		vuelo_ruta_aerea_ciu_destino nvarchar(255),
		vuelo_aerolinea_codigo INT
)

CREATE TABLE LOS_BORBOTONES.CIUDAD (
		ciudad_codigo INT IDENTITY(1,1) NOT NULL,
		ciudad_detalle nvarchar(255)
)

CREATE TABLE LOS_BORBOTONES.RUTA_AEREA (
		ruta_aerea_codigo decimal(18,0) NOT NULL,
		ruta_aerea_ciu_origen INT NOT NULL,
		ruta_aerea_ciu_destino INT NOT NULL
)

CREATE TABLE LOS_BORBOTONES.TIPO_BUTACA (
		tipo_butaca_codigo nvarchar(50) NOT NULL,
		tipo_butaca_detalle nvarchar(50)
)

CREATE TABLE LOS_BORBOTONES.BUTACA (
		butaca_id nvarchar(255) NOT NULL,
		butaca_numero decimal(18,0),
		butaca_tipo_butaca_codigo nvarchar(50),
		butaca_avion_id nvarchar(50)
)

CREATE TABLE LOS_BORBOTONES.GRUPO_HOTELARIO (
		grupo_hotelario_codigo INT IDENTITY(1,1) NOT NULL,
		grupo_hotelario_razon_social nvarchar(255)
)

CREATE TABLE LOS_BORBOTONES.HOTEL (
		hotel_codigo nvarchar(255) NOT NULL,
		hotel_calle nvarchar(50),
		hotel_nro_calle decimal(18,0),
		hotel_cantidad_estrellas decimal(18,0),
		hotel_grupo_hotelario_codigo INT
)

CREATE TABLE LOS_BORBOTONES.TIPO_HABITACION (
		tipo_habitacion_codigo decimal(18,0) NOT NULL,
		tipo_habitacion_detalle nvarchar(255)
)

CREATE TABLE LOS_BORBOTONES.HABITACION (
		habitacion_numero decimal(18,0) NOT NULL,
		habitacion_codigo_hotel nvarchar(255) NOT NULL,
		habitacion_piso decimal(18,0),
		habitacion_frente nvarchar(50),
		habitacion_costo decimal(18,2),
		habitacion_precio decimal(18,2),
		habitacion_tipo_habitacion_codigo decimal(18,0)
)

CREATE TABLE LOS_BORBOTONES.FACTURA (
		factura_fecha datetime2(3),
		factura_numero decimal(18,0) NOT NULL,
		factura_cliente_id int,
		factura_sucursal_id decimal(18,0)
)

CREATE TABLE LOS_BORBOTONES.COMPRA_EMPRESA_TURISMO (
		compra_empr_numero decimal(18,0) NOT NULL,
		compra_empr_fecha datetime2(3)
)

CREATE TABLE LOS_BORBOTONES.PASAJE (
		pasaje_codigo decimal(18,0) NOT NULL,
		pasaje_costo decimal(18,2),
		pasaje_precio decimal(18,2),
		pasaje_vuelo_codigo decimal(18,0),
		pasaje_butaca_id nvarchar(255),
		pasaje_factura_numero decimal(18,0),
		pasaje_compra_numero decimal(18,0)
)

CREATE TABLE LOS_BORBOTONES.ESTADIA (
		estadia_codigo decimal(18,0) NOT NULL,
		estadia_fecha_inicial datetime2(3),
		estadia_cantidad_noches decimal(18,0),
		estadia_hotel_codigo nvarchar(255),
		estadia_habitacion_numero decimal(18,0),
		estadia_precio decimal(18,2),
		estadia_factura_numero decimal(18,0),
		estadia_compra_numero decimal(18,0)
)

/* CREANDO PK Y FK */

ALTER TABLE LOS_BORBOTONES.CLIENTE ADD CONSTRAINT PK_CLIENTE_ID PRIMARY KEY (cliente_id)
ALTER TABLE LOS_BORBOTONES.SUCURSAL ADD CONSTRAINT PK_SUCURSAL_ID PRIMARY KEY (sucursal_id)
ALTER TABLE LOS_BORBOTONES.AEROLINEA ADD CONSTRAINT PK_AEROLINEA_CODIGO PRIMARY KEY (aerolinea_codigo)
ALTER TABLE LOS_BORBOTONES.AVION ADD CONSTRAINT PK_AVION_ID PRIMARY KEY (avion_id)
ALTER TABLE LOS_BORBOTONES.VUELO ADD CONSTRAINT PK_VUELO_CODIGO PRIMARY KEY (vuelo_codigo)
ALTER TABLE LOS_BORBOTONES.CIUDAD ADD CONSTRAINT PK_CIUDAD_CODIGO PRIMARY KEY (ciudad_codigo)
ALTER TABLE LOS_BORBOTONES.RUTA_AEREA ADD CONSTRAINT PK_RUTA_AEREA_ID PRIMARY KEY (ruta_aerea_codigo, ruta_aerea_ciu_origen, ruta_aerea_ciu_destino)
ALTER TABLE LOS_BORBOTONES.TIPO_BUTACA ADD CONSTRAINT PK_TIPO_BUTACA_CODIGO PRIMARY KEY (tipo_butaca_codigo)
ALTER TABLE LOS_BORBOTONES.BUTACA ADD CONSTRAINT PK_BUTACA_ID PRIMARY KEY (butaca_id)
ALTER TABLE LOS_BORBOTONES.GRUPO_HOTELARIO ADD CONSTRAINT PK_GRUPO_HOTELARIO_CODIGO PRIMARY KEY (grupo_hotelario_codigo)
ALTER TABLE LOS_BORBOTONES.HOTEL ADD CONSTRAINT PK_HOTEL_CODIGO PRIMARY KEY (hotel_codigo)
ALTER TABLE LOS_BORBOTONES.TIPO_HABITACION ADD CONSTRAINT PK_TIPO_HABITACION_CODIGO PRIMARY KEY (tipo_habitacion_codigo)
ALTER TABLE LOS_BORBOTONES.HABITACION ADD CONSTRAINT PK_HABITACION_NUMERO_CODIGO_HOTEL PRIMARY KEY (habitacion_numero, habitacion_codigo_hotel)
ALTER TABLE LOS_BORBOTONES.FACTURA ADD CONSTRAINT PK_FACTURA_NUMERO PRIMARY KEY (factura_numero)
ALTER TABLE LOS_BORBOTONES.COMPRA_EMPRESA_TURISMO ADD CONSTRAINT PK_COMPRA_NUMERO PRIMARY KEY (compra_empr_numero)
ALTER TABLE LOS_BORBOTONES.PASAJE ADD CONSTRAINT PK_PASAJE_CODIGO PRIMARY KEY (pasaje_codigo)
ALTER TABLE LOS_BORBOTONES.ESTADIA ADD CONSTRAINT PK_ESTADIA_CODIGO PRIMARY KEY (estadia_codigo)


ALTER TABLE LOS_BORBOTONES.VUELO ADD CONSTRAINT FK_VUELO_AVION_ID FOREIGN KEY (vuelo_avion_id) REFERENCES LOS_BORBOTONES.AVION(avion_id)
ALTER TABLE LOS_BORBOTONES.RUTA_AEREA ADD CONSTRAINT FK_RUTA_AEREA_CIUDAD_ORIGEN FOREIGN KEY (ruta_aerea_ciu_origen) REFERENCES LOS_BORBOTONES.CIUDAD(ciudad_codigo)
ALTER TABLE LOS_BORBOTONES.RUTA_AEREA ADD CONSTRAINT FK_RUTA_AEREA_CIUDAD_DESTINO FOREIGN KEY (ruta_aerea_ciu_destino) REFERENCES LOS_BORBOTONES.CIUDAD(ciudad_codigo)
ALTER TABLE LOS_BORBOTONES.BUTACA ADD CONSTRAINT FK_BUTACA_TIPO_BUTACA_CODIGO FOREIGN KEY (butaca_tipo_butaca_codigo) REFERENCES LOS_BORBOTONES.TIPO_BUTACA(tipo_butaca_codigo)
ALTER TABLE LOS_BORBOTONES.BUTACA ADD CONSTRAINT FK_BUTACA_AVION_ID FOREIGN KEY (butaca_avion_id) REFERENCES LOS_BORBOTONES.AVION(avion_id)
ALTER TABLE LOS_BORBOTONES.HOTEL ADD CONSTRAINT FK_HOTEL_GRUPO_HOTELARIO_CODIGO FOREIGN KEY (hotel_grupo_hotelario_codigo) REFERENCES LOS_BORBOTONES.GRUPO_HOTELARIO(grupo_hotelario_codigo)
ALTER TABLE LOS_BORBOTONES.HABITACION ADD CONSTRAINT FK_HABITACION_CODIGO_HOTEL FOREIGN KEY (habitacion_codigo_hotel) REFERENCES LOS_BORBOTONES.HOTEL(hotel_codigo)
ALTER TABLE LOS_BORBOTONES.HABITACION ADD CONSTRAINT FK_HABITACION_TIPO_HABITACION_CODIGO FOREIGN KEY (habitacion_tipo_habitacion_codigo) REFERENCES LOS_BORBOTONES.TIPO_HABITACION(tipo_habitacion_codigo)
ALTER TABLE LOS_BORBOTONES.FACTURA ADD CONSTRAINT FK_FACTURA_CLIENTE_ID FOREIGN KEY (factura_cliente_id) REFERENCES LOS_BORBOTONES.CLIENTE(cliente_id)
ALTER TABLE LOS_BORBOTONES.FACTURA ADD CONSTRAINT FK_FACTURA_SUCURSAL_ID FOREIGN KEY (factura_sucursal_id) REFERENCES LOS_BORBOTONES.SUCURSAL(sucursal_id)
ALTER TABLE LOS_BORBOTONES.PASAJE ADD CONSTRAINT FK_PASAJE_VUELO_CODIGO FOREIGN KEY (pasaje_vuelo_codigo) REFERENCES LOS_BORBOTONES.VUELO(vuelo_codigo)
ALTER TABLE LOS_BORBOTONES.PASAJE ADD CONSTRAINT FK_PASAJE_BUTACA_ID FOREIGN KEY (pasaje_butaca_id) REFERENCES LOS_BORBOTONES.BUTACA(butaca_id)
ALTER TABLE LOS_BORBOTONES.PASAJE ADD CONSTRAINT FK_PASAJE_FACTURA_NUMERO FOREIGN KEY (pasaje_factura_numero) REFERENCES LOS_BORBOTONES.FACTURA(factura_numero)
ALTER TABLE LOS_BORBOTONES.PASAJE ADD CONSTRAINT FK_PASAJE_COMPRA_NUMERO FOREIGN KEY (pasaje_compra_numero) REFERENCES LOS_BORBOTONES.COMPRA_EMPRESA_TURISMO(compra_empr_numero)
ALTER TABLE LOS_BORBOTONES.ESTADIA ADD CONSTRAINT FK_ESTADIA_HOTEL_HABITACION FOREIGN KEY (estadia_hotel_codigo, estadia_habitacion_numero) REFERENCES LOS_BORBOTONES.HABITACION(habitacion_codigo_hotel, habitacion_numero)
ALTER TABLE LOS_BORBOTONES.ESTADIA ADD CONSTRAINT FK_ESTADIA_FACTURA_NUMERO FOREIGN KEY (estadia_factura_numero) REFERENCES LOS_BORBOTONES.FACTURA(factura_numero)
ALTER TABLE LOS_BORBOTONES.ESTADIA ADD CONSTRAINT FK_ESTADIA_COMPRA_NUMERO FOREIGN KEY (estadia_compra_numero) REFERENCES LOS_BORBOTONES.COMPRA_EMPRESA_TURISMO(compra_empr_numero)
GO

/* MIGRACION */

CREATE PROC LOS_BORBOTONES.migracion_insert_clientes AS
BEGIN
	INSERT INTO LOS_BORBOTONES.CLIENTE(cliente_apellido, cliente_nombre, cliente_dni, cliente_fecha_nac, cliente_mail, cliente_telefono)
		SELECT	CLIENTE_APELLIDO, CLIENTE_NOMBRE, CLIENTE_DNI, CLIENTE_FECHA_NAC, CLIENTE_MAIL, CLIENTE_TELEFONO
		FROM gd_esquema.Maestra
		WHERE CLIENTE_DNI IS NOT NULL
		GROUP BY CLIENTE_DNI, CLIENTE_APELLIDO, CLIENTE_NOMBRE, CLIENTE_DNI, CLIENTE_FECHA_NAC, CLIENTE_MAIL, CLIENTE_TELEFONO
END
GO

CREATE PROC LOS_BORBOTONES.migracion_insert_sucursales AS
BEGIN
	INSERT INTO LOS_BORBOTONES.SUCURSAL(sucursal_direccion, sucursal_mail, sucursal_telefono)
		SELECT SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TELEFONO
		FROM gd_esquema.Maestra
		WHERE SUCURSAL_DIR IS NOT NULL
		GROUP BY SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TELEFONO
		ORDER BY SUCURSAL_MAIL
END
GO

CREATE PROC LOS_BORBOTONES.migracion_insert_aerolineas AS
BEGIN
	INSERT INTO LOS_BORBOTONES.AEROLINEA(aerolinea_razon_social)
		SELECT EMPRESA_RAZON_SOCIAL
		FROM gd_esquema.Maestra
		WHERE PASAJE_CODIGO IS NOT NULL
		GROUP BY EMPRESA_RAZON_SOCIAL
		ORDER BY EMPRESA_RAZON_SOCIAL
END
GO

CREATE PROC LOS_BORBOTONES.migracion_insert_ciudades AS
BEGIN
	INSERT INTO LOS_BORBOTONES.CIUDAD(ciudad_detalle)
		SELECT DISTINCT RUTA_AEREA_CIU_ORIG
		FROM gd_esquema.Maestra
		WHERE RUTA_AEREA_CODIGO IS NOT NULL AND RUTA_AEREA_CIU_ORIG IS NOT NULL
		ORDER BY RUTA_AEREA_CIU_ORIG
END
GO

CREATE PROC LOS_BORBOTONES.migracion_insert_grupos_hotelarios AS
BEGIN
	INSERT INTO LOS_BORBOTONES.GRUPO_HOTELARIO(grupo_hotelario_razon_social)
		SELECT EMPRESA_RAZON_SOCIAL
		FROM gd_esquema.Maestra
		WHERE ESTADIA_CODIGO IS NOT NULL
		GROUP BY EMPRESA_RAZON_SOCIAL
		ORDER BY EMPRESA_RAZON_SOCIAL
END
GO