CREATE OR REPLACE PROCEDURE Java_XmlTransform (xml CLOB, xslt CLOB, output CLOB) AS LANGUAGE JAVA
  NAME 'JavaXslt.XMLTtransform(oracle.sql.CLOB, oracle.sql.CLOB, oracle.sql.CLOB)';
/