CREATE DATABASE ProjectWork

GO

CREATE TABLE Project (
	ProjectID INT NOT NULL,
	ProjectName VARCHAR(32),
	Location VARCHAR(32)
	CONSTRAINT pk_ProjectID PRIMARY KEY(ProjectID)
	)
GO

CREATE TABLE Employees  (
	person_id INT NOT NULL,
	ProjectID INT NOT NULL,
	name VARCHAR(32),
	firstname VARCHAR(32),
	sex VARCHAR(1),
	language_id INT,
	service_id INT,
	birthdate VARCHAR(32),
	yearsalary INT,
	holidayallowance INT,
	CONSTRAINT pk_person_id PRIMARY KEY(person_id),
	CONSTRAINT fk_projectid FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID) 
	)
	
GO


INSERT INTO Project
(ProjectID, ProjectName, Location
)
VALUES
(1, 'Project1', 'Amsterdam'),
(2, 'Project2', 'Rotterdam'),
(3, 'Project3', 'Groningen')



INSERT INTO Employees
(person_id, ProjectID, name, firstname, sex, language_id,service_id, birthdate, yearsalary, holidayallowance
)
VALUES
(1,1,'Heyvaert'                      ,'Peter'                         ,'M',5,3,NULL,35000,3300),
(2,2,'Vermeiren'                     ,'Willy'                         ,'M',3,2,'19650112',18000,1600),
(3,3,'Pasmans'                       ,'Dirk'                          ,'M',5,1,'19700315',65000,6300),
(4,1,'Pattoor'                      ,'Wim'                           ,'M',5,3,'19901124',25000,2300),
(5,2,'Kloetens'                      ,'Marc'                          ,'M',5,4,NULL,17000,1500),
(6,2,'Nijsen'                        ,'Corinne'                       ,'V',5,4,'19810830',27000,2500),
(7,3,'Van Sanden'                    ,'Staf'                          ,'V',3,3,'19601026',23000,2100),
(8,2,'Van Puym'                      ,'Petra'                         ,'V',3,3,'19910317',33000,3100),
(9,2,'Piers'                     ,'Tamara'                        ,'V',5,2,'19870729',29000,2700),
(10,3,'Puyseleer'                     ,'Raf'                           ,'M',5,3,NULL,38000,3600),
(11,1,'Van Brande'                    ,'Ingrid'                        ,'V',3,3,'19701205',28000,2600),
(12,1,'Rombaut'                       ,'Jeroen'                        ,'M',5,1,'19730109',40000,3800),
(13,2,'De Fleur'                      ,'Thomas'                        ,'M',1,2,NULL,37000,3500),
(14,2,'Dierxcens'                     ,'Jacques'                       ,'M',3,2,'19950312',26000,2400),
(15,2,'Van Goethem'                   ,'Eric'                          ,'M',5,3,'19760102',22000,2000),
(16,1,'Huyghen'                       ,'Raf'                           ,'M',5,3,'19930428',35000,3200),
(17,3,'Stoffelen'                     ,'Jozef'                         ,'M',5,2,'19780411',22000,2000),
(18,3,'Moonen'                        ,'Staf'                          ,'M',3,2,NULL,19000,1700),
(19,3,'Ysebaert'                      ,'Sabine'                        ,'V',5,3,'19870809',36000,3400),
(20,3,'Michielsen'                    ,'Veerle'                        ,'V',3,3,'19681205',22000,2000),
(21,1,'Verpooten'                     ,'Marleen'                       ,'V',5,3,'19791222',23000,2100),
(22,1,'Machtels'                      ,'Marc'                         ,'M',5,3,NULL,29000,2700),
(23,2,'Michiels'                      ,'Hilde'                         ,'V',3,1,'19951201',36000,3400)
