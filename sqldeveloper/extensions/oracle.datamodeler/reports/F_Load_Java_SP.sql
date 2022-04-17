CREATE OR REPLACE FUNCTION Load_Java_SP(log_file UTL_FILE.FILE_TYPE) RETURN NUMBER IS

v_status     VARCHAR2(10);
v_path       VARCHAR2(1000);
v_java_class VARCHAR2(1500);
j_file       UTL_FILE.File_Type;

BEGIN
	
   v_java_class :=                       'import java.io.PrintWriter; ' ||
                   CHR(13) || CHR(10) || 'import java.io.Writer; ' ||
                   CHR(13) || CHR(10) || 'import oracle.xml.parser.v2.DOMParser; ' ||
                   CHR(13) || CHR(10) || 'import oracle.xml.parser.v2.XMLDocument; ' ||
                   CHR(13) || CHR(10) || 'import oracle.xml.parser.v2.XSLProcessor; ' ||
                   CHR(13) || CHR(10) || 'import oracle.xml.parser.v2.XSLStylesheet; ' ||
                   CHR(13) || CHR(10) || ' ' ||
                   CHR(13) || CHR(10) || '/* ' ||
                   CHR(13) || CHR(10) || ' * This class is used as Java stored procedure ' ||
                   CHR(13) || CHR(10) || ' * There is a bug on Oracle11gR2, related to the limitation on the number of style sheet instructions  ' ||
                   CHR(13) || CHR(10) || ' * This stored procedure is workaround when PLSQL code can not be used. ' ||
                   CHR(13) || CHR(10) || ' *  ' ||
                   CHR(13) || CHR(10) || ' * File must not have package, otherwise is wrongly compiled in DB ' ||
                   CHR(13) || CHR(10) || ' */ ' ||
                   CHR(13) || CHR(10) || 'public class JavaXslt { ' ||
                   CHR(13) || CHR(10) || '	 ' ||
                   CHR(13) || CHR(10) || '	public static void XMLTtransform(oracle.sql.CLOB xmlInput,oracle.sql.CLOB xslInput,oracle.sql.CLOB output) throws Exception{ ' ||
                   CHR(13) || CHR(10) || '' ||
                   CHR(13) || CHR(10) || '		DOMParser parser; ' ||
                   CHR(13) || CHR(10) || '		XMLDocument xml; ' ||
                   CHR(13) || CHR(10) || '		XMLDocument xsldoc; ' ||
                   CHR(13) || CHR(10) || '' ||
                   CHR(13) || CHR(10) || '		try{ ' ||
                   CHR(13) || CHR(10) || '' ||
                   CHR(13) || CHR(10) || '			parser = new DOMParser(); ' ||
                   CHR(13) || CHR(10) || '' ||
                   CHR(13) || CHR(10) || '			parser.parse(xmlInput.getCharacterStream()); ' ||
                   CHR(13) || CHR(10) || '			xml = parser.getDocument(); ' ||
                   CHR(13) || CHR(10) || '' ||
                   CHR(13) || CHR(10) || '			parser.parse(xslInput.getCharacterStream()); ' ||
                   CHR(13) || CHR(10) || '			xsldoc = parser.getDocument(); ' ||
                   CHR(13) || CHR(10) || '' ||
                   CHR(13) || CHR(10) || '			XSLProcessor processor = new XSLProcessor(); ' ||
                   CHR(13) || CHR(10) || '			XSLStylesheet xsl = processor.newXSLStylesheet(xsldoc); ' ||
                   CHR(13) || CHR(10) || '' ||
                   CHR(13) || CHR(10) || '			Writer w = output.setCharacterStream(1L); ' ||
                   CHR(13) || CHR(10) || '			PrintWriter pw = new PrintWriter(w); ' ||
                   CHR(13) || CHR(10) || '' ||
                   CHR(13) || CHR(10) || '			processor.processXSL(xsl, xml, pw); ' ||
                   CHR(13) || CHR(10) || '' ||
                   CHR(13) || CHR(10) || '		}catch (Exception ex){ ' ||
                   CHR(13) || CHR(10) || '			throw ex; ' ||
                   CHR(13) || CHR(10) || '		} ' ||
                   CHR(13) || CHR(10) || '	} ' ||
                   CHR(13) || CHR(10) || '} ';

  SELECT directory_path 
  INTO   v_path
  FROM   all_directories
  WHERE  directory_name  = 'OSDDM_REPORTS_DIR';

  SELECT status 
  INTO   v_status
  FROM   user_objects
  WHERE  object_name = 'JavaXslt'
  AND    object_type = 'JAVA CLASS';
  
  IF (v_status = 'INVALID') THEN
     j_file := UTL_FILE.fopen('OSDDM_REPORTS_DIR','JavaXslt.java','w', 32767);
     UTL_FILE.PUT(j_file, v_java_class);
     UTL_FILE.FClose(j_file);
     DBMS_JAVA.LoadJava(''|| v_path || '/JavaXslt.java');
  END IF;

	RETURN 0;
  
EXCEPTION

  WHEN no_data_found THEN
    j_file := UTL_FILE.fopen('OSDDM_REPORTS_DIR','JavaXslt.java','w', 32767);
    UTL_FILE.PUT(j_file, v_java_class);
    UTL_FILE.fclose(j_file);
    DBMS_JAVA.LOADJAVA(''|| v_path || '/JavaXslt.java');
    RETURN 0;

  WHEN others THEN
    IF UTL_FILE.is_open(j_file) THEN
     UTL_FILE.fclose(j_file);
    END IF;
    UTL_FILE.PUT_LINE(log_file, 'Load_Java_SP : ' || SQLERRM);  
    UTL_FILE.PUT_LINE(log_file, 'Load_Java_SP : ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    RETURN 1;

END Load_Java_SP;
/