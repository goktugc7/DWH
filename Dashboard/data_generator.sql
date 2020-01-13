-- generate data 
DECLARE
  i INTEGER;
  j INTEGER;
  k INTEGER;
  nextDate DATE;
  nextMonth varchar2(6);
  maxPeople CONSTANT INTEGER := 100;  
  maxTemporal CONSTANT INTEGER := 5000;   
  l_start_date DATE := DATE'2004-01-01';
 
  type aircraftarray is varray(20) of varchar2(6);
  aircrafts CONSTANT aircraftarray := aircraftarray('XY-WTR', 'XY-VWK', 'XY-OKG','XY-HNS','XY-QLY','XY-XTT','XY-QXN','XY-JJQ','XY-ZSE','XY-XVI','XY-HXO','XY-IOL','XY-WBH','XY-EYQ','XY-OSF','XY-KKF','XY-ZHR','XY-HCI','XY-XPV','XY-VYU'); 
   
  type modelarray is varray(10) of varchar2(25);
  models CONSTANT modelarray := modelarray('767','777','747','A340','A330','A321','A330neo','A320neo family','737','A350 XWB');
 
  type manufacturerarray is varray(2) of varchar2(6);
  manufacturers CONSTANT manufacturerarray := manufacturerarray('Boeing','Airbus');
 
  type airportarray is varray(100) of varchar2(3);
  airports CONSTANT airportarray := airportarray('AGP','SKP','TSE','ESB','VKO','IEV','TIV','FRA','DUB','PDL','GYD','KIV','TRD','CLJ','TLL','OLB','BHX','KRS','DME','DRS','VNO','TFS','NUE','GDN','OVD','BGY','ORY','FNC','MSQ','LPL','TLS','TPS','RVN','PUY','AJA','LWO','CIA','GVA','LTN','HUY','BIQ','DBV','REU','BOO','ODS','RHO','CIY','BJV','BSL','GLA','EIN','LUG','BRQ','BRN','CTA','AAR','TSF','KUN','ZTH','WAW','BIO','LYS','PMO','CFU','OSL','BES','AER','ZAZ','FUE','LNZ','FMO','LIL','SVG','PMI','GOA','INI','LJU','IST','SVX','KBP','XRY','TZX','SEN','OVB','FCO','OST','VLC','SCQ','PFO','HAJ','ALC','PSR','ORK','AAL','EXT','BIA','MAN','BRS','SXF','FAO');
 
  type rolearray is varray(2) of varchar2(1);
  roles CONSTANT rolearray := rolearray('P','M');
  
BEGIN
DBMS_RANDOM.seed(0);

-- Insertions in AircraftDimentsion
FOR i IN 1..(aircrafts.count) LOOP
  INSERT INTO AIRCRAFTDIMENSION(ID, MODEL, MANUFACTURER) VALUES (aircrafts(i), models(dbms_random.value(1,10)), manufacturers(dbms_random.value(1,2)));
  END LOOP;
 
 -- Insertions in PeopleDimension
FOR i IN 1..(maxPeople) LOOP
  INSERT INTO PEOPLEDIMENSION(ID, AIRPORT, "ROLE") VALUES (i, airports(dbms_random.value(1,100)), roles(dbms_random.value(1,2)));
  END LOOP;   
 

 -- Insertions in TemporalDimensions and Months
 nextMonth :=  CONCAT(EXTRACT(MONTH FROM l_start_date), EXTRACT(YEAR FROM l_start_date));
 INSERT INTO MONTHS(ID,Y) VALUES (nextMonth, SUBSTR(nextMonth,LENGTH(nextMonth)-3,4));
 FOR i IN 1..maxTemporal LOOP  
  nextDate := l_start_date + i;    
  IF CONCAT(EXTRACT(MONTH FROM nextDate), EXTRACT(YEAR FROM nextDate)) <> nextMonth THEN 
      nextMonth :=  CONCAT(EXTRACT(MONTH FROM nextDate), EXTRACT(YEAR FROM nextDate));
	  INSERT INTO MONTHS(ID,Y) VALUES (nextMonth, SUBSTR(nextMonth,LENGTH(nextMonth)-3,4));
  END IF; 
  INSERT INTO TEMPORALDIMENSION(ID, MONTHID) VALUES (nextDate, nextMonth); 
 END LOOP;
  
-- Insertions in LogBookReporting
 nextMonth :=  CONCAT(EXTRACT(MONTH FROM l_start_date), EXTRACT(YEAR FROM l_start_date));
 FOR i IN 1..aircrafts.count LOOP
   FOR k IN 1..maxPeople LOOP
	 FOR j IN 1..maxTemporal LOOP
	     nextDate := l_start_date + j;
	     IF CONCAT(EXTRACT(MONTH FROM nextDate), EXTRACT(YEAR FROM nextDate)) <> nextMonth THEN 
		    nextMonth :=  CONCAT(EXTRACT(MONTH FROM nextDate), EXTRACT(YEAR FROM nextDate));	
		 ELSE CONTINUE;
		 END IF;		 
		  INSERT INTO LOGBOOKREPORTING(AIRCRAFTID, MONTHID, PERSONID, COUNTER) VALUES (
		    aircrafts(i),
		    nextMonth,
		    k,
		    CAST(dbms_random.value(1,50) AS INT) );
		 END LOOP;
	 END LOOP;
 END LOOP;

-- Insertions in AircraftUtilization
FOR i IN 1..aircrafts.count LOOP
	 FOR j IN 1..maxTemporal LOOP		
	 nextDate := l_start_date + j;
	  INSERT INTO AIRCRAFTUTILIZATION(AIRCRAFTID, TIMEID, FLIGHTHOURS, FLIGHTCYCLES, DELAYS, DELAYEDMINUTES, CANCELLATIONS, SCHEDULEDOUTOFSERVICE, UNSCHEDULEDOUTOFSERVICE) VALUES (
	    aircrafts(i),
	    nextDate,	    
	  	CAST(dbms_random.value(1,24) AS INT),
	    CAST(dbms_random.value(1,5) AS INT),
	    CAST(dbms_random.value(1,5) AS INT),
	    CAST(dbms_random.value(1,3) AS INT),
	    CAST(dbms_random.value(0,2) AS INT),
	    CAST(dbms_random.value(1,5) AS INT),
	    CAST(dbms_random.value(1,5) AS INT));		 
	 END LOOP;
END LOOP;
 
END;

COMMIT;