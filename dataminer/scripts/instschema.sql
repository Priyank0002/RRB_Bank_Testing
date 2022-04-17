ALTER USER ODMRSYS QUOTA UNLIMITED on DMUSER;
/

ALTER session set current_schema = "ODMRSYS";
BEGIN
  DBMS_XMLSCHEMA.DELETESCHEMA('http://xmlns.oracle.com/odmr11/odmr.xsd', DBMS_XMLSCHEMA.DELETE_CASCADE_FORCE);
EXCEPTION WHEN OTHERS THEN
  NULL;
END;
/

ALTER session set current_schema = "SYS";
/
DECLARE
  -- Declare a CLOB variable
  schema1 CLOB;
  schema2 CLOB;
  schema3 CLOB;
  schema4 CLOB;
BEGIN

schema1 := '<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns="http://xmlns.oracle.com/odmr11"
           xmlns:xs="http://www.w3.org/2001/XMLSchema"
           xmlns:xdb="http://xmlns.oracle.com/xdb"
           targetNamespace="http://xmlns.oracle.com/odmr11"
           elementFormDefault="qualified" attributeFormDefault="unqualified"
           version="11.2.0.1.0" xdb:storeVarrayAsTable="true">
 <xs:element name="WorkflowProcess">
  <xs:complexType xdb:maintainDOM="true">
   <xs:sequence>
    <xs:element name="Nodes" minOccurs="0">
     <xs:complexType xdb:maintainDOM="true">
      <xs:sequence>
       <xs:element ref="DataSource" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="DataSink" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="DataProfile" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="CreateTable" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="UpdateTable" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="DataRecord" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="Transform" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="Aggregation" minOccurs="0" maxOccurs="unbounded"/>
       <!-- Transformation Start -->
       <xs:element ref="Transformation" minOccurs="0" maxOccurs="unbounded"/>
       <!-- Transformation End -->
       <xs:element ref="Join" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="Text" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="Split" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="Sample" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="ColumnFilter" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="RowFilter" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="Reference" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="ClassificationBuild" minOccurs="0"
                   maxOccurs="unbounded"/>
       <xs:element ref="RegressionBuild" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="ClusteringBuild" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="AssociationBuild" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="FeatureExtractionBuild" minOccurs="0"
                   maxOccurs="unbounded"/>
       <xs:element ref="AnomalyDetectionBuild" minOccurs="0"
                   maxOccurs="unbounded"/>
       <xs:element ref="Model" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="Apply" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="Test" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="Compare" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="Monitor" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="ModelDetails" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="TestDetails" minOccurs="0" maxOccurs="unbounded"/>
       <xs:element ref="FilterDetails" minOccurs="0" maxOccurs="unbounded"/>
      </xs:sequence>
     </xs:complexType>
    </xs:element>
    <xs:element name="Links" minOccurs="0">
     <xs:complexType xdb:maintainDOM="true">
      <xs:sequence>
       <xs:element ref="Link" maxOccurs="unbounded" minOccurs="0"/>
      </xs:sequence>
     </xs:complexType>
    </xs:element>
    <xs:element minOccurs="0" ref="Messages"/>
    <xs:element name="Comment" minOccurs="0" type="xs:string"/>
   </xs:sequence>
   <xs:attribute name="Version" type="xs:string" use="required"/>
  </xs:complexType>
 </xs:element>
 <!-- Transformation Start -->
 <xs:element name="Transformation" type="TransformationNodeType"
             xdb:defaultTable=""/>
 <!-- Transformation End -->
 <xs:element name="Aggregation" type="AggregationNodeType" xdb:defaultTable=""/>
 <xs:element name="AnomalyDetectionBuild" type="AnomalyDetectionBuildNodeType"
             xdb:defaultTable=""/>
 <xs:element name="Apply" type="ApplyNodeType" xdb:defaultTable=""/>
 <xs:element name="AssociationBuild" type="AssociationBuildNodeType"
             xdb:defaultTable=""/>
 <xs:element name="Attribute" type="AttributeType" xdb:defaultTable=""/>
 <xs:element name="Attributes" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:sequence>
    <xs:element ref="Attribute" maxOccurs="unbounded" minOccurs="0"/>
   </xs:sequence>
  </xs:complexType>
 </xs:element>
 <!--Agg.Node start-->
 <xs:complexType name="GroupingElementType" xdb:maintainDOM="true">
  <xs:choice>
   <xs:element ref="Attributes"/>
   <xs:element name="Expression" type="xs:string"/>
  </xs:choice>
 </xs:complexType>
 <xs:complexType name="AggregationElementType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="Source" type="GroupingElementType" minOccurs="1"/>
   <xs:element name="Output" type="AttributeType" minOccurs="1"/>
   <xs:element name="AggregationFunction" type="xs:string" minOccurs="0"/>
   <xs:element name="SubGroupBy" type="GroupingElementType" minOccurs="0"/>
  </xs:sequence>
 </xs:complexType>
 <xs:element name="AggregationElement" type="AggregationElementType"
             xdb:defaultTable=""/>
 <xs:element name="AggregationElements" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:sequence>
    <xs:element ref="AggregationElement" maxOccurs="unbounded" minOccurs="0"/>
   </xs:sequence>
  </xs:complexType>
 </xs:element>
 <!--Agg.Node end-->
 <xs:element name="DBAttribute" type="DBColumnType" xdb:defaultTable=""/>
 <xs:element name="DBAttributes" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:sequence>
    <xs:element ref="DBAttribute" maxOccurs="unbounded" minOccurs="0"/>
   </xs:sequence>
  </xs:complexType>
 </xs:element>
 <xs:element name="BuildDataSource" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:attribute name="SourceId" use="required" type="xs:string"/>
  </xs:complexType>
 </xs:element>
 <xs:element name="SampleSettings" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:sequence minOccurs="0">
    <xs:choice>
     <xs:element name="NumberOfRows" default="2000">
      <xs:simpleType>
       <xs:restriction base="xs:long">
        <xs:minInclusive value="1"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:element>
     <xs:element name="PercentOfTotal" default="10">
      <xs:simpleType>
       <xs:restriction base="xs:double">
        <xs:maxInclusive value="100"/>
        <xs:minInclusive value="1"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:element>
    </xs:choice>
    <xs:element name="Method">
     <xs:complexType xdb:maintainDOM="true">
      <xs:choice>
       <xs:element name="Random">
        <xs:complexType xdb:maintainDOM="true">
         <xs:attribute name="Seed" type="xs:integer" use="required"/>
        </xs:complexType>
       </xs:element>
       <xs:element name="Stratified">
        <xs:complexType xdb:maintainDOM="true">
         <xs:attribute name="TargetAttr" use="required">
          <xs:simpleType>
           <xs:restriction base="xs:string">
            <xs:minLength value="1"/>
            <xs:maxLength value="30"/>
           </xs:restriction>
          </xs:simpleType>
         </xs:attribute>
        </xs:complexType>
       </xs:element>
       <xs:element name="TopN">
        <xs:complexType xdb:maintainDOM="true"/>
       </xs:element>
      </xs:choice>
     </xs:complexType>
    </xs:element>
    <xs:element ref="OutputTable" minOccurs="0"/>
   </xs:sequence>
   <xs:attribute name="UseFullData" type="xs:boolean" use="required"/>
   <xs:attribute name="GenerateCache" type="xs:boolean" use="optional"
                 default="true"/>
  </xs:complexType>
 </xs:element>
 <xs:element name="CacheSettings" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:sequence minOccurs="0">
    <xs:choice>
     <xs:element name="NumberOfRows" default="2000">
      <xs:simpleType>
       <xs:restriction base="xs:long">
        <xs:minInclusive value="1"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:element>
     <xs:element name="PercentOfTotal" default="10">
      <xs:simpleType>
       <xs:restriction base="xs:double">
        <xs:maxInclusive value="100"/>
        <xs:minInclusive value="1"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:element>
    </xs:choice>
    <xs:element name="Method">
     <xs:complexType xdb:maintainDOM="true">
      <xs:choice>
       <xs:element name="Random">
        <xs:complexType xdb:maintainDOM="true">
         <xs:attribute name="Seed" type="xs:integer" use="required"/>
        </xs:complexType>
       </xs:element>
       <xs:element name="Stratified">
        <xs:complexType xdb:maintainDOM="true">
         <xs:attribute name="TargetAttr" use="required">
          <xs:simpleType>
           <xs:restriction base="xs:string">
            <xs:minLength value="1"/>
            <xs:maxLength value="30"/>
           </xs:restriction>
          </xs:simpleType>
         </xs:attribute>
        </xs:complexType>
       </xs:element>
       <xs:element name="TopN">
        <xs:complexType xdb:maintainDOM="true"/>
       </xs:element>
      </xs:choice>
     </xs:complexType>
    </xs:element>
    <xs:element ref="OutputTable" minOccurs="0"/>
   </xs:sequence>
   <xs:attribute name="UseFullData" type="xs:boolean" use="optional"
                 default="false"/>
   <xs:attribute name="GenerateCache" type="xs:boolean" use="required"/>
  </xs:complexType>
 </xs:element>
 <xs:element name="CaseAttributes" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:sequence>
    <xs:element ref="Attribute" maxOccurs="unbounded" minOccurs="0"/>
   </xs:sequence>
  </xs:complexType>
 </xs:element>
 <xs:element name="CGeneralizedLinearAlgo" type="CGeneralizedLinearAlgoType"
             xdb:defaultTable=""/>
 <xs:element name="CGeneralizedLinearModel" type="CGeneralizedLinearModelType"
             xdb:defaultTable=""/>
 <xs:element name="ClassificationBuild" type="ClassificationBuildNodeType"
             xdb:defaultTable=""/>
 <xs:element name="ClassificationResult" type="ClassificationResultType"
             xdb:defaultTable=""/>
 <xs:element name="ClusteringBuild" type="ClusteringBuildNodeType"
             xdb:defaultTable=""/>
 <xs:element name="ColumnFilter" type="ColumnFilterNodeType"
             xdb:defaultTable=""/>
 <xs:element name="Compare" type="CompareNodeType" xdb:defaultTable=""/>
 <xs:element name="ConfusionMatrix" type="ResultType" xdb:defaultTable=""/>
 <xs:element name="ConnectorGraphicsInfo" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:sequence>
    <xs:element ref="Coordinates" minOccurs="0" maxOccurs="unbounded"/>
   </xs:sequence>
   <xs:attribute name="Style" type="xs:string" use="optional"/>
   <xs:attribute name="BorderColor" type="xs:string" use="optional"/>
   <xs:attribute name="FillColor" type="xs:string" use="optional"/>
  </xs:complexType>
 </xs:element>
 <xs:element name="Coordinates" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:attribute name="XCoordinate" type="xs:double" use="required"/>
   <xs:attribute name="YCoordinate" type="xs:double" use="required"/>
  </xs:complexType>
 </xs:element>
 <xs:element name="CostMatrix" type="CostMatrixType" xdb:defaultTable=""/>
 <xs:element name="CSupportVectorMachineModel"
             type="CSupportVectorMachineModelType" xdb:defaultTable=""/>
 <xs:element name="CSupportVectorMachineAlgo"
             type="CSupportVectorMachineAlgoType" xdb:defaultTable=""/>
 <xs:element name="DataProfile" type="DataProfileNodeType" xdb:defaultTable=""/>
 <xs:element name="CreateTable" type="CreateTableNodeType" xdb:defaultTable=""/>
 <xs:element name="DataRecord" type="DataRecordNodeType" xdb:defaultTable=""/>
 <xs:element name="DataSink" type="DataSinkNodeType" xdb:defaultTable=""/>
 <xs:element name="DataSource" type="DataSourceNodeType" xdb:defaultTable=""/>
 <xs:element name="DecisionTreeAlgo" type="DecisionTreeAlgoType"
             xdb:defaultTable=""/>
 <xs:element name="DecisionTreeModel" type="DecisionTreeModelType"
             xdb:defaultTable=""/>
 <xs:element name="FeatureExtractionBuild" type="FeatureExtractionBuildNodeType"
             xdb:defaultTable=""/>
 <xs:element name="FilterDetails" type="FilterDetailsDataNodeType"
             xdb:defaultTable=""/>
 <xs:element name="Icon" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:simpleContent>
    <xs:extension base="xs:string">
     <xs:attribute name="XCOORD" type="xs:integer" use="required"/>
     <xs:attribute name="YCOORD" type="xs:integer" use="required"/>
     <xs:attribute name="WIDTH" type="xs:integer" use="optional"/>
     <xs:attribute name="HEIGHT" type="xs:integer" use="optional"/>
     <xs:attribute name="BorderColor" type="xs:string" use="optional"/>
     <xs:attribute name="FillColor" type="xs:string" use="optional"/>
     <xs:attribute name="SHAPE" use="optional" default="RoundRectangle">
      <xs:simpleType>
       <xs:restriction base="xs:NMTOKEN">
        <xs:enumeration value="RoundRectangle"/>
        <xs:enumeration value="Rectangle"/>
        <xs:enumeration value="Ellipse"/>
        <xs:enumeration value="Diamond"/>
        <xs:enumeration value="Ellipse"/>
        <xs:enumeration value="UpTriangle"/>
        <xs:enumeration value="DownTriangle"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
    </xs:extension>
   </xs:simpleContent>
  </xs:complexType>
 </xs:element>
 <xs:element name="InputMiningData" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:sequence>
    <xs:element ref="MiningAttributes" minOccurs="1"/>
   </xs:sequence>
   <xs:attribute name="DataUsage" use="required" type="InputMiningDataType"/>
   <xs:attribute name="MiningUsage" type="InputMiningDataType" use="required"/>
  </xs:complexType>
 </xs:element>
 <xs:element name="Join" type="JoinNodeType" xdb:defaultTable=""/>
 <xs:element name="Lifts" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:sequence>
    <xs:element name="Lift" type="TargetResultType" minOccurs="0"
                maxOccurs="unbounded"/>
   </xs:sequence>
  </xs:complexType>
 </xs:element>
 <xs:element name="Link" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:sequence>
    <xs:element ref="ConnectorGraphicsInfo"/>
   </xs:sequence>
   <xs:attribute name="Id" type="xs:string" use="required"/>
   <xs:attribute name="From" type="xs:string" use="required"/>
   <xs:attribute name="To" type="xs:string" use="required"/>
   <xs:attribute name="Name" use="required">
    <xs:simpleType>
     <xs:restriction base="xs:string">
      <xs:minLength value="1"/>
      <xs:maxLength value="30"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:attribute>
   <xs:attribute name="Label" type="xs:string"/>
  </xs:complexType>
 </xs:element>
 <xs:element name="Messages" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:sequence>
    <xs:element name="Message" maxOccurs="unbounded" type="MessageType"
                minOccurs="0"/>
   </xs:sequence>
  </xs:complexType>
 </xs:element>
 <xs:element name="MiningAttribute" type="MiningAttributeType"
             xdb:defaultTable=""/>
 <xs:element name="MiningAttributes" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:sequence>
    <xs:element ref="MiningAttribute" maxOccurs="unbounded" minOccurs="0"/>
   </xs:sequence>
  </xs:complexType>
 </xs:element>
 <xs:element name="Model" type="ModelNodeType" xdb:defaultTable=""/>
 <xs:element name="ModelDetails" type="ModelDetailsDataNodeType"
             xdb:defaultTable=""/>
 <xs:element name="ModelSettingsODM" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:sequence>
    <xs:element name="ModelSettingODM" maxOccurs="unbounded"
                type="ModelSettingODMType" minOccurs="0"/>
   </xs:sequence>
  </xs:complexType>
 </xs:element>
 <xs:element name="Monitor" type="MonitorNodeType" xdb:defaultTable=""/>
 <xs:element name="NaiveBayesAlgo" type="NaiveBayesAlgoType"
             xdb:defaultTable=""/>
 <xs:element name="NaiveBayesModel" type="NaiveBayesModelType"
             xdb:defaultTable=""/>
 <xs:element name="OutputTable" type="ResultType" xdb:defaultTable=""/>
 <xs:element name="Reference" type="ReferenceNodeType" xdb:defaultTable=""/>
 <xs:element name="RegressionBuild" type="RegressionBuildNodeType"
             xdb:defaultTable=""/>
 <xs:element name="RegressionResult" type="RegressionResultType"/>
 <xs:element name="ResidualPlot" type="ResultType" xdb:defaultTable=""/>
 <xs:element name="RGeneralizedLinearModel" type="RGeneralizedLinearModelType"
             xdb:defaultTable=""/>
 <xs:element name="RGeneralizedLinearModelAlgo"
             type="RGeneralizedLinearAlgoType" xdb:defaultTable=""/>
 <xs:element name="ROCs" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:sequence>
    <xs:element name="ROC" type="TargetResultType" minOccurs="0" maxOccurs="2"/>
    <xs:element name="AreaUnderCurve" maxOccurs="2" minOccurs="0">
     <xs:complexType xdb:maintainDOM="true">
      <xs:attribute name="Area" use="required" type="xs:double"/>
      <xs:attribute name="TargetValue" use="required"/>
     </xs:complexType>
    </xs:element>
   </xs:sequence>
  </xs:complexType>
 </xs:element>
 <xs:element name="RowFilter" type="RowFilterNodeType" xdb:defaultTable=""/>
 <xs:element name="RSupportVectorMachineAlgo"
             type="RSupportVectorMachineAlgoType" xdb:defaultTable=""/>
 <xs:element name="RSupportVectorMachineModel"
             type="RSupportVectorMachineModelType" xdb:defaultTable=""/>
 <xs:element name="Sample" type="SampleNodeType" xdb:defaultTable=""/>
 <xs:element name="SourceTable" type="TableType" xdb:defaultTable=""/>
 <xs:element name="Split" type="SplitNodeType" xdb:defaultTable=""/>
 <xs:element name="SQLExpression" type="xs:string" xdb:SQLType="CLOB"/>
 <xs:element name="TargetAttribute" type="AttributeType" xdb:defaultTable=""/>
 <xs:element name="TargetValues" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:choice>
    <xs:element name="TargetValueString" maxOccurs="unbounded"
                type="TargetValueStringType" minOccurs="0"/>
    <xs:element name="TargetValueNumber" maxOccurs="unbounded"
                type="TargetValueNumberType" minOccurs="0"/>
   </xs:choice>
  </xs:complexType>
 </xs:element>
 <xs:element name="Test" type="TestNodeType" xdb:defaultTable=""/>
 <xs:element name="TestDataSource" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:choice>
    <xs:element name="SplitData">
     <xs:complexType xdb:maintainDOM="true">
      <xs:attribute name="TestPercent" use="required">
       <xs:simpleType>
        <xs:restriction base="xs:double">
         <xs:minExclusive value="0"/>
         <xs:maxExclusive value="100"/>
        </xs:restriction>
       </xs:simpleType>
      </xs:attribute>
     </xs:complexType>
    </xs:element>
    <xs:element name="BuildData"/>
    <xs:element name="TestData">
     <xs:complexType xdb:maintainDOM="true">
      <xs:attribute name="SourceId" use="required" type="xs:string"/>
     </xs:complexType>
    </xs:element>
    <xs:element name="None"/>
   </xs:choice>
  </xs:complexType>
 </xs:element>
 <xs:element name="TestDetails" type="TestDetailsDataNodeType"
             xdb:defaultTable=""/>
 <xs:element name="TestMetrics" type="ResultType" xdb:defaultTable=""/>
 <xs:element name="Text" type="TextNodeType" xdb:defaultTable=""/>
 <xs:element name="Transform" type="TransformNodeType" xdb:defaultTable=""/>
 <xs:element name="UpdateTable" type="UpdateTableNodeType" xdb:defaultTable=""/>
 <xs:element name="UpdateTableAttributes" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:sequence>
    <xs:element ref="UpdateTableItemType" maxOccurs="unbounded" minOccurs="0"/>
   </xs:sequence>
  </xs:complexType>
 </xs:element>
 <xs:element name="UpdateTableItemType" type="MapTargetSourceType"
             xdb:defaultTable=""/>
 <xs:element name="UpdateTargetTable" type="TableType" xdb:defaultTable=""/>
 <xs:simpleType name="AttributeStatus">
  <xs:restriction base="xs:string">
   <xs:enumeration value="Valid"/>
   <xs:enumeration value="Invalid"/>
   <xs:enumeration value="Missing"/>
  </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="AutoSpecType">
  <xs:restriction base="xs:string">
   <xs:enumeration value="Yes"/>
   <xs:enumeration value="No"/>
  </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="ColumnFilterReasonEnumType">
  <xs:restriction base="xs:string">
   <xs:enumeration value="NULL_LIMIT"/>
   <xs:enumeration value="CONSTANT_LIMIT"/>
   <xs:enumeration value="UNIQUE_LIMIT"/>
   <xs:enumeration value="TOPN_LIMIT"/>
   <xs:enumeration value="CUTOFF_LIMIT"/>
  </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="InputMiningDataType">
  <xs:restriction base="xs:string">
   <xs:enumeration value="AUTO"/>
   <xs:enumeration value="MANUAL"/>
  </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="JoinType">
  <xs:restriction base="xs:string">
   <xs:enumeration value="Inner"/>
   <xs:enumeration value="Left Outer"/>
   <xs:enumeration value="Right Outer"/>
   <xs:enumeration value="Full Outer"/>
   <xs:enumeration value="Cartesian"/>
  </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="LiftType">
  <xs:restriction base="xs:string">
   <xs:enumeration value="Cumulative Lift"/>
   <xs:enumeration value="Cumulative Positive Cases"/>
  </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="MessageEnumType">
  <xs:restriction base="xs:string">
   <xs:enumeration value="ADVISORY"/>
   <xs:enumeration value="ERROR"/>
   <xs:enumeration value="INCOMPLETE"/>
   <xs:enumeration value="WARNING"/>
  </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="MiningAlgorithmType">
  <xs:restriction base="xs:string">
   <xs:enumeration value="DECISION_TREE"/>
   <xs:enumeration value="NAIVE_BAYES"/>
   <xs:enumeration value="GENERALIZED_LINEAR_MODEL"/>
   <xs:enumeration value="SUPPORT_VECTOR_MACHINES"/>
   <xs:enumeration value="KMEANS"/>
   <xs:enumeration value="O_CLUSTER"/>
   <xs:enumeration value="AI_MDL"/>
   <xs:enumeration value="APRIORI_ASSOCIATION_RULES"/>
   <xs:enumeration value="NONNEGATIVE_MATRIX_FACTOR"/>
   <xs:enumeration value="ALL"/>
  </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="MiningDataType">
  <xs:restriction base="xs:string">
   <xs:enumeration value="CHAR"/>
   <xs:enumeration value="VARCHAR2"/>
   <xs:enumeration value="NUMBER"/>
   <xs:enumeration value="CLOB"/>
   <xs:enumeration value="DM_NESTED_NUMERICALS"/>
   <xs:enumeration value="DM_NESTED_CATEGORICALS"/>
  </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="MiningFunctionType">
  <xs:restriction base="xs:string">
   <xs:enumeration value="ANOMALY_DETECTION"/>
   <xs:enumeration value="ASSOCIATION"/>
   <xs:enumeration value="ATTRIBUTE_IMPORTANCE"/>
   <xs:enumeration value="CLASSIFICATION"/>
   <xs:enumeration value="CLUSTERING"/>
   <xs:enumeration value="FEATURE_EXTRACTION"/>
   <xs:enumeration value="REGRESSION"/>
  </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="ModelDetailType">
  <xs:restriction base="xs:string">
   <xs:enumeration value="DTFullTree"/>
   <xs:enumeration value="DTLeafNodesOnly"/>
   <xs:enumeration value="DTLeafNodesOnlyProfileVersion"/>
   <xs:enumeration value="DTFullTreeXMLVersion"/>
   <xs:enumeration value="NBPairProbabilities"/>
   <xs:enumeration value="SVMCCoefficients"/>
   <xs:enumeration value="SVMRCoefficients"/>
   <xs:enumeration value="ADCoefficients"/>
   <xs:enumeration value="GLMCCoefficientsAndStatistics"/>
   <xs:enumeration value="GLMRCoefficientsAndStatistics"/>
   <xs:enumeration value="GLMCRowDiagnostics"/>
   <xs:enumeration value="GLMRRowDiagnostics"/>
   <xs:enumeration value="ClusterDetails"/>
   <xs:enumeration value="ClusterRules"/>
   <xs:enumeration value="ClusterAttributeHistograms"/>
   <xs:enumeration value="ClusterAll"/>
   <xs:enumeration value="ARRulesStringVersion"/>
   <xs:enumeration value="ARRulesDMPredicateVersion"/>
   <xs:enumeration value="ARFrequentItemSetsTransactionalVersion"/>
   <xs:enumeration value="ARFrequentItemSetsDMItemVersion"/>
   <xs:enumeration value="NMFDetailsTransactionalVersion"/>
   <xs:enumeration value="NMFDetailsDMAttributesVersion"/>
   <xs:enumeration value="ModelSignature"/>
   <xs:enumeration value="GlobalDetails"/>
  </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="FilterDetailType">
  <xs:restriction base="xs:string">
   <xs:enumeration value="AttributeImportance"/>
  </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="ModelStatusType">
  <xs:restriction base="xs:string">
   <xs:enumeration value="Ready"/>
   <xs:enumeration value="Complete"/>
   <xs:enumeration value="Failure"/>
  </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="NodeStatusType">
  <xs:restriction base="xs:string">
   <xs:enumeration value="Invalid"/>
   <xs:enumeration value="Ready"/>
   <xs:enumeration value="Complete"/>
   <xs:enumeration value="Failure"/>
   <xs:enumeration value="Warning"/>
  </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="ParameterDataType">
  <xs:restriction base="xs:string">
   <xs:enumeration value="String"/>
   <xs:enumeration value="Date"/>
   <xs:enumeration value="Number"/>
  </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="RefModelStatusType">
  <xs:restriction base="xs:string">
   <xs:enumeration value="Valid"/>
   <xs:enumeration value="Invalid"/>
  </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="ROCAccuracyType">
  <xs:restriction base="xs:string">
   <xs:enumeration value="CurrentModel"/>
   <xs:enumeration value="MaxAccuracy"/>
   <xs:enumeration value="AvgAccuracy"/>
   <xs:enumeration value="CustomAccuracy"/>
  </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="ROCCustomThresholdType">
  <xs:restriction base="xs:string">
   <xs:enumeration value="HitRatio"/>
   <xs:enumeration value="FalseAlarm"/>
   <xs:enumeration value="FalsePosNegRatio"/>
  </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="StratifiedType">
  <xs:restriction base="xs:string">
   <xs:enumeration value="Original"/>
   <xs:enumeration value="Balanced"/>
   <xs:enumeration value="Custom"/>
  </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="TargetValueNumberType">
  <xs:restriction base="xs:double"/>
 </xs:simpleType>
 <xs:simpleType name="TargetValueStringType">
  <xs:restriction base="xs:string">
   <xs:minLength value="1"/>
   <xs:maxLength value="4000"/>
  </xs:restriction>
 </xs:simpleType>
 <!--Agg.Node start-->
 <xs:complexType xdb:maintainDOM="true" name="AggregationNodeType">
  <xs:complexContent>
   <xs:extension base="TransformsNodeType">
    <xs:sequence>
     <xs:element ref="AggregationElements"/>
     <xs:element name="GroupingElement" type="GroupingElementType"
                 minOccurs="0"/>
     <xs:element name="AutoSpec" type="AutoSpecType" minOccurs="1"/>
    </xs:sequence>
    <!--<xs:attribute name="AutoSpec" type="AutoSpecType" use="required"/>-->
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <!--Agg.Node end-->
 <xs:complexType name="AnomalyDetectionBuildNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="BuildNodeType">
    <xs:sequence>
     <xs:element name="Models">
      <xs:complexType>
       <xs:sequence>
        <xs:element name="AnomalyDetectionModel"
                    type="AnomalyDetectionModelType" minOccurs="0"
                    maxOccurs="unbounded"/>
       </xs:sequence>
      </xs:complexType>
     </xs:element>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="AnomalyDetectionModelType">
  <xs:complexContent>
   <xs:extension base="ModelType">
    <xs:sequence>
     <xs:element name="AnomalyDetectionAlgo" type="AnomalyDetectionAlgoType"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="AnomalyDetectionAlgoType">
  <xs:complexContent>
   <xs:extension base="SupportVectorMachineAlgoType">
    <xs:sequence>
     <xs:element name="SVMS_OUTLIER_RATE" minOccurs="0" default="0.1">
      <xs:simpleType>
       <xs:restriction base="xs:double">
        <xs:minExclusive value="0"/>
        <xs:maxExclusive value="1"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:element>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="ApplyOutputColumnsType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="OutputColumn" minOccurs="0" maxOccurs="unbounded">
    <xs:complexType xdb:maintainDOM="true">
     <xs:sequence>
      <xs:element name="Model" type="RefModelType"/>
      <xs:choice>
       <xs:element name="Prediction" type="PredictionType" minOccurs="1"/>
       <xs:element name="PredictionBounds" type="PredictionBoundsType"
                   minOccurs="1"/>
       <xs:element name="PredictionCost" type="PredictionCostType"
                   minOccurs="1"/>
       <xs:element name="PredictionDetails" type="PredictionDetailsType"
                   minOccurs="1"/>
       <xs:element name="PredictionProbability" type="PredictionProbabilityType"
                   minOccurs="1"/>
       <xs:element name="PredictionSet" type="PredictionSetType" minOccurs="1"/>
       <xs:element name="ClusterId" type="ClusterIdType" minOccurs="1"/>
       <xs:element name="ClusterProbability" type="ClusterProbabilityType"
                   minOccurs="1"/>
       <xs:element name="ClusterSet" type="ClusterSetType" minOccurs="1"/>
       <xs:element name="FeatureId" type="FeatureIdType" minOccurs="1"/>
       <xs:element name="FeatureSet" type="FeatureSetType" minOccurs="1"/>
       <xs:element name="FeatureValue" type="FeatureValueType" minOccurs="1"/>
      </xs:choice>
     </xs:sequence>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
  <xs:attribute name="AutoSpec" type="AutoSpecType" use="required"/>
 </xs:complexType>
 <xs:complexType name="ApplyNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="TransformsNodeType">
    <xs:sequence>
     <xs:element name="SupplementalAttributes" minOccurs="1"
                 type="SupplementalAttributesType"></xs:element>
     <xs:element name="OutputColumns" type="ApplyOutputColumnsType"></xs:element>
    </xs:sequence>
    <xs:attribute name="ColumnOutputOrder" use="required">
     <xs:simpleType>
      <xs:restriction base="xs:string">
       <xs:enumeration value="OutputColumns"/>
       <xs:enumeration value="SupplementalColumns"/>
      </xs:restriction>
     </xs:simpleType>
    </xs:attribute>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="AprioriAlgoType">
  <xs:sequence>
   <xs:element name="ASSO_MAX_RULE_LENGTH" default="4">
    <xs:simpleType>
     <xs:restriction base="xs:integer">
      <xs:minInclusive value="2"/>
      <xs:maxInclusive value="20"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="ASSO_MIN_CONFIDENCE" default="0.1">
    <xs:simpleType>
     <xs:restriction base="xs:double">
      <xs:minInclusive value="0"/>
      <xs:maxInclusive value="1"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="ASSO_MIN_SUPPORT" default="0.1">
    <xs:simpleType>
     <xs:restriction base="xs:double">
      <xs:minInclusive value="0"/>
      <xs:maxInclusive value="1"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="AprioriModelType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="ModelType">
    <xs:sequence>
     <xs:element name="AprioriAlgo" type="AprioriAlgoType"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>';
schema2 := ' <xs:complexType name="AssociationBuildNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="BuildNodeType">
    <xs:sequence>
     <xs:element name="ItemID" type="AttributeType"/>
     <xs:element name="ItemValue" type="AttributeType" minOccurs="0"/>
     <xs:element name="Models">
      <xs:complexType>
       <xs:sequence>
        <xs:element name="AprioriModel" type="AprioriModelType" minOccurs="0"
                    maxOccurs="unbounded"/>
       </xs:sequence>
      </xs:complexType>
     </xs:element>
    </xs:sequence>
    <xs:attribute name="MaxDistinctItemValue" type="xs:integer"/>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="AttributeType" xdb:maintainDOM="true">
  <xs:attribute name="Name" use="required">
   <xs:simpleType>
    <xs:restriction base="xs:string">
     <xs:minLength value="1"/>
     <xs:maxLength value="30"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
  <xs:attribute name="DataType" use="required">
   <xs:simpleType>
    <xs:restriction base="xs:string">
     <xs:minLength value="1"/>
     <xs:maxLength value="30"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
  <xs:attribute name="Status" type="AttributeStatus" use="required"/>
  <xs:attribute name="Alias" use="optional">
   <xs:simpleType>
    <xs:restriction base="xs:string">
     <xs:maxLength value="30"/>
     <xs:minLength value="1"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
  <xs:attribute name="Annotation" type="xs:string"/>
 </xs:complexType>
 <!--  Update Table Type Node start -->
 <!--  Update Table Type Node end -->
 <xs:complexType name="BuildNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="MiningNodeType">
    <xs:sequence>
     <xs:element ref="BuildDataSource"/>
     <xs:element ref="CaseAttributes"/>
     <xs:element ref="MiningAttributes"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <!--
 <xs:complexType name="CacheSettingsType">
  <xs:sequence minOccurs="0">
   <xs:choice>
    <xs:element name="NumberOfRows" default="2000">
     <xs:simpleType>
      <xs:restriction base="xs:long">
       <xs:minInclusive value="1"/>
      </xs:restriction>
     </xs:simpleType>
    </xs:element>
    <xs:element name="PercentOfTotal" default="10">
     <xs:simpleType>
      <xs:restriction base="xs:double">
       <xs:maxInclusive value="100"/>
       <xs:minInclusive value="1"/>
      </xs:restriction>
     </xs:simpleType>
    </xs:element>
   </xs:choice>
   <xs:element name="Method">
    <xs:complexType xdb:maintainDOM="true">
     <xs:choice>
      <xs:element name="Random">
       <xs:complexType xdb:maintainDOM="true">
        <xs:attribute name="Seed" type="xs:integer" use="required"/>
       </xs:complexType>
      </xs:element>
      <xs:element name="Stratified">
       <xs:complexType xdb:maintainDOM="true">
        <xs:attribute name="TargetAttr" use="required">
         <xs:simpleType>
          <xs:restriction base="xs:string">
           <xs:minLength value="1"/>
           <xs:maxLength value="30"/>
          </xs:restriction>
         </xs:simpleType>
        </xs:attribute>
       </xs:complexType>
      </xs:element>
      <xs:element name="TopN">
       <xs:complexType xdb:maintainDOM="true"/>
      </xs:element>
     </xs:choice>
    </xs:complexType>
   </xs:element>
   <xs:element ref="OutputTable" minOccurs="0"/>
  </xs:sequence>
  <xs:attribute name="UseFullData" type="xs:boolean" use="required"/>
 </xs:complexType>
 -->
 <xs:complexType name="CGeneralizedLinearAlgoType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="GeneralizedLinearAlgoType"/>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="CGeneralizedLinearModelType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="ClassificationModelType">
    <xs:sequence>
     <xs:element ref="CGeneralizedLinearAlgo"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="ClassificationBuildNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="SuperviseBuildNodeType">
    <xs:sequence>
     <xs:element name="Models">
      <xs:complexType>
       <xs:sequence>
        <xs:element ref="NaiveBayesModel" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element ref="DecisionTreeModel" minOccurs="0"
                    maxOccurs="unbounded"/>
        <xs:element ref="CSupportVectorMachineModel" minOccurs="0"
                    maxOccurs="unbounded"/>
        <xs:element ref="CGeneralizedLinearModel" minOccurs="0"
                    maxOccurs="unbounded"/>
       </xs:sequence>
      </xs:complexType>
     </xs:element>
     <xs:element name="CostSettings" type="CostMatrixType" minOccurs="0"/>
     <xs:element name="BenefitSettings" type="WeightsType" minOccurs="0"/>
     <xs:element name="TestSettings" type="ClassificationTestSettingsType"/>
     <xs:element name="ProfitSettings" minOccurs="0">
      <xs:complexType xdb:maintainDOM="true">
       <xs:attribute name="StartupCost" use="required" type="xs:double"/>
       <xs:attribute name="IncrementalRevenue" use="required" type="xs:double"/>
       <xs:attribute name="IncrementalCost" use="required" type="xs:double"/>
       <xs:attribute name="Budget" use="required" type="xs:double"/>
       <xs:attribute name="Population" use="required" type="xs:double"/>
      </xs:complexType>
     </xs:element>
     <xs:element name="Results" minOccurs="1">
      <xs:complexType xdb:maintainDOM="true">
       <xs:sequence>
        <xs:element maxOccurs="unbounded" ref="ClassificationResult"
                    minOccurs="0"/>
       </xs:sequence>
      </xs:complexType>
     </xs:element>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="ClassificationModelType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="SuperviseModelType">
    <xs:sequence>
     <xs:element minOccurs="0" maxOccurs="1" type="PerformanceType"
                 name="Performance"/>
     <xs:element type="TuningType" name="Tuning"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="ClassificationResultType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="MiningResultType">
    <xs:sequence>
     <xs:element ref="TestMetrics"/>
     <xs:element ref="ConfusionMatrix"/>
     <xs:element ref="Lifts"/>
     <xs:element ref="ROCs"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="ClassificationTestSettingsType" xdb:maintainDOM="true">
  <xs:choice>
   <xs:element name="TopNTargets">
    <xs:complexType>
     <xs:attribute name="Value" use="required" type="xs:integer"/>
    </xs:complexType>
   </xs:element>
   <xs:element name="BottomNTargets">
    <xs:complexType xdb:maintainDOM="true">
     <xs:attribute name="Value" type="xs:integer" use="required"/>
    </xs:complexType>
   </xs:element>
   <xs:element name="SpecificTargets">
    <xs:complexType xdb:maintainDOM="true">
     <xs:sequence>
      <xs:element name="TargetValue" maxOccurs="unbounded">
       <xs:complexType xdb:maintainDOM="true">
        <xs:attribute name="Value" use="required"/>
       </xs:complexType>
      </xs:element>
     </xs:sequence>
    </xs:complexType>
   </xs:element>
  </xs:choice>
 </xs:complexType>
 <xs:complexType name="ClusteringBuildNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="BuildNodeType">
    <xs:sequence>
     <xs:element name="Models">
      <xs:complexType>
       <xs:sequence>
        <xs:element name="KMeansModel" type="KMeansModelType"
                    maxOccurs="unbounded" minOccurs="0"/>
        <xs:element name="OClusterModel" type="OClusterModelType"
                    maxOccurs="unbounded" minOccurs="0"/>
       </xs:sequence>
      </xs:complexType>
     </xs:element>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="ClusteringModelType">
  <xs:complexContent>
   <xs:extension base="ModelType"/>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="ClusterIdType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="Column">
    <xs:complexType xdb:maintainDOM="true">
     <xs:attribute name="Name" use="required">
      <xs:simpleType>
       <xs:restriction base="xs:string">
        <xs:minLength value="1"/>
        <xs:maxLength value="30"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="ClusterProbabilityType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="Column">
    <xs:complexType xdb:maintainDOM="true">
     <xs:attribute name="Name" use="required">
      <xs:simpleType>
       <xs:restriction base="xs:string">
        <xs:minLength value="1"/>
        <xs:maxLength value="30"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
     <xs:attribute name="ClusterId" use="optional" type="xs:integer"/>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="ClusterSetType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="Column" minOccurs="1">
    <xs:complexType xdb:maintainDOM="true">
     <xs:attribute name="Name" use="required">
      <xs:simpleType>
       <xs:restriction base="xs:string">
        <xs:minLength value="1"/>
        <xs:maxLength value="30"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
     <xs:attribute name="TopNValue">
      <xs:simpleType>
       <xs:restriction base="xs:integer">
        <xs:minExclusive value="0"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
     <xs:attribute name="CutOffValue">
      <xs:simpleType>
       <xs:restriction base="xs:double">
        <xs:minInclusive value="0"/>
        <xs:maxInclusive value="1"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="DataQualitySettingsType" xdb:maintainDOM="true">
  <xs:attribute name="NullsPercent" use="optional">
   <xs:simpleType>
    <xs:restriction base="xs:double">
     <xs:minInclusive value="0"/>
     <xs:maxInclusive value="100"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
  <xs:attribute name="UniquePercent" use="optional">
   <xs:simpleType>
    <xs:restriction base="xs:double">
     <xs:minInclusive value="0"/>
     <xs:maxInclusive value="100"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
  <xs:attribute name="ConstantPercent" use="optional">
   <xs:simpleType>
    <xs:restriction base="xs:double">
     <xs:minInclusive value="0"/>
     <xs:maxInclusive value="100"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
 </xs:complexType>
 <xs:complexType name="AttrImportantSettingsType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element ref="TargetAttribute" minOccurs="0"/>
  </xs:sequence>
  <xs:attribute name="CutOff" use="optional">
   <xs:simpleType>
    <xs:restriction base="xs:double">
     <xs:minInclusive value="0"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
  <xs:attribute name="TopN" use="optional">
   <xs:simpleType>
    <xs:restriction base="xs:integer">
     <xs:minExclusive value="0"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
 </xs:complexType>
 <xs:complexType name="ColumnFilterSettingsType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="DataQualitySettings" type="DataQualitySettingsType"/>
   <xs:element name="AttrImportantSettings" type="AttrImportantSettingsType"/>
  </xs:sequence>
  <xs:attribute name="NumberOfRows" use="optional">
   <xs:simpleType>
    <xs:restriction base="xs:integer">
     <xs:minExclusive value="0"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
 </xs:complexType>
 <xs:complexType name="ColumnFilterAttributeType" xdb:maintainDOM="true">
  <xs:sequence minOccurs="1">
   <xs:element name="Attribute" minOccurs="0" maxOccurs="unbounded">
    <xs:complexType>
     <xs:complexContent>
      <xs:extension base="AttributeType">
       <xs:attribute name="AutomaticFiltering" use="required"
                     type="xs:boolean"/>
       <xs:attribute name="Output" use="required">
        <xs:simpleType>
         <xs:restriction base="xs:string">
          <xs:enumeration value="System"/>
          <xs:enumeration value="Yes"/>
          <xs:enumeration value="No"/>
         </xs:restriction>
        </xs:simpleType>
       </xs:attribute>
      </xs:extension>
     </xs:complexContent>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
  <xs:attribute name="AutoSpec" type="AutoSpecType" use="required"/>
  <xs:attribute name="AutomaticFilterEnable" type="AutoSpecType"
                use="required"/>
 </xs:complexType>
 <xs:complexType name="ColumnFilterResultType">
  <xs:sequence>
   <xs:element name="Attribute" minOccurs="0" maxOccurs="unbounded">
    <xs:complexType>
     <xs:sequence>
      <xs:element name="Reason" minOccurs="0" maxOccurs="unbounded">
       <xs:complexType>
        <xs:attribute name="Type" type="ColumnFilterReasonEnumType"/>
       </xs:complexType>
      </xs:element>
     </xs:sequence>
     <xs:attribute name="Name" use="required">
      <xs:simpleType>
       <xs:restriction base="xs:string">
        <xs:minLength value="1"/>
        <xs:maxLength value="30"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
  <xs:attribute name="DataQualityOutput" type="xs:string"/>
  <xs:attribute name="AttrImportanceOutput" type="xs:string"/>
 </xs:complexType>
 <xs:complexType name="ColumnFilterNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="TransformsNodeType">
    <xs:sequence>
     <xs:element name="ColumnFilterSettings" type="ColumnFilterSettingsType"/>
     <xs:element name="ColumnFilterAttributes"
                 type="ColumnFilterAttributeType"/>
     <xs:element name="ColumnFilterResults" type="ColumnFilterResultType"
                 minOccurs="0"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="CompareNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="MiningNodeType"/>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="CostMatrixType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="Item" maxOccurs="unbounded" minOccurs="0">
    <xs:complexType xdb:maintainDOM="true">
     <xs:attribute name="Actual" use="required"/>
     <xs:attribute name="Predict" use="required"/>
     <xs:attribute name="Cost" type="xs:double" use="required"/>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <!--  Create Table Type Node -->
 <xs:complexType name="CreateTableNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="DataNodeType">
    <xs:sequence>
     <xs:element ref="DBAttributes"/>
    </xs:sequence>
    <xs:attribute name="TableName" use="required">
     <xs:simpleType>
      <xs:restriction base="xs:string">
       <xs:minLength value="1"/>
       <xs:maxLength value="30"/>
      </xs:restriction>
     </xs:simpleType>
    </xs:attribute>
    <!--<xs:attribute name="Schema" use="required">
     <xs:simpleType>
      <xs:restriction base="xs:string">
       <xs:minLength value="1"/>
       <xs:maxLength value="30"/>
      </xs:restriction>
     </xs:simpleType>
    </xs:attribute>-->
    <xs:attribute name="Table" type="xs:boolean" use="required"/>
    <xs:attribute name="AutoSpec" type="AutoSpecType" default="Yes"/>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="CSupportVectorMachineAlgoType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="SupportVectorMachineAlgoType"/>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="CSupportVectorMachineModelType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="ClassificationModelType">
    <xs:sequence>
     <xs:element ref="CSupportVectorMachineAlgo"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="DataNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="NodeType">
    <xs:sequence>
     <xs:element ref="CacheSettings"/>
     <xs:element ref="SQLExpression" minOccurs="1"/>
    </xs:sequence>
    <xs:attribute name="AttributesInDBTableCount" type="xs:integer"
                  use="required"/>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="DataProfileNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="TransformsNodeType">
    <xs:sequence>
     <xs:element name="DataProfileInput" type="DataProfileInputType"/>
     <xs:element name="DataProfileSettings" type="DataProfileSettingsType"/>
     <xs:element name="StatisticTable" type="ResultType" minOccurs="0"/>
     <xs:element ref="SampleSettings"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="DataProfileInputType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element ref="Attributes"/>
   <xs:element name="GroupByAttribute" type="AttributeType" minOccurs="0"/>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="DataProfileSettingsType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="NumericalBins" default="10">
    <xs:simpleType>
     <xs:restriction base="xs:integer">
      <xs:maxInclusive value="128"/>
      <xs:minInclusive value="1"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="CategoricalBins" default="10">
    <xs:simpleType>
     <xs:restriction base="xs:integer">
      <xs:maxInclusive value="128"/>
      <xs:minInclusive value="1"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="DateBins" default="10">
    <xs:simpleType>
     <xs:restriction base="xs:integer">
      <xs:maxInclusive value="128"/>
      <xs:minInclusive value="1"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="DataRecordNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="DataNodeType"/>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="DataSinkNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="DataNodeType"/>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="DataSourceNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="DataNodeType">
    <xs:sequence>
     <xs:element ref="Attributes"/>
     <xs:element ref="SourceTable"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="DBColumnType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="AttributeType">
    <xs:attribute name="Key" use="optional">
     <xs:simpleType>
      <xs:restriction base="xs:string">
       <xs:enumeration value="Yes"/>
       <xs:enumeration value="No"/>
      </xs:restriction>
     </xs:simpleType>
    </xs:attribute>
    <xs:attribute name="Index" use="optional">
     <xs:simpleType>
      <xs:restriction base="xs:string">
       <xs:enumeration value="Yes"/>
       <xs:enumeration value="No"/>
      </xs:restriction>
     </xs:simpleType>
    </xs:attribute>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="DecisionTreeAlgoType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="TREE_IMPURITY_METRIC" default="TREE_IMPURITY_GINI">
    <xs:simpleType>
     <xs:restriction base="xs:string">
      <xs:enumeration value="TREE_IMPURITY_GINI"/>
      <xs:enumeration value="TREE_IMPURITY_ENTROPY"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="TREE_TERM_MAX_DEPTH" default="7">
    <xs:simpleType>
     <xs:restriction base="xs:integer">
      <xs:minInclusive value="2"/>
      <xs:maxInclusive value="20"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="TREE_TERM_MINPCT_NODE" default="0.05">
    <xs:simpleType>
     <xs:restriction base="xs:double">
      <xs:minInclusive value="0"/>
      <xs:maxInclusive value="10"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="TREE_TERM_MINPCT_SPLIT" default="0.1">
    <xs:simpleType>
     <xs:restriction base="xs:double">
      <xs:minInclusive value="0"/>
      <xs:maxInclusive value="20"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="TREE_TERM_MINREC_NODE" default="10">
    <xs:simpleType>
     <xs:restriction base="xs:integer">
      <xs:minInclusive value="0"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="TREE_TERM_MINREC_SPLIT" default="20">
    <xs:simpleType>
     <xs:restriction base="xs:integer">
      <xs:minInclusive value="0"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="DecisionTreeModelType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="ClassificationModelType">
    <xs:sequence>
     <xs:element ref="DecisionTreeAlgo"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="FeatureExtractionBuildNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="BuildNodeType"/>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="FeatureIdType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="Column">
    <xs:complexType xdb:maintainDOM="true">
     <xs:attribute name="Name" use="required">
      <xs:simpleType>
       <xs:restriction base="xs:string">
        <xs:minLength value="1"/>
        <xs:maxLength value="30"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="FeatureSetType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="Column" minOccurs="1">
    <xs:complexType xdb:maintainDOM="true">
     <xs:attribute name="Name" use="required">
      <xs:simpleType>
       <xs:restriction base="xs:string">
        <xs:minLength value="1"/>
        <xs:maxLength value="30"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
     <xs:attribute name="TopNValue">
      <xs:simpleType>
       <xs:restriction base="xs:integer">
        <xs:minExclusive value="0"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
     <xs:attribute name="CutOffValue">
      <xs:simpleType>
       <xs:restriction base="xs:double">
        <xs:minInclusive value="0"/>
        <xs:maxInclusive value="1"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="FeatureValueType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="Column">
    <xs:complexType xdb:maintainDOM="true">
     <xs:attribute name="Name" use="required">
      <xs:simpleType>
       <xs:restriction base="xs:string">
        <xs:minLength value="1"/>
        <xs:maxLength value="30"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
     <xs:attribute name="FeatureId" use="optional" type="xs:integer"/>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="FilterDetailsDataNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="TransformsNodeType">
    <xs:sequence>
     <xs:element name="FilterDetailsOutput" type="FilterDetailsOutputType"
                 minOccurs="0"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="FilterDetailsOutputType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element ref="Attributes"/>
  </xs:sequence>
  <xs:attribute name="Type" type="FilterDetailType"/>
  <xs:attribute name="AutoSpec" type="AutoSpecType" use="required"/>
 </xs:complexType>
 <xs:complexType name="GeneralizedLinearAlgoType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="GLMS_CONF_LEVEL" default="0.95">
    <xs:simpleType>
     <xs:restriction base="xs:double">
      <xs:minExclusive value="0"/>
      <xs:maxExclusive value="1"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="GLMS_DIAGNOSTICS_TABLE_NAME" type="xs:string"
               minOccurs="0"/>
   <xs:element name="GLMS_REFERENCE_CLASS_NAME" type="xs:string" minOccurs="0"/>
   <xs:element name="GLMS_RIDGE_REGRESSION" minOccurs="0">
    <xs:simpleType>
     <xs:restriction base="xs:string">
      <xs:enumeration value="GLMS_RIDGE_REG_ENABLE"/>
      <xs:enumeration value="GLMS_RIDGE_REG_DISABLE"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="GLMS_RIDGE_VALUE" minOccurs="0">
    <xs:simpleType>
     <xs:restriction base="xs:double">
      <xs:minExclusive value="0"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="GLMS_VIF_FOR_RIDGE" minOccurs="0">
    <xs:simpleType>
     <xs:restriction base="xs:string">
      <xs:enumeration value="GLMS_VIF_RIDGE_ENABLE"/>
      <xs:enumeration value="GLMS_VIF_RIDGE_DISABLE"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="ODMS_MISSING_VALUE_TREATMENT" minOccurs="0">
    <xs:simpleType>
     <xs:restriction base="xs:string">
      <xs:enumeration value="ODMS_MISSING_VALUE_MEAN_MODE"/>
      <xs:enumeration value="ODMS_MISSING_VALUE_DELETE_ROW"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="ODMS_ROW_WEIGHT_COLUMN_NAME" minOccurs="0">
    <xs:simpleType>
     <xs:restriction base="xs:string">
      <xs:minLength value="1"/>
      <xs:maxLength value="30"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="JoinKeyColumnsType">
  <xs:sequence>
   <xs:element name="JoinColumn" maxOccurs="unbounded" minOccurs="0">
    <xs:complexType>
     <xs:sequence>
      <xs:element name="LeftColumn" type="RefDBColumnType"/>
      <xs:element name="RightColumn" type="RefDBColumnType"/>
     </xs:sequence>
     <xs:attribute name="Type" use="required" type="JoinType"/>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
  <xs:attribute name="AutoSpec" type="AutoSpecType" use="required"/>
 </xs:complexType>';
schema3 := ' <xs:complexType name="JoinOutputColumnsType">
  <xs:sequence>
   <xs:element name="RefDBColumn" type="RefDBColumnType" maxOccurs="unbounded"
               minOccurs="0"/>
  </xs:sequence>
  <xs:attribute name="AutoSpec" type="AutoSpecType" use="required"/>
 </xs:complexType>
 <xs:complexType name="JoinNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="TransformsNodeType">
    <xs:sequence>
     <xs:element name="KeyColumns" type="JoinKeyColumnsType"/>
     <xs:element name="OutputColumns" type="JoinOutputColumnsType"/>
     <xs:element name="Filter" type="xs:string" xdb:SQLType="CLOB"
                 minOccurs="0"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="KMeansAlgoType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="CLUS_NUM_CLUSTERS" default="10">
    <xs:simpleType>
     <xs:restriction base="xs:integer">
      <xs:minInclusive value="1"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="KMNS_BLOCK_GROWTH" default="2">
    <xs:simpleType>
     <xs:restriction base="xs:integer">
      <xs:minExclusive value="1"/>
      <xs:maxInclusive value="5"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="KMNS_CONV_TOLERANCE" default="0.01">
    <xs:simpleType>
     <xs:restriction base="xs:double">
      <xs:minExclusive value="0"/>
      <xs:maxInclusive value="0.5"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="KMNS_DISTANCE" default="KMNS_EUCLIDEAN">
    <xs:simpleType>
     <xs:restriction base="xs:string">
      <xs:enumeration value="KMNS_COSINE"/>
      <xs:enumeration value="KMNS_EUCLIDEAN"/>
      <xs:enumeration value="KMNS_FAST_COSINE"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="KMNS_ITERATIONS" default="3">
    <xs:simpleType>
     <xs:restriction base="xs:integer">
      <xs:minExclusive value="0"/>
      <xs:maxInclusive value="20"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="KMNS_MIN_PCT_ATTR_SUPPORT" default="0.1">
    <xs:simpleType>
     <xs:restriction base="xs:double">
      <xs:minInclusive value="0"/>
      <xs:maxInclusive value="1"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="KMNS_NUM_BINS" default="10">
    <xs:simpleType>
     <xs:restriction base="xs:integer">
      <xs:minExclusive value="0"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="KMNS_SPLIT_CRITERION" default="KMNS_VARIANCE">
    <xs:simpleType>
     <xs:restriction base="xs:string">
      <xs:enumeration value="KMNS_SIZE"/>
      <xs:enumeration value="KMNS_VARIANCE"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="KMeansModelType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="ClusteringModelType">
    <xs:sequence>
     <xs:element name="KMeansAlgo" type="KMeansAlgoType"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="MapTargetSourceType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="key" type="UpdateTableColumnType"/>
   <xs:element name="value" type="AttributeType"/>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="MessageType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:choice>
    <xs:element name="Resource">
     <xs:complexType xdb:maintainDOM="true">
      <xs:sequence>
       <xs:element name="Parameters">
        <xs:complexType>
         <xs:sequence>
          <xs:element name="Value" maxOccurs="unbounded">
           <xs:complexType xdb:maintainDOM="true">
            <xs:simpleContent>
             <xs:extension base="xs:string">
              <xs:attribute name="Type" type="ParameterDataType"
                            use="required"/>
              <xs:attribute name="Pos" type="xs:integer"/>
             </xs:extension>
            </xs:simpleContent>
           </xs:complexType>
          </xs:element>
         </xs:sequence>
        </xs:complexType>
       </xs:element>
      </xs:sequence>
      <xs:attribute name="Id" type="xs:string" use="required"/>
     </xs:complexType>
    </xs:element>
    <xs:element name="DisplayValue" type="xs:string"/>
   </xs:choice>
   <xs:element name="ActionKeys">
    <xs:complexType xdb:maintainDOM="true">
     <xs:sequence>
      <xs:element name="Action" maxOccurs="unbounded">
       <xs:complexType xdb:maintainDOM="true">
        <xs:simpleContent>
         <xs:extension base="xs:string">
          <xs:attribute name="Id" type="xs:string" use="required"/>
          <xs:attribute name="Order"/>
         </xs:extension>
        </xs:simpleContent>
       </xs:complexType>
      </xs:element>
     </xs:sequence>
    </xs:complexType>
   </xs:element>
   <xs:element name="ErrorDetail" type="xs:string"/>
  </xs:sequence>
  <xs:attribute name="Id" use="optional" type="xs:string"/>
  <xs:attribute name="Type" type="MessageEnumType" use="required"/>
 </xs:complexType>
 <xs:complexType name="MiningAttributeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="AttributeType">
    <xs:attribute name="AutoPrep" use="required">
     <xs:simpleType>
      <xs:restriction base="xs:string">
       <xs:enumeration value="Yes"/>
       <xs:enumeration value="No"/>
      </xs:restriction>
     </xs:simpleType>
    </xs:attribute>
    <xs:attribute name="MiningType" use="required">
     <xs:simpleType>
      <xs:restriction base="xs:string">
       <xs:enumeration value="Categorical"/>
       <xs:enumeration value="Numerical"/>
      </xs:restriction>
     </xs:simpleType>
    </xs:attribute>
    <xs:attribute name="Input" use="required">
     <xs:simpleType>
      <xs:restriction base="xs:string">
       <xs:enumeration value="Yes"/>
       <xs:enumeration value="No"/>
      </xs:restriction>
     </xs:simpleType>
    </xs:attribute>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="MiningNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="NodeType"/>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="MiningResultType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="ResultType">
    <xs:attribute name="ModelId" type="xs:string" use="required"/>
    <xs:attribute name="Status" type="ModelStatusType" use="required"/>
    <xs:attribute name="Annotation" type="xs:string"/>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="ModelDetailsDataNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="TransformsNodeType">
    <xs:sequence>
     <xs:element name="ModelDetailsOutput" type="ModelDetailsOutputType"
                 minOccurs="0"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="ModelDetailsOutputType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="Models">
    <xs:complexType xdb:maintainDOM="true">
     <xs:sequence>
      <xs:element name="Model" maxOccurs="unbounded" type="RefModelType"
                  minOccurs="0"/>
     </xs:sequence>
    </xs:complexType>
   </xs:element>
   <xs:element ref="Attributes"/>
  </xs:sequence>
  <xs:attribute name="Type" type="ModelDetailType"/>
  <xs:attribute name="MiningFunction" type="MiningFunctionType"/>
  <xs:attribute name="MiningAlgorithm" type="MiningAlgorithmType"/>
  <xs:attribute name="AutoSpec" type="AutoSpecType" use="required"/>
 </xs:complexType>
 <xs:complexType name="ModelInfoType" xdb:maintainDOM="true">
  <xs:attribute name="Schema" use="required">
   <xs:simpleType>
    <xs:restriction base="xs:string">
     <xs:minLength value="1"/>
     <xs:maxLength value="30"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
  <xs:attribute name="Name" use="required">
   <xs:simpleType>
    <xs:restriction base="xs:string">
     <xs:minLength value="1"/>
     <xs:maxLength value="25"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
  <xs:attribute name="MiningFunction" use="required" type="MiningFunctionType"/>
  <xs:attribute name="MiningAlgorithm" use="required"
                type="MiningAlgorithmType"/>
  <xs:attribute name="Status" use="required" type="RefModelStatusType"/>
  <xs:attribute name="UseForOutput" use="required" type="xs:boolean"/>
  <xs:attribute name="ModelId" use="required" type="xs:string"/>
 </xs:complexType>
 <xs:complexType name="ModelNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="MiningNodeType">
    <xs:sequence>
     <xs:element name="MiningFunction" type="MiningFunctionType" minOccurs="0"/>
     <xs:element name="Models" minOccurs="0">
      <xs:complexType xdb:maintainDOM="true">
       <xs:sequence>
        <xs:element name="Model" maxOccurs="unbounded" minOccurs="0">
         <xs:complexType xdb:maintainDOM="true">
          <xs:complexContent>
           <xs:extension base="ModelInfoType">
            <xs:sequence>
             <xs:element ref="ModelSettingsODM" minOccurs="0"/>
            </xs:sequence>
           </xs:extension>
          </xs:complexContent>
         </xs:complexType>
        </xs:element>
       </xs:sequence>
      </xs:complexType>
     </xs:element>
     <xs:element ref="TargetAttribute" minOccurs="0"/>
     <xs:element ref="TargetValues" minOccurs="0"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="ModelSettingODMType" xdb:maintainDOM="true">
  <xs:attribute name="Name" use="required">
   <xs:simpleType>
    <xs:restriction base="xs:string">
     <xs:minLength value="1"/>
     <xs:maxLength value="30"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
  <xs:attribute name="Value" use="required">
   <xs:simpleType>
    <xs:restriction base="xs:string">
     <xs:minLength value="1"/>
     <xs:maxLength value="4000"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
  <xs:attribute name="Type" use="required">
   <xs:simpleType>
    <xs:restriction base="xs:string">
     <xs:minLength value="1"/>
     <xs:maxLength value="30"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
 </xs:complexType>
 <xs:complexType name="ModelType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element ref="InputMiningData"/>
   <xs:element name="Messages" minOccurs="0">
    <xs:complexType xdb:maintainDOM="true">
     <xs:sequence>
      <xs:element name="Message" maxOccurs="unbounded" type="MessageType"/>
     </xs:sequence>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
  <xs:attribute name="Id" type="xs:string" use="required"/>
  <xs:attribute name="Name" use="required">
   <xs:simpleType>
    <xs:restriction base="xs:string">
     <xs:minLength value="1"/>
     <xs:maxLength value="25"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
  <xs:attribute name="Status" type="ModelStatusType" use="required"/>
  <xs:attribute name="Valid" use="optional" type="xs:boolean"/>
  <xs:attribute name="CreationDate" type="xs:string" use="optional"/>
  <xs:attribute name="Annotation" use="optional">
   <xs:simpleType>
    <xs:restriction base="xs:string">
     <xs:minLength value="0"/>
     <xs:maxLength value="4000"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
  <xs:attribute name="UseForOutput" use="required" type="xs:boolean"/>
 </xs:complexType>
 <xs:complexType name="MonitorNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="MiningNodeType"/>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="NaiveBayesAlgoType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="NABS_PAIRWISE_THRESHOLD" default="0.01">
    <xs:simpleType>
     <xs:restriction base="xs:double">
      <xs:minInclusive value="0"/>
      <xs:maxInclusive value="1"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="NABS_SINGLETON_THRESHOLD" default="0.01">
    <xs:simpleType>
     <xs:restriction base="xs:double">
      <xs:minInclusive value="0"/>
      <xs:maxInclusive value="1"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="NaiveBayesModelType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="ClassificationModelType">
    <xs:sequence>
     <xs:element ref="NaiveBayesAlgo"/>
     <xs:element name="Prior" type="PriorType" maxOccurs="1" minOccurs="0"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="NodeType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element ref="Icon"/>
   <xs:element ref="Messages" minOccurs="0"/>
  </xs:sequence>
  <xs:attribute name="Id" type="xs:string" use="required"/>
  <xs:attribute name="Name" type="xs:string" use="required"/>
  <xs:attribute name="Status" type="NodeStatusType" use="required"/>
  <xs:attribute name="Annotation" type="xs:string"/>
 </xs:complexType>
 <xs:complexType name="OClusterAlgoType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="CLUS_NUM_CLUSTERS" default="10">
    <xs:simpleType>
     <xs:restriction base="xs:integer">
      <xs:minInclusive value="1"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="OCLT_MAX_BUFFER" default="50000">
    <xs:simpleType>
     <xs:restriction base="xs:double">
      <xs:minExclusive value="0"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="OCLT_SENSITIVITY" default="0.5">
    <xs:simpleType>
     <xs:restriction base="xs:double">
      <xs:minInclusive value="0"/>
      <xs:maxInclusive value="1"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="OClusterModelType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="ClusteringModelType">
    <xs:sequence>
     <xs:element name="OClusterAlgo" type="OClusterAlgoType"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="OutputNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="NodeType"/>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="PerformanceType" xdb:maintainDOM="true">
  <xs:choice>
   <xs:element name="Balanced"/>
   <xs:element name="Natural"/>
   <xs:element name="Custom">
    <xs:complexType>
     <xs:sequence>
      <xs:element name="Weights" type="WeightsType"/>
     </xs:sequence>
    </xs:complexType>
   </xs:element>
  </xs:choice>
 </xs:complexType>
 <xs:complexType name="PredictionType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="CostOption" minOccurs="1">
    <xs:complexType xdb:maintainDOM="true">
     <xs:choice>
      <xs:element name="None"/>
      <xs:element name="Model"/>
      <xs:element name="Inline">
       <xs:complexType xdb:maintainDOM="true">
        <xs:sequence>
         <xs:element ref="CostMatrix"/>
        </xs:sequence>
       </xs:complexType>
      </xs:element>
     </xs:choice>
    </xs:complexType>
   </xs:element>
   <xs:element name="Column">
    <xs:complexType xdb:maintainDOM="true">
     <xs:attribute name="Name" use="required">
      <xs:simpleType>
       <xs:restriction base="xs:string">
        <xs:minLength value="1"/>
        <xs:maxLength value="30"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="PredictionBoundsType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="Column">
    <xs:complexType>
     <xs:attribute name="Name" use="optional">
      <xs:simpleType>
       <xs:restriction base="xs:string">
        <xs:minLength value="1"/>
        <xs:maxLength value="30"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
     <xs:attribute name="LowerBound" use="optional">
      <xs:simpleType>
       <xs:restriction base="xs:string">
        <xs:minLength value="1"/>
        <xs:maxLength value="30"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
     <xs:attribute name="UpperBound" use="optional">
      <xs:simpleType>
       <xs:restriction base="xs:string">
        <xs:minLength value="1"/>
        <xs:maxLength value="30"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
     <xs:attribute name="TargetValue" use="optional"/>
     <xs:attribute name="Confidence">
      <xs:simpleType>
       <xs:restriction base="xs:double">
        <xs:minInclusive value="0"/>
        <xs:maxInclusive value="1"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="PredictionCostType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="CostOption">
    <xs:complexType xdb:maintainDOM="true">
     <xs:choice>
      <xs:element name="None"/>
      <xs:element name="Model"/>
      <xs:element name="Inline">
       <xs:complexType xdb:maintainDOM="true">
        <xs:sequence>
         <xs:element ref="CostMatrix"/>
        </xs:sequence>
       </xs:complexType>
      </xs:element>
     </xs:choice>
    </xs:complexType>
   </xs:element>
   <xs:element name="Column">
    <xs:complexType xdb:maintainDOM="true">
     <xs:attribute name="Name" use="required">
      <xs:simpleType>
       <xs:restriction base="xs:string">
        <xs:minLength value="1"/>
        <xs:maxLength value="30"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
     <xs:attribute name="TargetValue" use="optional"/>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="PredictionDetailsType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="Column">
    <xs:complexType xdb:maintainDOM="true">
     <xs:attribute name="Name" use="required">
      <xs:simpleType>
       <xs:restriction base="xs:string">
        <xs:minLength value="1"/>
        <xs:maxLength value="30"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="PredictionProbabilityType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="Column">
    <xs:complexType xdb:maintainDOM="true">
     <xs:attribute name="Name" use="required">
      <xs:simpleType>
       <xs:restriction base="xs:string">
        <xs:minLength value="1"/>
        <xs:maxLength value="30"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
     <xs:attribute name="TargetValue" use="optional"/>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="PredictionSetType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="CostOption">
    <xs:complexType xdb:maintainDOM="true">
     <xs:choice>
      <xs:element name="None"/>
      <xs:element name="Model"/>
      <xs:element name="Inline">
       <xs:complexType xdb:maintainDOM="true">
        <xs:sequence>
         <xs:element ref="CostMatrix"/>
        </xs:sequence>
       </xs:complexType>
      </xs:element>
     </xs:choice>
    </xs:complexType>
   </xs:element>
   <xs:element name="Column" minOccurs="1">
    <xs:complexType xdb:maintainDOM="true">
     <xs:attribute name="Name" use="required">
      <xs:simpleType>
       <xs:restriction base="xs:string">
        <xs:minLength value="1"/>
        <xs:maxLength value="30"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
     <xs:attribute name="TopNValue">
      <xs:simpleType>
       <xs:restriction base="xs:integer">
        <xs:minExclusive value="0"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
     <xs:attribute name="ProbCutOff">
      <xs:simpleType>
       <xs:restriction base="xs:double">
        <xs:minInclusive value="0"/>
        <xs:maxInclusive value="1"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
     <xs:attribute name="CostCutOff">
      <xs:simpleType>
       <xs:restriction base="xs:double">
        <xs:minInclusive value="0"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="PriorType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="Item" maxOccurs="unbounded" minOccurs="0">
    <xs:complexType xdb:maintainDOM="true">
     <xs:attribute name="TargetValue" type="TargetValueStringType"
                   use="required"></xs:attribute>
     <xs:attribute name="Prob" type="xs:double" use="required"/>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="RefDBColumnType">
  <xs:complexContent>
   <xs:extension base="DBColumnType">
    <xs:attribute name="NodeId" use="required" type="xs:string"/>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="ReferenceNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="TransformsNodeType"/>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="RefModelType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="ModelInfoType">
    <xs:attribute name="IsModelBuilt" type="xs:boolean" use="required"/>
    <xs:attribute name="NodeId" use="required" type="xs:string"/>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="RegressionBuildNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="SuperviseBuildNodeType">
    <xs:sequence>
     <xs:element name="Models">
      <xs:complexType xdb:maintainDOM="true">
       <xs:sequence>
        <xs:element ref="RSupportVectorMachineModel" minOccurs="0"
                    maxOccurs="unbounded"/>
        <xs:element ref="RGeneralizedLinearModel" minOccurs="0"
                    maxOccurs="unbounded"/>
       </xs:sequence>
      </xs:complexType>
     </xs:element>
     <xs:element name="Results" minOccurs="1">
      <xs:complexType xdb:maintainDOM="true">
       <xs:sequence>
        <xs:element minOccurs="0" maxOccurs="unbounded" ref="RegressionResult"/>
       </xs:sequence>
      </xs:complexType>
     </xs:element>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="RegressionModelType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="SuperviseModelType"/>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="RegressionResultType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="MiningResultType">
    <xs:sequence>
     <xs:element ref="TestMetrics"/>
     <xs:element ref="ResidualPlot"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="ResultType" xdb:maintainDOM="true">
  <xs:attribute name="Name" use="required">
   <xs:simpleType>
    <xs:restriction base="xs:string">
     <xs:minLength value="1"/>
     <xs:maxLength value="30"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
  <xs:attribute name="CreationDate" type="xs:string" use="required"/>
 </xs:complexType>
 <xs:complexType name="RGeneralizedLinearAlgoType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="GeneralizedLinearAlgoType"/>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="RGeneralizedLinearModelType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="RegressionModelType">
    <xs:sequence>
     <xs:element ref="RGeneralizedLinearModelAlgo"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="RowFilterOutputColumnsType">
  <xs:sequence>
   <xs:element name="Attribute" minOccurs="0" maxOccurs="unbounded"
               type="AttributeType"/>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="RowFilterNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="TransformsNodeType">
    <xs:sequence>
     <xs:element name="OutputColumns" type="RowFilterOutputColumnsType"/>
     <xs:element name="Filter" type="xs:string" xdb:SQLType="CLOB"
                 minOccurs="0"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="RSupportVectorMachineAlgoType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="SupportVectorMachineAlgoType">
    <xs:sequence>
     <xs:element name="SVMS_EPSILON" minOccurs="0">
      <xs:simpleType>
       <xs:restriction base="xs:double">
        <xs:minExclusive value="0"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:element>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="RSupportVectorMachineModelType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="RegressionModelType">
    <xs:sequence>
     <xs:element ref="RSupportVectorMachineAlgo"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>';
schema4 := ' <xs:complexType name="SamplingSettingsType">
  <xs:sequence minOccurs="1">
   <xs:choice>
    <xs:element name="NumberOfRows" default="2000">
     <xs:simpleType>
      <xs:restriction base="xs:long">
       <xs:minInclusive value="1"/>
      </xs:restriction>
     </xs:simpleType>
    </xs:element>
    <xs:element name="PercentOfTotal" default="10">
     <xs:simpleType>
      <xs:restriction base="xs:double">
       <xs:maxInclusive value="100"/>
       <xs:minInclusive value="1"/>
      </xs:restriction>
     </xs:simpleType>
    </xs:element>
   </xs:choice>
   <xs:element name="Method">
    <xs:complexType xdb:maintainDOM="true">
     <xs:choice>
      <xs:element name="Random">
       <xs:complexType xdb:maintainDOM="true">
        <xs:attribute name="Seed" type="xs:integer" use="required"/>
       </xs:complexType>
      </xs:element>
      <xs:element name="Stratified">
       <xs:complexType xdb:maintainDOM="true">
        <xs:sequence>
         <xs:element name="Distributions">
          <xs:complexType>
           <xs:sequence>
            <xs:element name="Distribution" maxOccurs="unbounded" minOccurs="0">
             <xs:complexType>
              <xs:attribute name="TargetValue" use="required">
               <xs:simpleType>
                <xs:restriction base="xs:string">
                 <xs:minLength value="1"/>
                 <xs:maxLength value="4000"/>
                </xs:restriction>
               </xs:simpleType>
              </xs:attribute>
              <xs:attribute name="Count" type="xs:integer" use="required"/>
             </xs:complexType>
            </xs:element>
           </xs:sequence>
          </xs:complexType>
         </xs:element>
        </xs:sequence>
        <xs:attribute name="TargetAttr" use="required">
         <xs:simpleType>
          <xs:restriction base="xs:string">
           <xs:minLength value="1"/>
           <xs:maxLength value="30"/>
          </xs:restriction>
         </xs:simpleType>
        </xs:attribute>
        <xs:attribute name="DataType" use="required">
         <xs:simpleType>
          <xs:restriction base="xs:string">
           <xs:minLength value="1"/>
           <xs:maxLength value="30"/>
          </xs:restriction>
         </xs:simpleType>
        </xs:attribute>
        <xs:attribute name="Status" type="AttributeStatus" use="required"/>
        <xs:attribute name="Type" use="required" type="StratifiedType"/>
        <xs:attribute name="Seed" type="xs:integer" use="required"/>
       </xs:complexType>
      </xs:element>
      <xs:element name="TopN">
       <xs:complexType xdb:maintainDOM="true"/>
      </xs:element>
     </xs:choice>
    </xs:complexType>
   </xs:element>
   <xs:element name="CaseAttribute" type="AttributeType" minOccurs="0"/>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="SampleNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="TransformsNodeType">
    <xs:sequence>
     <xs:element name="SamplingSettings" type="SamplingSettingsType"/>
     <xs:element name="StatisticTable" minOccurs="0">
      <xs:complexType>
       <xs:complexContent>
        <xs:extension base="ResultType">
         <xs:attribute name="Column" use="required">
           <xs:simpleType>
            <xs:restriction base="xs:string">
             <xs:minLength value="1"/>
             <xs:maxLength value="30"/>
            </xs:restriction>
           </xs:simpleType>
           </xs:attribute>
        </xs:extension>
       </xs:complexContent>
      </xs:complexType>
     </xs:element>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="SplitNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="TransformsNodeType"/>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="SuperviseBuildNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="BuildNodeType">
    <xs:sequence>
     <xs:element ref="TestDataSource"/>
     <xs:element ref="TargetAttribute" minOccurs="0"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="SuperviseModelType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="ModelType">
    <xs:sequence>
     <xs:element ref="TargetAttribute" minOccurs="0"/>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="SupplementalAttributesType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element ref="Attribute" maxOccurs="unbounded" minOccurs="0"/>
  </xs:sequence>
  <xs:attribute name="AutoSpec" type="AutoSpecType" use="required"/>
 </xs:complexType>
 <xs:complexType name="SupportVectorMachineAlgoType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="SVMS_ACTIVE_LEARNING" default="SVMS_AL_ENABLE">
    <xs:simpleType>
     <xs:restriction base="xs:string">
      <xs:enumeration value="SVMS_AL_ENABLE"/>
      <xs:enumeration value="SVMS_AL_DISABLE"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="SVMS_COMPLEXITY_FACTOR" minOccurs="0">
    <xs:simpleType>
     <xs:restriction base="xs:double">
      <xs:minExclusive value="0"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="SVMS_CONV_TOLERANCE" default="0.001">
    <xs:simpleType>
     <xs:restriction base="xs:double">
      <xs:minExclusive value="0"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="SVMS_KERNEL_CACHE_SIZE" default="50000000" minOccurs="0">
    <xs:simpleType>
     <xs:restriction base="xs:integer">
      <xs:minExclusive value="0"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="SVMS_KERNEL_FUNCTION" default="SVMS_LINEAR" minOccurs="0">
    <xs:simpleType>
     <xs:restriction base="xs:string">
      <xs:enumeration value="SVMS_GAUSSIAN"/>
      <xs:enumeration value="SVMS_LINEAR"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
   <xs:element name="SVMS_STD_DEV" minOccurs="0">
    <xs:simpleType>
     <xs:restriction base="xs:double">
      <xs:minExclusive value="0"/>
     </xs:restriction>
    </xs:simpleType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 <xs:complexType name="TableType" xdb:maintainDOM="true">
  <xs:attribute name="Schema" use="required">
   <xs:simpleType>
    <xs:restriction base="xs:string">
     <xs:minLength value="1"/>
     <xs:maxLength value="30"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
  <xs:attribute name="Name" use="required">
   <xs:simpleType>
    <xs:restriction base="xs:string">
     <xs:minLength value="1"/>
     <xs:maxLength value="30"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
 </xs:complexType>
 <xs:complexType name="TargetResultType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="ResultType">
    <xs:attribute name="TargetValue" use="required"/>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="TestDetailsDataNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="TransformsNodeType"/>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="TestNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="MiningNodeType">
    <xs:sequence>
     <xs:element ref="TargetAttribute" minOccurs="0"/>
     <xs:element name="TestSettings" type="ClassificationTestSettingsType"
                 minOccurs="0"/>
     <xs:element ref="CaseAttributes"/>
     <xs:element name="TestModels" type="TestModelType"/>
     <xs:element name="Results">
      <xs:complexType>
       <xs:choice>
        <xs:element minOccurs="0" maxOccurs="unbounded"
                    ref="ClassificationResult"/>
        <xs:element minOccurs="0" maxOccurs="unbounded" ref="RegressionResult"/>
       </xs:choice>
      </xs:complexType>
     </xs:element>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="TestModelType">
  <xs:sequence>
   <xs:element name="Model" maxOccurs="unbounded" minOccurs="0">
    <xs:complexType>
     <xs:complexContent>
      <xs:extension base="RefModelType">
       <xs:attribute name="TestStatus" type="ModelStatusType" use="required"/>
      </xs:extension>
     </xs:complexContent>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
  <xs:attribute name="MiningFunction" type="MiningFunctionType" use="required"/>
  <xs:attribute name="AutoSpec" type="AutoSpecType" use="required"/>
  <xs:attribute name="Archive" use="required">
   <xs:simpleType>
    <xs:restriction base="xs:string">
     <xs:enumeration value="Yes"/>
     <xs:enumeration value="No"/>
    </xs:restriction>
   </xs:simpleType>
  </xs:attribute>
 </xs:complexType>
 <xs:complexType name="TextNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="TransformsNodeType"/>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="TransformsNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="DataNodeType"/>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="TransformNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="TransformsNodeType"/>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="TuningType" xdb:maintainDOM="true">
  <xs:choice>
   <xs:element name="None"/>
   <xs:element name="Cost">
    <xs:complexType xdb:maintainDOM="true">
     <xs:sequence>
      <xs:element ref="CostMatrix"/>
     </xs:sequence>
    </xs:complexType>
   </xs:element>
   <xs:element name="Benefit">
    <xs:complexType xdb:maintainDOM="true">
     <xs:sequence>
      <xs:element name="BenefitWeights" type="WeightsType"/>
     </xs:sequence>
    </xs:complexType>
   </xs:element>
   <xs:element name="Custom">
    <xs:complexType xdb:maintainDOM="true">
     <xs:sequence>
      <xs:element name="Settings">
       <xs:complexType xdb:maintainDOM="true">
        <xs:choice>
         <xs:element name="ROC">
          <xs:complexType xdb:maintainDOM="true">
           <xs:sequence>
            <xs:element name="CustomThreshold" minOccurs="0">
             <xs:complexType xdb:maintainDOM="true">
              <xs:attribute name="Type" use="required"
                            type="ROCCustomThresholdType"/>
              <xs:attribute name="Value" use="required" type="xs:double"/>
             </xs:complexType>
            </xs:element>
           </xs:sequence>
           <xs:attribute name="Accuracy" use="required" type="ROCAccuracyType"/>
           <xs:attribute name="Threshold" type="xs:double" use="required"/>
          </xs:complexType>
         </xs:element>
         <xs:element name="Lift">
          <xs:complexType>
           <xs:attribute name="Type" use="required" type="LiftType"/>
           <xs:attribute name="Quantile" use="required" type="xs:integer"/>
           <xs:attribute name="Threshold" type="xs:double" use="required"/>
          </xs:complexType>
         </xs:element>
         <xs:element name="Profit">
          <xs:complexType>
           <xs:attribute name="Population" use="required" type="xs:integer"/>
           <xs:attribute name="Profit" type="xs:double" use="required"/>
           <xs:attribute name="ROI" use="required" type="xs:double"/>
          </xs:complexType>
         </xs:element>
        </xs:choice>
        <xs:attribute name="TargetValue" use="required" type="xs:string"/>
       </xs:complexType>
      </xs:element>
      <xs:element ref="CostMatrix"/>
     </xs:sequence>
    </xs:complexType>
   </xs:element>
  </xs:choice>
 </xs:complexType>
 <xs:complexType name="UpdateTableColumnType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="AttributeType">
    <xs:attribute name="RequiredColumn" type="xs:boolean" use="required"/>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="UpdateTableNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="DataNodeType">
    <xs:sequence>
     <xs:element ref="UpdateTargetTable"/>
     <xs:element ref="UpdateTableAttributes"/>
    </xs:sequence>
    <xs:attribute name="DropExisting" type="xs:boolean" use="required"/>
    <xs:attribute name="AutoSpec" type="AutoSpecType" default="Yes"/>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <xs:complexType name="WeightsType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="Item" maxOccurs="unbounded" minOccurs="0">
    <xs:complexType xdb:maintainDOM="true">
     <xs:attribute name="TargetValue" type="TargetValueStringType"
                   use="required"></xs:attribute>
     <xs:attribute name="Weight" type="xs:double" use="required"/>
    </xs:complexType>
   </xs:element>
  </xs:sequence>
 </xs:complexType>
 
 <!-- Transformation Start -->
 
 <!-- custom transforms definitions -->
 <!--
 <xs:element name="StringCollection" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:sequence>
    <xs:element name="Value" maxOccurs="unbounded" minOccurs="0">
     <xs:simpleType>
      <xs:restriction base="xs:string"/>
     </xs:simpleType>
    </xs:element>
    </xs:sequence>
   </xs:complexType>
  </xs:element>
-->

  <xs:complexType name="StringCollection" xdb:maintainDOM="true">
   <xs:sequence>
    <xs:element name="Value" maxOccurs="unbounded" minOccurs="0">
     <xs:simpleType>
      <xs:restriction base="xs:string"/>
     </xs:simpleType>
    </xs:element>
    </xs:sequence>
   </xs:complexType>

  <xs:element name="StringCollectionValues" type="StringCollection" xdb:defaultTable=""/>
 
   <xs:element name="CategoricalBin">
    <xs:complexType xdb:maintainDOM="true">
     <xs:sequence>
      <xs:element name="Name">
       <xs:simpleType>
        <xs:restriction base="xs:string"/>
       </xs:simpleType>
      </xs:element>
      <xs:element name="IsOther" minOccurs="1" default="false">
       <xs:simpleType>
        <xs:restriction base="xs:boolean"/>
       </xs:simpleType>
      </xs:element>
      <xs:element ref="StringCollectionValues"/>
     </xs:sequence>
    </xs:complexType>
   </xs:element>

   <xs:element name="NumericBin">
    <xs:complexType xdb:maintainDOM="true">
     <xs:sequence>
      <xs:element name="BinName">
       <xs:simpleType>
        <xs:restriction base="xs:string"/>
       </xs:simpleType>
      </xs:element>
      <xs:element name="LowerBound">
       <xs:simpleType>
        <xs:restriction base="xs:double"/>
       </xs:simpleType>
      </xs:element>
     </xs:sequence>
    </xs:complexType>
   </xs:element>
 
 <!-- definitions to support binning -->
 <xs:element name="BinGeneration">
  <xs:complexType xdb:maintainDOM="true">
   <xs:choice>
    <xs:element name="Auto"/>
    <xs:element name="Manual"/>
   </xs:choice>
  </xs:complexType>
 </xs:element>
 
 <xs:element name="BinCount" default="10">
  <xs:simpleType>
   <xs:restriction base="xs:integer">
    <xs:minInclusive value="1"/>
   </xs:restriction>
  </xs:simpleType>
 </xs:element>
 
 <xs:element name="BinLabels">
  <xs:complexType xdb:maintainDOM="true">
   <xs:choice>
    <xs:element name="Range"/>
    <xs:element name="NumberSequence"/>
   </xs:choice>
  </xs:complexType>
 </xs:element>
 <!-- end -->
 
 <!-- Definitions for Missing Values -->
   <xs:element name="NumericStatistic">
    <xs:complexType xdb:maintainDOM="true">
     <xs:attribute name="ReplaceNullsWith">
      <xs:simpleType>
       <xs:restriction base="xs:string">
        <xs:enumeration value="Mean"/>
        <xs:enumeration value="Minimum"/>
        <xs:enumeration value="Maximum"/>
        <xs:enumeration value="Median"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
    </xs:complexType>
   </xs:element>
 
   <xs:element name="CategoricalStatistic">
    <xs:complexType xdb:maintainDOM="true">
     <xs:attribute name="ReplaceNullsWith">
      <xs:simpleType>
       <xs:restriction base="xs:string">
        <xs:enumeration value="Mode"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
    </xs:complexType>
   </xs:element>

   <xs:element name="DateStatistic">
    <xs:complexType xdb:maintainDOM="true">
     <xs:attribute name="ReplaceNullsWith">
      <xs:simpleType>
       <xs:restriction base="xs:string">
        <xs:enumeration value="Minimum"/>
        <xs:enumeration value="Mean"/>
        <xs:enumeration value="Mode"/>
       </xs:restriction>
      </xs:simpleType>
     </xs:attribute>
    </xs:complexType>
   </xs:element>
  <!-- end -->

 <!-- Main transformation definition declaration-->
 <xs:complexType name="TransformationType" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:choice>
    <xs:element name="Normalization">
     <xs:complexType xdb:maintainDOM="true">
      <xs:choice>
       <xs:element name="MinMax">
        <xs:complexType xdb:maintainDOM="true">
         <xs:attribute name="Minimum" default="0">
          <xs:simpleType>
           <xs:restriction base="xs:double">
            <xs:minInclusive value="0"/>
           </xs:restriction>
          </xs:simpleType>
         </xs:attribute>
         <xs:attribute name="Maximum" default="1">
          <xs:simpleType>
           <xs:restriction base="xs:double">
            <xs:minInclusive value="0"/>
           </xs:restriction>
          </xs:simpleType>
         </xs:attribute>
        </xs:complexType>
       </xs:element>
       <xs:element name="ZScore"/>
       <xs:element name="LinearScale"/>
      </xs:choice>
     </xs:complexType>
    </xs:element>
    <xs:element name="Outlier">
     <xs:complexType xdb:maintainDOM="true">
      <xs:choice>
       <xs:element name="StandardDeviation">
        <xs:complexType xdb:maintainDOM="true">
         <xs:attribute name="MultiplesSigma" default="3">
          <xs:simpleType>
           <xs:restriction base="xs:double">
            <xs:minExclusive value="0"/>
            <xs:maxExclusive value="20"/>
           </xs:restriction>
          </xs:simpleType>
         </xs:attribute>
        </xs:complexType>
       </xs:element>
       <xs:element name="Percent">
        <xs:complexType xdb:maintainDOM="true">
         <xs:attribute name="LowerPercent" default="5">
          <xs:simpleType>
           <xs:restriction base="xs:double">
            <xs:minInclusive value="0"/>
            <xs:maxInclusive value="100"/>
           </xs:restriction>
          </xs:simpleType>
         </xs:attribute>
         <xs:attribute name="UpperPercent" default="5">
          <xs:simpleType>
           <xs:restriction base="xs:double">
            <xs:minInclusive value="0"/>
            <xs:maxInclusive value="100"/>
           </xs:restriction>
          </xs:simpleType>
         </xs:attribute>
        </xs:complexType>
       </xs:element>
       <xs:element name="Value">
        <xs:complexType xdb:maintainDOM="true">
         <xs:attribute name="LowerValue" default="0">
          <xs:simpleType>
           <xs:restriction base="xs:double"/>
          </xs:simpleType>
         </xs:attribute>
         <xs:attribute name="UpperValue" default="1">
          <xs:simpleType>
           <xs:restriction base="xs:double"/>
          </xs:simpleType>
         </xs:attribute>
        </xs:complexType>
       </xs:element>
      </xs:choice>
      <xs:attribute name="ReplaceWith" default="Nulls">
       <xs:simpleType>
        <xs:restriction base="xs:string">
         <xs:enumeration value="Nulls"/>
         <xs:enumeration value="EdgeValues"/>
        </xs:restriction>
       </xs:simpleType>
      </xs:attribute>
     </xs:complexType>
    </xs:element>
    
    <xs:element name="MissingValuesNumeric">
     <xs:complexType xdb:maintainDOM="true">
      <xs:choice>
       <xs:element ref="NumericStatistic"/>
       <xs:element name="Value">
        <xs:complexType xdb:maintainDOM="true">
         <xs:attribute name="ReplaceNullsWith" default="0">
          <xs:simpleType>
           <xs:restriction base="xs:double"/>
          </xs:simpleType>
         </xs:attribute>
        </xs:complexType>
       </xs:element>
      </xs:choice>
     </xs:complexType>
    </xs:element>

    <xs:element name="MissingValuesCategorical">
     <xs:complexType xdb:maintainDOM="true">
      <xs:choice>
       <xs:element ref="CategoricalStatistic"/>
       <xs:element name="Value">
        <xs:complexType xdb:maintainDOM="true">
         <xs:attribute name="ReplaceNullsWith" default="0">
          <xs:simpleType>
           <xs:restriction base="xs:string"/>
          </xs:simpleType>
         </xs:attribute>
        </xs:complexType>
       </xs:element>
      </xs:choice>
     </xs:complexType>
    </xs:element>

    <xs:element name="MissingValuesDate">
     <xs:complexType xdb:maintainDOM="true">
      <xs:choice>
       <xs:element ref="DateStatistic"/>
       <xs:element name="Value">
        <xs:complexType xdb:maintainDOM="true">
         <xs:attribute name="ReplaceNullsWith">
          <xs:simpleType>
           <xs:restriction base="xs:date"/>
          </xs:simpleType>
         </xs:attribute>
        </xs:complexType>
       </xs:element>
      </xs:choice>
     </xs:complexType>
    </xs:element>

    <xs:element name="CustomTransformation">
     <xs:complexType xdb:maintainDOM="true">
      <xs:attribute name="Value" default="0">
       <xs:simpleType>
        <xs:restriction base="xs:string">
         <xs:minLength value="1"/>
         <xs:maxLength value="4000"/>
        </xs:restriction>
       </xs:simpleType>
      </xs:attribute>
     </xs:complexType>
    </xs:element>
    
    <xs:element name="Binning">
     <xs:complexType xdb:maintainDOM="true">
      <xs:choice>
       <xs:element name="Quantile">
        <xs:complexType xdb:maintainDOM="true">
         <xs:sequence>
          <xs:element ref="BinCount"/>
          <xs:element ref="BinGeneration"/>
          <xs:element ref="BinLabels"/>
         </xs:sequence>
        </xs:complexType>
       </xs:element>
       <xs:element name="CustomNumeric" xdb:defaultTable="">
        <xs:complexType xdb:maintainDOM="true">
          <xs:sequence>
           <xs:sequence>
            <xs:element ref="NumericBin"  maxOccurs="unbounded" minOccurs="0"/>
           </xs:sequence>
           <xs:element ref="BinLabels"/>
          </xs:sequence>
        </xs:complexType>
       </xs:element>
       <xs:element name="CustomCategorical" xdb:defaultTable="">
        <xs:complexType xdb:maintainDOM="true">
         <xs:sequence>
          <xs:element ref="CategoricalBin"  maxOccurs="unbounded" minOccurs="0"/>
         </xs:sequence>
        </xs:complexType>
       </xs:element>
       <xs:element name="EqualWidth">
        <xs:complexType xdb:maintainDOM="true">
         <xs:sequence>
          <xs:element ref="BinCount"/>
          <xs:element ref="BinGeneration"/>
          <xs:element ref="BinLabels"/>
         </xs:sequence>
        </xs:complexType>
       </xs:element>
       <xs:element name="TopN">
        <xs:complexType xdb:maintainDOM="true">
         <xs:sequence>
          <xs:element ref="BinCount"/>
          <xs:element name="Other">
           <xs:simpleType>
            <xs:restriction base="xs:string"/>
           </xs:simpleType>
          </xs:element>
         </xs:sequence>
        </xs:complexType>
       </xs:element>
      </xs:choice>
     </xs:complexType>
    </xs:element>
   </xs:choice>
  </xs:sequence>
 </xs:complexType>
 <!-- end of TransformationType-->
 
 <!-- Instance of the transformation definition -->
 <xs:element name="TransformationElementType" type="TransformationType" xdb:defaultTable=""/>
 <!-- end -->
 
 <!-- Definition of transformation source attribute-->
  <xs:complexType name="TransformationSourceAttribute" xdb:maintainDOM="true">
   <xs:complexContent>
    <xs:extension base="AttributeType">
     <xs:sequence>
      <xs:element name="IsOutput" minOccurs="1">
       <xs:simpleType>
        <xs:restriction base="xs:boolean"/>
       </xs:simpleType>
      </xs:element>
     </xs:sequence>
    </xs:extension>
   </xs:complexContent>
  </xs:complexType>
 <xs:element name="TransformationSourceAttributeType" type="TransformationSourceAttribute" xdb:defaultTable=""/>
  
 <!-- Definition of transformed attribute-->
  <xs:complexType name="TransformationOutputAttribute" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="TransformationSourceAttribute">
   <xs:sequence>
    <xs:element ref="TransformationElementType"/>
    <xs:element name="Modified" minOccurs="1">
     <xs:simpleType>
     <xs:restriction base="xs:boolean"/>
     </xs:simpleType>
    </xs:element>
    </xs:sequence>
   </xs:extension>
  </xs:complexContent>
 </xs:complexType>
 <!-- end -->
 
 <!--Maps transformed attribute to its source-->
  <xs:element name="StringCollectionNames" type="StringCollection" xdb:defaultTable=""/>
 
 <xs:complexType name="MapTransformedSource" xdb:maintainDOM="true">
  <xs:sequence>
   <xs:element name="key" type="TransformationOutputAttribute"/>
   <xs:element ref="StringCollectionNames"/>
  </xs:sequence>
 </xs:complexType>
  <!-- end -->
 <xs:element name="MapTransformedSourceType" type="MapTransformedSource" xdb:defaultTable=""/>

  <!-- Collection of transformation output attributes (each mapped to its source) -->
 <xs:element name="TransformedAttributes" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:sequence>
    <xs:element ref="MapTransformedSourceType" maxOccurs="unbounded" minOccurs="0"/>
   </xs:sequence>
  </xs:complexType>
 </xs:element>

  <!-- Collection of transformation source attributes (each mapped to its source) -->
 <xs:element name="TransformationSourceAttributes" xdb:defaultTable="">
  <xs:complexType xdb:maintainDOM="true">
   <xs:sequence>
    <xs:element ref="TransformationSourceAttributeType" maxOccurs="unbounded" minOccurs="0"/>
   </xs:sequence>
  </xs:complexType>
 </xs:element>
 
 <!-- Definition of transformation node -->
  <xs:complexType name="TransformationNodeType" xdb:maintainDOM="true">
  <xs:complexContent>
   <xs:extension base="TransformsNodeType">
    <xs:sequence>
     <xs:element ref="TransformationSourceAttributes"/>
     <xs:element ref="TransformedAttributes"/>
     <xs:element ref="SampleSettings"/>
     <xs:element name="InputStatisticTable" type="ResultType" minOccurs="0"/>
     <xs:element name="TransformedStatisticTable" type="ResultType" minOccurs="0"/>
    </xs:sequence>
  </xs:extension>
  </xs:complexContent>
</xs:complexType>
 <!-- Transformation End -->
</xs:schema>';

-- alter session was added for as a workaround for bug 9541946
alter session set events '31178 trace name context forever, level=0x400';

  DBMS_XMLSCHEMA.registerSchema(
  'http://xmlns.oracle.com/odmr11/odmr.xsd',
    schemadoc => schema1||schema2||schema3||schema4,
    local => FALSE,
    gentypes => TRUE,
    genbean => FALSE,
    gentables => TRUE,
    enablehierarchy => DBMS_XMLSCHEMA.ENABLE_HIERARCHY_NONE,
    owner => 'ODMRSYS');

  /*
  CREATE OR REPLACE DIRECTORY DM_DIR AS '<directory>';

  IF (NOT DBMS_XDB.existsResource('/sys/schemas/PUBLIC/xmlns.oracle.com/odmr11')) THEN
    res := DBMS_XDB.createFolder('/sys/schemas/PUBLIC/xmlns.oracle.com/odmr11');
    dbms_output.put_line('Create Resource Folder: /sys/schemas/PUBLIC/xmlns.oracle.com/odmr11');
  ELSE
    DBMS_XDB.DELETERESOURCE('/sys/schemas/PUBLIC/xmlns.oracle.com/odmr11/odmr.xsd');
    dbms_output.put_line('Delete Resource: /sys/schemas/PUBLIC/xmlns.oracle.com/odmr11/odmr.xsd');
  END IF;
  
  IF DBMS_XDB.CREATERESOURCE(
     abspath => '/sys/schemas/PUBLIC/xmlns.oracle.com/odmr11/odmr.xsd',
     data    => BFILENAME('DM_DIR','odmr.xsd'),
     csid    => nls_charset_id('AL32UTF8')
     )
  THEN
     DBMS_XMLSCHEMA.REGISTERSCHEMA(
        schemaurl => 'http://xmlns.oracle.com/odmr11/odmr.xsd',
        schemadoc => sys.UriFactory.getUri('/sys/schemas/PUBLIC/xmlns.oracle.com/odmr11/odmr.xsd'),
        local => FALSE,
        gentypes => TRUE,
        genbean => FALSE,
        gentables => TRUE,
        enablehierarchy => DBMS_XMLSCHEMA.ENABLE_HIERARCHY_NONE,
        owner => 'ODMRSYS'
        );
     COMMIT;
  END IF;
  */
  
END;
/