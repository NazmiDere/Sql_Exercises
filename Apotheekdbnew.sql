

CREATE DATABASE Apotheek
GO


USE Apotheek
GO


CREATE SCHEMA Apo


CREATE TABLE Apo.Huisarts (
    huisartscode varchar(3),
    huisartsnaam varchar(32),
	huisartplaats varchar(32),
	CONSTRAINT pk_huisartcode PRIMARY KEY (huisartscode)
	);
GO


CREATE TABLE Apo.Patient (
    
	patientnr INT NOT NULL,
    patientnaam varchar(32),
	gebortedatum DATE,
	huisartscode varchar(3),
	CONSTRAINT pk_patientnr PRIMARY KEY (patientnr),
	CONSTRAINT fk_huisartcode FOREIGN KEY (huisartscode) REFERENCES Apo.Huisarts(huisartscode)
	);
GO


CREATE TABLE Apo.Medicijnen (
	medicijnencode varchar(6),
    omschrijving varchar(64),
	CONSTRAINT pk_medicijnencode PRIMARY KEY (medicijnencode),
	);
GO


CREATE TABLE Apo.Aankoop (
    
	patientnr INT NOT NULL,
    datumaankoop DATE,
	medicijnencode varchar(6),
	hoeveelheid int,
	CONSTRAINT pk_compound PRIMARY KEY (patientnr, datumaankoop, medicijnencode),
	CONSTRAINT fk_medicijnencode FOREIGN KEY (medicijnencode) REFERENCES Apo.Medicijnen(medicijnencode),
	CONSTRAINT fk_patientnr FOREIGN KEY (patientnr) REFERENCES Apo.Patient(patientnr)
	);
GO


INSERT INTO Apo.Huisarts(huisartscode, huisartsnaam, huisartplaats) VALUES 
('VER', 'V. Vader', 'Almere'),
('VLD', 'R. TE Veld', 'Lelestad'),
('DME', 'L. Dame', 'Lelystad');
GO


INSERT INTO Apo.Medicijnen(medicijnencode, omschrijving) VALUES 
('PAC500', 'Paracetemol 500 mg'),
('IBR200', 'Ibuprofen 200 mg'),
('HLC800', 'Broomhexine 8 mg'),
('OXP10', 'Oxazepam 10 mg'),
('PRO20', 'Prozac 20 mg'),
('DIA5', 'Diazepam 5 mg')
GO


INSERT INTO Apo.Patient(patientnr, patientnaam, gebortedatum, huisartscode ) VALUES 
(12, 'T. van der Pen', '19640423','VER'),
(37, 'G. Hovius', '19590203','VER'),
(38, 'L. Peters', '19400704','DME'),
(43, 'K. van der Pen', '19331209','VER')
GO


INSERT INTO Apo.Aankoop(patientnr, datumaankoop, medicijnencode, hoeveelheid) VALUES 
(12, '20140217', 'PAC500', 20),
(12, '20140217', 'IBR200', 50),
(12, '20140629', 'PAC500', 50),
(37, '20140602', 'HLC800', 30),
(38, '20140423', 'OXP10', 15),
(38, '20140423', 'PRO20', 45),
(43, '20140206', 'DIA5', 10),
(38, '20140423', 'HLC800', 20)



select * from Apo.Huisarts
select * from Apo.Patient
select * from Apo.Medicijnen
select * from Apo.Aankoop


