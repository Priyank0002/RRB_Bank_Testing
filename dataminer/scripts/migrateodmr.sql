-- Run this script to migrate an existing ODMRSYS account
-- Warning: Data base will be put into restricted mode until migration is completed.
-- All sessions with role of ODMRUSER will be disconnected.
-- @migrateodmr.sql
--
-- Migration will only be allowed from ODMRSYS version 11.2.0.1.9 (SQL DEVELOPER 3.0 EA4)
-- to ODMRSYS version 11.2.0.1.10 (SQL DEVELOPER 3.0 Final)
--



DECLARE
v_version VARCHAR2(30);
BEGIN
    EXECUTE IMMEDIATE 'SELECT PROPERTY_STR_VALUE FROM ODMRSYS.ODMR_REPOSITORY_PROPERTIES WHERE PROPERTY_NAME=''VERSION''' INTO v_version;
    if v_version != '11.2.0.1.9'
    THEN
         RAISE_APPLICATION_ERROR(-20000, 'Not allowed to migrate current repository version: ' || v_version);
    END IF;
END;
/

-- update the status of the repository
@updateRepositoryProperty.sql REPOSITORY_STATUS  NOT_LOADED

-- restrict further sessions to avoid deadload during migration
@alterDBRestrictSession.sql

-- disconnect any existing odmruser sessions, or odmrsys sessions
@disconnectODMRSessions.sql DR

-- install new packages
alter session set current_schema = "ODMRSYS";
@instpackages.sql

-- unrestrict database sessions
@alterDBUnRestrictSession.sql

WHENEVER SQLERROR EXIT SQL.SQLCODE;

-- insure there are no invalid objects
alter session set current_schema = "ODMRSYS";
@validateODMRSYS.sql

-- update the repository status
alter session set current_schema = "ODMRSYS";
@updateRepositoryProperty.sql VERSION 11.2.0.1.10

-- update the status of the repository
@updateRepositoryProperty.sql REPOSITORY_STATUS  LOADED





