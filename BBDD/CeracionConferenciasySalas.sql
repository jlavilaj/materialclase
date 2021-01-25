create table Sala (
	nombre		varchar2(20) primary key,
	capacidad	number(4) not null
);

create table Conferencia (
	referencia	char(7) primary key,
	tema		varchar2(60),
	precio		number(5,2),
	fecha		date not null,
	turno		char(1) constraint con_tur_CK check (turno in ('T','M')),
	sala		varchar2(20) constraint con_sal_FK references Sala(Nombre) on delete cascade
);

create table Ponente (
	codigo		char(6) primary key,
	nombre		varchar2(20) not null,
	apellido1	varchar2(20) not null,
	apellido2	varchar2(20),
	especialidad	varchar2(30)
);

create table Participar (
	codPonente	char(6),
	refConferencia	char(7),
	num_orden	number(2),
	gratificacion	number(6,2),
	constraint par_cod_PK primary key (codPonente, refConferencia),
	constraint par_pon_FK foreign key (codPonente) references Ponente(codigo) on delete cascade,
	constraint par_con_FK foreign key (refConferencia) references Conferencia(referencia) on delete cascade
);

create table Asistente (
	codigo		char(6) primary key,
	nombre		varchar2(20) not null,
	apellido1	varchar2(20) not null,
	apellido2	varchar2(20),
	sexo		char(1) constraint asi_sex_CK check (sexo in ('H','M')),
	fechaNac	date not null,
	empresa		varchar2(30)
);

create table Asistir (
	codAsistente	char(6),
	refConferencia	char(7),
	constraint asi_cod_PK primary key (codAsistente, refConferencia),
	constraint asi_asi_FK foreign key (codAsistente) references Asistente(codigo) on delete cascade,
	constraint asi_con_FK foreign key (refConferencia) references Conferencia(referencia) on delete cascade
);


insert into Sala values ('Zeus', 250);
insert into Sala values ('Afrodita', 80);
insert into Sala values ('Apolo', 200);
insert into Sala values ('Hermes', 150);


insert into Conferencia values ('BDO1314','Bases de Datos Orientadas a Objetos',10.50,'01/10/2013','T','Afrodita');
insert into Conferencia values ('POO1314','Programacion Orientada a Objetos',20.00,'02/10/2013','M','Zeus');
insert into Conferencia values ('PWB1314','Programacion Web',18.50,'02/10/2013','T','Apolo');
insert into Conferencia values ('ADS1314','Accediendo a datos de forma segura',12.50,'03/10/2013','M','Afrodita');
insert into Conferencia values ('SEG1314','Seguridad Informatica en la Empresa',15.00,'03/10/2013','T','Apolo');

insert into Ponente values ('ESP001', 'Juan', 'Llobregat', 'Garcia','Bases de Datos');
insert into Ponente values ('USA001', 'Stephen', 'Gary',null,'Programacion');
insert into Ponente values ('FRA001', 'Piere', 'Gaul', 'More','Seguridad Inform�tica');
insert into Ponente values ('ESP002', 'Silvia', 'Duran', 'Cespedes','Bases de Datos');
insert into Ponente values ('ESP003', 'Julian', 'Amores', 'Perez','Seguridad Informatica');
insert into Ponente values ('USA002', 'Robert', 'Craig',null,'Bases de Datos');
insert into Ponente values ('ESP004', 'Luisa', 'Soriano', 'Lopez','Seguridad Informatica');
insert into Ponente values ('USA003', 'Kevin', 'Shull',null,'Programacion');


insert into Participar values ('ESP001','BDO1314',1,450.00);
insert into Participar values ('USA002','BDO1314',2,350.00);
insert into Participar values ('ESP002','BDO1314',3,550.00);
insert into Participar values ('USA003','POO1314',1,600.00);
insert into Participar values ('USA001','POO1314',2,520.00);
insert into Participar values ('USA001','PWB1314',1,370.00);
insert into Participar values ('ESP003','PWB1314',2,250.00);
insert into Participar values ('FRA001','PWB1314',3,375.00);
insert into Participar values ('USA003','PWB1314',4,350.00);
insert into Participar values ('ESP002','ADS1314',1,420.00);
insert into Participar values ('FRA001','ADS1314',2,330.00);
insert into Participar values ('USA001','ADS1314',3,560.00);
insert into Participar values ('USA002','ADS1314',4,150.00);
insert into Participar values ('ESP004','ADS1314',5,480.00);
insert into Participar values ('ESP003','SEG1314',1,350.00);
insert into Participar values ('ESP004','SEG1314',2,290.00);
insert into Participar values ('USA001','SEG1314',3,600.00);
insert into Participar values ('FRA001','SEG1314',4,570.00);


insert into Asistente values ('AS0001', 'Mario', 'C�spedes', 'Hermida','H','16/11/1970','BK Programaci�n');
insert into Asistente values ('AS0002', 'Carmen', 'Guti�rrez', 'Sevilla','M','20/02/1968','BK Programaci�n');
insert into Asistente values ('AS0003', 'Felipe', 'Mart�n', 'Comillas','H','06/11/1975','ProgConsulting');
insert into Asistente values ('AS0004', 'Lourdes', 'Soriano', 'L�pez','M','30/07/1982',null);
insert into Asistente values ('AS0005', 'Inmaculada', 'Herrero', 'Puig','M','13/09/1978','BigSoft');
insert into Asistente values ('AS0006', 'Luc�a', 'D�az', 'Mart�nez','M','25/08/1973','BigSoft');
insert into Asistente values ('AS0007', 'Ferm�n', 'Guti�rrez', 'P�ez','H','03/03/1969','ProgConsulting');
insert into Asistente values ('AS0008', 'Jos� Enrique', 'Martos', 'Martos','H','20/10/1982','BK Programaci�n');
insert into Asistente values ('AS0009', 'Jos� Ram�n', 'G�mez', 'P�rz','H','21/01/1973','ProgConsulting');
insert into Asistente values ('AS0010', 'Mercedes', 'Bosh', 'Toral','M','05/05/1980','BK Programaci�n');
insert into Asistente values ('AS0011', 'Mar�a Jos�', 'V�zquez', 'Soriano','M','19/03/1990',null);
insert into Asistente values ('AS0012', 'Jos� Luis', 'Jim�nez', 'Molina','H','01/10/1991','BigSoft');
insert into Asistente values ('AS0013', 'Manuel', 'P�rez', 'Mart�nez','H','30/11/1987',null);


insert into Asistir values ('AS0013', 'BDO1314');
insert into Asistir values ('AS0009', 'BDO1314');
insert into Asistir values ('AS0006', 'BDO1314');
insert into Asistir values ('AS0007', 'BDO1314');
insert into Asistir values ('AS0012', 'BDO1314');
insert into Asistir values ('AS0003', 'BDO1314');
insert into Asistir values ('AS0008', 'POO1314');
insert into Asistir values ('AS0003', 'POO1314');
insert into Asistir values ('AS0005', 'POO1314');
insert into Asistir values ('AS0013', 'POO1314');
insert into Asistir values ('AS0002', 'POO1314');
insert into Asistir values ('AS0001', 'POO1314');
insert into Asistir values ('AS0012', 'POO1314');
insert into Asistir values ('AS0010', 'POO1314');
insert into Asistir values ('AS0004', 'POO1314');
insert into Asistir values ('AS0007', 'POO1314');
insert into Asistir values ('AS0011', 'POO1314');
insert into Asistir values ('AS0012', 'PWB1314');
insert into Asistir values ('AS0007', 'PWB1314');
insert into Asistir values ('AS0009', 'PWB1314');
insert into Asistir values ('AS0013', 'PWB1314');
insert into Asistir values ('AS0008', 'PWB1314');
insert into Asistir values ('AS0004', 'PWB1314');
insert into Asistir values ('AS0011', 'PWB1314');
insert into Asistir values ('AS0003', 'PWB1314');
insert into Asistir values ('AS0010', 'PWB1314');
insert into Asistir values ('AS0001', 'PWB1314');
insert into Asistir values ('AS0006', 'PWB1314');
insert into Asistir values ('AS0005', 'PWB1314');
insert into Asistir values ('AS0002', 'PWB1314');
insert into Asistir values ('AS0012', 'ADS1314');
insert into Asistir values ('AS0008', 'ADS1314');
insert into Asistir values ('AS0010', 'ADS1314');
insert into Asistir values ('AS0001', 'ADS1314');
insert into Asistir values ('AS0007', 'ADS1314');
insert into Asistir values ('AS0009', 'SEG1314');
insert into Asistir values ('AS0008', 'SEG1314');
insert into Asistir values ('AS0003', 'SEG1314');
insert into Asistir values ('AS0004', 'SEG1314');
insert into Asistir values ('AS0010', 'SEG1314');
insert into Asistir values ('AS0006', 'SEG1314');
