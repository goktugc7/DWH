-------------------------------------------------------------------------  AIMS

CREATE TYPE SlotKind AS ENUM ('Flight', 'Maintenance', 'Buffer', 'Spare');

CREATE TABLE Slots (
	aircraftRegistration CHAR(6) NOT NULL,
	scheduledDeparture TIMESTAMP WITHOUT TIME ZONE NOT NULL,
	scheduledArrival TIMESTAMP WITHOUT TIME ZONE NOT NULL,
	kind SlotKind NOT NULL,
);
CREATE TABLE Flights (
	flightID CHAR(26) NOT NULL, -- Date-Origin-Destination-FlightNumber-AircraftRegistration -> 6+1+3+1+3+1+4+1+6
	departureAirport CHAR(3) NOT NULL,
	arrivalAirport CHAR(3) NOT NULL,
	actualDeparture TIMESTAMP WITHOUT TIME ZONE,
	actualArrival TIMESTAMP WITHOUT TIME ZONE,
	cancelled BOOLEAN,
	delayCode CHAR(2), -- IATA code, 2 digits
	passengers SMALLINT,
	cabinCrew SMALLINT, 
	flightCrew SMALLINT 
) INHERITS (Slots);
CREATE TABLE Maintenance (
	programmed boolean NOT NULL
) INHERITS (Slots);