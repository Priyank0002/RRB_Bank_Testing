ALTER TABLE ODMR$WORKFLOW_JOBS 
DROP CONSTRAINT ODMR$WORKFLOW_JOBS_FK;

ALTER TABLE ODMR$WORKFLOWS 
DROP CONSTRAINT ODMR$WORKFLOWS_FK;

ALTER TABLE ODMR$WF_JOB_ARGS 
DROP CONSTRAINT ODMR$WF_JOB_ARGS_FK;

DROP TABLE ODMR$DEFAULT_STOPLISTS CASCADE CONSTRAINTS;

DROP TABLE ODMR$DEBUG_LOG CASCADE CONSTRAINTS;

DROP TABLE ODMR$WORKFLOW_JOBS CASCADE CONSTRAINTS;

DROP TABLE ODMR$WORKFLOWS CASCADE CONSTRAINTS;

DROP TABLE ODMR$WF_LOG CASCADE CONSTRAINTS;

DROP TABLE ODMR$WF_JOB_ARGS CASCADE CONSTRAINTS;

DROP TABLE ODMR$REPOSITORY_PROPERTIES CASCADE CONSTRAINTS;

DROP TABLE ODMR$PROJECTS CASCADE CONSTRAINTS;

DROP SEQUENCE ODMR$WORKFLOW_OBJECT_NAME_SEQ;

DROP SEQUENCE ODMR$WORKFLOW_ID_SEQ;

DROP SEQUENCE ODMR$PROJECT_ID_SEQ;

DROP SEQUENCE ODMR$LOG_ID_SEQ;
