create database MedicData;

use MedicData;

create table tblDireccion (
    IdDireccion     int not null auto_increment,
    Calle  			varchar(20) not null,
    NumInterior		numeric not null,
    NumExterior 	numeric not null,
    Colonia 		varchar(20) not null,
    CP 				numeric not null,
    Municipio 		varchar(20) not null,
    primary key (IdDireccion));
    
insert into tblDireccion (Calle, NumInterior, NumExterior, Colonia, CP, Municipio) values 
('Panamericana', 0, 302, 'Pedregal de Carrasco', 04700, 'Coyoacan'),
('Calle Central', 10, 102, 'Polanco', 02300, 'Gustavo A. Madero'), 
('Calle Sur', 102, 502, 'Hidalgo', 02470, 'Hidalgo');

create table tblCatCto
	(IdCto   int not null auto_increment,
	TipoCto    	  varchar(30) not null,
	primary key (IdCto));
        
insert into tblCatCto (TipoCto) values ('Telefono'), ('Correo');
    
create table tblRoles
	(IdRoles   int not null auto_increment,
	Tipo       varchar(20) not null,
	primary key (IdRoles));

insert into tblRoles (Tipo) values('Paciente'), ('Medico');

create table tblCatAlergia
	(IdAlergia   	int not null auto_increment,
	Tipo         	varchar(50) not null,
	Descripcion  	varchar(50) not null,
	primary key (IdAlergia));

    
insert into tblCatAlergia (Tipo, Descripcion) values
('Polvo', 'Alergía a polvo casero'),
('Polen', 'Alergía a flores con pistilo'), 
('Cesped', 'Alergía a cesped de campo'), 
('Fresas', 'Alergía a todo la fruta en general');
        
create table tblCatEnfermedad
	(IdEnfermedad  	integer not null auto_increment,
	Tipo      		varchar(50) not null,
	Descripcion    	varchar(50) not null,
	primary key (IdEnfermedad));

insert into tblCatEnfermedad (Tipo, Descripcion) values
('Respiratoria', 'En los pulmones'),
('Cardiaca', 'En la arteria cava superior derecha'), 
('Neurologica', 'Falta de memoria a corto plazo'),
('Gastrointestinal', 'Gastritis grado 3');

create table tblPersona
	(IdPersona   int not null auto_increment,
    IdDireccion int not  null,
	Nombre       varchar(25) not null,
	APaterno     varchar(25) not null,
	AMaterno     varchar(25) not null,
    Edad int not null,
    Correo varchar(50) not null,
    Contraseña varchar (20) not null,
	primary key (IdPersona),
    foreign key (IdPersona) references tblDireccion(IdDireccion)
    );
        
insert into tblPersona (IdDireccion, Nombre, APaterno, AMaterno, Edad, Correo, Contraseña) values
(1, 'Laura', 'Dorantes', 'Andrade', 23, 'kfjgru@gmail.com', '6745hvvrf'),
(2, 'Alison', 'Estévez', 'Pérez', 18, 'fulanito@gmail.com', 'fulanito3000'),
(3, 'Fernando', 'Calleja', 'Jiménez', 100, 'jgvhr@gmail.com', 'fnrshb767');

    
    create table tblRelPerRol
	(IdRelPerRol   int not null auto_increment,
	IdPersona      int not null,
	IdRoles        int not null,
	primary key (IdRelPerRol),
    foreign key (IdRoles)references tblRoles(IdRoles),
    foreign key (IdPersona)references tblPersona(IdPersona)
    );

insert into tblRelPerRol (IdPersona, IdRoles) values(1, 1);
insert into tblRelPerRol (IdPersona, IdRoles) values(2, 1);
insert into tblRelPerRol (IdPersona, IdRoles) values(3, 2);
    
create table tblRelPerCto
	(IdRelPerCto   int not null auto_increment,
	IdPersona      int not null,
	IdCto          int not null,
    Descrip        varchar(50) not null,
	primary key (IdRelPerCto),
    foreign key (IdCto)references tblCatCto(IdCto),
    foreign key (IdPersona)references tblPersona(IdPersona)
    );

insert into tblRelPerCto (IdPersona, IdCto, Descrip) values(1, 1, '5532689007');
insert into tblRelPerCto (IdPersona, IdCto, Descrip) values(2, 2, 'alison@gmail.com');
insert into tblRelPerCto (IdPersona, IdCto, Descrip) values(3, 1, '5545660014');

create table tblEstudios
	(IdEstudios   int not null auto_increment,
    IdPersona int not null,
	Archivo       varchar(30) not null,
	NombreEst     varchar(30) not null,
	primary key (IdEstudios),
    foreign key (IdEstudios)references tblPersona(IdPersona)
    );
    
insert into tblEstudios (IdPersona, Archivo, NombreEst) values
(1, 'ImagenR.jpg', 'Radiografía'),
(2, 'ImagenE.png', 'Ecograma');

create table tblEspecialidad
	(IdEspecialidad   int not null auto_increment,
    IdPersona int not null,
	NombreEsp         varchar(30) not null,
	primary key (IdEspecialidad),
    foreign key (IdEspecialidad) references tblPersona(IdPersona)
    );

insert into tblEspecialidad (IdPersona, NombreEsp) values(3, 'Cargiología');
    
create table tblConsultas
	(IdConsultas   int not null auto_increment,
    IdPersona int not null,
	Fecha          date not null,
	Diagnostico    varchar(50) not null,
	Tratamiento    varchar(50) not null,
	primary key (IdConsultas),
    foreign key (IdConsultas)references tblPersona(IdPersona)
    );

insert into tblConsultas (IdPersona, Fecha, Diagnostico, Tratamiento) values
(1, '2022/06/11', 'Gripe', 'Paracetamol'),
(2, '2022/06/21', 'Resfriado', 'Zirtec');

create table tblExpediente
	(IdExpediente   int not null auto_increment,
    IdPersona int not null,
    Genero varchar(10) not null,
    TipoSangre      varchar(10) not null,
    Peso int not null,
    Talla int not null,
    Adicciones varchar(100) not null,
    Fracturas varchar(100) not null,
    Cirugias varchar(100) not null,
    ProblemasVision varchar(100) not null,
	primary key (IdExpediente),
    foreign key (IdExpediente)references tblPersona(IdPersona)
    );
    
insert into tblExpediente (IdPersona, Genero, TipoSangre, Peso, Talla, Adicciones, Fracturas, Cirugias, ProblemasVision) values 
(1, 'Femenino', 'O+', 45, 65, 'Tabaco', 'Brazo derecho', 'Ninguna', 'Uso de lentes'), 
(2, 'Femenino', 'O+', 64, 77, 'Alcohol', 'Ninguna', 'Higado', 'Sin uso de lentes');

create table tblRelExpAler
	(IdRelExpAler     int not null auto_increment,
	IdExpediente      int not null,
	IdAlergia         int not null,
	primary key (IdRelExpAler),
    foreign key (IdExpediente) references tblExpediente(IdExpediente),
    foreign key (IdAlergia)references tblCatAlergia(IdAlergia)
    );

insert into tblRelExpAler (IdExpediente, IdAlergia) values (1, 1), (1, 3), (2, 2), (2, 4);

create table tblRelExpEnf
	(IdRelExpEnf      int not null auto_increment,
	IdExpediente      int not null,
	IdEnfermedad      int not null,
	primary key (IdRelExpEnf),
    foreign key (IdExpediente) references tblExpediente(IdExpediente),
    foreign key (IdEnfermedad)references tblCatEnfermedad(IdEnfermedad)
    );

insert into tblRelExpEnf (IdExpediente, IdEnfermedad) values(1, 1), (1, 3), (2, 2), (2, 4);

show tables;
select * from tblPersona;
select * from tblDireccion;
select * from tblExpediente;
select * from tblConsultas;
select * from tblEstudios;
select * from tblRoles;
select * from tblEspecialidad;
select * from tblCatAlergia;
select * from tblCatEnfermedad;
select * from tblRelExpAler;
select * from tblRelExpEnf;
select * from tblRelPerRol;
select * from tblCatCto;
select * from tblRelPerCto;