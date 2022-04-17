
  CREATE OR REPLACE PACKAGE "ODMRSYS"."ODMR_MSG" 
AUTHID CURRENT_USER AS

  -- message level
  MSG_LEVEL_WARN      CONSTANT VARCHAR2(10) := 'WARN';
  MSG_LEVEL_ERR       CONSTANT VARCHAR2(10) := 'ERR';
  MSG_LEVEL_INFO      CONSTANT VARCHAR2(10) := 'INFO';

  MSG_LOG_TYPE_WARN          CONSTANT VARCHAR2(10) := 'WARN';
  MSG_LOG_TYPE_ERR           CONSTANT VARCHAR2(10) := 'ERR';
  MSG_LOG_TYPE_INFO          CONSTANT VARCHAR2(10) := 'INFO';

  MSG_LOG_SUBTYPE_START      CONSTANT VARCHAR2(10) := 'START';
  MSG_LOG_SUBTYPE_END        CONSTANT VARCHAR2(10) := 'END';

  MSG_LOG_TASK_WORKFLOW      CONSTANT VARCHAR2(30) := 'WORKFLOW';
  MSG_LOG_TASK_NODE          CONSTANT VARCHAR2(30) := 'NODE';
  MSG_LOG_TASK_SUBNODE       CONSTANT VARCHAR2(30) := 'SUBNODE';
  MSG_LOG_TASK_VALIDATE      CONSTANT VARCHAR2(30) := 'VALIDATE';
  MSG_LOG_TASK_SAMPLE        CONSTANT VARCHAR2(30) := 'SAMPLE';
  MSG_LOG_TASK_CACHE         CONSTANT VARCHAR2(30) := 'CACHE';
  MSG_LOG_TASK_STATISTICS    CONSTANT VARCHAR2(30) := 'STATISTICS';
  MSG_LOG_TASK_FEATURES      CONSTANT VARCHAR2(30) := 'FEATURES';
  MSG_LOG_TASK_DATAPREP      CONSTANT VARCHAR2(30) := 'DATAPREP';
  MSG_LOG_TASK_BUILD         CONSTANT VARCHAR2(30) := 'BUILD';
  MSG_LOG_TASK_TEST          CONSTANT VARCHAR2(30) := 'TEST';
  MSG_LOG_TASK_APPLY         CONSTANT VARCHAR2(30) := 'APPLY';
  MSG_LOG_TASK_TRANSFORM     CONSTANT VARCHAR2(30) := 'TRANSFORM';
  MSG_LOG_TASK_TEXT          CONSTANT VARCHAR2(30) := 'TEXT';
  MSG_LOG_TASK_BUILDTEXT     CONSTANT VARCHAR2(30) := 'BUILDTEXT';
  MSG_LOG_TASK_APPLYTEXT     CONSTANT VARCHAR2(30) := 'APPLYTEXT';
  MSG_LOG_TASK_OUTPUT        CONSTANT VARCHAR2(30) := 'OUTPUT';
  MSG_LOG_TASK_CLEANUP       CONSTANT VARCHAR2(30) := 'CLEANUP';

  -- Valid range of application error message codes are -20999 to -20000
  -- MSG_GEN prefix for Generic messages that can be used across many modules
  -- Range -20000 to -20100
  MSG_ERROR_CODE_START            CONSTANT NUMBER := -20000;
  MSG_GEN_OBJECT_NOT_EXISTS       CONSTANT NUMBER := -20001;
  MSG_GEN_OBJECT_EXISTS           CONSTANT NUMBER := -20002;
  MSG_GEN_OPERATION_FAIL          CONSTANT NUMBER := -20003;
  MSG_GEN_INVALID_INPUT           CONSTANT NUMBER := -20004;
  MSG_GEN_INVALID_INPUT2          CONSTANT NUMBER := -20005;
  MSG_GEN_INPUT_DATA_EMPTY        CONSTANT NUMBER := -20006;
  MSG_GEN_OUTPUT_DATA_EMPTY       CONSTANT NUMBER := -20007;

  MSG_INVALID_COST_BENEFIT        CONSTANT NUMBER := -20100;
  MSG_TARGET_ONE_DISTINCT_VALUE   CONSTANT NUMBER := -20101;
  MSG_TARGET_ALL_DISTINCT_VALUE   CONSTANT NUMBER := -20102;
  MSG_TARGET_HAS_NULL_VALUE       CONSTANT NUMBER := -20103;
  MSG_TARGET_HAS_ALL_NULL_VALUE   CONSTANT NUMBER := -20104;
  MSG_TARGET_INCOMP_WITH_BUILD    CONSTANT NUMBER := -20105;
  MSG_TARGET_INCOMP_DATATYPE      CONSTANT NUMBER := -20106;
  MSG_TARGET_VAL_INCOMP_W_MODEL   CONSTANT NUMBER := -20107;
  MSG_OBJECT_IS_MISSING           CONSTANT NUMBER := -20108;
  MSG_ITEM_VALUE_TOO_MANY_VALUES  CONSTANT NUMBER := -20109;
  MSG_CASEID_NOT_UNIQUE           CONSTANT NUMBER := -20110;
  MSG_GEN_INVALID_APPLY_ATTR      CONSTANT NUMBER := -20111;
  MSG_TARGET_INCOMP_WITH_GLMC     CONSTANT NUMBER := -20112;
  MSG_THEMES_NOT_GENERATED        CONSTANT NUMBER := -20113;
  MSG_NO_PREDICTOR_FOUND          CONSTANT NUMBER := -20114;
  MSG_COLUMN_INCOMP_DATATYPE      CONSTANT NUMBER := -20115;
  MSG_COLUMN_INCOMP_DATATYPE_EX   CONSTANT NUMBER := -20116;
  MSG_TEXT_TRANSFORM_OBJ_MISSING  CONSTANT NUMBER := -20117;
  MSG_PROJECT_DELETE_FAIL         CONSTANT NUMBER := -20118;
  MSG_TARGET_HAS_SPACE_VALUE      CONSTANT NUMBER := -20119;
  MSG_TARGET_EXCEED_DISTINCT_VAL  CONSTANT NUMBER := -20200;
  
  MSG_WORKFLOW_CANCEL             CONSTANT NUMBER := -20900;

  MSG_DEBUG_MESSAGE               CONSTANT NUMBER := -20999;

/* --------------------------------------------------------------------------- */
  -- Temporarily we will use the following structure to define the
  -- messages associated with the constants. Later we may have to
  -- define an error message table that will have these messages
  TYPE MSG_ASSOCIATIVE_ARRAY IS TABLE OF VARCHAR2(4000) index by binary_integer;

  ERR_MSG MSG_ASSOCIATIVE_ARRAY;

END ODMR_MSG;
/
 