-- Drops the ODMRSYS Repostory and ODMRUSER Role
-- Example: @dropRepository.sql 

SET SERVEROUTPUT ON;
SET ECHO ON;


-- Drop ODMRSYS user, and ODMRUSER role
-- NOTE: ERRORS ARE OK FOR THESE TWO DROP COMMANDS AS THEY JUST CONFIRM THE USER AND ROLE DO NOT EXIST
drop user ODMRSYS cascade;
drop role ODMRUSER;


