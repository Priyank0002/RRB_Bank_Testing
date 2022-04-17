
-- History ----------------------------
Rem    MODIFIER   (DD/MM/YYYY)  Notes
Rem    dslavov     19/01/2011 - Created
---------------------------------------

PROMPT Prerequisites fulfilled.
PROMPT
PROMPT ================================
PROMPT II. DB upgrade
PROMPT ================================

@DMRS_Upgrade_Script_DM2.0patch_DM3.0.sql;

PROMPT
PROMPT ================================
PROMPT III. DML statements execution
PROMPT ================================

@DMRS_Upgrade_Script_DM2.0patch_DM3.0_DML.sql;

PROMPT
PROMPT ================================
PROMPT IV. Compile stored procedure/s/
PROMPT ================================

@P_Java_XmlTransform.sql
@F_Load_Java_SP.sql
@F_Apply_Java_Transformation.sql
@Pkg_Osdm_Utils.sql;
@Pkg_Osdm_Utils_body.sql;

PROMPT
PROMPT Reporting repository is upgraded.
PROMPT It is compatible for use with current Oracle Data Modeler version.