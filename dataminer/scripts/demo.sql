DECLARE"
  v_projectId   NUMBER(30);
  v_workflowId  NUMBER(30);
  v_jobId       VARCHAR2(30);
  v_timestamp   TIMESTAMP;
  v_mode        CHAR(1) := 'R';
  v_force       CHAR(1) := 'N';
  v_xml1        CLOB;
  v_xml2        CLOB;
  v_xml3        CLOB;
  v_xml4        CLOB;
  v_xml5        CLOB;
BEGIN
  FOR projects IN (
    SELECT PROJECT_ID FROM ODMR_USER_PROJECT_WORKFLOW )
  LOOP
    ODMR_PROJECT.PROJECT_DELETE(projects.PROJECT_ID);
    DBMS_OUTPUT.PUT_LINE('PROJECT_DELETE: '||projects.PROJECT_ID);
  END LOOP;
    
  v_projectId := ODMR_PROJECT.PROJECT_CREATE('project1', 'project comment');
  DBMS_OUTPUT.PUT_LINE('PROJECT_CREATE: '||v_projectId);

  v_projectId := ODMR_PROJECT.PROJECT_CREATE('project2', 'project comment');
  DBMS_OUTPUT.PUT_LINE('PROJECT_CREATE: '||v_projectId);

  v_workflowId := ODMR_WORKFLOW.WF_CREATE(v_projectId, 'workflow1', 'workflow comment', v_timestamp);
  DBMS_OUTPUT.PUT_LINE('WF_CREATE: '||v_workflowId);

v_xml1:= '
<WorkflowProcess xsi:schemaLocation="http://xmlns.oracle.com/odmr11 http://xmlns.oracle.com/odmr11/odmr.xsd"
                 xmlns="http://xmlns.oracle.com/odmr11"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <Nodes>
    <DataSource Status="Ready" Id="1" Name="Customers">
      <Icon XCOORD="0" YCOORD="0"/>
      <Attributes>
        <Attribute Status="Valid" DataType="NUMBER" Name="CUST_ID"/>
        <Attribute Status="Valid" DataType="VARCHAR2" Name="CUST_FIRST_NAME"/>
        <Attribute Status="Valid" DataType="VARCHAR2" Name="CUST_LAST_NAME"/>
        <Attribute Status="Valid" DataType="CHAR" Name="CUST_GENDER"/>
        <Attribute Status="Valid" DataType="NUMBER" Name="CUST_YEAR_OF_BIRTH"/>
        <Attribute Status="Valid" DataType="VARCHAR2"
                   Name="CUST_MARITAL_STATUS"/>
        <Attribute Status="Valid" DataType="VARCHAR2"
                   Name="CUST_STREET_ADDRESS"/>
        <Attribute Status="Valid" DataType="VARCHAR2" Name="CUST_POSTAL_CODE"/>
        <Attribute Status="Valid" DataType="VARCHAR2" Name="CUST_CITY"/>
        <Attribute Status="Valid" DataType="NUMBER" Name="CUST_CITY_ID"/>
        <Attribute Status="Valid" DataType="VARCHAR2"
                   Name="CUST_STATE_PROVINCE"/>
        <Attribute Status="Valid" DataType="NUMBER"
                   Name="CUST_STATE_PROVINCE_ID"/>
        <Attribute Status="Valid" DataType="NUMBER" Name="COUNTRY_ID"/>
        <Attribute Status="Valid" DataType="VARCHAR2"
                   Name="CUST_MAIN_PHONE_NUMBER"/>
        <Attribute Status="Valid" DataType="VARCHAR2" Name="CUST_INCOME_LEVEL"/>
        <Attribute Status="Valid" DataType="NUMBER" Name="CUST_CREDIT_LIMIT"/>
        <Attribute Status="Valid" DataType="VARCHAR2" Name="CUST_EMAIL"/>
        <Attribute Status="Valid" DataType="VARCHAR2" Name="CUST_TOTAL"/>
        <Attribute Status="Valid" DataType="NUMBER" Name="CUST_TOTAL_ID"/>
        <Attribute Status="Valid" DataType="NUMBER" Name="CUST_SRC_ID"/>
        <Attribute Status="Valid" DataType="DATE" Name="CUST_EFF_FROM"/>
        <Attribute Status="Valid" DataType="DATE" Name="CUST_EFF_TO"/>
        <Attribute Status="Valid" DataType="VARCHAR2" Name="CUST_VALID"/>
      </Attributes>
      <CacheSettings>
        <NumberOfRows>2000</NumberOfRows>
        <Method>
          <Random Seed="12345"/>
        </Method>
      </CacheSettings>
      <SQLExpression>SELECT CUST_ID, CUST_FIRST_NAME, CUST_LAST_NAME, CUST_GENDER, CUST_YEAR_OF_BIRTH, CUST_MARITAL_STATUS, CUST_STREET_ADDRESS, CUST_POSTAL_CODE, CUST_CITY, CUST_CITY_ID, CUST_STATE_PROVINCE, CUST_STATE_PROVINCE_ID, COUNTRY_ID, CUST_MAIN_PHONE_NUMBER, CUST_INCOME_LEVEL, CUST_CREDIT_LIMIT, CUST_EMAIL, CUST_TOTAL, CUST_TOTAL_ID, CUST_SRC_ID, CUST_EFF_FROM, CUST_EFF_TO, CUST_VALID FROM SH.CUSTOMERS</SQLExpression>
      <SourceTable Name="CUSTOMERS" Schema="SH"/>
    </DataSource>';

v_xml2:= '
    <DataSource Status="Ready" Id="10" Name="Customers2">
      <Icon XCOORD="0" YCOORD="0"/>
      <Attributes>
        <Attribute Status="Valid" DataType="NUMBER" Name="CUST_ID"/>
        <Attribute Status="Valid" DataType="VARCHAR2" Name="CUST_FIRST_NAME"/>
        <Attribute Status="Valid" DataType="VARCHAR2" Name="CUST_LAST_NAME"/>
        <Attribute Status="Valid" DataType="CHAR" Name="CUST_GENDER"/>
        <Attribute Status="Valid" DataType="NUMBER" Name="CUST_YEAR_OF_BIRTH"/>
        <Attribute Status="Valid" DataType="VARCHAR2"
                   Name="CUST_MARITAL_STATUS"/>
        <Attribute Status="Valid" DataType="VARCHAR2"
                   Name="CUST_STREET_ADDRESS"/>
        <Attribute Status="Valid" DataType="VARCHAR2" Name="CUST_POSTAL_CODE"/>
        <Attribute Status="Valid" DataType="VARCHAR2" Name="CUST_CITY"/>
        <Attribute Status="Valid" DataType="NUMBER" Name="CUST_CITY_ID"/>
        <Attribute Status="Valid" DataType="VARCHAR2"
                   Name="CUST_STATE_PROVINCE"/>
        <Attribute Status="Valid" DataType="NUMBER"
                   Name="CUST_STATE_PROVINCE_ID"/>
        <Attribute Status="Valid" DataType="NUMBER" Name="COUNTRY_ID"/>
        <Attribute Status="Valid" DataType="VARCHAR2"
                   Name="CUST_MAIN_PHONE_NUMBER"/>
        <Attribute Status="Valid" DataType="VARCHAR2" Name="CUST_INCOME_LEVEL"/>
        <Attribute Status="Valid" DataType="NUMBER" Name="CUST_CREDIT_LIMIT"/>
        <Attribute Status="Valid" DataType="VARCHAR2" Name="CUST_EMAIL"/>
        <Attribute Status="Valid" DataType="VARCHAR2" Name="CUST_TOTAL"/>
        <Attribute Status="Valid" DataType="NUMBER" Name="CUST_TOTAL_ID"/>
        <Attribute Status="Valid" DataType="NUMBER" Name="CUST_SRC_ID"/>
        <Attribute Status="Valid" DataType="DATE" Name="CUST_EFF_FROM"/>
        <Attribute Status="Valid" DataType="DATE" Name="CUST_EFF_TO"/>
        <Attribute Status="Valid" DataType="VARCHAR2" Name="CUST_VALID"/>
      </Attributes>
      <CacheSettings>
        <NumberOfRows>2000</NumberOfRows>
        <Method>
          <Random Seed="12345"/>
        </Method>
      </CacheSettings>
      <SQLExpression>SELECT CUST_ID, CUST_FIRST_NAME, CUST_LAST_NAME, CUST_GENDER, CUST_YEAR_OF_BIRTH, CUST_MARITAL_STATUS, CUST_STREET_ADDRESS, CUST_POSTAL_CODE, CUST_CITY, CUST_CITY_ID, CUST_STATE_PROVINCE, CUST_STATE_PROVINCE_ID, COUNTRY_ID, CUST_MAIN_PHONE_NUMBER, CUST_INCOME_LEVEL, CUST_CREDIT_LIMIT, CUST_EMAIL, CUST_TOTAL, CUST_TOTAL_ID, CUST_SRC_ID, CUST_EFF_FROM, CUST_EFF_TO, CUST_VALID FROM SH.CUSTOMERS</SQLExpression>
      <SourceTable Name="CUSTOMERS" Schema="SH"/>
    </DataSource>';

v_xml3:= '
    <ClassificationBuild Status="Ready" Id="2" Name="Model Build">
      <Icon XCOORD="0" YCOORD="0"/>
      <BuildDataSource SourceId="1"/>
      <CaseAttributes>
        <Attribute Status="Valid" DataType="NUMBER" Name="CUST_ID"/>
      </CaseAttributes>
      <MiningAttributes>
        <MiningAttribute Status="Valid" DataType="NUMBER" AutoPrep="Yes"
                         Name="CUST_ID"/>
        <MiningAttribute Status="Valid" DataType="VARCHAR2" AutoPrep="Yes"
                         Name="CUST_FIRST_NAME"/>
        <MiningAttribute Status="Valid" DataType="VARCHAR2" AutoPrep="Yes"
                         Name="CUST_LAST_NAME"/>
        <MiningAttribute Status="Valid" DataType="CHAR" AutoPrep="Yes"
                         Name="CUST_GENDER"/>
        <MiningAttribute Status="Valid" DataType="NUMBER" AutoPrep="Yes"
                         Name="CUST_YEAR_OF_BIRTH"/>
        <MiningAttribute Status="Valid" DataType="VARCHAR2" AutoPrep="Yes"
                         Name="CUST_MARITAL_STATUS"/>
        <MiningAttribute Status="Valid" DataType="VARCHAR2" AutoPrep="Yes"
                         Name="CUST_STREET_ADDRESS"/>
        <MiningAttribute Status="Valid" DataType="VARCHAR2" AutoPrep="Yes"
                         Name="CUST_POSTAL_CODE"/>
        <MiningAttribute Status="Valid" DataType="VARCHAR2" AutoPrep="Yes"
                         Name="CUST_CITY"/>
        <MiningAttribute Status="Valid" DataType="NUMBER" AutoPrep="Yes"
                         Name="CUST_CITY_ID"/>
        <MiningAttribute Status="Valid" DataType="VARCHAR2" AutoPrep="Yes"
                         Name="CUST_STATE_PROVINCE"/>
        <MiningAttribute Status="Valid" DataType="NUMBER" AutoPrep="Yes"
                         Name="CUST_STATE_PROVINCE_ID"/>
        <MiningAttribute Status="Valid" DataType="NUMBER" AutoPrep="Yes"
                         Name="COUNTRY_ID"/>
        <MiningAttribute Status="Valid" DataType="VARCHAR2" AutoPrep="Yes"
                         Name="CUST_MAIN_PHONE_NUMBER"/>
        <MiningAttribute Status="Valid" DataType="VARCHAR2" AutoPrep="Yes"
                         Name="CUST_INCOME_LEVEL"/>
        <MiningAttribute Status="Valid" DataType="NUMBER" AutoPrep="Yes"
                         Name="CUST_CREDIT_LIMIT"/>
        <MiningAttribute Status="Valid" DataType="VARCHAR2" AutoPrep="Yes"
                         Name="CUST_EMAIL"/>
        <MiningAttribute Status="Valid" DataType="VARCHAR2" AutoPrep="Yes"
                         Name="CUST_TOTAL"/>
        <MiningAttribute Status="Valid" DataType="NUMBER" AutoPrep="Yes"
                         Name="CUST_TOTAL_ID"/>
        <MiningAttribute Status="Valid" DataType="NUMBER" AutoPrep="Yes"
                         Name="CUST_SRC_ID"/>
        <MiningAttribute Status="Valid" DataType="DATE" AutoPrep="Yes"
                         Name="CUST_EFF_FROM"/>
        <MiningAttribute Status="Valid" DataType="DATE" AutoPrep="Yes"
                         Name="CUST_EFF_TO"/>
        <MiningAttribute Status="Valid" DataType="VARCHAR2" AutoPrep="Yes"
                         Name="CUST_VALID"/>
      </MiningAttributes>
      <TestDataSource>
        <SplitData TestPercent="50"/>
      </TestDataSource>
      <TargetAttribute Status="Valid" DataType="CHAR" Name="CUST_GENDER"/>
      <CostBenefit>
        <None/>
      </CostBenefit>
      <Models>
        <DecisionTreeModel Status="Not Built" Id="4" Name="CL_DT_1">
          <InputMiningData Type="AUTO"/>
          <Performance>
            <Balanced/>
          </Performance>
          <DecisionTreeAlgo>
            <TREE_IMPURITY_METRIC>TREE_IMPURITY_GINI</TREE_IMPURITY_METRIC>
            <TREE_TERM_MAX_DEPTH>7</TREE_TERM_MAX_DEPTH>
            <TREE_TERM_MINPCT_NODE>.05</TREE_TERM_MINPCT_NODE>
            <TREE_TERM_MINPCT_SPLIT>.1</TREE_TERM_MINPCT_SPLIT>
            <TREE_TERM_MINREC_NODE>10</TREE_TERM_MINREC_NODE>
            <TREE_TERM_MINREC_SPLIT>20</TREE_TERM_MINREC_SPLIT>
          </DecisionTreeAlgo>
        </DecisionTreeModel>
      </Models>
    </ClassificationBuild>';

v_xml4:= '
    <Apply Status="Ready" Id="7" Name="Class Apply">
      <Icon XCOORD="0" YCOORD="0"/>
      <CacheSettings>
        <NumberOfRows>2000</NumberOfRows>
        <Method>
          <TopN/>
        </Method>
      </CacheSettings>
      <SQLExpression>SELECT it.CUST_ID, it.CUST_GENDER, s.* FROM {INPUT_SOURCE} it, TABLE(PREDICTION_SET (CL_DT_1, 1 using it.*)) s</SQLExpression>
      <SupplementalAttributes>
        <Attribute Status="Valid" DataType="NUMBER" Name="CUST_ID"/>
        <Attribute Status="Valid" DataType="CHAR" Name="CUST_GENDER"/>
      </SupplementalAttributes>
      <ApplySettings>
        <ClassificationApplySetting>
          <RefModel Schema="DMUSER" Name="CL_DT_1" MiningAlgorithm="DECISION_TREE" Target="CUST_GENDER" Status="Complete" RefNodeId="2" RefModelId="4"/>
          <CostOption>
            <Model/>
          </CostOption>
          <PredictOption>
            <BestPredictions>
              <TopN Value="1"/>
              <OutputColumn Name="Pred" Type="PREDICTION"/>
              <OutputColumn Name="Prob" Type="PROBABILITY"/>
            </BestPredictions>
          </PredictOption>
        </ClassificationApplySetting>
      </ApplySettings>
    </Apply>
  </Nodes>';
  
v_xml5:= '
  <Links>
    <Link Id="20" From="1" To="2">
      <ConnectorGraphicsInfo>
        <Coordinates XCoordinate="0" YCoordinate="0"/>
        <Coordinates XCoordinate="0" YCoordinate="0"/>
      </ConnectorGraphicsInfo>
    </Link>
    <Link Id="21" From="2" To="7">
      <ConnectorGraphicsInfo>
        <Coordinates XCoordinate="0" YCoordinate="0"/>
        <Coordinates XCoordinate="0" YCoordinate="0"/>
      </ConnectorGraphicsInfo>
    </Link>
    <Link Id="22" From="10" To="7">
      <ConnectorGraphicsInfo>
        <Coordinates XCoordinate="0" YCoordinate="0"/>
        <Coordinates XCoordinate="0" YCoordinate="0"/>
      </ConnectorGraphicsInfo>
    </Link>
  </Links>
</WorkflowProcess>';
  ODMR_WORKFLOW.WF_SAVE(v_workflowId, XMLType(v_xml1||v_xml2||v_xml3||v_xml4||v_xml5), v_timestamp, v_mode, v_force);
  DBMS_OUTPUT.PUT_LINE('WF_SAVE: '||v_workflowId);

  v_jobId := ODMR_WORKFLOW.WF_RUN(v_workflowId, 7, ODMR_WORKFLOW.RERUN_MODE);
  DBMS_OUTPUT.PUT_LINE('WF_RUN: '||v_jobId);
END;
