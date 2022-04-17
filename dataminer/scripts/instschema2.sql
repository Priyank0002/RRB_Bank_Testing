-- install XML schema

BEGIN
  DBMS_XMLSCHEMA.DELETESCHEMA('http://xmlns.oracle.com/odmr11/odmr.xsd', DBMS_XMLSCHEMA.DELETE_CASCADE_FORCE);
EXCEPTION WHEN OTHERS THEN
  dbms_output.put_line('Delete XML schema failed: '||DBMS_UTILITY.FORMAT_ERROR_STACK());
END;
/
-- alter session was added for as a workaround for bug 9541946
-- changed to 0x800 due to a xdb patch to 11.2.0.1
alter session set events '31178 trace name context forever, level=0x800';

BEGIN
  DBMS_XMLSCHEMA.registerSchema(
    SCHEMAURL => 'http://xmlns.oracle.com/odmr11/odmr.xsd',
    SCHEMADOC => bfilename('DM_DIR','XMLSchema.xsd'),
    local => FALSE,
    gentypes => TRUE,
    genbean => FALSE,
    gentables => TRUE,
    enablehierarchy => DBMS_XMLSCHEMA.ENABLE_HIERARCHY_NONE);  
EXCEPTION WHEN OTHERS THEN
  dbms_output.put_line('Register XML schema failed: '||DBMS_UTILITY.FORMAT_ERROR_STACK());
END;
/