-- migrate XML schema
SET SERVEROUTPUT ON;

ALTER SESSION SET current_schema = "ODMRSYS";

ALTER SESSION SET RECYCLEBIN = OFF;

DECLARE
  tgt_ver VARCHAR2(30) := '11_2_0_2_0';
  ver VARCHAR2(30);
  res BOOLEAN;
BEGIN

  -- get current XML schema version
  SELECT extractvalue(x.SCHEMA, 'schema/@version') INTO ver
  FROM USER_XML_SCHEMAS x WHERE SCHEMA_URL = 'http://xmlns.oracle.com/odmr11/odmr.xsd';  

  ver := REPLACE(ver, '.', '_');
  
  -- make sure resource path exists /PUBLIC/xmlns.oracle.com/odmr11
  IF (NOT DBMS_XDB.existsResource('/public/odmr11')) THEN
    res := DBMS_XDB.createFolder('/public/odmr11');
  END IF;
  
  -- clean up resources from the current ver to the patch ver
  BEGIN
    DBMS_XDB.DELETERESOURCE('/public/odmr11/XMLSchema_11_2_0_2_0.xsd');
  EXCEPTION WHEN OTHERS THEN
    NULL;
  END;
  BEGIN
    DBMS_XDB.DELETERESOURCE('/public/odmr11/Migrate_11_2_0_1_0_to_11_2_0_2_0.xslt');
  EXCEPTION WHEN OTHERS THEN
    NULL;
  END;

  COMMIT;

  -- Load new XML schema
  res := DBMS_XDB.createResource(
           '/public/odmr11/XMLSchema_11_2_0_2_0.xsd',
           bfilename('DM_DIR', 'XMLSchema_11_2_0_2_0.xsd'));
  dbms_output.put_line('Load new XML schema');

  -- Load transformation XSL style sheet
  res := DBMS_XDB.createResource(
           '/public/odmr11/Migrate_11_2_0_1_0_to_11_2_0_2_0.xslt',
           bfilename('DM_DIR', 'Migrate_11_2_0_1_0_to_11_2_0_2_0.xslt'));
  dbms_output.put_line('Load transformation XSL style sheet');

  dbms_output.put_line('Migration Starts: '||SYSTIMESTAMP);
  DBMS_XMLSCHEMA.copyEvolve(
    xdb$string_list_t('http://xmlns.oracle.com/odmr11/odmr.xsd'), -- URL of current XML schema
    XMLSequenceType(XDBURIType('/public/odmr11/XMLSchema_11_2_0_2_0.xsd').getXML()), -- new XML schema document
    XMLSequenceType(XDBURIType('/public/odmr11/Migrate_11_2_0_1_0_to_11_2_0_2_0.xslt').getXML()), -- XSL document for transformation to new schema
    force => TRUE);
  dbms_output.put_line('Migration Ends: '||SYSTIMESTAMP);

EXCEPTION WHEN OTHERS THEN
  dbms_output.put_line('Migration failed: '||DBMS_UTILITY.FORMAT_ERROR_STACK());
END;
/

-- update tables/views

-- update PL/SQL packages

-- update grants
