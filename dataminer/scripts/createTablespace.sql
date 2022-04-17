-- drop and create tablespace
-- invoke this to create a tablespace
-- parameters
--  1: table space name
--  2: data file name(directory can be include as well but that might introduce platform considerations)
-- Example:
-- @createTablespace.sql ODMRSPACE odmrfile_f1.dat

SET SERVEROUTPUT ON;

-- drop tablespace if it already exists
DROP TABLESPACE &&1 INCLUDING CONTENTS AND DATAFILES;

-- create tablespace
  create tablespace &&1
  DATAFILE '&&2'
  size 20m 
  autoextend on 
  next 32m maxsize UNLIMITED
  extent management local  AUTOALLOCATE; 
