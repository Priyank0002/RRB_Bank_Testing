-- prepares demo data for user
-- A. Grant user access to SH schema
-- B. Create mining_data_* views in user account based on SH schema
-- C. Load insurance data into table in user account
-- Parameters:
-- 1: <USER>  - user account
-- Example:
-- @instDemoData.sql MYUSER

-- User account subsitution variable
DEFINE USER_ACCOUNT = &&1

-- drop prexisting demo views/tables and revokes SH select grants
@@dropSHDemoData.sql "&USER_ACCOUNT"  
/

--grant rights to SH
@dmshgrants.sql "&USER_ACCOUNT"
/

-- create demo tables/views based on SH data in users account
@@dmsh.sql "&USER_ACCOUNT"
/

-- load insurance customer demo data
@@instInsurCustData.sql "&USER_ACCOUNT"
/

-- required to insure inserts performed in instInsurCustData.sql are commited
commit;
