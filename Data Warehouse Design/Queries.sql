-- ----------------------------------------------------------------
--          Indyco Builder - Auto-Generated DDL Script           --
-- ----------------------------------------------------------------
--
-- Project Name . . . . . . : airport
--  + Exported Datamarts. . : AMOS, AIMS
--  + Export Timestamp. . . : 2019-10-24 19:33:02
--
-- Selected Profile . . . . : Custom
--  + Shared Hierarchies. . : Snowflake
--  + Cross Dimensional Attr: Bridge table without surrogates
--  + Degenerate Dimensions : Use junk table
--  + Multiple Arcs . . . . : Bridge table without surrogates
--  + Recursions. . . . . . : Use self-referencing keys
--
-- Target DB. . . . . . . . : Oracle Database
--  + Export Primary Keys . : True
--  + Export Foreign Keys . : True
--  + Nullable columns. . . : False
--
-- ----------------------------------------------------------------

CREATE TABLE "DT_AIRCRAFT"
(
  "ID_REGISTRATION_CODE" NUMBER (9) NOT NULL,
  "REGISTRATION_CODE" VARCHAR2 (255 CHAR) NOT NULL,
  "MODEL" VARCHAR2 (255 CHAR) NOT NULL,
  "ID_MODEL" NUMBER (9) NOT NULL,
  "MANUFACTURER" VARCHAR2 (255 CHAR) NOT NULL,
  "ID_MANUFACTURER" NUMBER (9) NOT NULL
);
ALTER TABLE "DT_AIRCRAFT" ADD CONSTRAINT "PK_DT_AIRCRAFT" PRIMARY KEY ("ID_REGISTRATION_CODE");





CREATE TABLE "DT_FLIGHT"
(
  "ID_FLIGHT_CODE" NUMBER (9) NOT NULL,
  "FLIGHT_CODE" VARCHAR2 (255 CHAR) NOT NULL,
  "PILOT" VARCHAR2 (255 CHAR) NOT NULL,
  "ID_PILOT" NUMBER (9) NOT NULL,
  "MAINTENANCE_PERSON" VARCHAR2 (255 CHAR) NOT NULL,
  "ID_MAINTENANCE_PERSON" NUMBER (9) NOT NULL,
  "AIRPORT" VARCHAR2 (255 CHAR) NOT NULL,
  "ID_AIRPORT" NUMBER (9) NOT NULL
);
ALTER TABLE "DT_FLIGHT" ADD CONSTRAINT "PK_DT_FLIGHT" PRIMARY KEY ("ID_FLIGHT_CODE");





CREATE TABLE "DT_DATE"
(
  "ID_DATE_DAY" NUMBER (9) NOT NULL,
  "DATE_DAY" DATE NOT NULL,
  "CALENDAR_MONTH" VARCHAR2 (25 CHAR) NOT NULL,
  "ID_CALENDAR_MONTH" NUMBER (9) NOT NULL,
  "CALENDAR_YEAR" VARCHAR2 (25 CHAR) NOT NULL,
  "ID_CALENDAR_YEAR" NUMBER (9) NOT NULL,
  "DAY_NAME" VARCHAR2 (255 CHAR) NOT NULL
);
ALTER TABLE "DT_DATE" ADD CONSTRAINT "PK_DT_DATE" PRIMARY KEY ("ID_DATE_DAY");





CREATE TABLE "FT_AC_USAGE"
(
  "ID_REGISTRATION_CODE" NUMBER (9) NOT NULL,
  "ID_DATE_DAY" NUMBER (9) NOT NULL,
  "DAYS_IN_SERVICE" NUMBER (18,3) NOT NULL,
  "DAYS_OUT_OF_SERVICE_UNSC" NUMBER (18,3) NOT NULL,
  "DAYS_OUT_OF_SERVICE_SCHEDULED" NUMBER (18,3) NOT NULL
);
ALTER TABLE "FT_AC_USAGE" ADD CONSTRAINT "PK_FT_AC_USAGE" PRIMARY KEY ("ID_REGISTRATION_CODE", "ID_DATE_DAY");

-- validate consistency at insertion time
-- the usage time of an aircraft is distributed in three parts that add to 1
ALTER TABLE "FT_AC_USAGE" ADD CONSTRAINT "CHECK_USAGE_DAYS_FIT"
CHECK (
	"DAYS_OUT_OF_SERVICE_SCHEDULED"
	+ "DAYS_OUT_OF_SERVICE_UNSC"
	+ "DAYS_IN_SERVICE" = 1);



CREATE TABLE "FT_FLIGHT_OP"
(
  "ID_REGISTRATION_CODE" NUMBER (9) NOT NULL,
  "ID_FLIGHT_CODE" NUMBER (9) NOT NULL,
  "ID_DATE_DAY" NUMBER (9) NOT NULL,
  "DELAY_MINUTES" NUMBER (18,3) NOT NULL,
  "FLIGHT_HOURS" NUMBER (18,3) NOT NULL,
  "LOGBOOK_COUNT_PILOT" NUMBER (9) NOT NULL,
  "LOGBOOK_COUNT_MAINTENANCE" NUMBER (9) NOT NULL,
  "CANCELLATION_COUNT" NUMBER (9) NOT NULL,
  "DELAY_COUNT" NUMBER (9) NOT NULL,
  "TAKEOFF_COUNT" NUMBER (9) NOT NULL
);
ALTER TABLE "FT_FLIGHT_OP" ADD CONSTRAINT "PK_FT_FLIGHT_OP" PRIMARY KEY ("ID_REGISTRATION_CODE", "ID_FLIGHT_CODE", "ID_DATE_DAY");

-- validate consistency at insertion time
-- the number of takeoffs is bigger or equal than delay count
-- and bigger than cancellation count
ALTER TABLE "FT_FLIGHT_OP" ADD CONSTRAINT "CHECK_DELAYS_LEQ_THAN_TAKEOFFS"
CHECK (
	"DELAY_COUNT" <= "TAKEOFF_COUNT");



ALTER TABLE "FT_AC_USAGE" ADD CONSTRAINT "FK_FT_AC_USG_ID_RGST_CODE_ID" FOREIGN KEY ("ID_REGISTRATION_CODE") REFERENCES "DT_AIRCRAFT" ("ID_REGISTRATION_CODE");
ALTER TABLE "FT_AC_USAGE" ADD CONSTRAINT "FK_FT_AC_USG_ID_DATE_DAY_ID_D" FOREIGN KEY ("ID_DATE_DAY") REFERENCES "DT_DATE" ("ID_DATE_DAY");

ALTER TABLE "FT_FLIGHT_OP" ADD CONSTRAINT "FK_FT_FLGH_OP_ID_RGST_CODE_ID" FOREIGN KEY ("ID_REGISTRATION_CODE") REFERENCES "DT_AIRCRAFT" ("ID_REGISTRATION_CODE");
ALTER TABLE "FT_FLIGHT_OP" ADD CONSTRAINT "FK_FT_FLGH_OP_ID_FLGH_CODE_ID" FOREIGN KEY ("ID_FLIGHT_CODE") REFERENCES "DT_FLIGHT" ("ID_FLIGHT_CODE");
ALTER TABLE "FT_FLIGHT_OP" ADD CONSTRAINT "FK_FT_FLGH_OP_ID_DATE_DAY_ID" FOREIGN KEY ("ID_DATE_DAY") REFERENCES "DT_DATE" ("ID_DATE_DAY");


-- INSERT DATA, random, non meaningful (only datatype compliant)

-- INSERT INTO DT_AIRCRAFT (ID_REGISTRATION_CODE,REGISTRATION_CODE,MODEL,ID_MODEL,MANUFACTURER,ID_MANUFACTURER) VALUES (1,'FBE00FF6','scelerisque sed,',1,'Nec Urna Foundation',1);
-- INSERT INTO DT_AIRCRAFT (ID_REGISTRATION_CODE,REGISTRATION_CODE,MODEL,ID_MODEL,MANUFACTURER,ID_MANUFACTURER) VALUES (2,'ED30E7FE','ut eros',2,'Nunc Ltd',2);
-- INSERT INTO DT_AIRCRAFT (ID_REGISTRATION_CODE,REGISTRATION_CODE,MODEL,ID_MODEL,MANUFACTURER,ID_MANUFACTURER) VALUES (3,'AA1BE4BA','laoreet lectus',3,'Lacus Vestibulum Lorem Ltd',3);
-- INSERT INTO DT_AIRCRAFT (ID_REGISTRATION_CODE,REGISTRATION_CODE,MODEL,ID_MODEL,MANUFACTURER,ID_MANUFACTURER) VALUES (4,'67C5CD82','ac mattis',4,'Massa Mauris Incorporated',4);
-- INSERT INTO DT_AIRCRAFT (ID_REGISTRATION_CODE,REGISTRATION_CODE,MODEL,ID_MODEL,MANUFACTURER,ID_MANUFACTURER) VALUES (5,'0D127BA1','pede blandit',5,'Eros Consulting',5);

-- INSERT INTO DT_FLIGHT (ID_FLIGHT_CODE,FLIGHT_CODE,ID_PILOT, PILOT, ID_MAINTENANCE_PERSON, MAINTENANCE_PERSON,ID_AIRPORT, AIRPORT) VALUES (1,'7D46828B-0864-E0AA-9817-5BD18DFFFB20',1,'Bradford, Yoko E.',1,'Campos, Ursula I.',1,'Langenburg');
-- INSERT INTO DT_FLIGHT (ID_FLIGHT_CODE,FLIGHT_CODE,ID_PILOT, PILOT, ID_MAINTENANCE_PERSON, MAINTENANCE_PERSON,ID_AIRPORT, AIRPORT) VALUES (2,'F225F9EB-96E7-DE81-38B0-89D6E0AA0C18',2,'Marshall, Gareth F.',2,'Hancock, Calvin H.',2,'Paradise');
-- INSERT INTO DT_FLIGHT (ID_FLIGHT_CODE,FLIGHT_CODE,ID_PILOT, PILOT, ID_MAINTENANCE_PERSON, MAINTENANCE_PERSON,ID_AIRPORT, AIRPORT) VALUES (3,'1C60D8EC-D8B2-19B6-B7B6-C8CAF0F98A8A',3,'Wood, Tyler W.',3,'Little, Kennan J.',3,'Travo');
-- INSERT INTO DT_FLIGHT (ID_FLIGHT_CODE,FLIGHT_CODE,ID_PILOT, PILOT, ID_MAINTENANCE_PERSON, MAINTENANCE_PERSON,ID_AIRPORT, AIRPORT) VALUES (4,'0195E3A9-FEEF-B254-FBFA-240F1A37C065',4,'Ingram, Octavia I.',4,'Anthony, Colby Z.',4,'Moio Alcantara');
-- INSERT INTO DT_FLIGHT (ID_FLIGHT_CODE,FLIGHT_CODE,ID_PILOT, PILOT, ID_MAINTENANCE_PERSON, MAINTENANCE_PERSON,ID_AIRPORT, AIRPORT) VALUES (5,'4E6BBC88-4C39-E181-4F80-B8BDE27CBBC2',5,'Hamilton, Donovan W.',5,'Vaughan, Hanna Y.',5,'Stalowa Wola');

-- INSERT INTO DT_DATE (ID_DATE_DAY, DATE_DAY, DAY_NAME, ID_CALENDAR_MONTH, CALENDAR_MONTH, ID_CALENDAR_YEAR, CALENDAR_YEAR) VALUES (1,TO_DATE('24/11/2019', 'DD/MM/YYYY'),'Friday',10,'OCTOBER',1,'2019');
-- INSERT INTO DT_DATE (ID_DATE_DAY, DATE_DAY, DAY_NAME, ID_CALENDAR_MONTH, CALENDAR_MONTH, ID_CALENDAR_YEAR, CALENDAR_YEAR) VALUES (2,TO_DATE('25/11/2019', 'DD/MM/YYYY'),'Saturday',10,'OCTOBER',1,'2019');
-- INSERT INTO DT_DATE (ID_DATE_DAY, DATE_DAY, DAY_NAME, ID_CALENDAR_MONTH, CALENDAR_MONTH, ID_CALENDAR_YEAR, CALENDAR_YEAR) VALUES (3,TO_DATE('26/11/2019', 'DD/MM/YYYY'),'Sunday',10,'OCTOBER',1,'2019');
-- INSERT INTO DT_DATE (ID_DATE_DAY, DATE_DAY, DAY_NAME, ID_CALENDAR_MONTH, CALENDAR_MONTH, ID_CALENDAR_YEAR, CALENDAR_YEAR) VALUES (4,TO_DATE('27/12/2019', 'DD/MM/YYYY'),'Friday',10,'DECEMBER',1,'2019');
-- INSERT INTO DT_DATE (ID_DATE_DAY, DATE_DAY, DAY_NAME, ID_CALENDAR_MONTH, CALENDAR_MONTH, ID_CALENDAR_YEAR, CALENDAR_YEAR) VALUES (5,TO_DATE('28/01/2020', 'DD/MM/YYYY'),'Tuesday',10,'OCTOBER',1,'2020');

-- INSERT INTO FT_AC_USAGE (ID_REGISTRATION_CODE,ID_DATE_DAY,DAYS_IN_SERVICE,DAYS_OUT_OF_SERVICE_UNSC,DAYS_OUT_OF_SERVICE_SCHEDULED) VALUES (1,1,0.5,0.5,0);
-- INSERT INTO FT_AC_USAGE (ID_REGISTRATION_CODE,ID_DATE_DAY,DAYS_IN_SERVICE,DAYS_OUT_OF_SERVICE_UNSC,DAYS_OUT_OF_SERVICE_SCHEDULED) VALUES (2,2,0,0,1);
-- INSERT INTO FT_AC_USAGE (ID_REGISTRATION_CODE,ID_DATE_DAY,DAYS_IN_SERVICE,DAYS_OUT_OF_SERVICE_UNSC,DAYS_OUT_OF_SERVICE_SCHEDULED) VALUES (3,3,0,1,0);
-- INSERT INTO FT_AC_USAGE (ID_REGISTRATION_CODE,ID_DATE_DAY,DAYS_IN_SERVICE,DAYS_OUT_OF_SERVICE_UNSC,DAYS_OUT_OF_SERVICE_SCHEDULED) VALUES (4,4,0,0.3,0.7);

-- INSERT INTO FT_FLIGHT_OP (ID_DATE_DAY,ID_REGISTRATION_CODE,ID_FLIGHT_CODE,DELAY_MINUTES,FLIGHT_HOURS,LOGBOOK_COUNT_PILOT,LOGBOOK_COUNT_MAINTENANCE,CANCELLATION_COUNT,DELAY_COUNT,TAKEOFF_COUNT) VALUES (1,1,1,89,2,5,5,1,1,9);
-- INSERT INTO FT_FLIGHT_OP (ID_DATE_DAY,ID_REGISTRATION_CODE,ID_FLIGHT_CODE,DELAY_MINUTES,FLIGHT_HOURS,LOGBOOK_COUNT_PILOT,LOGBOOK_COUNT_MAINTENANCE,CANCELLATION_COUNT,DELAY_COUNT,TAKEOFF_COUNT) VALUES (2,2,2,5,7,10,2,2,1,10);
-- INSERT INTO FT_FLIGHT_OP (ID_DATE_DAY,ID_REGISTRATION_CODE,ID_FLIGHT_CODE,DELAY_MINUTES,FLIGHT_HOURS,LOGBOOK_COUNT_PILOT,LOGBOOK_COUNT_MAINTENANCE,CANCELLATION_COUNT,DELAY_COUNT,TAKEOFF_COUNT) VALUES (3,3,3,34,7,8,14,1,1,12);
-- INSERT INTO FT_FLIGHT_OP (ID_DATE_DAY,ID_REGISTRATION_CODE,ID_FLIGHT_CODE,DELAY_MINUTES,FLIGHT_HOURS,LOGBOOK_COUNT_PILOT,LOGBOOK_COUNT_MAINTENANCE,CANCELLATION_COUNT,DELAY_COUNT,TAKEOFF_COUNT) VALUES (4,4,4,54,8,5,11,4,1,10);
-- INSERT INTO FT_FLIGHT_OP (ID_DATE_DAY,ID_REGISTRATION_CODE,ID_FLIGHT_CODE,DELAY_MINUTES,FLIGHT_HOURS,LOGBOOK_COUNT_PILOT,LOGBOOK_COUNT_MAINTENANCE,CANCELLATION_COUNT,DELAY_COUNT,TAKEOFF_COUNT) VALUES (5,5,5,83,9,12,2,2,1,9);

-- ######################### CREATE MATERIALIZED VIEWS ####################

-- ######## MATERIALIZED VIEWS FOR AIMS ############
-- logs are necessary to allow for REFRESH FAST
-- https://stackoverflow.com/questions/48813870/cannot-use-filter-columns-from-materialized-view-log-on-table

CREATE MATERIALIZED VIEW LOG ON DT_AIRCRAFT
WITH ROWID, SEQUENCE(ID_REGISTRATION_CODE, REGISTRATION_CODE, MODEL, MANUFACTURER)
INCLUDING NEW VALUES;

CREATE MATERIALIZED VIEW LOG ON DT_DATE
WITH ROWID, SEQUENCE(ID_DATE_DAY, DATE_DAY, CALENDAR_MONTH, CALENDAR_YEAR)
INCLUDING NEW VALUES;

CREATE MATERIALIZED VIEW LOG ON DT_FLIGHT
WITH ROWID, SEQUENCE(ID_FLIGHT_CODE, AIRPORT, MAINTENANCE_PERSON)
INCLUDING NEW VALUES;

CREATE MATERIALIZED VIEW LOG ON FT_FLIGHT_OP
WITH ROWID, SEQUENCE(
	ID_REGISTRATION_CODE,
	ID_FLIGHT_CODE,
	ID_DATE_DAY,
	FLIGHT_HOURS, 
    TAKEOFF_COUNT, -- TO is a reserved name in ORACLE
    DELAY_COUNT,
    CANCELLATION_COUNT,
    DELAY_MINUTES,
    LOGBOOK_COUNT_MAINTENANCE,
    LOGBOOK_COUNT_PILOT)
INCLUDING NEW VALUES;



CREATE MATERIALIZED VIEW MV_AIMS
BUILD IMMEDIATE
REFRESH FAST
ON DEMAND
-- UPDATE EACH DAY AT 00:00
START WITH SYSDATE NEXT TRUNC(SYSDATE,'DD') + 1 
ENABLE QUERY REWRITE
 AS
  SELECT a.REGISTRATION_CODE, a.MODEL, a.MANUFACTURER, t.DATE_DAY, t.CALENDAR_MONTH, T.CALENDAR_YEAR,
  	COUNT(*),
    SUM(fo.FLIGHT_HOURS) as FH,
    SUM(fo.TAKEOFF_COUNT) as TOC, -- TO is a reserved name in ORACLE
    SUM(fo.DELAY_COUNT) AS DC,
    SUM(fo.CANCELLATION_COUNT) as CN,
    SUM(fo.DELAY_MINUTES) AS DM
  FROM DT_AIRCRAFT a, DT_DATE t, DT_FLIGHT f, FT_FLIGHT_OP fo
  WHERE fo.ID_REGISTRATION_CODE=a.ID_REGISTRATION_CODE
    AND fo.ID_DATE_DAY=t.ID_DATE_DAY
    AND fo.ID_FLIGHT_CODE=f.ID_FLIGHT_CODE
  GROUP BY a.REGISTRATION_CODE, a.MODEL, a.MANUFACTURER, t.DATE_DAY, t.CALENDAR_MONTH, t.CALENDAR_YEAR
  ORDER BY a.REGISTRATION_CODE, a.MODEL, a.MANUFACTURER, t.DATE_DAY, t.CALENDAR_MONTH, t.CALENDAR_YEAR;
  

 -- sample query, FH by calendar year per model

  -- SELECT a.MODEL, a.MANUFACTURER, t.CALENDAR_YEAR,
  --   SUM(fo.FLIGHT_HOURS) as FH
  -- FROM DT_AIRCRAFT a, DT_DATE t, DT_FLIGHT f, FT_FLIGHT_OP fo
  -- WHERE fo.ID_REGISTRATION_CODE=a.ID_REGISTRATION_CODE
  --   AND fo.ID_DATE_DAY=t.ID_DATE_DAY
  --   AND fo.ID_FLIGHT_CODE=f.ID_FLIGHT_CODE
  -- GROUP BY a.REGISTRATION_CODE, a.MODEL, a.MANUFACTURER, t.DATE_DAY, t.CALENDAR_MONTH, t.CALENDAR_YEAR
  -- ORDER BY a.REGISTRATION_CODE, a.MODEL, a.MANUFACTURER, t.DATE_DAY, t.CALENDAR_MONTH, t.CALENDAR_YEAR;
  
 -- Example of query: DYR, CNR, FH, TOC, ADD and TDR per model and per year
 
--  SELECT a.MODEL, T.CALENDAR_YEAR,
--     SUM(fo.FLIGHT_HOURS) as FH,
--     SUM(fo.TAKEOFF_COUNT) as TOC, -- TO is a reserved name in ORACLE
--     SUM(fo.DELAY_COUNT)/SUM(fo.TAKEOFF_COUNT)*100 as DYR,
--     SUM(fo.CANCELLATION_COUNT) AS CN,
--     SUM(fo.DELAY_COUNT) AS DC,   
--     SUM(fo.CANCELLATION_COUNT)/SUM(fo.TAKEOFF_COUNT)*100 as CNR,
--     100 - ((SUM(fo.CANCELLATION_COUNT) + SUM(fo.DELAY_COUNT))/SUM(fo.TAKEOFF_COUNT))*100 as TDR,
--     SUM(fo.DELAY_MINUTES)/SUM(fo.DELAY_COUNT)*100 as AVGDD -- ADD is a reserved name in ORACLE
--   FROM DT_AIRCRAFT a, DT_DATE t, DT_FLIGHT f, FT_FLIGHT_OP fo
--   WHERE fo.ID_REGISTRATION_CODE=a.ID_REGISTRATION_CODE
--     AND fo.ID_DATE_DAY=t.ID_DATE_DAY
--     AND fo.ID_FLIGHT_CODE=f.ID_FLIGHT_CODE
--   GROUP BY a.MODEL, t.CALENDAR_YEAR
--   ORDER BY a.MODEL, t.CALENDAR_YEAR;
 

-- ####### AMOS MATERIALIZED VIEW ############

CREATE MATERIALIZED VIEW LOG ON FT_AC_USAGE
WITH ROWID, SEQUENCE(
	ID_REGISTRATION_CODE,
	ID_DATE_DAY,
	DAYS_IN_SERVICE,
	DAYS_OUT_OF_SERVICE_UNSC,
	DAYS_OUT_OF_SERVICE_SCHEDULED)
INCLUDING NEW VALUES;

-- UPDATE FROM NOW, MONTHLY AT 00:00

CREATE MATERIALIZED VIEW MV_AMOS
BUILD IMMEDIATE
REFRESH FAST
ON DEMAND
START WITH SYSDATE NEXT (ADD_MONTHS(TRUNC(SYSDATE,'MM'),1))
ENABLE QUERY REWRITE AS
	SELECT a.REGISTRATION_CODE, a.MODEL, a.MANUFACTURER, t.DATE_DAY, t.CALENDAR_MONTH, T.CALENDAR_YEAR, 
	    SUM(au.DAYS_IN_SERVICE) as ADIS,
	    SUM(au.DAYS_OUT_OF_SERVICE_SCHEDULED) as ADOSS,
	    SUM(au.DAYS_OUT_OF_SERVICE_UNSC) AS ADOSU
	  FROM DT_AIRCRAFT a, DT_DATE t, FT_AC_USAGE au
	  WHERE au.ID_REGISTRATION_CODE=a.ID_REGISTRATION_CODE
	    AND au.ID_DATE_DAY=t.ID_DATE_DAY
	  GROUP BY a.REGISTRATION_CODE, a.MODEL, a.MANUFACTURER, t.DATE_DAY, t.CALENDAR_MONTH, T.CALENDAR_YEAR
	  ORDER BY a.REGISTRATION_CODE, a.MODEL, a.MANUFACTURER, t.DATE_DAY, t.CALENDAR_MONTH, T.CALENDAR_YEAR;


-- example query, ADOS per MANUFACTURER per CALENDAR_MONTH

  -- SELECT a.MANUFACTURER, t.CALENDAR_MONTH,
  --   SUM(au.DAYS_OUT_OF_SERVICE_UNSC) + SUM(au.DAYS_OUT_OF_SERVICE_SCHEDULED) as ADOS
  -- FROM DT_AIRCRAFT a, DT_DATE t, FT_AC_USAGE au
  -- WHERE au.ID_REGISTRATION_CODE=a.ID_REGISTRATION_CODE
  --   AND au.ID_DATE_DAY=t.ID_DATE_DAY
  -- GROUP BY a.REGISTRATION_CODE, a.MODEL, a.MANUFACTURER, t.DATE_DAY, t.CALENDAR_MONTH, T.CALENDAR_YEAR
  -- ORDER BY a.REGISTRATION_CODE, a.MODEL, a.MANUFACTURER, t.DATE_DAY, t.CALENDAR_MONTH, T.CALENDAR_YEAR;
  
-- #### REPORT MATERIALIZED VIEW #####
  
-- UPDATE FROM NOW, NEXT MONTH AT 00:00

CREATE MATERIALIZED VIEW MV_RR
BUILD IMMEDIATE
REFRESH FAST
ON DEMAND
START WITH SYSDATE NEXT (ADD_MONTHS(TRUNC(SYSDATE,'MM'),1))
ENABLE QUERY REWRITE
 AS  
  SELECT a.ID_REGISTRATION_CODE, a.MODEL, a.MANUFACTURER, t.CALENDAR_MONTH, t.CALENDAR_YEAR, f.MAINTENANCE_PERSON, f.AIRPORT,
    SUM(fo.LOGBOOK_COUNT_MAINTENANCE) AS MRR,
    SUM(fo.LOGBOOK_COUNT_PILOT) AS PRR,
    SUM(fo.TAKEOFF_COUNT) as TOC,
    SUM(fo.FLIGHT_HOURS) as FO
  FROM DT_AIRCRAFT a, DT_DATE t, DT_FLIGHT f, FT_FLIGHT_OP fo
  WHERE fo.ID_REGISTRATION_CODE=a.ID_REGISTRATION_CODE
    AND fo.ID_DATE_DAY=t.ID_DATE_DAY
    AND fo.ID_FLIGHT_CODE=f.ID_FLIGHT_CODE
  GROUP BY a.ID_REGISTRATION_CODE, a.MODEL, a.MANUFACTURER, t.CALENDAR_MONTH, t.CALENDAR_YEAR, f.MAINTENANCE_PERSON, f.AIRPORT
  ORDER BY a.ID_REGISTRATION_CODE, a.MODEL, a.MANUFACTURER, t.CALENDAR_MONTH, t.CALENDAR_YEAR, f.MAINTENANCE_PERSON, f.AIRPORT;  
  
-- QUERY EXAMPLES
  
--  SELECT a.MANUFACTURER, f.MAINTENANCE_PERSON, f.AIRPORT,
--      SUM(fo.LOGBOOK_COUNT_MAINTENANCE)/SUM(fo.TAKEOFF_COUNT)*100 as MRRC,
--      SUM(fo.LOGBOOK_COUNT_MAINTENANCE)/SUM(fo.FLIGHT_HOURS)*1000 as MRRH
--    FROM DT_AIRCRAFT a, DT_DATE t, DT_FLIGHT f, FT_FLIGHT_OP fo
--    WHERE fo.ID_REGISTRATION_CODE=a.ID_REGISTRATION_CODE
--      AND fo.ID_DATE_DAY=t.ID_DATE_DAY
--      AND fo.ID_FLIGHT_CODE=f.ID_FLIGHT_CODE
--    GROUP BY a.MANUFACTURER, f.MAINTENANCE_PERSON, f.AIRPORT
--    ORDER BY a.MANUFACTURER, f.MAINTENANCE_PERSON, f.AIRPORT; 
 
  
  
-- #############  DROP QUERIES ###############


-- DROP TABLE "DT_AIRCRAFT" CASCADE CONSTRAINTS;
-- DROP TABLE "DT_FLIGHT" CASCADE CONSTRAINTS;
-- DROP TABLE "DT_DATE" CASCADE CONSTRAINTS;
-- DROP TABLE "FT_AC_USAGE" CASCADE CONSTRAINTS;
-- DROP TABLE "FT_FLIGHT_OP" CASCADE CONSTRAINTS;

--DELETE FROM FT_FLIGHT_OP;
--DELETE FROM FT_AC_USAGE;
--DELETE FROM DT_AIRCRAFT;
--DELETE FROM DT_DATE;
--DELETE FROM DT_FLIGHT;

--DROP MATERIALIZED VIEW MV_AIMS;
--DROP MATERIALIZED VIEW MV_RR;
--DROP MATERIALIZED VIEW MV_AMOS;
  
--DROP MATERIALIZED VIEW LOG ON "FT_FLIGHT_OP";
--DROP MATERIALIZED VIEW LOG ON "DT_AIRCRAFT";
--DROP MATERIALIZED VIEW LOG ON "DT_DATE";
--DROP MATERIALIZED VIEW LOG ON "DT_FLIGHT";