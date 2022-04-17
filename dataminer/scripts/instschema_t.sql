-- template file for generating intschema_g.sql

-- alter session was added for as a workaround for bug 9541946, revised to be 0x800 instead of 0x400
-- as a request from xdb folks due to a backport change on 11.2.0.1
alter session set events ''31178 trace name context forever, level=0x800'';


ALTER session set current_schema = "ODMRSYS";
BEGIN
  DBMS_XMLSCHEMA.DELETESCHEMA(''http://xmlns.oracle.com/odmr11/odmr.xsd'', DBMS_XMLSCHEMA.DELETE_CASCADE_FORCE);
EXCEPTION WHEN OTHERS THEN
  NULL;
END;
/

ALTER session set current_schema = "SYS";
/
DECLARE
  -- Declare a CLOB variable
{0}
BEGIN

{1}

  DBMS_XMLSCHEMA.registerSchema(
    ''http://xmlns.oracle.com/odmr11/odmr.xsd'',
    schemadoc => {2},
    local => FALSE,
    gentypes => TRUE,
    genbean => FALSE,
    gentables => TRUE,
    enablehierarchy => DBMS_XMLSCHEMA.ENABLE_HIERARCHY_NONE,
    owner => ''ODMRSYS'');

END;
/