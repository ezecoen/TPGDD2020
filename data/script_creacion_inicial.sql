USE GD1C2020
GO

------------------------------ DROP DE LAS FOREIGN KEY ------------------------------

--ALTER TABLE LOS_BORBOTONES.VUELO DROP CONSTRAINT FK_VUELO_AVION_ID;

--ALTER TABLE LOS_BORBOTONES.VUELO DROP CONSTRAINT FK_VUELO_AEROLINEA_CODIGO;

--ALTER TABLE LOS_BORBOTONES.VUELO DROP CONSTRAINT FK_VUELO_RUTA_AEREA;

--ALTER TABLE LOS_BORBOTONES.RUTA_AEREA DROP CONSTRAINT FK_RUTA_AEREA_CIUDAD_ORIGEN;

--ALTER TABLE LOS_BORBOTONES.RUTA_AEREA DROP CONSTRAINT FK_RUTA_AEREA_CIUDAD_DESTINO;

--ALTER TABLE LOS_BORBOTONES.BUTACA DROP CONSTRAINT FK_BUTACA_TIPO_BUTACA_CODIGO;

--ALTER TABLE LOS_BORBOTONES.BUTACA DROP CONSTRAINT FK_BUTACA_AVION_ID;

--ALTER TABLE LOS_BORBOTONES.HOTEL DROP CONSTRAINT FK_HOTEL_GRUPO_HOTELARIO_CODIGO;

--ALTER TABLE LOS_BORBOTONES.HABITACION DROP CONSTRAINT FK_HABITACION_CODIGO_HOTEL;

--ALTER TABLE LOS_BORBOTONES.HABITACION DROP CONSTRAINT FK_HABITACION_TIPO_HABITACION_CODIGO;

--ALTER TABLE LOS_BORBOTONES.FACTURA DROP CONSTRAINT FK_FACTURA_CLIENTE_ID;

--ALTER TABLE LOS_BORBOTONES.FACTURA DROP CONSTRAINT FK_FACTURA_SUCURSAL_ID;

--ALTER TABLE LOS_BORBOTONES.PASAJE DROP CONSTRAINT FK_PASAJE_VUELO_CODIGO;

--ALTER TABLE LOS_BORBOTONES.PASAJE DROP CONSTRAINT FK_PASAJE_BUTACA_ID;

--ALTER TABLE LOS_BORBOTONES.PASAJE DROP CONSTRAINT FK_PASAJE_FACTURA_NUMERO;

--ALTER TABLE LOS_BORBOTONES.PASAJE DROP CONSTRAINT FK_PASAJE_COMPRA_NUMERO;

--ALTER TABLE LOS_BORBOTONES.ESTADIA DROP CONSTRAINT FK_ESTADIA_HOTEL_HABITACION;

--ALTER TABLE LOS_BORBOTONES.ESTADIA DROP CONSTRAINT FK_ESTADIA_FACTURA_NUMERO;

--ALTER TABLE LOS_BORBOTONES.ESTADIA DROP CONSTRAINT FK_ESTADIA_COMPRA_NUMERO;

------------------------------ DROP DE LAS PRIMARY KEY ------------------------------

--ALTER TABLE LOS_BORBOTONES.CLIENTE DROP CONSTRAINT PK_CLIENTE_ID

--ALTER TABLE LOS_BORBOTONES.SUCURSAL DROP CONSTRAINT PK_SUCURSAL_ID

--ALTER TABLE LOS_BORBOTONES.AEROLINEA DROP CONSTRAINT PK_AEROLINEA_CODIGO

--ALTER TABLE LOS_BORBOTONES.AVION DROP CONSTRAINT PK_AVION_ID

--ALTER TABLE LOS_BORBOTONES.VUELO DROP CONSTRAINT PK_VUELO_CODIGO

--ALTER TABLE LOS_BORBOTONES.CIUDAD DROP CONSTRAINT PK_CIUDAD_CODIGO

--ALTER TABLE LOS_BORBOTONES.RUTA_AEREA DROP CONSTRAINT PK_RUTA_AEREA_ID

--ALTER TABLE LOS_BORBOTONES.TIPO_BUTACA DROP CONSTRAINT PK_TIPO_BUTACA_CODIGO

--ALTER TABLE LOS_BORBOTONES.BUTACA DROP CONSTRAINT PK_BUTACA_ID

--ALTER TABLE LOS_BORBOTONES.GRUPO_HOTELARIO DROP CONSTRAINT PK_GRUPO_HOTELARIO_CODIGO

--ALTER TABLE LOS_BORBOTONES.HOTEL DROP CONSTRAINT PK_HOTEL_CODIGO

--ALTER TABLE LOS_BORBOTONES.TIPO_HABITACION DROP CONSTRAINT PK_TIPO_HABITACION_CODIGO

--ALTER TABLE LOS_BORBOTONES.HABITACION DROP CONSTRAINT PK_HABITACION_NUMERO_CODIGO_HOTEL

--ALTER TABLE LOS_BORBOTONES.FACTURA DROP CONSTRAINT PK_FACTURA_NUMERO

--ALTER TABLE LOS_BORBOTONES.COMPRA_EMPRESA_TURISMO DROP CONSTRAINT PK_COMPRA_NUMERO

--ALTER TABLE LOS_BORBOTONES.PASAJE DROP CONSTRAINT PK_PASAJE_CODIGO

--ALTER TABLE LOS_BORBOTONES.ESTADIA DROP CONSTRAINT PK_ESTADIA_CODIGO

------------------------------ DROP DE LAS TABLAS ------------------------------

IF OBJECT_ID('LOS_BORBOTONES.CLIENTE') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.CLIENTE;
GO

IF OBJECT_ID('LOS_BORBOTONES.SUCURSAL') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.SUCURSAL;
GO

IF OBJECT_ID('LOS_BORBOTONES.AEROLINEA') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.AEROLINEA;
GO

IF OBJECT_ID('LOS_BORBOTONES.VUELO') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.VUELO;
GO

IF OBJECT_ID('LOS_BORBOTONES.RUTA_AEREA') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.RUTA_AEREA;
GO

IF OBJECT_ID('LOS_BORBOTONES.CIUDAD') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.CIUDAD;
GO

IF OBJECT_ID('LOS_BORBOTONES.AVION') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.AVION;
GO

IF OBJECT_ID('LOS_BORBOTONES.BUTACA') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.BUTACA;
GO

IF OBJECT_ID('LOS_BORBOTONES.TIPO_BUTACA') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.TIPO_BUTACA;
GO

IF OBJECT_ID('LOS_BORBOTONES.GRUPO_HOTELARIO') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.GRUPO_HOTELARIO;
GO

IF OBJECT_ID('LOS_BORBOTONES.HOTEL') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.HOTEL;
GO

IF OBJECT_ID('LOS_BORBOTONES.HABITACION') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.HABITACION;
GO

IF OBJECT_ID('LOS_BORBOTONES.TIPO_HABITACION') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.TIPO_HABITACION;
GO

IF OBJECT_ID('LOS_BORBOTONES.PASAJE') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.PASAJE;
GO

IF OBJECT_ID('LOS_BORBOTONES.ESTADIA') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.ESTADIA;
GO

IF OBJECT_ID('LOS_BORBOTONES.FACTURA') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.FACTURA;
GO

IF OBJECT_ID('LOS_BORBOTONES.COMPRA_EMPRESA_TURISMO') IS NOT NULL
	DROP TABLE LOS_BORBOTONES.COMPRA_EMPRESA_TURISMO;
GO

------------------------------ DROP DE LAS FUNCIONES ------------------------------

IF OBJECT_ID('LOS_BORBOTONES.get_codigo_ciudad_by_detalle_ciudad') IS NOT NULL
	DROP FUNCTION LOS_BORBOTONES.get_codigo_ciudad_by_detalle_ciudad;
GO

IF OBJECT_ID('LOS_BORBOTONES.get_hotel_codigo_by_calle_y_nro_calle') IS NOT NULL
	DROP FUNCTION LOS_BORBOTONES.get_hotel_codigo_by_calle_y_nro_calle;
GO

IF OBJECT_ID('LOS_BORBOTONES.get_grupo_hotelario_codigo_by_empresa_razon_social') IS NOT NULL
	DROP FUNCTION LOS_BORBOTONES.get_grupo_hotelario_codigo_by_empresa_razon_social;
GO

IF OBJECT_ID('LOS_BORBOTONES.get_aerolinea_codigo_by_empresa_razon_social') IS NOT NULL
	DROP FUNCTION LOS_BORBOTONES.get_aerolinea_codigo_by_empresa_razon_social;
GO

IF OBJECT_ID('LOS_BORBOTONES.get_tipo_butaca_codigo_by_tipo_butaca_detalle') IS NOT NULL
	DROP FUNCTION LOS_BORBOTONES.get_tipo_butaca_codigo_by_tipo_butaca_detalle;
GO

IF OBJECT_ID('LOS_BORBOTONES.get_cliente_id_by_nombre_apellido_dni') IS NOT NULL
	DROP FUNCTION LOS_BORBOTONES.get_cliente_id_by_nombre_apellido_dni;
GO

IF OBJECT_ID('LOS_BORBOTONES.get_sucursal_id_by_direccion') IS NOT NULL
	DROP FUNCTION LOS_BORBOTONES.get_sucursal_id_by_direccion;
GO

IF OBJECT_ID('LOS_BORBOTONES.get_butaca_id_by_avion_numero_butaca_tipo_butaca') IS NOT NULL
	DROP FUNCTION LOS_BORBOTONES.get_butaca_id_by_avion_numero_butaca_tipo_butaca;
GO

IF OBJECT_ID('LOS_BORBOTONES.get_ruta_aerea_id_by_ruta_aerea_codigo_ciudad_origen_ciudad_destino') IS NOT NULL
	DROP FUNCTION LOS_BORBOTONES.get_ruta_aerea_id_by_ruta_aerea_codigo_ciudad_origen_ciudad_destino;
GO

------------------------------ DROP DE LOS PROCEDURE ------------------------------

IF OBJECT_ID('LOS_BORBOTONES.migracion_insert_clientes') IS NOT NULL
	DROP PROCEDURE LOS_BORBOTONES.migracion_insert_clientes;
GO

IF OBJECT_ID('LOS_BORBOTONES.migracion_insert_sucursales') IS NOT NULL
	DROP PROCEDURE LOS_BORBOTONES.migracion_insert_sucursales;
GO

IF OBJECT_ID('LOS_BORBOTONES.migracion_insert_aerolineas') IS NOT NULL
	DROP PROCEDURE LOS_BORBOTONES.migracion_insert_aerolineas;
GO

IF OBJECT_ID('LOS_BORBOTONES.migracion_insert_aviones') IS NOT NULL
	DROP PROCEDURE LOS_BORBOTONES.migracion_insert_aviones;
GO

IF OBJECT_ID('LOS_BORBOTONES.migracion_insert_ciudades') IS NOT NULL
	DROP PROCEDURE LOS_BORBOTONES.migracion_insert_ciudades;
GO

IF OBJECT_ID('LOS_BORBOTONES.migracion_insert_rutas_aereas') IS NOT NULL
	DROP PROCEDURE LOS_BORBOTONES.migracion_insert_rutas_aereas;
GO

IF OBJECT_ID('LOS_BORBOTONES.migracion_insert_tipos_butaca') IS NOT NULL
	DROP PROCEDURE LOS_BORBOTONES.migracion_insert_tipos_butaca;
GO

IF OBJECT_ID('LOS_BORBOTONES.migracion_insert_butacas') IS NOT NULL
	DROP PROCEDURE LOS_BORBOTONES.migracion_insert_butacas;
GO

IF OBJECT_ID('LOS_BORBOTONES.migracion_insert_grupos_hotelarios') IS NOT NULL
	DROP PROCEDURE LOS_BORBOTONES.migracion_insert_grupos_hotelarios;
GO

IF OBJECT_ID('LOS_BORBOTONES.migracion_insert_hoteles') IS NOT NULL
	DROP PROCEDURE LOS_BORBOTONES.migracion_insert_hoteles;
GO

IF OBJECT_ID('LOS_BORBOTONES.migracion_insert_tipos_habitacion') IS NOT NULL
	DROP PROCEDURE LOS_BORBOTONES.migracion_insert_tipos_habitacion;
GO

IF OBJECT_ID('LOS_BORBOTONES.migracion_insert_habitaciones') IS NOT NULL
	DROP PROCEDURE LOS_BORBOTONES.migracion_insert_habitaciones;
GO

IF OBJECT_ID('LOS_BORBOTONES.migracion_insert_compras') IS NOT NULL
	DROP PROCEDURE LOS_BORBOTONES.migracion_insert_compras;
GO

IF OBJECT_ID('LOS_BORBOTONES.migracion_insert_vuelos') IS NOT NULL
	DROP PROCEDURE LOS_BORBOTONES.migracion_insert_vuelos;
GO

IF OBJECT_ID('LOS_BORBOTONES.migracion_insert_facturas') IS NOT NULL
	DROP PROCEDURE LOS_BORBOTONES.migracion_insert_facturas;
GO

IF OBJECT_ID('LOS_BORBOTONES.migracion_insert_pasajes') IS NOT NULL
	DROP PROCEDURE LOS_BORBOTONES.migracion_insert_pasajes;
GO

IF OBJECT_ID('LOS_BORBOTONES.migracion_validar_pasajes') IS NOT NULL
	DROP PROCEDURE LOS_BORBOTONES.migracion_validar_pasajes;
GO

IF OBJECT_ID('LOS_BORBOTONES.migracion_insert_estadias') IS NOT NULL
	DROP PROCEDURE LOS_BORBOTONES.migracion_insert_estadias;
GO

------------------------------ DROP DEL SCHEMA ------------------------------

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'LOS_BORBOTONES')
  	BEGIN
    	EXEC ('CREATE SCHEMA LOS_BORBOTONES');
  	END
GO

------------------------------ CREACION DE TABLAS ------------------------------

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
	vuelo_ruta_aerea_id INT,
	vuelo_aerolinea_codigo INT
)

CREATE TABLE LOS_BORBOTONES.CIUDAD (
	ciudad_codigo INT IDENTITY(1,1) NOT NULL,
	ciudad_detalle nvarchar(255)
)

CREATE TABLE LOS_BORBOTONES.RUTA_AEREA (
	ruta_aerea_id INT IDENTITY(1,1) NOT NULL,
	ruta_aerea_codigo decimal(18,0) NOT NULL,
	ruta_aerea_ciu_origen INT NOT NULL,
	ruta_aerea_ciu_destino INT NOT NULL
)

CREATE TABLE LOS_BORBOTONES.TIPO_BUTACA (
	tipo_butaca_codigo INT IDENTITY(1,1) NOT NULL,
	tipo_butaca_detalle nvarchar(255)
)

CREATE TABLE LOS_BORBOTONES.BUTACA (
	butaca_id INT IDENTITY(1,1) NOT NULL,
	butaca_numero decimal(18,0),
	butaca_tipo_butaca_codigo INT,
	butaca_avion_id nvarchar(50)
)

CREATE TABLE LOS_BORBOTONES.GRUPO_HOTELARIO (
	grupo_hotelario_codigo INT IDENTITY(1,1) NOT NULL,
	grupo_hotelario_razon_social nvarchar(255)
)

CREATE TABLE LOS_BORBOTONES.HOTEL (
	hotel_codigo INT IDENTITY(1,1) NOT NULL,
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
	habitacion_hotel_codigo INT NOT NULL,
	habitacion_piso decimal(18,0),
	habitacion_frente nvarchar(50),
	habitacion_costo decimal(18,2),
	habitacion_precio decimal(18,2),
	habitacion_tipo_habitacion_codigo decimal(18,0)
)

CREATE TABLE LOS_BORBOTONES.FACTURA (
	factura_numero decimal(18,0) NOT NULL,
	factura_fecha datetime2(3),
	factura_cliente_id INT,
	factura_sucursal_id INT
)

CREATE TABLE LOS_BORBOTONES.COMPRA_EMPRESA_TURISMO (
	compra_empr_numero decimal(18,0) NOT NULL,
	compra_empr_fecha datetime2(3)
)

CREATE TABLE LOS_BORBOTONES.PASAJE (
	pasaje_codigo decimal(18,0) NOT NULL,
	pasaje_costo decimal(18,2),
	pasaje_precio decimal(18,2),
	pasaje_vuelo_codigo decimal(19,0),
	pasaje_butaca_id INT,
	pasaje_factura_numero decimal(18,0),
	pasaje_compra_numero decimal(18,0),
	pasaje_valido bit
)

CREATE TABLE LOS_BORBOTONES.ESTADIA (
	estadia_codigo decimal(18,0) NOT NULL,
	estadia_fecha_inicial datetime2(3),
	estadia_fecha_fin datetime2(3),
	estadia_cantidad_noches decimal(18,0),
	estadia_hotel_codigo INT,
	estadia_habitacion_numero decimal(18,0),
	estadia_costo decimal(18,2),
	estadia_precio decimal(18,2),
	estadia_factura_numero decimal(18,0),
	estadia_compra_numero decimal(18,0)
)

------------------------------ CREANDO PRIMARY KEY ------------------------------

ALTER TABLE LOS_BORBOTONES.CLIENTE ADD CONSTRAINT PK_CLIENTE_ID PRIMARY KEY (cliente_id);
ALTER TABLE LOS_BORBOTONES.SUCURSAL ADD CONSTRAINT PK_SUCURSAL_ID PRIMARY KEY (sucursal_id);
ALTER TABLE LOS_BORBOTONES.AEROLINEA ADD CONSTRAINT PK_AEROLINEA_CODIGO PRIMARY KEY (aerolinea_codigo);
ALTER TABLE LOS_BORBOTONES.AVION ADD CONSTRAINT PK_AVION_ID PRIMARY KEY (avion_id);
ALTER TABLE LOS_BORBOTONES.VUELO ADD CONSTRAINT PK_VUELO_CODIGO PRIMARY KEY (vuelo_codigo);
ALTER TABLE LOS_BORBOTONES.CIUDAD ADD CONSTRAINT PK_CIUDAD_CODIGO PRIMARY KEY (ciudad_codigo);
ALTER TABLE LOS_BORBOTONES.RUTA_AEREA ADD CONSTRAINT PK_RUTA_AEREA_ID PRIMARY KEY (ruta_aerea_id);
ALTER TABLE LOS_BORBOTONES.TIPO_BUTACA ADD CONSTRAINT PK_TIPO_BUTACA_CODIGO PRIMARY KEY (tipo_butaca_codigo);
ALTER TABLE LOS_BORBOTONES.BUTACA ADD CONSTRAINT PK_BUTACA_ID PRIMARY KEY (butaca_id);
ALTER TABLE LOS_BORBOTONES.GRUPO_HOTELARIO ADD CONSTRAINT PK_GRUPO_HOTELARIO_CODIGO PRIMARY KEY (grupo_hotelario_codigo);
ALTER TABLE LOS_BORBOTONES.HOTEL ADD CONSTRAINT PK_HOTEL_CODIGO PRIMARY KEY (hotel_codigo);
ALTER TABLE LOS_BORBOTONES.TIPO_HABITACION ADD CONSTRAINT PK_TIPO_HABITACION_CODIGO PRIMARY KEY (tipo_habitacion_codigo);
ALTER TABLE LOS_BORBOTONES.HABITACION ADD CONSTRAINT PK_HABITACION_NUMERO_CODIGO_HOTEL PRIMARY KEY (habitacion_numero, habitacion_hotel_codigo);
ALTER TABLE LOS_BORBOTONES.FACTURA ADD CONSTRAINT PK_FACTURA_NUMERO PRIMARY KEY (factura_numero);
ALTER TABLE LOS_BORBOTONES.COMPRA_EMPRESA_TURISMO ADD CONSTRAINT PK_COMPRA_NUMERO PRIMARY KEY (compra_empr_numero);
ALTER TABLE LOS_BORBOTONES.PASAJE ADD CONSTRAINT PK_PASAJE_CODIGO PRIMARY KEY (pasaje_codigo);
ALTER TABLE LOS_BORBOTONES.ESTADIA ADD CONSTRAINT PK_ESTADIA_CODIGO PRIMARY KEY (estadia_codigo);
GO

------------------------------ CREANDO FOREIGN KEY ------------------------------

ALTER TABLE LOS_BORBOTONES.VUELO ADD CONSTRAINT FK_VUELO_AVION_ID FOREIGN KEY (vuelo_avion_id) REFERENCES LOS_BORBOTONES.AVION(avion_id);
ALTER TABLE LOS_BORBOTONES.VUELO ADD CONSTRAINT FK_VUELO_AEROLINEA_CODIGO FOREIGN KEY (vuelo_aerolinea_codigo) REFERENCES LOS_BORBOTONES.AEROLINEA(aerolinea_codigo);
ALTER TABLE LOS_BORBOTONES.VUELO ADD CONSTRAINT FK_VUELO_RUTA_AEREA FOREIGN KEY (vuelo_ruta_aerea_id) REFERENCES LOS_BORBOTONES.RUTA_AEREA(ruta_aerea_id);
ALTER TABLE LOS_BORBOTONES.RUTA_AEREA ADD CONSTRAINT FK_RUTA_AEREA_CIUDAD_ORIGEN FOREIGN KEY (ruta_aerea_ciu_origen) REFERENCES LOS_BORBOTONES.CIUDAD(ciudad_codigo);
ALTER TABLE LOS_BORBOTONES.RUTA_AEREA ADD CONSTRAINT FK_RUTA_AEREA_CIUDAD_DESTINO FOREIGN KEY (ruta_aerea_ciu_destino) REFERENCES LOS_BORBOTONES.CIUDAD(ciudad_codigo);
ALTER TABLE LOS_BORBOTONES.BUTACA ADD CONSTRAINT FK_BUTACA_TIPO_BUTACA_CODIGO FOREIGN KEY (butaca_tipo_butaca_codigo) REFERENCES LOS_BORBOTONES.TIPO_BUTACA(tipo_butaca_codigo);
ALTER TABLE LOS_BORBOTONES.BUTACA ADD CONSTRAINT FK_BUTACA_AVION_ID FOREIGN KEY (butaca_avion_id) REFERENCES LOS_BORBOTONES.AVION(avion_id);
ALTER TABLE LOS_BORBOTONES.HOTEL ADD CONSTRAINT FK_HOTEL_GRUPO_HOTELARIO_CODIGO FOREIGN KEY (hotel_grupo_hotelario_codigo) REFERENCES LOS_BORBOTONES.GRUPO_HOTELARIO(grupo_hotelario_codigo);
ALTER TABLE LOS_BORBOTONES.HABITACION ADD CONSTRAINT FK_HABITACION_CODIGO_HOTEL FOREIGN KEY (habitacion_hotel_codigo) REFERENCES LOS_BORBOTONES.HOTEL(hotel_codigo);
ALTER TABLE LOS_BORBOTONES.HABITACION ADD CONSTRAINT FK_HABITACION_TIPO_HABITACION_CODIGO FOREIGN KEY (habitacion_tipo_habitacion_codigo) REFERENCES LOS_BORBOTONES.TIPO_HABITACION(tipo_habitacion_codigo);
ALTER TABLE LOS_BORBOTONES.FACTURA ADD CONSTRAINT FK_FACTURA_CLIENTE_ID FOREIGN KEY (factura_cliente_id) REFERENCES LOS_BORBOTONES.CLIENTE(cliente_id);
ALTER TABLE LOS_BORBOTONES.FACTURA ADD CONSTRAINT FK_FACTURA_SUCURSAL_ID FOREIGN KEY (factura_sucursal_id) REFERENCES LOS_BORBOTONES.SUCURSAL(sucursal_id);
ALTER TABLE LOS_BORBOTONES.PASAJE ADD CONSTRAINT FK_PASAJE_VUELO_CODIGO FOREIGN KEY (pasaje_vuelo_codigo) REFERENCES LOS_BORBOTONES.VUELO(vuelo_codigo);
ALTER TABLE LOS_BORBOTONES.PASAJE ADD CONSTRAINT FK_PASAJE_BUTACA_ID FOREIGN KEY (pasaje_butaca_id) REFERENCES LOS_BORBOTONES.BUTACA(butaca_id);
ALTER TABLE LOS_BORBOTONES.PASAJE ADD CONSTRAINT FK_PASAJE_FACTURA_NUMERO FOREIGN KEY (pasaje_factura_numero) REFERENCES LOS_BORBOTONES.FACTURA(factura_numero);
ALTER TABLE LOS_BORBOTONES.PASAJE ADD CONSTRAINT FK_PASAJE_COMPRA_NUMERO FOREIGN KEY (pasaje_compra_numero) REFERENCES LOS_BORBOTONES.COMPRA_EMPRESA_TURISMO(compra_empr_numero);
ALTER TABLE LOS_BORBOTONES.ESTADIA ADD CONSTRAINT FK_ESTADIA_HOTEL_HABITACION FOREIGN KEY (estadia_habitacion_numero, estadia_hotel_codigo) REFERENCES LOS_BORBOTONES.HABITACION(habitacion_numero, habitacion_hotel_codigo);
ALTER TABLE LOS_BORBOTONES.ESTADIA ADD CONSTRAINT FK_ESTADIA_FACTURA_NUMERO FOREIGN KEY (estadia_factura_numero) REFERENCES LOS_BORBOTONES.FACTURA(factura_numero);
ALTER TABLE LOS_BORBOTONES.ESTADIA ADD CONSTRAINT FK_ESTADIA_COMPRA_NUMERO FOREIGN KEY (estadia_compra_numero) REFERENCES LOS_BORBOTONES.COMPRA_EMPRESA_TURISMO(compra_empr_numero);
GO

------------------------------ MIGRACION ------------------------------

------------------------------ FUNCIONES ------------------------------ 

-- Obtengo el codigo de la ciudad utilizando el detalle de la ciudad
CREATE FUNCTION LOS_BORBOTONES.get_codigo_ciudad_by_detalle_ciudad(@detalleCiudad NVARCHAR(255))
RETURNS INT
BEGIN
	RETURN (SELECT ciudad_codigo
			FROM LOS_BORBOTONES.CIUDAD
			WHERE ciudad_detalle = @detalleCiudad)
END
GO

-- Obtengo el codigo del hotel utilizando la calle y el numero de calle
CREATE FUNCTION LOS_BORBOTONES.get_hotel_codigo_by_calle_y_nro_calle (@calle nvarchar(50), @nro_calle decimal(18,0))
RETURNS INT
AS
BEGIN
	RETURN (SELECT hotel_codigo 
			FROM LOS_BORBOTONES.HOTEL 
			WHERE hotel_calle = @calle AND hotel_nro_calle = @nro_calle)
END
GO

-- Obtengo el codigo del grupo hotelario utilizando la razon social de la empresa
CREATE FUNCTION LOS_BORBOTONES.get_grupo_hotelario_codigo_by_empresa_razon_social(@empresa_razon_social nvarchar(255))
RETURNS INT
AS
BEGIN
	RETURN (SELECT grupo_hotelario_codigo
			FROM LOS_BORBOTONES.GRUPO_HOTELARIO 
			WHERE grupo_hotelario_razon_social = @empresa_razon_social)
END
GO

-- Obtengo el codigo de aerolinea utilizando la razon social de la empresa
CREATE FUNCTION LOS_BORBOTONES.get_aerolinea_codigo_by_empresa_razon_social(@empresa_razon_social nvarchar(255))
RETURNS INT
AS
BEGIN
	RETURN (SELECT aerolinea_codigo
			FROM LOS_BORBOTONES.AEROLINEA 
			WHERE aerolinea_razon_social = @empresa_razon_social)
END
GO

-- Obtengo el codigo del tipo de butaca utilizando el detalle del tipo de butaca
CREATE FUNCTION LOS_BORBOTONES.get_tipo_butaca_codigo_by_tipo_butaca_detalle(@tipo_butaca_detalle nvarchar(255))
RETURNS INT
AS
BEGIN
	RETURN (SELECT tipo_butaca_codigo
			FROM LOS_BORBOTONES.TIPO_BUTACA
			WHERE tipo_butaca_detalle = @tipo_butaca_detalle)
END
GO

CREATE FUNCTION LOS_BORBOTONES.get_butaca_id_by_avion_numero_butaca_tipo_butaca(@avion nvarchar(50), @butaca_numero decimal(18,0), @tipo_butaca_codigo nvarchar(255))
RETURNS INT
AS
BEGIN
	RETURN (select butaca_id
	from LOS_BORBOTONES.BUTACA
	where butaca_avion_id = @avion and butaca_numero = @butaca_numero and butaca_tipo_butaca_codigo = @tipo_butaca_codigo)
END
GO

-- Obtengo ruta aerea id utilizando los codigos de ciudades, y a su vez, uso la otra funcion para obtener el codigo ciudad utilizando el detalle
CREATE FUNCTION LOS_BORBOTONES.get_ruta_aerea_id_by_ruta_aerea_codigo_ciudad_origen_ciudad_destino(@ruta_aerea_codigo decimal(18,0), @ciudad_origen nvarchar(255), @ciudad_destino nvarchar(255))
RETURNS INT
AS
BEGIN
    RETURN (select ruta_aerea_id
    from LOS_BORBOTONES.RUTA_AEREA
    where ruta_aerea_codigo = @ruta_aerea_codigo and ruta_aerea_ciu_origen = LOS_BORBOTONES.get_codigo_ciudad_by_detalle_ciudad(@ciudad_origen) and ruta_aerea_ciu_destino = LOS_BORBOTONES.get_codigo_ciudad_by_detalle_ciudad(@ciudad_destino))
END
GO

--------------- STORED PROCEDURES PARA MIGRAR LOS DATOS A LAS TABLAS -----------------

------------------------------ CLIENTES --------------------------------

CREATE PROC LOS_BORBOTONES.migracion_insert_clientes AS
BEGIN
	INSERT INTO LOS_BORBOTONES.CLIENTE(cliente_apellido, cliente_nombre, cliente_dni, cliente_fecha_nac, cliente_mail, cliente_telefono)
		SELECT	CLIENTE_APELLIDO, CLIENTE_NOMBRE, CLIENTE_DNI, CLIENTE_FECHA_NAC, CLIENTE_MAIL, CLIENTE_TELEFONO
		FROM gd_esquema.Maestra
		WHERE CLIENTE_DNI IS NOT NULL
		GROUP BY CLIENTE_APELLIDO, CLIENTE_NOMBRE, CLIENTE_DNI, CLIENTE_FECHA_NAC, CLIENTE_MAIL, CLIENTE_TELEFONO
		ORDER BY CLIENTE_DNI
END
GO

------------------------------ SUCURSALES ------------------------------ 

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

------------------------------ AEROLINEAS ------------------------------ 

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

------------------------------ AVIONES ------------------------------ 

CREATE PROC LOS_BORBOTONES.migracion_insert_aviones AS
BEGIN
	INSERT INTO LOS_BORBOTONES.AVION(avion_id, avion_modelo)
		SELECT AVION_IDENTIFICADOR, AVION_MODELO
		FROM gd_esquema.Maestra
		WHERE AVION_IDENTIFICADOR IS NOT NULL
		GROUP BY AVION_IDENTIFICADOR, AVION_MODELO
		ORDER BY AVION_IDENTIFICADOR
END
GO

---------------------------- CIUDADES ------------------------------ 

CREATE PROC LOS_BORBOTONES.migracion_insert_ciudades AS
BEGIN
	INSERT INTO LOS_BORBOTONES.CIUDAD(ciudad_detalle)
		SELECT DISTINCT RUTA_AEREA_CIU_ORIG
		FROM gd_esquema.Maestra
		WHERE RUTA_AEREA_CODIGO IS NOT NULL AND RUTA_AEREA_CIU_ORIG IS NOT NULL
		ORDER BY RUTA_AEREA_CIU_ORIG
END
GO

------------------------------ RUTAS AEREAS ---------------------------

CREATE PROC LOS_BORBOTONES.migracion_insert_rutas_aereas AS
BEGIN
	INSERT INTO LOS_BORBOTONES.RUTA_AEREA(ruta_aerea_codigo, ruta_aerea_ciu_origen, ruta_aerea_ciu_destino)
		SELECT 	RA.RUTA_AEREA_CODIGO,
				LOS_BORBOTONES.get_codigo_ciudad_by_detalle_ciudad(RA.RUTA_AEREA_CIU_ORIG),
				LOS_BORBOTONES.get_codigo_ciudad_by_detalle_ciudad(RA.RUTA_AEREA_CIU_DEST)
		FROM GD1C2020.gd_esquema.Maestra RA 
		WHERE RUTA_AEREA_CODIGO IS NOT NULL
		GROUP BY RA.RUTA_AEREA_CODIGO, RA.RUTA_AEREA_CIU_ORIG, RA.RUTA_AEREA_CIU_DEST
		ORDER BY RA.RUTA_AEREA_CODIGO
END
GO

------------------------------ TIPOS DE BUTACA -------------------------

CREATE PROC LOS_BORBOTONES.migracion_insert_tipos_butaca AS
BEGIN
	INSERT INTO LOS_BORBOTONES.TIPO_BUTACA(tipo_butaca_detalle)
		SELECT DISTINCT BUTACA_TIPO
		FROM gd_esquema.Maestra
		WHERE BUTACA_TIPO IS NOT NULL
		ORDER BY BUTACA_TIPO
END
GO

------------------------------ BUTACAS ----------------------------------

CREATE PROC LOS_BORBOTONES.migracion_insert_butacas AS
BEGIN
	INSERT INTO LOS_BORBOTONES.BUTACA(butaca_numero, butaca_tipo_butaca_codigo, butaca_avion_id)
		SELECT 	BUTACA_NUMERO,
				LOS_BORBOTONES.get_tipo_butaca_codigo_by_tipo_butaca_detalle(BUTACA_TIPO),
				AVION_IDENTIFICADOR
		FROM GD1C2020.gd_esquema.Maestra 
		WHERE BUTACA_NUMERO IS NOT NULL
		GROUP BY BUTACA_NUMERO, LOS_BORBOTONES.get_tipo_butaca_codigo_by_tipo_butaca_detalle(BUTACA_TIPO), AVION_IDENTIFICADOR
		ORDER BY AVION_IDENTIFICADOR, BUTACA_NUMERO, LOS_BORBOTONES.get_tipo_butaca_codigo_by_tipo_butaca_detalle(BUTACA_TIPO)
END
GO

------------------------------ GRUPOS HOTELARIOS -------------------------

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

------------------------------ HOTELES ---------------------------------

CREATE PROC LOS_BORBOTONES.migracion_insert_hoteles AS
BEGIN
	INSERT INTO LOS_BORBOTONES.HOTEL(hotel_calle, hotel_nro_calle, hotel_cantidad_estrellas, hotel_grupo_hotelario_codigo)
		SELECT 	HOTEL_CALLE,
				HOTEL_NRO_CALLE,
				HOTEL_CANTIDAD_ESTRELLAS,
				LOS_BORBOTONES.get_grupo_hotelario_codigo_by_empresa_razon_social(EMPRESA_RAZON_SOCIAL)
		FROM gd_esquema.Maestra
		WHERE EMPRESA_RAZON_SOCIAL IS NOT NULL AND ESTADIA_CODIGO IS NOT NULL
		GROUP BY HOTEL_CALLE, HOTEL_NRO_CALLE, HOTEL_CANTIDAD_ESTRELLAS,LOS_BORBOTONES.get_grupo_hotelario_codigo_by_empresa_razon_social(EMPRESA_RAZON_SOCIAL)
		ORDER BY 4
END
GO

------------------------------ TIPOS DE HABITACION -------------------------

CREATE PROC LOS_BORBOTONES.migracion_insert_tipos_habitacion AS
BEGIN
	INSERT INTO LOS_BORBOTONES.TIPO_HABITACION(tipo_habitacion_codigo, tipo_habitacion_detalle)
		SELECT TIPO_HABITACION_CODIGO, TIPO_HABITACION_DESC
		FROM gd_esquema.Maestra
		WHERE TIPO_HABITACION_CODIGO IS NOT NULL
		GROUP BY TIPO_HABITACION_CODIGO, TIPO_HABITACION_DESC
		ORDER BY TIPO_HABITACION_CODIGO
END
GO

---------------------------------- HABITACION --------------------------------

CREATE PROC LOS_BORBOTONES.migracion_insert_habitaciones AS
BEGIN
	INSERT INTO LOS_BORBOTONES.HABITACION(habitacion_numero, habitacion_hotel_codigo, habitacion_piso, habitacion_frente, habitacion_costo, habitacion_precio, habitacion_tipo_habitacion_codigo)
		SELECT HABITACION_NUMERO,
				LOS_BORBOTONES.get_hotel_codigo_by_calle_y_nro_calle(HOTEL_CALLE, HOTEL_NRO_CALLE),
				HABITACION_PISO,
				HABITACION_FRENTE,
				HABITACION_COSTO,
				HABITACION_PRECIO,
				TIPO_HABITACION_CODIGO
		FROM gd_esquema.Maestra
		WHERE ESTADIA_CODIGO IS NOT NULL
		GROUP BY HABITACION_NUMERO,
				 LOS_BORBOTONES.get_hotel_codigo_by_calle_y_nro_calle(HOTEL_CALLE, HOTEL_NRO_CALLE),
				 HABITACION_PISO,
				 HABITACION_FRENTE,
				 HABITACION_COSTO,
				 HABITACION_PRECIO,
				 TIPO_HABITACION_CODIGO
		ORDER BY 2,1
END
GO

------------------------------ VUELO ---------------------------------------

CREATE PROC LOS_BORBOTONES.migracion_insert_vuelos AS
BEGIN
	INSERT INTO LOS_BORBOTONES.VUELO(vuelo_codigo, vuelo_fecha_salida, vuelo_fecha_llegada, vuelo_avion_id, vuelo_ruta_aerea_id, vuelo_aerolinea_codigo)
		SELECT 	VUELO_CODIGO,
				VUELO_FECHA_SALUDA,
				VUELO_FECHA_LLEGADA,
				AVION_IDENTIFICADOR,
				LOS_BORBOTONES.get_ruta_aerea_id_by_ruta_aerea_codigo_ciudad_origen_ciudad_destino(RUTA_AEREA_CODIGO, RUTA_AEREA_CIU_ORIG, RUTA_AEREA_CIU_DEST),
				LOS_BORBOTONES.get_aerolinea_codigo_by_empresa_razon_social(EMPRESA_RAZON_SOCIAL)
		FROM GD1C2020.gd_esquema.Maestra
		WHERE VUELO_CODIGO IS NOT NULL
		GROUP BY VUELO_CODIGO,
				 VUELO_FECHA_SALUDA,
				 VUELO_FECHA_LLEGADA,
				 AVION_IDENTIFICADOR,
				 LOS_BORBOTONES.get_ruta_aerea_id_by_ruta_aerea_codigo_ciudad_origen_ciudad_destino(RUTA_AEREA_CODIGO, RUTA_AEREA_CIU_ORIG, RUTA_AEREA_CIU_DEST),
				 LOS_BORBOTONES.get_aerolinea_codigo_by_empresa_razon_social(EMPRESA_RAZON_SOCIAL)
		ORDER BY VUELO_CODIGO, VUELO_FECHA_SALUDA
END
GO

------------------------------ COMPRAS EMPRESA TURISMO ---------------------------

CREATE PROC LOS_BORBOTONES.migracion_insert_compras AS
BEGIN
	INSERT INTO LOS_BORBOTONES.COMPRA_EMPRESA_TURISMO(compra_empr_numero, compra_empr_fecha)
		SELECT COMPRA_NUMERO, COMPRA_FECHA
		FROM GD1C2020.gd_esquema.Maestra
		GROUP BY COMPRA_NUMERO, COMPRA_FECHA
		ORDER BY COMPRA_FECHA, COMPRA_NUMERO
END
GO

------------------------------ FACTURA ------------------------------------------

CREATE PROC LOS_BORBOTONES.migracion_insert_facturas AS
BEGIN
	INSERT INTO LOS_BORBOTONES.FACTURA(factura_numero, factura_fecha, factura_cliente_id, factura_sucursal_id)
		SELECT 	FACTURA_NRO,
				FACTURA_FECHA,
				cliente_id,
				sucursal_id
		FROM GD1C2020.gd_esquema.Maestra M
		JOIN CLIENTE C ON M.CLIENTE_NOMBRE = C.cliente_nombre AND M.CLIENTE_APELLIDO = C.cliente_apellido AND M.CLIENTE_DNI = C.cliente_dni
		JOIN SUCURSAL ON SUCURSAL_DIR = sucursal_direccion
		WHERE FACTURA_NRO IS NOT NULL
		ORDER BY FACTURA_FECHA
END
GO

------------------------------ PASAJE ------------------------------------

CREATE PROC LOS_BORBOTONES.migracion_insert_pasajes AS
BEGIN
	INSERT INTO LOS_BORBOTONES.PASAJE	
	SELECT 	P.PASAJE_CODIGO,
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
END
GO

-------------------------- INVALIDAR LOS PASAJES REPETIDOS ----------------------------------

CREATE PROC LOS_BORBOTONES.migracion_validar_pasajes AS
BEGIN
	-- PRIMERO SE MARCAN COMO NO VALIDOS AQUELLOS PASAJES QUE ESTEN REPETIDOS Y AMBOS ESTEN VENDIDOS
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

	-- SE MARCAN COMO NO VALIDOS LOS PASAJES QUE ESTAN REPETIDOS Y UN PASAJE ESTE VENDIDO Y EL OTRO NO VENDIDO
	UPDATE P SET P.pasaje_valido = 0
	FROM LOS_BORBOTONES.PASAJE P
	WHERE P.pasaje_factura_numero IS NULL AND (SELECT COUNT(*)
												FROM LOS_BORBOTONES.PASAJE R
												WHERE R.pasaje_vuelo_codigo = P.pasaje_vuelo_codigo 
													AND R.pasaje_butaca_id = P.pasaje_butaca_id
													AND R.pasaje_codigo != P.pasaje_codigo 
													AND R.pasaje_factura_numero IS NOT NULL) >= 1
	
	-- SE MARCAN COMO NO VALIDOS LOS PASAJES QUE ESTAN REPETIDOS Y ESTAN AMBOS COMPRADOS PERO NO VENDIDOS
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
END
GO
------------------------------ ESTADIA --------------------------------------------

CREATE PROC LOS_BORBOTONES.migracion_insert_estadias AS
BEGIN
	INSERT INTO LOS_BORBOTONES.ESTADIA(estadia_codigo, estadia_fecha_inicial, estadia_fecha_fin, estadia_cantidad_noches, estadia_hotel_codigo, estadia_habitacion_numero, estadia_costo, estadia_precio, estadia_factura_numero, estadia_compra_numero)
		SELECT	ESTADIA_CODIGO,
				ESTADIA_FECHA_INI,
				DATEADD(DAY, ESTADIA_CANTIDAD_NOCHES, ESTADIA_FECHA_INI),
				ESTADIA_CANTIDAD_NOCHES,
				LOS_BORBOTONES.get_hotel_codigo_by_calle_y_nro_calle(HOTEL_CALLE, HOTEL_NRO_CALLE),
				HABITACION_NUMERO,
				(HABITACION_COSTO * ESTADIA_CANTIDAD_NOCHES),
				(HABITACION_PRECIO * ESTADIA_CANTIDAD_NOCHES),
				FACTURA_NRO,
				COMPRA_NUMERO
		FROM GD1C2020.gd_esquema.Maestra
		WHERE ESTADIA_CODIGO IS NOT NULL AND FACTURA_NRO IS NOT NULL
		ORDER BY ESTADIA_CODIGO
END
GO

--------------------------- EJECUCION DE LOS PROCEDURES ------------------------------

EXEC LOS_BORBOTONES.migracion_insert_clientes;
EXEC LOS_BORBOTONES.migracion_insert_sucursales;
EXEC LOS_BORBOTONES.migracion_insert_aerolineas;
EXEC LOS_BORBOTONES.migracion_insert_aviones;
EXEC LOS_BORBOTONES.migracion_insert_ciudades;
EXEC LOS_BORBOTONES.migracion_insert_rutas_aereas;
EXEC LOS_BORBOTONES.migracion_insert_tipos_butaca;
EXEC LOS_BORBOTONES.migracion_insert_butacas;
EXEC LOS_BORBOTONES.migracion_insert_grupos_hotelarios;
EXEC LOS_BORBOTONES.migracion_insert_hoteles;
EXEC LOS_BORBOTONES.migracion_insert_tipos_habitacion;
EXEC LOS_BORBOTONES.migracion_insert_habitaciones;
EXEC LOS_BORBOTONES.migracion_insert_vuelos;
EXEC LOS_BORBOTONES.migracion_insert_compras;
EXEC LOS_BORBOTONES.migracion_insert_facturas;
EXEC LOS_BORBOTONES.migracion_insert_pasajes;
EXEC LOS_BORBOTONES.migracion_validar_pasajes;
EXEC LOS_BORBOTONES.migracion_insert_estadias;