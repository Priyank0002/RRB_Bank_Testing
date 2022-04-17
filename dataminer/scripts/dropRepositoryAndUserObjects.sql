-- Drops the ODMRSYS Repostory and all internal User objects created by ODMr
-- Example: @dropRepositoryAndUserObjects.sql 
-- Warning: The data base will be placed into restricted mode, not allowing any new non priv user 
-- connections during the dropping of the repository. Additionally, all connections assigned the role
-- of ODMRUSER will be disconnected.

SET SERVEROUTPUT ON;
SET ECHO ON;

-- sets db in restricted mode
@alterDBRestrictSession.sql

-- disconnects any odmr sessions
@disconnectODMRSessions.sql DR

--Drop Users Internal Tables/Views created by ODMr
@@dropUserTablesViews.sql D

--Drop public synonyms of ODMRSyS
@@dropPublicSynonyms.sql 

--Drop ODMRSYS Repository
@@dropRepository.sql

--Drop Oracle Scheduler Chain objects
@@dropSchedulerObjects.sql D


-- disables db restricted mode
@alterDBUnRestrictSession.sql
