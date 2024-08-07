use Inmobiliaria
go
create database Inmobiliaria
go
use Inmobiliaria

go
/*
create table Localidad(
CP int not null,
Nombre varchar (50) not null unique,
Partido varchar (50) not null,
primary key (CP)
)
go
create table Categoria(
Id smallint identity (1,1) not null,
Nombre varchar (50) not null unique,
primary key (Id)
)
go
create table Usuario(
Id int identity (1,1) not null,
Nombre varchar (50) not null unique,
Contrase�a varchar (15) not null,
IDTipo bit not null,
Saldo money NULL,
Activo bit,
primary key (Id)
)

go
create table Inmueble(
Id int identity (1,1) not null,
Nombreusuario varchar (50) not null foreign key references Usuario (Nombre),
Nombre varchar (50) not null,
Descripcion varchar (500) null,
Domicilio varchar (50)not null,
Id_categoria smallint not null foreign key references Categoria,
Codigo_Postal int not null foreign key references Localidad (CP),
Precio money not null,
Ambientes int not null,
Ba�os int not null,
Gas_Natural bit,
Agua_Corriente bit,
Cloacas bit,
Luz bit,
Cochera bit,
Patio bit,
Aire_Acondicionado bit,
Calefacci�n bit,
Pavimento bit,
Pausa bit,
Estado bit,
Activa bit,
TipoOperacion varchar(20) not null,
primary key (Id)
)
go
create table Imagen(
Id int identity (1,1) not null,
ImagenUrl varchar (1000) not null,
Id_Inmueble int not null
)
go
create table DatosUsuario(
Email varchar (50) not null foreign key references Usuario (Nombre),
Nombres varchar (50) not null,
Apellidos varchar (15) not null,
Dni varchar(10) not null,
Celular varchar(15) not null,
Domicilio varchar (50) not null,
FechaNacimiento date not null,
Activo bit not null
)
go
create table  Email(
Id int identity (1,1) not null,
destinatario varchar (50) not null foreign key references Usuario (Nombre),
remitente varchar (50) not null foreign key references Usuario (Nombre),
Asunto varchar (100) not null,
Mensaje varchar (500) not null,
Estado bit, 
Visto bit,
FechaHora datetime not null,
primary key (Id)
)
go
create table PagosInmobiliaria (
    Id int identity(1,1) not null primary key,
    Id_Inmueble int not null,
    Id_Usuario int not null,
    pago varchar(100) not null,
    Fecha datetime not null,
    foreign key (Id_Inmueble) references Inmueble(Id),
    foreign key (Id_Usuario) references Usuario(Id)
)
go
create table FormaDePago (
    IDFormaDePago INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL
)
go
insert into Localidad values (1618,'El Talar','Tigre'),
(1617,'General Pacheco','Tigre'),
(1610,'Ricardo Rojas','Tigre'),
(1621,'Benavidez','Tigre'),
(1670,'Nordelta','Tigre'),
(1648,'Tigre','Tigre'),
(1611,'Don Torcuato','Tigre'),
(1622,'Dique Lujan','Tigre'),
(1649,'Rincon de Milberg','Tigre'),
(1608,'Los Troncos del Talar','Tigre'),
(1638,'Vicente Lopez ','Tigre'),
(1645,'Virreyes','San Fernando'),
(1644,'Victoria','San Fernando'),
(1646,'San Fernando','San Fernando')
go
insert into Categoria values ('Casa'),
('Departamento'),
('Monoambiente'), 
('PH'),
('Duplex'),
('Triplex'),
('Local'),
('Chalet')
go
insert into Usuario values ('admin', 'admin',1,0,1),
('macarena@gmail.com','Macarena1',0,0,1),
('alejandro@gmail.com','Alejandro1',0,0,1),
('martin@gmail.com','Martin1',0,0,1)
go
insert into DatosUsuario values('macarena@gmail.com','macarena','casas','38393020','12345678','chaco 470','1994-11-10',0 ),
('martin@gmail.com','martin','casas','43252525','87654321','gutemberg 850','2002-10-02',0 ),
('alejandro@gmail.com','Alejandro','Beron','37059354','1133333344','general Pacheco 123','1992-09-05',0 )
go
insert into Inmueble values ('admin','casa azul','amplia y luminosa','las palmas 123',1,1617,50000,3,2,1,1,0,1,0,1,1,1,0,1,1,0,'venta'),
 ('macarena@gmail.com','casa madera','rustica y acogedora','calle falsa 321',3,1618,20000,2,1,1,1,1,1,0,0,0,1,0,1,1,0,'alquiler'),
 ('martin@gmail.com','casa moderna','amplia y hogare�a','hudson 457',4,1611,80000,3,3,1,0,1,0,1,0,0,1,1,1,1,0,'venta'),
 ('alejandro@gmail.com','duplex a estrenar','excelente oportunidad negocio','medio del bosque 1',5,1645,200000,2,1,1,1,1,0,0,0,1,1,1,1,1,0,'venta')
go
insert into Imagen values ('https://definicion.de/wp-content/uploads/2011/01/casa-2.jpg',1),
('https://i.blogs.es/c68014/casa-3d/450_1000.jpeg',2),
('https://hips.hearstapps.com/hmg-prod/images/casa-de-madera-de-diseno-moderno21-645b7b443ba61.jpg?resize=980:*',3),
('https://definicion.de/wp-content/uploads/2011/01/ambiente.jpg',1)
go


  CREATE or alter PROCEDURE DescontarSaldoPorFormaPago
    @Id_Usuario int,
    @Id_Inmueble int,
    @FormaPago varchar(100)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MontoDescuento money;
    DECLARE @Fecha datetime = GETDATE()

    -- Determinar el monto a descontar seg�n la forma de pago
    IF @FormaPago = 'Hierro'
    BEGIN
        SET @MontoDescuento = 500;
    END
    ELSE IF @FormaPago = 'Plata'
    BEGIN
        SET @MontoDescuento = 750;
    END
    ELSE IF @FormaPago = 'Oro'
    BEGIN
        SET @MontoDescuento = 1000;
    END
	 ELSE IF @FormaPago = 'Diamante'
    BEGIN
        SET @MontoDescuento = 1500;
    END
	 ELSE IF @FormaPago = 'Platino'
    BEGIN
        SET @MontoDescuento = 2500;
    END
    ELSE
    BEGIN
        -- Si la forma de pago no es v�lida, lanzar un error
        THROW 50001, 'Error: Forma de pago no v�lida.', 1;
    END

    BEGIN TRY
        -- Iniciar la transacci�n
        BEGIN TRANSACTION;

        -- Verificar que el usuario tiene suficiente saldo
        DECLARE @Saldo_Usuario money;

        SELECT @Saldo_Usuario = Saldo
        FROM Usuario
        WHERE Id = @Id_Usuario;

        -- Verificar si el usuario tiene suficiente saldo para descontar
        IF @Saldo_Usuario < @MontoDescuento
        BEGIN
            -- Si no tiene suficiente saldo, lanzar un error y hacer rollback
            THROW 50002, 'Error: Saldo insuficiente para realizar el descuento.', 1
        END

        -- Actualizar el saldo del usuario (restar el monto correspondiente)
        UPDATE Usuario
        SET Saldo = Saldo - @MontoDescuento
        WHERE Id = @Id_Usuario;

        -- Insertar el registro de pago en PagosInmobiliaria
        INSERT INTO PagosInmobiliaria (Id_Inmueble, Id_Usuario, pagoID, Fecha)
        VALUES (@Id_Inmueble, @Id_Usuario, @FormaPago, @Fecha);

        -- Confirmar la transacci�n
        COMMIT TRANSACTION;

        PRINT 'Descuento realizado exitosamente y pago registrado en PagosInmobiliaria.'
    END TRY
    BEGIN CATCH
        -- Revertir la transacci�n en caso de error
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END

        -- Capturar y mostrar el mensaje de error
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
*/

CREATE OR ALTER PROCEDURE RecuperarContrase�a3
    @Email VARCHAR(50),
    @Dni VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Contrase�a VARCHAR(15);

    -- Verificar que el email y el DNI coincidan
    SELECT @Contrase�a = U.Contrase�a
    FROM Usuario U
    JOIN DatosUsuario DU ON U.Nombre = DU.Email
    WHERE DU.Email = @Email AND DU.Dni = @Dni;

    -- Si no se encuentra una coincidencia, lanzar un error
    IF @Contrase�a IS NULL
    BEGIN
        THROW 50001, 'Error: No se encontr� un usuario con el email y DNI proporcionados.', 1;
    END

    -- Devolver la contrase�a
    SELECT @Contrase�a AS Contrase�a;
END
GO
  


  exec RecuperarContrase�a3 'admin','001'


EXEC RecuperarContrase�a3 @email, @Dni;

select * from Usuario
select * from DatosUsuario
select * from Inmueble
select * from Imagen
select * from Email

