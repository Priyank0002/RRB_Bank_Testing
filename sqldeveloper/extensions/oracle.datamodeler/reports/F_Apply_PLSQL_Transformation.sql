CREATE OR REPLACE FUNCTION Apply_Transformation(v_rep_id IN NUMBER, inputXML IN CLOB, log_file UTL_FILE.File_Type) RETURN CLOB IS

result_xml CLOB;
xslt       CLOB;

BEGIN

   DBMS_LOB.CREATETEMPORARY(result_xml, TRUE);
   DBMS_LOB.CREATETEMPORARY(xslt, TRUE);
   
   SELECT x.xslt_clob
   INTO   xslt
   FROM   msword_ml_data x
   WHERE  x.report_id = v_rep_id;

   SELECT XMLTRANSFORM(XMLTYPE.createxml(inputXML,'',0,1), XMLTYPE.createxml(xslt,'',0,1)).GetClobVal()
   INTO   result_xml
   FROM   dual;

 RETURN result_xml;

EXCEPTION

 WHEN no_data_found THEN
   UTL_FILE.PUT_LINE(log_file, 'Required record with id = ' || v_rep_id || ' in MSWORD_ML_DATA table not found! Report generation is terminated.');
   RETURN NULL;
  
 WHEN others THEN
   UTL_FILE.PUT_LINE(log_file, 'Apply_Transformation Exception : ' || SQLERRM);  
   UTL_FILE.PUT_LINE(log_file, 'Apply_Transformation Exception : ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
   RETURN NULL;

END Apply_Transformation;
/