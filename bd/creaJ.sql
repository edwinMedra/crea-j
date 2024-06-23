-- CREACION DE LA BASE DE DATOS:

Create database aerolinea;
Use aerolinea;

-- CREACION DE TABLAS: 
-- Tabla usuario
create table usuario(
nomCliente varchar(100),
apeCliente varchar(100),
genero varchar(20),
contraseña varchar(100),
correo varchar(100),
direccion varchar(100),
telefono varchar(20),
pasaporte varchar(9),
dui varchar(10),
idCliente int auto_increment,
constraint primary key (idCliente)
);

-- Tabla aerolinea
create table aerolinea(
idAero int auto_increment,
nombreAereo varchar(100),
telefonoAero varchar(20),
correoAereo varchar(45),
baseAereo varchar(100),
codigoIATA varchar(9),
CEO varchar(25),
constraint primary key (idAero)
);

create table servicios(
	idServicio int auto_increment,
    nomServcio varchar(100),
    descripcion varchar(500),
    precio float,
   constraint primary key (idServicio)
);

-- Tabla asistente
create table asistente(
idAsistente int auto_increment,
idAero int,
nomAsistente varchar(100),
apeAsistente varchar(100),
numTelefono varchar(10),
servicios varchar(200),
horarioTrabajo varchar(100),
genero varchar(30),
constraint primary key (idAsistente)
);


-- Tabla empleado
create table empleado(
	idEmpleado int auto_increment,
    idAero int,
    expeLaboral varchar(100),
    nomEmpleado varchar(100),
    apeEmpleado varchar(100),
    correoEmple varchar(100),
    telefonoEmpleado varchar(20),
    genero varchar(30),
    departamento varchar(500),
    dui varchar(15),
    constraint primary key (idEmpleado)
);

-- Tabla alianza
 create table alianza(
	idAli int auto_increment,
    idAero int,
    miembros varchar(500),
    coberturaGeo varchar(300),
    nombreAli varchar(200),
    constraint primary key (idAli)
 );
 
-- Tabla aeropuerto
 create table aeropuerto(
	idAeropuerto int auto_increment,
    pistas varchar(500),
    capacidad varchar(100),
    coordenadasGeo varchar(100),
    tipo varchar(100),
    ciudad varchar(100),
    pais varchar(100),
    codigoIATA varchar(9),
    constraint primary key (idAeropuerto)
 );
 
-- Tabla avion
create table avion(
	idAvion int auto_increment,
    pesoMax varchar(30),
    equipamento varchar(200),
    fabricante varchar(100),
    capacidad varchar(100),
    modeloAvion varchar(100),
    numSerie varchar(100),
    constraint primary key (idAvion)
);


-- Tabla vuelo
create table vuelo(
	idVuelo int auto_increment,
    idAero int,
    destino varchar(100),
    tipoVuelo varchar(100),
    distancia varchar(100),
    fechaSalida datetime,
    fechaEntrada datetime,
    origen varchar(100),
    duracion varchar(100),
    piloto varchar(100),
    cantAsientos int,
    precio float,
    constraint primary key (idVuelo)
);

-- TABLAS INTERMEDIAS:
-- Tabla aerolineaAsistente
create table aerolineaAsistente(
	idAero int, 
    idAsistente int, 
    constraint foreign key (idAero) references aerolinea(idAero),
    constraint foreign key (idAsistente)references asistente(idAsistente)
);


-- Tabla empleadoAerolinea
create table empleadoAerolinea(
	idAero int,
    idEmpleado int, 
    constraint foreign key (idAero)references aerolinea(idAero),
    constraint foreign key (idEmpleado)references empleado(idEmpleado)
);


-- Tabla usuarioAerolinea
create table usuarioAerolinea(
	idAero int,
    idCliente int, 
    tipoServicio varchar(100),
    tipoPago varchar(100),
    constraint foreign key (idAero) references aerolinea(idAero),
    constraint foreign key (idCliente) references usuario(idCliente)
);


-- Tabla aeropuertoAlianza
create table aeropuertoAlianza(
	idAli int,
    idAeropuerto int,
    constraint foreign key (idAli) references alianza(idAli),
    constraint foreign key (idAeropuerto) references aeropuerto(idAeropuerto)
);


-- Tabla aeropuertoAvion
create table aeropuertoAvion(
	idAvion int, 
    idAeropuerto int,
    constraint foreign key (idAvion) references avion(idAvion),
    constraint foreign key (idAeropuerto)references aeropuerto(idAeropuerto)
);


-- Tabla aerolineaVuelo
create table aerolineaVuelo(
	idVuelo int, 
    idAero int, 
    constraint foreign key (idVuelo)references vuelo(idVuelo),
    constraint foreign key (idAero)references aerolinea(idAero)
);

-- Tabla vueloAvion
  create table vueloAvion(
	idAvion int, 
    idVuelo int, 
    constraint foreign key (idAvion) references avion(idAvion),
    constraint foreign key (idVuelo) references vuelo(idVuelo)
  );    
  
  
-- Tabla aerolineaAlianza
  create table aerolineaAlianza(
	idAero int,
    idAli int,
    constraint foreign key (idAero)references aerolinea(idAero),
    constraint foreign key (idAli) references alianza(idAli)
  );
  
   create table servicioAerolinea (
	idServicio int,
    idAero int,
    foreign key (idServicio) references servicios(idServicio),
    foreign key (idAero) references aerolinea(idAero)
  );
  -- INSERTANDO DATOS: 

-- Ingreso de datos de usuario
Insert into usuario values 
("Miguel", "López", "Masculino","11110", "miguel.lopez@gmail.com", "Casa #10, Colonia San Benito, San Salvador, El Salvador","2222-1234", "SV1234567", "00123456-8", null),
("Laura", "Chinchilla", "Femenino","22220", "laura.chinchilla@gmail.com", "Apartamento #3B, Condominio Las Palmas, Boulevard de los Héroes, San Salvador, El Salvador","7777-5678", "ESA876543", "09876543-1", null),
("Keila", "Castillo", "Femenino","33330", "keila.castillo@gmail.com", "Lote #15, Residencial Los Almendros, Santa Tecla, La Libertad, El Salvador","2345-6789", "P12345678", "11223344-5", null),
("Nicole", "Campos", "Femenino","44440", "nicole.campos@gmail.com", "Calle Principal, Barrio El Centro, Suchitoto, Cuscatlán, El Salvador", " 7654-3210", "SVS456789", "55443322-9", null),
("Josué", "de Paz", "Masculino","55550", "josue.depaz@gmail.com", "Casa #25, Urbanización Las Mercedes, Ciudad Arce, La Libertad, El Salvador","8888-9999", "PAS456789", "98765432-0", null);


-- Ingreso de datos de aerolinea
Insert into aerolinea values
(null,"Esfly", "2109-8765", "esfly@gmail.com","Aeropuerto de El Salvador ", "(ESF)-SAL","CEO"),
(null,"Avianca", " 7878-4321", "avianca@gmail.com","Aeropuerto de El Salvador ", "(AVI)-SAL","CEO"),
(null,"Volaris ", "2200-3456", "volaris@gmail.com","Aeropuerto de El Salvador ", "(VOL)-SAL","CEO"),
(null,"American Airlines", "7171-9876", "americanairlines@gmail.com","Aeropuerto de El Salvador ", "(AAL)-SAL","CEO"),
(null,"Copa Airlines", "2332-6789", "copaairlines@gmail.com","Aeropuerto de El Salvador ", "(CAL)-SAL","CEO");


-- Ingreso de datos de asistente
insert into asistente values
(null, 1, "Jorge","Martínez","7000-1234","Especiales","Matutino","Mascculino"),
(null, 2, "Diego","Hernandéz","7777-8888","Especiales","Vespertino","Mascculino"),
(null, 3, "María","Rivas","2345-6789","Especiales","Nocturno","Femenino"),
(null, 4, "Blanca","Quintanilla","6000-1111","Especiales","Matutino","Femenino"),
(null, 5, "Olivia","Escalante","8000-9999","Especiales","Nocturno","Femenino");


-- Ingreso de datos de empleado
insert into empleado values
(null,5, "Piloto de Aviación Comercial","Manuel","González","manuel.gonzalez@gmail.com","6000-1234","Masculino","San Salvador","00123457-8"),
(null,4,"Auxiliar de Vuelo","Margarita","Ramos","margarita.ramos@gmail.com","7000-5678","Femenino","La Libertad","98765421-0"),
(null,3,"Ingeniero de Mantenimiento de Aeronaves","Giovanni","Hernandéz","giovanni.hernandez@gmail.com","8000-9012","Masculino","Santa Ana","11223345-5"),
(null,2,"Controlador de Tráfico Aéreo","Ana","Martínez"," ana.martinez@gmail.com","9000-3456","Femenino","San Miguel","55443221-9"),
(null,1,"Técnico en Aviónica","Luis","Ramírez","luis.ramirez@gmail.com","6100-7890","Masculino","Sonsonate","76543219-8");


-- Ingreso de datos de Alianza
Insert into alianza values
(null,1,"SkyWings, AeroUnión, AirConnect","Centro América","Estrella del Cielo"),
(null,2," BlueSky, GlobalAir, FlyLink","América del Norte","Vuelo Continental"),
(null,3,"AeroCaribe, LatinoJet, AirPanam","América del Sur","AireLatino"),
(null,4,"SkyPacific, OceanAir, IslandHopper","América del Norte","PacificWings"),
(null,5,"AirLink, FlyTogether, SkyAlliance","América del Sur","SkyUnity");


-- Ingreso de datos de aeropuerto
Insert into aeropuerto values
(null,"2F","50,000 personas","13.8167° N, 89.6333° O","Nacional","San Salvador","El Salvador","(AIS)-SSV"),
(null,"4R","80,000 personas","13.8775° N, 89.5464° O","Internacional","Santa Ana","El Salvador","(ARA)-SNA"),
(null,"6Q","60,000 personas","13.4822° N, 89.3717° O","Internacional","La Unión","El Salvador","(AIU)-LIU"),
(null,"9U","30,000 personas","13.6736° N, 89.2906° O","Nacional","San Vicente","El Salvador","(ASV)-SVC"),
(null,"2A","25,000 personas","13.8559° N, 89.0305° O","Internacional","La Libertad","El Salvador","(ALL)-LLD");


-- Ingreso de datos de aerolineaasistenteavion
Insert into avion values
(null,"79,000 kg","Sistema de entretenimiento a bordo","Boeing","6,000 personas","Boeing 737","SN 34567"),
(null,"78,000 kg","Sistema de navegación","Boeing","8,000 personas","Airbus A320neo","SN 78901"),
(null,"50,300 kg","Sistema de comunicaciones","Boeing","10,000 personas","Embraer E190","SN 12345"),
(null,"351,500 kg","Sistema de propulsión","Boeing","9,000 personas","Lockheed C-130 Hercules","SN 67890"),
(null,"1,275,000 kg","Sistema de control de vuelo","Boeing","12,000 personas","Bombardier CRJ900","SN 23456");

-- Ingreso de datos de vuelo
Insert into vuelo values
(null,1,"América del Norte","Especial","3,000 kilómetros","2024-05-01 00:00:00","2024-05-02 08:00:00","El Salvador","8 horas","Carlos Guerra",6000,70.75),
(null,2,"América del Sur","VIP","2,200 kilómetros ","2024-06-01 00:00:00","2024-06-02 09:00:00","El Salvador","9 horas","Sofía Flores",8000,80.00),
(null,3,"América del Sur","VIP","2,200 kilómetros ","2024-09-01 00:00:00","2024-09-02 10:00:00","El Salvador","10 horas","Melanie Hernandéz",7000,80.00),
(null,4,"América del Norte","Normal","3,000 kilómetros","2024-07-01 00:00:00","2024-07-02 07:00:00","El Salvador","7 horas","Carmen Guevara",5000,60.75),
(null,5,"América del Norte","VIP","3,000 kilómetros","2024-09-01 00:00:00","2024-09-02 06:00:00","El Salvador","6 horas","Mauricio Peréz",13000,80.50);



-- INSERTANDO DATOS DE LAS TABLAS INTERMEDIAS:

-- Ingreso de datos de aerolineaAsistente
insert into aerolineaAsistente values
(1, 5),
(2, 4),
(3, 3),
(4, 2),
(5, 1);


-- Ingreso de datos de empleadoAerolinea
insert into empleadoAerolinea values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


-- Ingreso de datos de usuarioAerolinea
insert into usuarioAerolinea values
(1,5,"Especial","Crédito"),
(2,4,"VIP","Débito"),
(3,3,"normal","Crédito"),
(4,2,"VIP","Débito"),
(5,1,"normal","Crédito");


-- Ingreso de datos de aeropuertoAlianza
insert into aeropuertoAlianza values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


-- Ingreso de datos de aeropuertoAvion
insert into aeropuertoAvion values
(1, 5),
(2, 4),
(3, 3),
(4, 2),
(5, 1);


-- Ingreso de datos de aerolineaVuelo
insert into aerolineaVuelo values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


-- Ingreso de datos de vueloAvion
insert into vueloAvion values
(1, 5),
(2, 4),
(3, 3),
(4, 2),
(5, 1);


-- Ingreso de datos de aerolineaAlianza
insert into aerolineaAlianza values
(1, 5),
(2, 4),
(3, 3),
(4, 2),
(5, 1);

-- select 
select * from usuario;
select * from empleado;
select * from aerolinea;
select * from aeropuerto;
select * from asistente;
select * from alianza;
select * from avion;
select * from vuelo;
-- truncar tabla usuario
truncate table usuario;
alter table usuarios rename usuario;
-- drop tabla usuario
drop table usuarios;
-- modificación de datos
update usuario set nomCliente="Gabriela" where idCliente=4;