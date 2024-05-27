create database Inmobiliaria
go
use Inmobiliaria
go
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
create table Inmueble(
Id int identity (1,1) not null,
Nombre varchar (50) not null,
Descripcion varchar (500) null,
Id_categoria smallint not null foreign key references Categoria
Codigo_Postal int not null foreign key references Localidad (CP),
Precio money null,
primary key (Id)
)
go
create table Imagen(
Id int identity (1,1) not null,
ImagenUrl varchar (1000) not null,
Id_Inmueble int not null
)
go
create table Usuario(
Id int identity (1,1) not null,
Nombre varchar (50) not null,
Contraseña varchar (15) not null
)
go
