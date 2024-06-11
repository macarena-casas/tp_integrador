use master
go
create database Inmobiliaria
go
use Inmobiliaria
/*
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
Id_categoria smallint not null foreign key references Categoria,
Codigo_Postal int not null foreign key references Localidad (CP),
Precio money null,
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
Pavimento bit
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
Contrase�a varchar (15) not null,
IDTipo bit not null
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
insert into Usuario values ('admin', 'admin',1),
('normal','normal',0)
go
insert into Inmueble values ('casa azul','amplia y luminosa',1,1617,50000,3,2,1,1,0,1,0,1,1,1,0),
 ('casa madera','rustica y acogedora',3,1618,20000,2,1,1,1,1,1,0,0,0,1,0),
 ('casa moderna','amplia y hogare�a',4,1611,80000,3,3,1,0,1,0,1,0,0,1,1),
 ('duplex a estrenar','excelente oportunidad negocio',5,1645,200000,2,1,1,1,1,0,0,0,1,1,1)




insert into Imagen values ('https://definicion.de/wp-content/uploads/2011/01/casa-2.jpg',1),
('https://i.blogs.es/c68014/casa-3d/450_1000.jpeg',2),
('https://hips.hearstapps.com/hmg-prod/images/casa-de-madera-de-diseno-moderno21-645b7b443ba61.jpg?resize=980:*',3),
('https://definicion.de/wp-content/uploads/2011/01/ambiente.jpg',1)

*/
select * from Usuario

select Id, Nombre, Contrase�a, IDTipo from Usuario where Nombre = 'taruka' and Contrase�a= '1234'
drop table Usuario
 drop table Imagen
drop table Inmueble