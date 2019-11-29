-------------------------------------------------------------------------- AMOS

CREATE TABLE WorkPackages (
	workPackageID INT,
	executionDate DATE,
	executionPlace CHAR(3)
);

CREATE TYPE WorkOrderKind AS ENUM ('Forecast', 'TechnicalLogBook');

CREATE TABLE WorkOrders (
	workOrderID INT,
	aircraftRegistration CHAR(6) NOT NULL,
	executionDate DATE,
	executionPlace CHAR(3),
	workPackage INT,
	kind WorkOrderKind NOT NULL
);

CREATE TYPE FrequencyUnitsKind AS ENUM ('Flights', 'Days', 'Miles');

CREATE TABLE ForecastedOrders (
	deadline DATE NOT NULL,
	planned DATE NOT NULL,
	frequency SMALLINT NOT NULL,
	frequencyUnits FrequencyUnitsKind NOT NULL,
	forecastedManHours SMALLINT NOT NULL
) INHERITS (WorkOrders);

CREATE TYPE ReportKind AS ENUM ('PIREP', 'MAREP'); 
CREATE TYPE MELCathegory AS ENUM ('A', 'B', 'C', 'D');

CREATE TABLE TechnicalLogBookOrders (
	reporteurClass ReportKind NOT NULL,
	reporteurID SMALLINT NOT NULL,
	reportingDate DATE NOT NULL,
	due DATE,
	deferred BOOLEAN,
	MEL MELCathegory
) INHERITS (WorkOrders);

CREATE TYPE MaintenanceEventKind AS ENUM ('Delay', 'Safety', 'AircraftOnGround', 'Maintenance', 'Revision');

CREATE TABLE MaintenanceEvents (
	maintenanceID CHAR(30), 
	aircraftRegistration CHAR(6) NOT NULL,
	airport CHAR(3), 
	subsystem CHAR(4), 
	startTime TIMESTAMP WITHOUT TIME ZONE,
	duration INTERVAL,
	kind MaintenanceEventKind NOT NULL
);

CREATE TABLE OperationInterruption (
	flightID CHAR(22) NOT NULL,
	departure DATE NOT NULL,
	delayCode CHAR(2)
) INHERITS (MaintenanceEvents);

CREATE TABLE Attachments (
	file UUID,
	event CHAR(30) NOT NULL
);