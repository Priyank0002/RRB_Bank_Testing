CREATE OR REPLACE VIEW ODMR_USER_WORKFLOW_NODES
AS
SELECT x.workflow_name "WF_NAME", x.workflow_id "WF_ID", xtab.nodeType "TYPE", xtab.nodeId "ID", xtab.nodeName "NAME", xtab.nodeStatus "STATUS"
  FROM ODMR$WORKFLOWS x, ODMR$PROJECTS p,
       XMLTable('for $i in //Nodes/*
                 return $i'
                PASSING x.WORKFLOW_DATA
                COLUMNS nodeType  VARCHAR2(30) PATH 'name()',
                        nodeId    NUMBER  PATH '@Id',
                        nodeName  VARCHAR2(30)  PATH '@Name',
                        nodeStatus VARCHAR2(10)  PATH '@Status') xtab
WHERE
    p.USER_NAME = SYS_CONTEXT('USERENV', 'SESSION_USER') AND p.PROJECT_ID = x.PROJECT_ID (+);

CREATE OR REPLACE VIEW ODMR_USER_WORKFLOW_MODELS
AS
SELECT x.workflow_name "WF_NAME", x.workflow_id "WF_ID", xtab.modelType "TYPE", xtab.modelId "ID", xtab.modelName "NAME", xtab.modelStatus "STATUS"
  FROM ODMR$WORKFLOWS x, ODMR$PROJECTS p,
       XMLTable('for $i in //Nodes/*/Models/*
                 return $i'
                PASSING x.WORKFLOW_DATA
                COLUMNS modelType  VARCHAR2(30) PATH 'name()',
                        modelId    NUMBER  PATH '@Id',
                        modelName  VARCHAR2(30)  PATH '@Name',
                        modelStatus VARCHAR2(10)  PATH '@Status') xtab
WHERE
    p.USER_NAME = SYS_CONTEXT('USERENV', 'SESSION_USER') AND p.PROJECT_ID = x.PROJECT_ID (+);

GRANT SELECT ON ODMR_USER_WORKFLOW_NODES TO PUBLIC;
/
CREATE OR REPLACE PUBLIC SYNONYM ODMR_USER_WORKFLOW_NODES FOR ODMR_USER_WORKFLOW_NODES;
/
GRANT SELECT ON ODMR_USER_WORKFLOW_MODELS TO PUBLIC;
/
CREATE OR REPLACE PUBLIC SYNONYM ODMR_USER_WORKFLOW_MODELS FOR ODMR_USER_WORKFLOW_MODELS;
/
