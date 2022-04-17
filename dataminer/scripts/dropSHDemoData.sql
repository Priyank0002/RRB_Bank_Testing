--------------------------------------------------------------------------------
-- Drops views created in users account that are based on the
-- SH sample schema as well as the INSUR_CUST_LTV_SAMPLE table that is loaded via script.
-- 
-- Parameters:
-- 1. User account - account to drop views and tables on
-- Example:
-- @dropSHDemoData.sql DMUSER
--------------------------------------------------------------------------
--


-- User Account substitution variable
DEFINE USER_ACCOUNT = &&1

-- Drop Views
-- NOTE: ERRORS ARE OK FOR THESE DROPS AS THEY CONFIRM THE TABLES/VIEWS DO NOT EXIST
drop VIEW "&USER_ACCOUNT".mining_data_apply_v;
drop VIEW "&USER_ACCOUNT".mining_data_build_v;
drop VIEW "&USER_ACCOUNT".mining_data_test_v;
drop VIEW "&USER_ACCOUNT".mining_data_text_apply_v;
drop VIEW "&USER_ACCOUNT".mining_data_text_build_v;
drop VIEW "&USER_ACCOUNT".mining_data_text_test_v;
-- remove market_basket_v before RTM
drop VIEW "&USER_ACCOUNT".market_basket_v;
DROP TABLE "&USER_ACCOUNT"."INSUR_CUST_LTV_SAMPLE" cascade constraints;
