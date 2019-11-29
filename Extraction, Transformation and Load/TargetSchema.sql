CREATE TABLE Months (
ID CHAR(7),
y NUMBER(4) NOT NULL,
PRIMARY KEY (ID)
);

CREATE TABLE TemporalDimension (
ID DATE,
monthID CHAR(7) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (monthID) REFERENCES Months (ID)
);

CREATE TABLE AircraftDimension (
ID CHAR(6),                            
model VARCHAR2(100) NOT NULL,          
manufacturer VARCHAR2(100) NOT NULL,   
PRIMARY KEY (ID)
);

CREATE TABLE AircraftUtilization (
aircraftID CHAR(6),
timeID DATE,
scheduledOutOfService NUMBER(2),
unScheduledOutOfService NUMBER(2),
flightHours NUMBER(2),
flightCycles NUMBER(2),
delays NUMBER(2),
delayedMinutes NUMBER(3),
cancellations NUMBER(2),
PRIMARY KEY (aircraftID, timeID),
FOREIGN KEY (aircraftID) REFERENCES AircraftDimension(ID),
FOREIGN KEY (timeID) REFERENCES TemporalDimension(ID)
);

CREATE TABLE PeopleDimension (
ID CHAR(6),                                       
airport CHAR(3),
role CHAR(1) CHECK (role IN ('P','M')) NOT NULL,
PRIMARY KEY (ID)
);

CREATE TABLE LogBookReporting (
aircraftID CHAR(6),
monthID CHAR(7),
personID CHAR(6),
counter NUMBER(2) NOT NULL,
PRIMARY KEY (aircraftID, monthID, personID),
FOREIGN KEY (aircraftID) REFERENCES AircraftDimension(ID),
FOREIGN KEY (monthID) REFERENCES Months(ID),
FOREIGN KEY (personID) REFERENCES PeopleDimension(ID)
);