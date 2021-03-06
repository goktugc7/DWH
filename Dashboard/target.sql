-- create tables 

CREATE TABLE Months (
ID CHAR(7),
y NUMBER(4) NOT NULL
) PCTFREE 0 ENABLE ROW MOVEMENT;

CREATE TABLE TemporalDimension (
ID DATE,
monthID CHAR(7) NOT NULL
) PCTFREE 0 ENABLE ROW MOVEMENT;

CREATE TABLE AircraftDimension (
ID CHAR(6),                            
model VARCHAR2(100) NOT NULL,          
manufacturer VARCHAR2(100) NOT NULL
) PCTFREE 0 ENABLE ROW MOVEMENT;

CREATE TABLE AircraftUtilization (
aircraftID CHAR(6),
timeID DATE,
scheduledOutOfService NUMBER(2),
unScheduledOutOfService NUMBER(2),
flightHours NUMBER(2),
flightCycles NUMBER(2),
delays NUMBER(2),
delayedMinutes NUMBER(3),
cancellations NUMBER(2)
) PCTFREE 0 ENABLE ROW MOVEMENT;

CREATE TABLE PeopleDimension (
ID CHAR(6),                                       
airport CHAR(3),
role CHAR(1) CHECK (role IN ('P','M')) NOT NULL
) PCTFREE 0 ENABLE ROW MOVEMENT;

CREATE TABLE LogBookReporting (
aircraftID CHAR(6),
monthID CHAR(7),
personID CHAR(6),
counter NUMBER(2) NOT NULL
) PCTFREE 0 ENABLE ROW MOVEMENT;

-- create view

CREATE VIEW FACTS_DRILLACCROSS ("AIRCRAFTID", "MONTHID", "PERSONID", "COUNTER", "FLIGHTCYCLES", "FLIGHTHOURS", "DELAYEDMINUTES", "DELAYS", "CANCELLATIONS", "SCHEDULEDOUTOFSERVICE", "UNSCHEDULEDOUTOFSERVICE", "DAYSTOTAL", "PIREP", "MAREP") AS 
  SELECT A1.AIRCRAFTID, L1.MONTHID, L1.PERSONID, L1.COUNTER, A1.FLIGHTCYCLES, A1.FLIGHTHOURS, A1.DELAYEDMINUTES, A1.DELAYS, A1.CANCELLATIONS, A1.SCHEDULEDOUTOFSERVICE, A1.UNSCHEDULEDOUTOFSERVICE, A1.DAYSTOTAL,
		CASE WHEN P.role='P' THEN L1.COUNTER ELSE 0 END AS PIREP, 
		CASE WHEN P.role='M' THEN L1.COUNTER ELSE 0 END AS MAREP
FROM (SELECT  A.AIRCRAFTID AS AIRCRAFTID, T.MONTHID AS MONTHID, SUM(A.FLIGHTHOURS) AS FLIGHTHOURS, SUM(A.FLIGHTCYCLES) AS FLIGHTCYCLES, SUM(A.DELAYS) AS DELAYS, 
              SUM(A.DELAYEDMINUTES) AS DELAYEDMINUTES, SUM(A.CANCELLATIONS) AS CANCELLATIONS, SUM(A.SCHEDULEDOUTOFSERVICE) AS SCHEDULEDOUTOFSERVICE, 
              SUM(A.UNSCHEDULEDOUTOFSERVICE) AS UNSCHEDULEDOUTOFSERVICE, COUNT(DISTINCT T.ID) AS DAYSTOTAL
	  FROM AIRCRAFTUTILIZATION A, TEMPORALDIMENSION T
	  WHERE A.TIMEID = T.ID
	  GROUP BY A.AIRCRAFTID, T.MONTHID) A1,
	  LOGBOOKREPORTING L1, PEOPLEDIMENSION P
WHERE A1.AIRCRAFTID = L1.AIRCRAFTID AND  L1.MONTHID = A1.MONTHID AND L1.PERSONID=P.ID;
