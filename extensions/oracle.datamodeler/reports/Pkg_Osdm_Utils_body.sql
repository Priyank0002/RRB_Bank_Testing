CREATE OR REPLACE PACKAGE BODY PKG_OSDM_UTILS AS

log_file   UTL_FILE.File_Type;
temp_file  UTL_FILE.File_Type;

PROCEDURE Generate_OS_File(v_blob IN BLOB, filename IN VARCHAR2, v_compressed IN NUMBER) IS

result_file     UTL_FILE.File_Type;
compressed_blob BLOB;
len             NUMBER;
l_pos           INTEGER := 1;
l_amount        BINARY_INTEGER := 32767;
l_buffer        RAW(32767);

BEGIN

 result_file := UTL_FILE.FOpen('OSDDM_REPORTS_DIR',filename,'wb', 32767); 

 len := DBMS_LOB.getlength(v_blob);
 
 IF (v_compressed = 0) THEN -- Non compressed

    WHILE l_pos < len LOOP
          DBMS_LOB.read(v_blob, l_amount, l_pos, l_buffer);
          UTL_FILE.put_raw(result_file, l_buffer, TRUE);
          l_pos := l_pos + l_amount;
    END LOOP;

 ELSIF (v_compressed = 1) THEN -- Compressed

    l_pos := 1;
    DBMS_LOB.CREATETEMPORARY(compressed_blob, TRUE);
    
    UTL_COMPRESS.Lz_Compress (v_blob, compressed_blob);
    
    len := DBMS_LOB.getlength(compressed_blob);
    WHILE l_pos < len LOOP
          DBMS_LOB.Read(compressed_blob, l_amount, l_pos, l_buffer);
          UTL_FILE.Put_Raw(result_file, l_buffer, TRUE);
          l_pos := l_pos + l_amount;
    END LOOP;

 END IF;

 UTL_FILE.fclose(result_file);
 
EXCEPTION

 WHEN others THEN
 
  IF UTL_FILE.Is_Open(result_file) THEN
     UTL_FILE.FClose(result_file);
  END IF;

  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Generate_OS_File Exception : ' || SQLERRM);  
  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Generate_OS_File Exception : ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  
END Generate_OS_File;

FUNCTION Gather_Constraint_Details_XML(col_attr_ovid VARCHAR2, namespace VARCHAR2) RETURN CLOB IS

res        CLOB;
v_vl_value VARCHAR2(50) := namespace||':VLValue';
v_s_descr  VARCHAR2(50) := namespace||':VLShortDescription';

CURSOR cur_c_constraints(v_ovid IN VARCHAR2, v_ns IN VARCHAR2) IS
 SELECT cc.text text,
        DECODE(v_ns, 'osdm_t',  XMLElement("osdm_t:DatabaseType", XMLCDATA(cc.database_type)).getClobVal(),
                     'osdm_at', XMLElement("osdm_at:DatabaseType", XMLCDATA(cc.database_type)).getClobVal(),
                     'osdm_e',  XMLElement("osdm_e:DatabaseType", XMLCDATA(cc.database_type)).getClobVal(),
                     'osdm_ae', XMLElement("osdm_ae:DatabaseType", XMLCDATA(cc.database_type)).getClobVal())  db_type,
       COUNT(cc.text) over()                                                                                  total_row_count
 FROM   dmrs_check_constraints cc
 WHERE  cc.dataelement_ovid = v_ovid
 ORDER BY sequence;
rec_c_constraints cur_c_constraints%rowtype;

CURSOR cur_vr_constraints(v_ovid IN VARCHAR2, v_ns IN VARCHAR2) IS
 SELECT DECODE(v_ns, 'osdm_t', XMLElement("osdm_t:RangeBeginValue", XMLCDATA(vr.begin_value)).getClobVal(),
                     'osdm_at',XMLElement("osdm_at:RangeBeginValue", XMLCDATA(vr.begin_value)).getClobVal(),
                     'osdm_e', XMLElement("osdm_e:RangeBeginValue", XMLCDATA(vr.begin_value)).getClobVal(),
                     'osdm_ae',XMLElement("osdm_ae:RangeBeginValue", XMLCDATA(vr.begin_value)).getClobVal())              begin_value,
        DECODE(v_ns, 'osdm_t', XMLElement("osdm_t:RangeEndValue", XMLCDATA(vr.end_value)).getClobVal(),
                     'osdm_at',XMLElement("osdm_at:RangeEndValue", XMLCDATA(vr.end_value)).getClobVal(),
                     'osdm_e', XMLElement("osdm_e:RangeEndValue", XMLCDATA(vr.end_value)).getClobVal(),
                     'osdm_ae',XMLElement("osdm_ae:RangeEndValue", XMLCDATA(vr.end_value)).getClobVal())                  end_value,
        DECODE(v_ns, 'osdm_t', XMLElement("osdm_t:RangeShortDescription", XMLCDATA(vr.short_description)).getClobVal(),  
                     'osdm_at',XMLElement("osdm_at:RangeShortDescription", XMLCDATA(vr.short_description)).getClobVal(),  
                     'osdm_e', XMLElement("osdm_e:RangeShortDescription", XMLCDATA(vr.short_description)).getClobVal(),
                     'osdm_ae',XMLElement("osdm_ae:RangeShortDescription", XMLCDATA(vr.short_description)).getClobVal())  short_description,
        COUNT(vr.begin_value) over()                                                                                      total_row_count
 FROM   dmrs_value_ranges vr
 WHERE  vr.dataelement_ovid = v_ovid
 ORDER BY sequence;
rec_vr_constraints cur_vr_constraints%rowtype;

CURSOR cur_vl_constraints(v_ovid IN VARCHAR2, v_ns IN VARCHAR2) IS
 SELECT DECODE(v_ns, 'osdm_t', XMLElement("osdm_t:VLValue", XMLCDATA(av.value)).getClobVal(),
                     'osdm_at',XMLElement("osdm_at:VLValue", XMLCDATA(av.value)).getClobVal(),
                     'osdm_e', XMLElement("osdm_e:VLValue", XMLCDATA(av.value)).getClobVal(),
                     'osdm_ae',XMLElement("osdm_ae:VLValue", XMLCDATA(av.value)).getClobVal())                         av_value,
        DECODE(v_ns, 'osdm_t', XMLElement("osdm_t:VLShortDescription", XMLCDATA(av.short_description)).getClobVal(),
                     'osdm_at',XMLElement("osdm_at:VLShortDescription", XMLCDATA(av.short_description)).getClobVal(),
                     'osdm_e', XMLElement("osdm_e:VLShortDescription", XMLCDATA(av.short_description)).getClobVal(),
                     'osdm_ae',XMLElement("osdm_ae:VLShortDescription", XMLCDATA(av.short_description)).getClobVal())  short_description,
        COUNT(av.value) over()                                                                                         total_row_count
 FROM   dmrs_avt av,
        dmrs_columns c
 WHERE  c.ovid = av.dataelement_ovid
 AND    av.dataelement_ovid = v_ovid;
rec_vl_constraints cur_vl_constraints%rowtype;

BEGIN

  DBMS_LOB.CREATETEMPORARY(res, TRUE);

  FOR rec_vr_constraints IN cur_vr_constraints(col_attr_ovid, namespace) LOOP
     IF (cur_vr_constraints%ROWCOUNT = 1) THEN
       DBMS_LOB.APPEND (res, '<'||namespace||':RangesCollection>');
     END IF;

       DBMS_LOB.APPEND (res, '<'||namespace||':RangeDetails>');
       DBMS_LOB.APPEND (res, rec_vr_constraints.begin_value);
       DBMS_LOB.APPEND (res, rec_vr_constraints.end_value);
       DBMS_LOB.APPEND (res, rec_vr_constraints.short_description);
       DBMS_LOB.APPEND (res, '</'||namespace||':RangeDetails>');
    
     IF (cur_vr_constraints%ROWCOUNT = rec_vr_constraints.total_row_count) THEN
       DBMS_LOB.APPEND (res, '</'||namespace||':RangesCollection>');
     END IF;
  END LOOP;
 
  FOR rec_vl_constraints IN cur_vl_constraints(col_attr_ovid, namespace) LOOP
     IF (cur_vl_constraints%ROWCOUNT = 1) THEN
       DBMS_LOB.APPEND (res, '<'||namespace||':ValueListsCollection>');
     END IF;
   
       DBMS_LOB.APPEND (res, '<'||namespace||':ValueListDetails>');
       DBMS_LOB.APPEND (res, rec_vl_constraints.av_value);
       DBMS_LOB.APPEND (res, rec_vl_constraints.short_description);
       DBMS_LOB.APPEND (res, '</'||namespace||':ValueListDetails>');
     
     IF (cur_vl_constraints%ROWCOUNT = rec_vl_constraints.total_row_count) THEN
       DBMS_LOB.APPEND (res, '</'||namespace||':ValueListsCollection>');
     END IF;
  END LOOP;

  FOR rec_c_constraints IN cur_c_constraints(col_attr_ovid, namespace) LOOP
     IF (cur_c_constraints%ROWCOUNT = 1) THEN
       DBMS_LOB.APPEND (res, '<'||namespace||':CheckConstraintsCollection>');
     END IF;

       DBMS_LOB.APPEND (res, '<'||namespace||':CheckConstraintDetails>');

     IF LENGTH(rec_c_constraints.text)>0 THEN
       DBMS_LOB.APPEND (res, '<'||namespace||':CheckConstraintText>');
       DBMS_LOB.APPEND (res, '<'||namespace||':CheckConstraintTextDetails>');
       -- Tokenize rows
       FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(XMLCDATA(rec_c_constraints.text) || Chr(10), '(.*' || Chr(10) || ')', 1, LEVEL ), Chr(10), '') t
                      FROM   dual
                      CONNECT BY REGEXP_INSTR(rec_c_constraints.text||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
     
         DBMS_LOB.APPEND (res, '<'||namespace||':CheckConstraintTextRow>');
         DBMS_LOB.APPEND (res, TO_CLOB(NVL(token.t,' ')));
         DBMS_LOB.APPEND (res, '</'||namespace||':CheckConstraintTextRow>');
     
       END LOOP;
       DBMS_LOB.APPEND (res, '</'||namespace||':CheckConstraintTextDetails>');
       DBMS_LOB.APPEND (res, '</'||namespace||':CheckConstraintText>');
     END IF;
    
       DBMS_LOB.APPEND (res, rec_c_constraints.db_type);
       DBMS_LOB.APPEND (res, '</'||namespace||':CheckConstraintDetails>');
   
     IF (cur_c_constraints%ROWCOUNT = rec_c_constraints.total_row_count) THEN
       DBMS_LOB.APPEND (res, '</'||namespace||':CheckConstraintsCollection>');
     END IF;
  END LOOP;

  RETURN res;

EXCEPTION
 WHEN others THEN
  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Gather_Constraint_Details_XML Exception : : ' || SQLERRM);  
  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Gather_Constraint_Details_XML Exception : ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  RETURN res;

END Gather_Constraint_Details_XML;

FUNCTION Gather_SingleTable_Data(v_table_ovid IN VARCHAR2) RETURN CLOB IS 

res             CLOB;
v_description   VARCHAR2(32767);
v_notes         VARCHAR2(32767);
v_cc_created    BOOLEAN := FALSE;
token_value     CLOB;

-- Common Data
CURSOR cur_common_data(v_t_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_t:DesignName",d.design_name).getClobVal()                                      design_name,
        XMLElement("osdm_t:VersionDate",TO_CHAR(d.date_published,'dd.mm.yyyy hh24:mi:ss')).getClobVal() version_date,
        d.version_comments                                                                              version_comment,
        XMLElement("osdm_t:ModelName",m.model_name).getClobVal()                                        model_name
 FROM   dmrs_designs d, 
        dmrs_models m,
        dmrs_tables t
 WHERE  d.design_ovid = m.design_ovid
 AND   t.model_ovid = m.model_ovid
 AND   t.ovid = v_t_ovid;
rec_common_data cur_common_data%ROWTYPE;

-- Table General Data
CURSOR cur_table(v_t_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_t:TableName",t.table_name).getClobVal()                                 table_name,
        XMLElement("osdm_t:Abbreviation",t.abbreviation).getClobVal()                            abbreviation,
        XMLElement("osdm_t:ClassificationTypeName",t.classification_type_name).getClobVal()      class_type_name,
        XMLElement("osdm_t:ObjectTypeName",t.structured_type_name).getClobVal()                  obj_type_name,
        XMLElement("osdm_t:NumberOfColumns",t.number_data_elements).getClobVal()                 number_cols,
        XMLElement("osdm_t:NumberOfRowsMin",t.min_volume).getClobVal()                           number_rows_min,
        XMLElement("osdm_t:NumberOfRowsMax",t.max_volume).getClobVal()                           number_rows_max,
        XMLElement("osdm_t:ExpectedNumberOfRows",t.expected_volume).getClobVal()                 number_rows_expected,
        XMLElement("osdm_t:ExpectedGrowth",t.growth_rate_percents).getClobVal()                  growth_expected,
        XMLElement("osdm_t:GrowthInterval",t.growth_rate_interval).getClobVal()                  growth_interval,
        XMLElement("osdm_t:FunctionalName", (SELECT NVL(e.entity_name,'')                        
                                              FROM   dmrs_entities e,
                                                     dmrs_mappings m
                                              WHERE  m.relational_object_ovid = t.ovid
                                              AND    m.logical_object_ovid  = e.ovid
                                              AND    ROWNUM = 1)).getClobVal()                    functional_name
 FROM	 dmrs_tables t
 WHERE  t.ovid = v_t_ovid
 ORDER BY t.table_name;
rec_table cur_table%ROWTYPE;

-- Columns Data
CURSOR cur_columns(v_t_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_t:Sequence",c.sequence).getClobVal()                                                                                              seq,
        XMLElement("osdm_t:ColumnName",c.column_name).getClobVal()                                                                                         column_name,
        XMLElement("osdm_t:PK",c.pk_flag).getClobVal()                                                                                                     pk,
        XMLElement("osdm_t:FK",c.fk_flag).getClobVal()                                                                                                     fk,
        XMLElement("osdm_t:M",DECODE(c.mandatory,'N',' ',c.mandatory)).getClobVal()                                                                        m,
        XMLElement("osdm_t:DataTypeKind",DECODE(c.datatype_kind,                                                                                           
                                                 'Domain',         'DOM',
                                                 'Logical Type',   'LT',
                                                 'Distinct Type',  'DT',
                                                 'Ref Struct Type','RST',
                                                 'Structured Type','ST',
                                                 'Collection Type','CT')
                  ).getClobVal()                                                                                                                             dt_kind,
         XMLElement("osdm_t:DataType", 
            DECODE(c.datatype_kind, 
                  'Domain', c.logical_type_name ||' '||
                           DECODE (NVL(c.t_size,0),0,
                              DECODE(NVL(c.t_scale,0),0,
                                 DECODE(NVL(c.t_precision,0),0,null,'('|| DECODE(NVL(c.t_precision,0),0,null,c.t_precision) ||')'),
                                   '('|| DECODE(NVL(c.t_precision,0),0,null,c.t_precision) || ',' || DECODE(NVL(c.t_scale,0),0,null,c.t_scale)||')'),
                                   '('||TRIM(DECODE(c.t_size,0,null,c.t_size||' '||c.char_units ))||')'),
                   'Logical Type', c.logical_type_name  ||' '|| 
                           DECODE (NVL(c.t_size,0),0,
                              DECODE(NVL(c.t_scale,0),0,
                                 DECODE(NVL(c.t_precision,0),0,null,'('|| DECODE(NVL(c.t_precision,0),0,null,c.t_precision) ||')'),
                                   '('|| DECODE(NVL(c.t_precision,0),0,null,c.t_precision) || ',' || DECODE(NVL(c.t_scale,0),0,null,c.t_scale)||')'),
                                   '('||TRIM(DECODE(c.t_size,0,null,c.t_size||' '||c.char_units ))||')')
            ) ||
            DECODE (c.auto_increment_column,'Y', ' - AI','') ||
            DECODE (c.identity_column,'Y', ' - ID','')
          ).getClobVal()                                                                                                                                    data_type,
        XMLElement("osdm_t:DomainName",DECODE(c.domain_name,'Unknown',null,c.domain_name)).getClobVal()                                                     domain_name,
        XMLElement("osdm_t:Formula",DECODE(c.formula,null,c.default_value,c.formula)).getClobVal()                                                          formula,
        XMLElement("osdm_t:Security",DECODE(c.personally_id_information ||'/'||c.sensitive_information||'/'||c.mask_for_none_production,'//',
                                      null,c.personally_id_information ||'/'||c.sensitive_information||'/'||c.mask_for_none_production)).getClobVal()       security,
        XMLElement("osdm_t:PreferredAbbreviation",c.abbreviation).getClobVal()                                                                              abbreviation,
        COUNT(c.column_name) over()                                                                                                                         total_row_count
 FROM 	dmrs_columns c
 WHERE  c.container_ovid = v_t_ovid
 ORDER BY c.sequence;
rec_columns cur_columns%ROWTYPE;

-- Columns Comments Data
CURSOR cur_columns_comments(v_t_ovid IN VARCHAR2) IS
 SELECT a.seq                       seq, 
        a.column_name               column_name, 
        a.description               description, 
        a.notes                     notes,
        COUNT(a.column_name) over() total_row_count
 FROM (
  SELECT XMLElement("osdm_t:ColumnCommentsSequence",c.sequence).getStringVal()  seq,
         XMLElement("osdm_t:ColumnCommentsName",c.column_name).getStringVal()   column_name,
         NVL(
        (SELECT t.text comments_in_rdbms
         FROM   dmrs_large_text t
         WHERE  t.ovid = c.ovid
         AND    t.type='Comments'),
        (SELECT t.text comments_in_rdbms
         FROM   dmrs_large_text t
         WHERE  t.ovid = c.ovid
         AND    t.type='CommentsInRDBMS'))                                       description, 
        (SELECT t.text comments_in_rdbms
         FROM   dmrs_large_text t
         WHERE  t.ovid = c.ovid
         AND    t.type='Note')                                                   notes
  FROM   dmrs_columns c
  WHERE  c.container_ovid = v_t_ovid
  ORDER BY c.sequence
 ) a
 WHERE DBMS_LOB.getlength(description) > 0 OR DBMS_LOB.getlength(notes) > 0;
rec_columns_comments cur_columns_comments%ROWTYPE;

--Indexes
CURSOR cur_indexes(v_t_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_t:IndexName",i.index_name).getClobVal()                                                                                        idx_name,
        XMLElement("osdm_t:IndexState",DECODE(i.state,'Unique Plain Index','UN','Unique Constraint','UK','Primary Constraint','PK',null)).getClobVal()  state,
        XMLElement("osdm_t:IndexFunctional",DECODE(i.functional,'N',' ',i.functional)).getClobVal()                                                     functional,
        XMLElement("osdm_t:IndexSpatial",DECODE(i.spatial_index,'N',' ',i.spatial_index)).getClobVal()                                                  spatial,
        XMLElement("osdm_t:IndexExpression",i.expression).getClobVal()                                                                                  expression,
        XMLElement("osdm_t:IndexColumnName",c.column_name).getClobVal()                                                                                 col_name,
        XMLElement("osdm_t:IndexSortOrder",c.sort_order).getClobVal()                                                                                   sort_order,
        c.sequence                                                                                                                                      idx_sequence,
        COUNT(c.column_name) over()                                                                                                                     total_row_count
 FROM   dmrs_tables t,
        dmrs_indexes i,
        dmrs_constr_index_columns c
 WHERE  t.ovid = i.container_ovid
 AND    i.ovid = c.index_ovid
 AND    t.ovid = v_t_ovid
 ORDER BY i.index_name, c.sequence, c.sort_order;
rec_indexes cur_indexes%ROWTYPE;

-- Table Level Constraints
CURSOR cur_tl_constraints(v_t_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_t:TLConstraintType", CASE WHEN rownum>1 THEN ''
                                               ELSE 'Table Level'
                                               END ).getClobVal()               c_type,
        XMLElement("osdm_t:TLConstraintName", tc.constraint_name).getClobVal() c_name,
        tc.text                                                                 c_details,
        COUNT(tc.constraint_name) over()                                        total_row_count
 FROM   dmrs_table_constraints tc
 WHERE  tc.table_ovid = v_t_ovid;
rec_tl_constraints cur_tl_constraints%ROWTYPE;

-- Column Level Constraints
CURSOR cur_cl_constraints(v_t_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_t:ContstraintType", CASE WHEN rownum>1 THEN ''
                                              ELSE 'Column Level'
                                              END).getClobVal()                                        c_type,
        XMLElement("osdm_t:ALCConstraintName", c.column_name || 
                                                DECODE((SELECT DISTINCT(constraint_name) 
                                                        FROM dmrs_check_constraints 
                                                        WHERE c.ovid = dataelement_ovid),NULL,'',
                                               ' / '|| (SELECT  DISTINCT(constraint_name) 
                                                        FROM dmrs_check_constraints 
                                                        WHERE c.ovid = dataelement_ovid))).getClobVal() c_name,
        Gather_Constraint_Details_XML(c.ovid, 'osdm_t')                                                 c_details,
        COUNT(c.column_name) over()                                                                     total_row_count
 FROM   dmrs_columns c
 WHERE  c.container_ovid = v_t_ovid
 AND    (c.ovid IN (SELECT dataelement_ovid FROM dmrs_avt) OR 
         c.ovid IN (SELECT dataelement_ovid FROM dmrs_value_ranges) OR 
         c.ovid IN (SELECT dataelement_ovid FROM dmrs_check_constraints));
rec_cl_constraints cur_cl_constraints%ROWTYPE;

--Foreign keys referring to other tables
CURSOR cur_fk_referring_to(v_t_ovid IN VARCHAR2) IS
 SELECT /*+ index(fk FOREIGNKEYS_CHILD_T_IDX) */
        XMLElement("osdm_t:FKName",CASE WHEN ic.sequence>1 THEN ' '
                                    ELSE fk.fk_name
                                    END
                   ).getClobVal()                                               fk_name,
        XMLElement("osdm_t:FKReferingTo",CASE WHEN ic.sequence>1 THEN ' '
                                          ELSE fk.referred_table_name
                                          END
                  ).getClobVal()                                                referring_to,
        XMLElement("osdm_t:FKReferedFrom",'').getClobVal()                     referred_from,
        XMLElement("osdm_t:FKMandatory",CASE WHEN ic.sequence>1 THEN ' '
                                         ELSE DECODE(fk.mandatory,'Y',fk.mandatory,' ')
                                         END
                  ).getClobVal()                                                mandatory,
        XMLElement("osdm_t:FKTransferable",CASE WHEN ic.sequence>1 THEN ' '
                                            ELSE DECODE(fk.transferable,'Y',fk.transferable,' ')
                                            END
                  ).getClobVal()                                                transferable,
        XMLElement("osdm_t:FKInArc",CASE WHEN ic.sequence>1 THEN ' '
                                     ELSE DECODE(fk.in_arc,'Y',fk.in_arc,' ')
                                     END
                  ).getClobVal()                                                in_arc,
        XMLElement("osdm_t:FKColumnName",ic.column_name).getClobVal()          col_name,
        ic.sequence                                                             seq,
        COUNT(ic.column_name) over()                                            total_row_count
 FROM   dmrs_foreignkeys fk,
        dmrs_constr_index_columns ic
 WHERE  fk.child_table_ovid = v_t_ovid
 AND    fk.ovid = ic.index_ovid
 ORDER BY fk.referred_table_name,fk.fk_name, ic.sequence;
rec_fk_referring_to cur_fk_referring_to%ROWTYPE;

--Foreign keys referring from other tables
CURSOR cur_fk_referred_from(v_t_ovid IN VARCHAR2) IS
 SELECT /*+ index(fk FOREIGNKEYS_PARENT_T_IDX) */
        XMLElement("osdm_t:FKName",CASE WHEN ic.sequence>1 THEN ' '
                                    ELSE fk.fk_name
                                    END
                   ).getClobVal()                                              fk_name,
        XMLElement("osdm_t:FKReferingTo",'').getClobVal()                      referring_to,
        XMLElement("osdm_t:FKReferedFrom",CASE WHEN ic.sequence>1 THEN ' '
                                           ELSE fk.child_table_name
                                           END
                  ).getClobVal()                                                referred_from,
        XMLElement("osdm_t:FKMandatory",CASE WHEN ic.sequence>1 THEN ' '
                                         ELSE DECODE(fk.mandatory,'Y',fk.mandatory,' ')
                                         END
                  ).getClobVal()                                                mandatory,
        XMLElement("osdm_t:FKTransferable",CASE WHEN ic.sequence>1 THEN ' '
                                            ELSE DECODE(fk.transferable,'Y',fk.transferable,' ')
                                            END
                  ).getClobVal()                                                transferable,
        XMLElement("osdm_t:FKInArc",CASE WHEN ic.sequence>1 THEN ' '
                                     ELSE DECODE(fk.in_arc,'Y',fk.in_arc,' ')
                                     END
                  ).getClobVal()                                                in_arc,
        XMLElement("osdm_t:FKColumnName",ic.column_name).getClobVal()           col_name,
        ic.sequence                                                             seq,
        COUNT(ic.column_name) over()                                            total_row_count
 FROM   dmrs_foreignkeys fk,
        dmrs_constr_index_columns ic
 WHERE  fk.referred_table_ovid = v_t_ovid
 AND    fk.ovid = ic.index_ovid
 ORDER BY fk.child_table_name,fk.fk_name, ic.sequence;
rec_fk_referred_from cur_fk_referred_from%ROWTYPE;

BEGIN

  UTL_FILE.PUT_LINE(log_file, TO_CHAR(SYSDATE,'yy.mm.dd hh:mi:ss') ||' '|| 'Gathering single table data started ...');

   DBMS_LOB.CREATETEMPORARY(res, TRUE);
   DBMS_LOB.APPEND (res,'<osdm_t:root xmlns:osdm_t="osdm_t">');

   -- Common Data
   FOR rec_common_data IN cur_common_data(v_table_ovid) LOOP

      DBMS_LOB.APPEND (res, rec_common_data.design_name);
      DBMS_LOB.APPEND (res, rec_common_data.version_date);  
      DBMS_LOB.APPEND (res, '<osdm_t:VersionComment>');
      DBMS_LOB.APPEND (res, '<osdm_t:VersionCommentDetails>');
      -- Tokenize rows
      FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(rec_common_data.version_comment||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                     FROM   dual
                     CONNECT BY REGEXP_INSTR(rec_common_data.version_comment||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
 
          SELECT XMLElement("osdm_t:VersionCommentRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
          DBMS_LOB.APPEND (res, token_value);
      END LOOP;
      DBMS_LOB.APPEND (res, '</osdm_t:VersionCommentDetails>');
      DBMS_LOB.APPEND (res, '</osdm_t:VersionComment>');
      DBMS_LOB.APPEND (res, rec_common_data.model_name);
 
   END LOOP;

   -- Description / Notes
   SELECT 
         NVL(
            (SELECT t.text comments_in_rdbms
             FROM   dmrs_large_text t
             WHERE  t.ovid = v_table_ovid
             AND    t.type='Comments'),
            (SELECT t.text comments_in_rdbms
             FROM   dmrs_large_text t
             WHERE  t.ovid = v_table_ovid
             AND    t.type='CommentsInRDBMS'))        description, 
            (SELECT t.text comments_in_rdbms
             FROM   dmrs_large_text t
             WHERE  t.ovid = v_table_ovid
             AND    t.type='Note')                     notes
   INTO   v_description, 
          v_notes
   FROM  dual;

   DBMS_LOB.APPEND (res, '<osdm_t:Description>');
   DBMS_LOB.APPEND (res, '<osdm_t:DescriptionDetails>');
   -- Tokenize rows
   FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(v_description||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                  FROM   dual
                  CONNECT BY REGEXP_INSTR(v_description||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
       SELECT XMLElement("osdm_t:DescriptionRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
       DBMS_LOB.APPEND (res, token_value);
   END LOOP;
   DBMS_LOB.APPEND (res, '</osdm_t:DescriptionDetails>');
   DBMS_LOB.APPEND (res, '</osdm_t:Description>');
   
   DBMS_LOB.APPEND (res, '<osdm_t:Notes>');
   DBMS_LOB.APPEND (res, '<osdm_t:NotesDetails>');
   -- Tokenize rows
   FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(v_notes||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                  FROM   dual
                  CONNECT BY REGEXP_INSTR(v_notes||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
       SELECT XMLElement("osdm_t:NoteRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
       DBMS_LOB.APPEND (res, token_value);
   END LOOP;
   DBMS_LOB.APPEND (res, '</osdm_t:NotesDetails>');
   DBMS_LOB.APPEND (res, '</osdm_t:Notes>');

   --Table General Data
   FOR rec_table IN cur_table(v_table_ovid) LOOP
      DBMS_LOB.APPEND (res, rec_table.table_name);
      DBMS_LOB.APPEND (res, rec_table.functional_name);      
      DBMS_LOB.APPEND (res, rec_table.abbreviation);
      DBMS_LOB.APPEND (res, rec_table.class_type_name);
      DBMS_LOB.APPEND (res, rec_table.obj_type_name);
      DBMS_LOB.APPEND (res, rec_table.number_cols);
      DBMS_LOB.APPEND (res, rec_table.number_rows_min);
      DBMS_LOB.APPEND (res, rec_table.number_rows_max);
      DBMS_LOB.APPEND (res, rec_table.number_rows_expected);
      DBMS_LOB.APPEND (res, rec_table.growth_expected);
      DBMS_LOB.APPEND (res, rec_table.growth_interval);
   END LOOP;

   -- Columns
   FOR rec_columns IN cur_columns(v_table_ovid) LOOP
      IF (cur_columns%ROWCOUNT = 1) THEN
        DBMS_LOB.APPEND (res,'<osdm_t:ColumnsCollection>');
      END IF;
      
        DBMS_LOB.APPEND (res, '<osdm_t:ColumnDetails>');
        DBMS_LOB.APPEND (res, rec_columns.seq);
        DBMS_LOB.APPEND (res, rec_columns.column_name);
        DBMS_LOB.APPEND (res, rec_columns.pk);
        DBMS_LOB.APPEND (res, rec_columns.fk);
        DBMS_LOB.APPEND (res, rec_columns.m);
        DBMS_LOB.APPEND (res, rec_columns.data_type);
        DBMS_LOB.APPEND (res, rec_columns.dt_kind);
        DBMS_LOB.APPEND (res, rec_columns.domain_name);
        DBMS_LOB.APPEND (res, rec_columns.formula);
        DBMS_LOB.APPEND (res, rec_columns.security);
        DBMS_LOB.APPEND (res, rec_columns.abbreviation);
        DBMS_LOB.APPEND (res,'</osdm_t:ColumnDetails>');
      
      IF (cur_columns%ROWCOUNT = rec_columns.total_row_count) THEN
       DBMS_LOB.APPEND (res, '</osdm_t:ColumnsCollection>');
      END IF;
   END LOOP;

   -- Columns Comments
   FOR rec_columns_comments IN cur_columns_comments(v_table_ovid) LOOP
      IF (cur_columns_comments%ROWCOUNT = 1) THEN
        DBMS_LOB.APPEND (res,'<osdm_t:ColumnsCommentsCollection>');
      END IF;
      
        DBMS_LOB.APPEND (res, '<osdm_t:ColumnCommentsDetails>');
        DBMS_LOB.APPEND (res, rec_columns_comments.seq);
        DBMS_LOB.APPEND (res, rec_columns_comments.column_name);
      
        DBMS_LOB.APPEND (res, '<osdm_t:ColumnDescription>');
        DBMS_LOB.APPEND (res, '<osdm_t:ColumnDescriptionDetails>');
        -- Tokenize rows
        FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(rec_columns_comments.description||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                         FROM   dual
                         CONNECT BY REGEXP_INSTR(rec_columns_comments.description||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
            SELECT XMLElement("osdm_t:ColumnDescriptionRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
            DBMS_LOB.APPEND (res, token_value);
        END LOOP;
        DBMS_LOB.APPEND (res, '</osdm_t:ColumnDescriptionDetails>');
        DBMS_LOB.APPEND (res, '</osdm_t:ColumnDescription>');
      
        DBMS_LOB.APPEND (res, '<osdm_t:ColumnNotes>');
        DBMS_LOB.APPEND (res, '<osdm_t:ColumnNotesDetails>');
        -- Tokenize rows
        FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(rec_columns_comments.notes||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                         FROM   dual
                         CONNECT BY REGEXP_INSTR(rec_columns_comments.notes||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
            SELECT XMLElement("osdm_t:ColumnNoteRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
            DBMS_LOB.APPEND (res, token_value);
        END LOOP;
        DBMS_LOB.APPEND (res, '</osdm_t:ColumnNotesDetails>');
        DBMS_LOB.APPEND (res, '</osdm_t:ColumnNotes>');

        DBMS_LOB.APPEND (res,'</osdm_t:ColumnCommentsDetails>');

      IF (cur_columns_comments%ROWCOUNT = rec_columns_comments.total_row_count) THEN
        DBMS_LOB.APPEND (res, '</osdm_t:ColumnsCommentsCollection>');
      END IF;
   END LOOP;

   -- Indexes
   FOR rec_indexes IN cur_indexes(v_table_ovid) LOOP
      IF (cur_indexes%ROWCOUNT = 1) THEN
        DBMS_LOB.APPEND (res,'<osdm_t:IndexesCollection>');
      END IF;

        DBMS_LOB.APPEND (res, '<osdm_t:IndexDetails>');
        DBMS_LOB.APPEND (res, rec_indexes.idx_name);
        DBMS_LOB.APPEND (res, rec_indexes.state);
        DBMS_LOB.APPEND (res, rec_indexes.functional);
        DBMS_LOB.APPEND (res, rec_indexes.spatial);
        DBMS_LOB.APPEND (res, rec_indexes.expression);
        DBMS_LOB.APPEND (res, rec_indexes.col_name);
        DBMS_LOB.APPEND (res, rec_indexes.sort_order);
        DBMS_LOB.APPEND (res,'</osdm_t:IndexDetails>');

      IF (cur_indexes%ROWCOUNT = rec_indexes.total_row_count) THEN
       DBMS_LOB.APPEND (res, '</osdm_t:IndexesCollection>');
      END IF;
   END LOOP;

   v_cc_created := FALSE;
   -- Table Level Constraints
   FOR rec_tl_constraints IN cur_tl_constraints(v_table_ovid) LOOP
      IF (cur_tl_constraints%ROWCOUNT = 1) THEN
        DBMS_LOB.APPEND (res,'<osdm_t:ConstraintsCollection>');
        v_cc_created := TRUE;
        DBMS_LOB.APPEND (res,'<osdm_t:TableLevelConstraintsCollection>');
      END IF;

        DBMS_LOB.APPEND (res, '<osdm_t:TableLevelConstraintDetails>');
        DBMS_LOB.APPEND (res, rec_tl_constraints.c_type);
        DBMS_LOB.APPEND (res, rec_tl_constraints.c_name);

        DBMS_LOB.APPEND (res, '<osdm_t:TLConstraintRule>');
        DBMS_LOB.APPEND (res, '<osdm_t:TLConstraintRuleDetails>');
        -- Tokenize rows
         FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR( rec_tl_constraints.c_details||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                        FROM   dual
                        CONNECT BY REGEXP_INSTR(rec_tl_constraints.c_details||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
             SELECT XMLElement("osdm_t:TLConstraintRuleRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
             DBMS_LOB.APPEND (res, token_value);
         END LOOP;
         DBMS_LOB.APPEND (res, '</osdm_t:TLConstraintRuleDetails>');       
         DBMS_LOB.APPEND (res, '</osdm_t:TLConstraintRule>');

         DBMS_LOB.APPEND (res, '</osdm_t:TableLevelConstraintDetails>');

      IF (cur_tl_constraints%ROWCOUNT = rec_tl_constraints.total_row_count) THEN
        DBMS_LOB.APPEND (res, '</osdm_t:TableLevelConstraintsCollection>');
      END IF;
   
   END LOOP;

   -- Column Level Constraints
   FOR rec_cl_constraints IN cur_cl_constraints(v_table_ovid) LOOP
      IF (cur_cl_constraints%ROWCOUNT = 1) THEN
        IF NOT v_cc_created THEN
           DBMS_LOB.APPEND (res,'<osdm_t:ConstraintsCollection>');
           v_cc_created := TRUE;
        END IF;

       DBMS_LOB.APPEND (res,'<osdm_t:ColumnLevelConstraintsCollection>');
       v_cc_created := TRUE;
      END IF;
     
       DBMS_LOB.APPEND (res, '<osdm_t:ConstraintDetails>');
       DBMS_LOB.APPEND (res, rec_cl_constraints.c_type);
       DBMS_LOB.APPEND (res, rec_cl_constraints.c_name);
       DBMS_LOB.APPEND (res, rec_cl_constraints.c_details);
       DBMS_LOB.APPEND (res,'</osdm_t:ConstraintDetails>');

      IF (cur_cl_constraints%ROWCOUNT = rec_cl_constraints.total_row_count) THEN
        DBMS_LOB.APPEND (res, '</osdm_t:ColumnLevelConstraintsCollection>');
      END IF;
   END LOOP;

   IF v_cc_created THEN
     DBMS_LOB.APPEND (res,'</osdm_t:ConstraintsCollection>');
   END IF;

   v_cc_created := FALSE;

   -- Foreign Keys Referring To
   FOR rec_fk_referring_to IN cur_fk_referring_to(v_table_ovid) LOOP
      IF (cur_fk_referring_to%ROWCOUNT = 1) THEN
        DBMS_LOB.APPEND (res,'<osdm_t:FKCollection>');
        v_cc_created := TRUE;
      END IF;

       DBMS_LOB.APPEND (res, '<osdm_t:FKDetails>');
       DBMS_LOB.APPEND (res, rec_fk_referring_to.fk_name);
       DBMS_LOB.APPEND (res, rec_fk_referring_to.referring_to);
       DBMS_LOB.APPEND (res, rec_fk_referring_to.referred_from);
       DBMS_LOB.APPEND (res, rec_fk_referring_to.mandatory);
       DBMS_LOB.APPEND (res, rec_fk_referring_to.transferable);
       DBMS_LOB.APPEND (res, rec_fk_referring_to.in_arc);
       DBMS_LOB.APPEND (res, rec_fk_referring_to.col_name);
       DBMS_LOB.APPEND (res,'</osdm_t:FKDetails>');
   
   END LOOP;

   -- Foreign Keys Referring From
   FOR rec_fk_referred_from IN cur_fk_referred_from(v_table_ovid) LOOP
      IF (cur_fk_referred_from%ROWCOUNT = 1) THEN
        IF NOT v_cc_created THEN 
          DBMS_LOB.APPEND (res,'<osdm_t:FKCollection>');
          v_cc_created := TRUE;
        END IF;
      END IF;
     
       DBMS_LOB.APPEND (res, '<osdm_t:FKDetails>');
       DBMS_LOB.APPEND (res, rec_fk_referred_from.fk_name);
       DBMS_LOB.APPEND (res, rec_fk_referred_from.referring_to);
       DBMS_LOB.APPEND (res, rec_fk_referred_from.referred_from);
       DBMS_LOB.APPEND (res, rec_fk_referred_from.mandatory);
       DBMS_LOB.APPEND (res, rec_fk_referred_from.transferable);
       DBMS_LOB.APPEND (res, rec_fk_referred_from.in_arc);
       DBMS_LOB.APPEND (res, rec_fk_referred_from.col_name);
       DBMS_LOB.APPEND (res,'</osdm_t:FKDetails>');
   
   END LOOP;
   
   IF v_cc_created THEN 
      DBMS_LOB.APPEND (res, '</osdm_t:FKCollection>');
   END IF;

   DBMS_LOB.APPEND (res,'</osdm_t:root>');

  UTL_FILE.PUT_LINE(log_file, TO_CHAR(SYSDATE,'yy.mm.dd hh:mi:ss') ||' '|| 'Gathering single table data ended');

RETURN res;

 EXCEPTION
 WHEN others THEN
  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Gather_SingleTable_Data Exception : ' || SQLERRM);  
  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Gather_SingleTable_Data Exception : ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  RETURN res;
	
END Gather_SingleTable_Data;

FUNCTION Gather_AllTables_Data(v_model_ovid IN VARCHAR2) RETURN CLOB IS 

res             CLOB;
v_description   VARCHAR2(32767);
v_notes         VARCHAR2(32767);
v_cc_created    BOOLEAN := FALSE;
token_value     CLOB;

-- Common Data
CURSOR cur_common_data(v_m_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_at:DesignName",d.design_name).getClobVal()                                      design_name,
        XMLElement("osdm_at:VersionDate",TO_CHAR(d.date_published,'dd.mm.yyyy hh24:mi:ss')).getClobVal() version_date,
        d.version_comments                                                                               version_comment,
        XMLElement("osdm_at:ModelName",m.model_name).getClobVal()                                        model_name
 FROM   dmrs_designs d, 
        dmrs_models m
 WHERE  d.design_ovid = m.design_ovid
 AND    m.model_ovid = v_m_ovid;
rec_common_data cur_common_data%ROWTYPE;

-- All Tables General Data
CURSOR cur_all_tables(v_m_ovid IN VARCHAR2) IS
 SELECT /*+ index(t TABLES_FK_IDXV1) */
        XMLElement("osdm_at:TableName",t.table_name).getClobVal()                                 table_name,
        XMLElement("osdm_at:Abbreviation",t.abbreviation).getClobVal()                            abbreviation,
        XMLElement("osdm_at:ClassificationTypeName",t.classification_type_name).getClobVal()      class_type_name,
        XMLElement("osdm_at:ObjectTypeName",t.structured_type_name).getClobVal()                  obj_type_name,
        XMLElement("osdm_at:NumberOfColumns",t.number_data_elements).getClobVal()                 number_cols,
        XMLElement("osdm_at:NumberOfRowsMin",t.min_volume).getClobVal()                           number_rows_min,
        XMLElement("osdm_at:NumberOfRowsMax",t.max_volume).getClobVal()                           number_rows_max,
        XMLElement("osdm_at:ExpectedNumberOfRows",t.expected_volume).getClobVal()                 number_rows_expected,
        XMLElement("osdm_at:ExpectedGrowth",t.growth_rate_percents).getClobVal()                  growth_expected,
        XMLElement("osdm_at:GrowthInterval",t.growth_rate_interval).getClobVal()                  growth_interval,
        XMLElement("osdm_at:FunctionalName", (SELECT NVL(e.entity_name,'')                        
                                              FROM   dmrs_entities e,
                                                     dmrs_mappings m
                                              WHERE  m.relational_object_ovid = t.ovid
                                              AND    m.logical_object_ovid  = e.ovid
                                              AND    ROWNUM = 1)).getClobVal()                    functional_name, 
       t.ovid                                                                                     table_ovid,
       COUNT(t.table_name) over()                                                                 total_row_count
 FROM 	 dmrs_tables t
 WHERE  t.model_ovid = v_m_ovid
 ORDER BY t.table_name;
rec_all_tables cur_all_tables%ROWTYPE;

-- Columns Data
CURSOR cur_columns(v_t_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_at:Sequence",c.sequence).getClobVal()                                                                                              seq,
        XMLElement("osdm_at:ColumnName",c.column_name).getClobVal()                                                                                         column_name,
        XMLElement("osdm_at:PK",c.pk_flag).getClobVal()                                                                                                     pk,
        XMLElement("osdm_at:FK",c.fk_flag).getClobVal()                                                                                                     fk,
        XMLElement("osdm_at:M",DECODE(c.mandatory,'N',' ',c.mandatory)).getClobVal()                                                                        m,
        XMLElement("osdm_at:DataTypeKind",DECODE(c.datatype_kind,                                                                                           
                                                 'Domain',         'DOM',                                                                                   
                                                 'Logical Type',   'LT',                                                                                    
                                                 'Distinct Type',  'DT',                                                                                    
                                                 'Ref Struct Type','RST',                                                                                   
                                                 'Structured Type','ST',                                                                                    
                                                 'Collection Type','CT')                                                                                    
                  ).getClobVal()                                                                                                                             dt_kind,
         XMLElement("osdm_at:DataType", 
            DECODE(c.datatype_kind, 
                  'Domain', c.logical_type_name ||' '||
                           DECODE (NVL(c.t_size,0),0,
                              DECODE(NVL(c.t_scale,0),0,
                                 DECODE(NVL(c.t_precision,0),0,null,'('|| DECODE(NVL(c.t_precision,0),0,null,c.t_precision) ||')'),
                                   '('|| DECODE(NVL(c.t_precision,0),0,null,c.t_precision) || ',' || DECODE(NVL(c.t_scale,0),0,null,c.t_scale)||')'),
                                   '('||TRIM(DECODE(c.t_size,0,null,c.t_size||' '||c.char_units ))||')'),
                   'Logical Type', c.logical_type_name  ||' '|| 
                           DECODE (NVL(c.t_size,0),0,
                              DECODE(NVL(c.t_scale,0),0,
                                 DECODE(NVL(c.t_precision,0),0,null,'('|| DECODE(NVL(c.t_precision,0),0,null,c.t_precision) ||')'),
                                   '('|| DECODE(NVL(c.t_precision,0),0,null,c.t_precision) || ',' || DECODE(NVL(c.t_scale,0),0,null,c.t_scale)||')'),
                                   '('||TRIM(DECODE(c.t_size,0,null,c.t_size||' '||c.char_units ))||')')
            ) ||
            DECODE (c.auto_increment_column,'Y', ' - AI','') ||
            DECODE (c.identity_column,'Y', ' - ID','')
          ).getClobVal()                                                                                                                                     data_type,
        XMLElement("osdm_at:DomainName",DECODE(c.domain_name,'Unknown',null,c.domain_name)).getClobVal()                                                     domain_name,
        XMLElement("osdm_at:Formula",DECODE(c.formula,null,c.default_value,c.formula)).getClobVal()                                                          formula,
        XMLElement("osdm_at:Security",DECODE(c.personally_id_information ||'/'||c.sensitive_information||'/'||c.mask_for_none_production,'//',
                                      null,c.personally_id_information ||'/'||c.sensitive_information||'/'||c.mask_for_none_production)).getClobVal()        security,
        XMLElement("osdm_at:PreferredAbbreviation",c.abbreviation).getClobVal()                                                                              abbreviation,
        COUNT(c.column_name) over()                                                                                                                          total_row_count
 FROM 	dmrs_columns c
 WHERE  c.container_ovid = v_t_ovid
 ORDER BY c.sequence;
rec_columns cur_columns%ROWTYPE;

-- Columns Comments Data
CURSOR cur_columns_comments(v_t_ovid IN VARCHAR2) IS
 SELECT a.seq                       seq, 
        a.column_name               column_name, 
        a.description               description, 
        a.notes                     notes,
        COUNT(a.column_name) over() total_row_count
 FROM (
  SELECT XMLElement("osdm_at:ColumnCommentsSequence",c.sequence).getStringVal()  seq,
         XMLElement("osdm_at:ColumnCommentsName",c.column_name).getStringVal()   column_name,
         NVL(
        (SELECT t.text comments_in_rdbms
         FROM   dmrs_large_text t
         WHERE  t.ovid = c.ovid
         AND    t.type='Comments'),
        (SELECT t.text comments_in_rdbms
         FROM   dmrs_large_text t
         WHERE  t.ovid = c.ovid
         AND    t.type='CommentsInRDBMS'))                                       description, 
        (SELECT t.text comments_in_rdbms
         FROM   dmrs_large_text t
         WHERE  t.ovid = c.ovid
         AND    t.type='Note')                                                   notes
  FROM   dmrs_columns c
  WHERE  c.container_ovid = v_t_ovid
  ORDER BY c.sequence
 ) a
 WHERE DBMS_LOB.getlength(description) > 0 OR DBMS_LOB.getlength(notes) > 0;
rec_columns_comments cur_columns_comments%ROWTYPE;

--Indexes
CURSOR cur_indexes(v_t_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_at:IndexName",i.index_name).getClobVal()                                                                                        idx_name,
        XMLElement("osdm_at:IndexState",DECODE(i.state,'Unique Plain Index','UN','Unique Constraint','UK','Primary Constraint','PK',null)).getClobVal()  state,
        XMLElement("osdm_at:IndexFunctional",DECODE(i.functional,'N',' ',i.functional)).getClobVal()                                                     functional,
        XMLElement("osdm_at:IndexSpatial",DECODE(i.spatial_index,'N',' ',i.spatial_index)).getClobVal()                                                  spatial,
        XMLElement("osdm_at:IndexExpression",i.expression).getClobVal()                                                                                  expression,
        XMLElement("osdm_at:IndexColumnName",c.column_name).getClobVal()                                                                                 col_name,
        XMLElement("osdm_at:IndexSortOrder",c.sort_order).getClobVal()                                                                                   sort_order,
        c.sequence                                                                                                                                       idx_sequence,
        COUNT(c.column_name) over()                                                                                                                      total_row_count
 FROM   dmrs_tables t,
        dmrs_indexes i,
        dmrs_constr_index_columns c
 WHERE  t.ovid = i.container_ovid
 AND    i.ovid = c.index_ovid
 AND    t.ovid = v_t_ovid
 ORDER BY i.index_name, c.sequence, c.sort_order;
rec_indexes cur_indexes%ROWTYPE;

-- Table Level Constraints
CURSOR cur_tl_constraints(v_t_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_at:TLConstraintType", CASE WHEN rownum>1 THEN ''
                                               ELSE 'Table Level'
                                               END ).getClobVal()               c_type,
        XMLElement("osdm_at:TLConstraintName", tc.constraint_name).getClobVal() c_name,
        tc.text                                                                 c_details,
        COUNT(tc.constraint_name) over()                                        total_row_count
 FROM   dmrs_table_constraints tc
 WHERE  tc.table_ovid = v_t_ovid;
rec_tl_constraints cur_tl_constraints%ROWTYPE;

-- Column Level Constraints
CURSOR cur_cl_constraints(v_t_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_at:ContstraintType", CASE WHEN rownum>1 THEN ''
                                              ELSE 'Column Level'
                                              END).getClobVal()                                        c_type,
        XMLElement("osdm_at:ALCConstraintName", c.column_name || 
                                                DECODE((SELECT DISTINCT(constraint_name) 
                                                        FROM dmrs_check_constraints 
                                                        WHERE c.ovid = dataelement_ovid),NULL,'',
                                               ' / '|| (SELECT  DISTINCT(constraint_name) 
                                                        FROM dmrs_check_constraints 
                                                        WHERE c.ovid = dataelement_ovid))).getClobVal() c_name,
        Gather_Constraint_Details_XML(c.ovid, 'osdm_at')                                                c_details,
        COUNT(c.column_name) over()                                                                     total_row_count
 FROM   dmrs_columns c
 WHERE  c.container_ovid = v_t_ovid
 AND    (c.ovid IN (SELECT dataelement_ovid FROM dmrs_avt) OR 
         c.ovid IN (SELECT dataelement_ovid FROM dmrs_value_ranges) OR 
         c.ovid IN (SELECT dataelement_ovid FROM dmrs_check_constraints));
rec_cl_constraints cur_cl_constraints%ROWTYPE;

--Foreign keys referring to other tables
CURSOR cur_fk_referring_to(v_t_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_at:FKName",CASE WHEN ic.sequence>1 THEN ' '
                                    ELSE fk.fk_name
                                    END
                   ).getClobVal()                                               fk_name,
        XMLElement("osdm_at:FKReferingTo",CASE WHEN ic.sequence>1 THEN ' '
                                          ELSE fk.referred_table_name
                                          END
                  ).getClobVal()                                                referring_to,
        XMLElement("osdm_at:FKReferedFrom",'').getClobVal()                     referred_from,
        XMLElement("osdm_at:FKMandatory",CASE WHEN ic.sequence>1 THEN ' '
                                         ELSE DECODE(fk.mandatory,'Y',fk.mandatory,' ')
                                         END
                  ).getClobVal()                                                mandatory,
        XMLElement("osdm_at:FKTransferable",CASE WHEN ic.sequence>1 THEN ' '
                                            ELSE DECODE(fk.transferable,'Y',fk.transferable,' ')
                                            END
                  ).getClobVal()                                                transferable,
        XMLElement("osdm_at:FKInArc",CASE WHEN ic.sequence>1 THEN ' '
                                     ELSE DECODE(fk.in_arc,'Y',fk.in_arc,' ')
                                     END
                  ).getClobVal()                                                in_arc,
        XMLElement("osdm_at:FKColumnName",ic.column_name).getClobVal()          col_name,
        ic.sequence                                                             seq,
        COUNT(ic.column_name) over()                                            total_row_count
 FROM   dmrs_foreignkeys fk,
        dmrs_constr_index_columns ic
 WHERE  fk.child_table_ovid = v_t_ovid
 AND    fk.ovid = ic.index_ovid
 ORDER BY fk.referred_table_name,fk.fk_name, ic.sequence;
rec_fk_referring_to cur_fk_referring_to%ROWTYPE;

--Foreign keys referring from other tables
CURSOR cur_fk_referred_from(v_t_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_at:FKName",CASE WHEN ic.sequence>1 THEN ' '
                                    ELSE fk.fk_name
                                    END
                   ).getClobVal()                                               fk_name,
        XMLElement("osdm_at:FKReferingTo",'').getClobVal()                      referring_to,
        XMLElement("osdm_at:FKReferedFrom",CASE WHEN ic.sequence>1 THEN ' '
                                           ELSE fk.child_table_name
                                           END
                  ).getClobVal()                                                referred_from,
        XMLElement("osdm_at:FKMandatory",CASE WHEN ic.sequence>1 THEN ' '
                                         ELSE DECODE(fk.mandatory,'Y',fk.mandatory,' ')
                                         END
                  ).getClobVal()                                                mandatory,
        XMLElement("osdm_at:FKTransferable",CASE WHEN ic.sequence>1 THEN ' '
                                            ELSE DECODE(fk.transferable,'Y',fk.transferable,' ')
                                            END
                  ).getClobVal()                                                transferable,
        XMLElement("osdm_at:FKInArc",CASE WHEN ic.sequence>1 THEN ' '
                                     ELSE DECODE(fk.in_arc,'Y',fk.in_arc,' ')
                                     END
                  ).getClobVal()                                                in_arc,
        XMLElement("osdm_at:FKColumnName",ic.column_name).getClobVal()          col_name,
        ic.sequence                                                             seq,
        COUNT(ic.column_name) over()                                            total_row_count
 FROM   dmrs_foreignkeys fk,
        dmrs_constr_index_columns ic
 WHERE  fk.referred_table_ovid = v_t_ovid
 AND    fk.ovid = ic.index_ovid
 ORDER BY fk.child_table_name,fk.fk_name, ic.sequence;
rec_fk_referred_from cur_fk_referred_from%ROWTYPE;

BEGIN

  UTL_FILE.PUT_LINE(log_file, TO_CHAR(SYSDATE,'yy.mm.dd hh:mi:ss') ||' '|| 'Gathering all tables data started ...');

  DBMS_LOB.CREATETEMPORARY(res, TRUE);
  DBMS_LOB.APPEND (res,'<osdm_at:root xmlns:osdm_at="osdm_at">');

   -- Common Data
   FOR rec_common_data IN cur_common_data(v_model_ovid) LOOP

      DBMS_LOB.APPEND (res, rec_common_data.design_name);
      DBMS_LOB.APPEND (res, rec_common_data.version_date);  
      DBMS_LOB.APPEND (res, '<osdm_at:VersionComment>');
      DBMS_LOB.APPEND (res, '<osdm_at:VersionCommentDetails>');
      -- Tokenize rows
      FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(rec_common_data.version_comment||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                     FROM   dual
                     CONNECT BY REGEXP_INSTR(rec_common_data.version_comment||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
 
          SELECT XMLElement("osdm_at:VersionCommentRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
          DBMS_LOB.APPEND (res, token_value);
      END LOOP;
      DBMS_LOB.APPEND (res, '</osdm_at:VersionCommentDetails>');
      DBMS_LOB.APPEND (res, '</osdm_at:VersionComment>');
      DBMS_LOB.APPEND (res, rec_common_data.model_name);
 
   END LOOP;

   FOR rec_all_tables IN cur_all_tables(v_model_ovid) LOOP

      IF (cur_all_tables%ROWCOUNT = 1) THEN
           DBMS_LOB.APPEND (res,'<osdm_at:TablesCollection>');
      END IF;
      
      DBMS_LOB.APPEND (res,'<osdm_at:TableDetails>');

      -- Description / Notes
      SELECT 
            NVL(
               (SELECT t.text comments_in_rdbms
                FROM   dmrs_large_text t
                WHERE  t.ovid = rec_all_tables.table_ovid
                AND    t.type='Comments'),
               (SELECT t.text comments_in_rdbms
                FROM   dmrs_large_text t
                WHERE  t.ovid = rec_all_tables.table_ovid
                AND    t.type='CommentsInRDBMS'))        description, 
               (SELECT t.text comments_in_rdbms
                FROM   dmrs_large_text t
                WHERE  t.ovid = rec_all_tables.table_ovid
                AND    t.type='Note')                     notes
      INTO   v_description, 
             v_notes
      FROM  dual;
  
      DBMS_LOB.APPEND (res, '<osdm_at:Description>');
      DBMS_LOB.APPEND (res, '<osdm_at:DescriptionDetails>');
      -- Tokenize rows
      FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(v_description||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                     FROM   dual
                     CONNECT BY REGEXP_INSTR(v_description||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
          SELECT XMLElement("osdm_at:DescriptionRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
          DBMS_LOB.APPEND (res, token_value);
      END LOOP;
      DBMS_LOB.APPEND (res, '</osdm_at:DescriptionDetails>');
      DBMS_LOB.APPEND (res, '</osdm_at:Description>');
      
      DBMS_LOB.APPEND (res, '<osdm_at:Notes>');
      DBMS_LOB.APPEND (res, '<osdm_at:NotesDetails>');
      -- Tokenize rows
      FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(v_notes||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                     FROM   dual
                     CONNECT BY REGEXP_INSTR(v_notes||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
          SELECT XMLElement("osdm_at:NoteRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
          DBMS_LOB.APPEND (res, token_value);
       END LOOP;
       DBMS_LOB.APPEND (res, '</osdm_at:NotesDetails>');
       DBMS_LOB.APPEND (res, '</osdm_at:Notes>');

       DBMS_LOB.APPEND (res, rec_all_tables.table_name);
       DBMS_LOB.APPEND (res, rec_all_tables.functional_name);      
       DBMS_LOB.APPEND (res, rec_all_tables.abbreviation);
       DBMS_LOB.APPEND (res, rec_all_tables.class_type_name);
       DBMS_LOB.APPEND (res, rec_all_tables.obj_type_name);
       DBMS_LOB.APPEND (res, rec_all_tables.number_cols);
       DBMS_LOB.APPEND (res, rec_all_tables.number_rows_min);
       DBMS_LOB.APPEND (res, rec_all_tables.number_rows_max);
       DBMS_LOB.APPEND (res, rec_all_tables.number_rows_expected);
       DBMS_LOB.APPEND (res, rec_all_tables.growth_expected);
       DBMS_LOB.APPEND (res, rec_all_tables.growth_interval);

       -- Columns
       FOR rec_columns IN cur_columns(rec_all_tables.table_ovid) LOOP
          IF (cur_columns%ROWCOUNT = 1) THEN
            DBMS_LOB.APPEND (res,'<osdm_at:ColumnsCollection>');
          END IF;
          
            DBMS_LOB.APPEND (res, '<osdm_at:ColumnDetails>');
            DBMS_LOB.APPEND (res, rec_columns.seq);
            DBMS_LOB.APPEND (res, rec_columns.column_name);
            DBMS_LOB.APPEND (res, rec_columns.pk);
            DBMS_LOB.APPEND (res, rec_columns.fk);
            DBMS_LOB.APPEND (res, rec_columns.m);
            DBMS_LOB.APPEND (res, rec_columns.data_type);
            DBMS_LOB.APPEND (res, rec_columns.dt_kind);
            DBMS_LOB.APPEND (res, rec_columns.domain_name);
            DBMS_LOB.APPEND (res, rec_columns.formula);
            DBMS_LOB.APPEND (res, rec_columns.security);
            DBMS_LOB.APPEND (res, rec_columns.abbreviation);
            DBMS_LOB.APPEND (res,'</osdm_at:ColumnDetails>');
          
          IF (cur_columns%ROWCOUNT = rec_columns.total_row_count) THEN
           DBMS_LOB.APPEND (res, '</osdm_at:ColumnsCollection>');
          END IF;
       END LOOP;

       -- Columns Comments
       FOR rec_columns_comments IN cur_columns_comments(rec_all_tables.table_ovid) LOOP
          IF (cur_columns_comments%ROWCOUNT = 1) THEN
            DBMS_LOB.APPEND (res,'<osdm_at:ColumnsCommentsCollection>');
          END IF;
          
            DBMS_LOB.APPEND (res, '<osdm_at:ColumnCommentsDetails>');
            DBMS_LOB.APPEND (res, rec_columns_comments.seq);
            DBMS_LOB.APPEND (res, rec_columns_comments.column_name);
          
            DBMS_LOB.APPEND (res, '<osdm_at:ColumnDescription>');
            DBMS_LOB.APPEND (res, '<osdm_at:ColumnDescriptionDetails>');
            -- Tokenize rows
            FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(rec_columns_comments.description||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                             FROM   dual
                             CONNECT BY REGEXP_INSTR(rec_columns_comments.description||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
                SELECT XMLElement("osdm_at:ColumnDescriptionRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
                DBMS_LOB.APPEND (res, token_value);
            END LOOP;
            DBMS_LOB.APPEND (res, '</osdm_at:ColumnDescriptionDetails>');
            DBMS_LOB.APPEND (res, '</osdm_at:ColumnDescription>');
          
            DBMS_LOB.APPEND (res, '<osdm_at:ColumnNotes>');
            DBMS_LOB.APPEND (res, '<osdm_at:ColumnNotesDetails>');
            -- Tokenize rows
            FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(rec_columns_comments.notes||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                             FROM   dual
                             CONNECT BY REGEXP_INSTR(rec_columns_comments.notes||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
                SELECT XMLElement("osdm_at:ColumnNoteRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
                DBMS_LOB.APPEND (res, token_value);
            END LOOP;
            DBMS_LOB.APPEND (res, '</osdm_at:ColumnNotesDetails>');
            DBMS_LOB.APPEND (res, '</osdm_at:ColumnNotes>');

            DBMS_LOB.APPEND (res,'</osdm_at:ColumnCommentsDetails>');

          IF (cur_columns_comments%ROWCOUNT = rec_columns_comments.total_row_count) THEN
            DBMS_LOB.APPEND (res, '</osdm_at:ColumnsCommentsCollection>');
          END IF;
       END LOOP;
  
       -- Indexes
       FOR rec_indexes IN cur_indexes(rec_all_tables.table_ovid) LOOP
          IF (cur_indexes%ROWCOUNT = 1) THEN
            DBMS_LOB.APPEND (res,'<osdm_at:IndexesCollection>');
          END IF;

            DBMS_LOB.APPEND (res, '<osdm_at:IndexDetails>');
            DBMS_LOB.APPEND (res, rec_indexes.idx_name);
            DBMS_LOB.APPEND (res, rec_indexes.state);
            DBMS_LOB.APPEND (res, rec_indexes.functional);
            DBMS_LOB.APPEND (res, rec_indexes.spatial);
            DBMS_LOB.APPEND (res, rec_indexes.expression);
            DBMS_LOB.APPEND (res, rec_indexes.col_name);
            DBMS_LOB.APPEND (res, rec_indexes.sort_order);
            DBMS_LOB.APPEND (res,'</osdm_at:IndexDetails>');

          IF (cur_indexes%ROWCOUNT = rec_indexes.total_row_count) THEN
           DBMS_LOB.APPEND (res, '</osdm_at:IndexesCollection>');
          END IF;
       END LOOP;
 
       v_cc_created := FALSE;
       -- Table Level Constraints
       FOR rec_tl_constraints IN cur_tl_constraints(rec_all_tables.table_ovid) LOOP
          IF (cur_tl_constraints%ROWCOUNT = 1) THEN
            DBMS_LOB.APPEND (res,'<osdm_at:ConstraintsCollection>');
            v_cc_created := TRUE;
            DBMS_LOB.APPEND (res,'<osdm_at:TableLevelConstraintsCollection>');
          END IF;

            DBMS_LOB.APPEND (res, '<osdm_at:TableLevelConstraintDetails>');
            DBMS_LOB.APPEND (res, rec_tl_constraints.c_type);
            DBMS_LOB.APPEND (res, rec_tl_constraints.c_name);

            DBMS_LOB.APPEND (res, '<osdm_at:TLConstraintRule>');
            DBMS_LOB.APPEND (res, '<osdm_at:TLConstraintRuleDetails>');
            -- Tokenize rows
             FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR( rec_tl_constraints.c_details||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                            FROM   dual
                            CONNECT BY REGEXP_INSTR(rec_tl_constraints.c_details||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
                 SELECT XMLElement("osdm_at:TLConstraintRuleRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
                 DBMS_LOB.APPEND (res, token_value);
             END LOOP;
             DBMS_LOB.APPEND (res, '</osdm_at:TLConstraintRuleDetails>');       
             DBMS_LOB.APPEND (res, '</osdm_at:TLConstraintRule>');

             DBMS_LOB.APPEND (res, '</osdm_at:TableLevelConstraintDetails>');

          IF (cur_tl_constraints%ROWCOUNT = rec_tl_constraints.total_row_count) THEN
            DBMS_LOB.APPEND (res, '</osdm_at:TableLevelConstraintsCollection>');
          END IF;
       
       END LOOP;
  
       -- Column Level Constraints
       FOR rec_cl_constraints IN cur_cl_constraints(rec_all_tables.table_ovid) LOOP
          IF (cur_cl_constraints%ROWCOUNT = 1) THEN
            IF NOT v_cc_created THEN
               DBMS_LOB.APPEND (res,'<osdm_at:ConstraintsCollection>');
               v_cc_created := TRUE;
            END IF;

           DBMS_LOB.APPEND (res,'<osdm_at:ColumnLevelConstraintsCollection>');
           v_cc_created := TRUE;
          END IF;
         
           DBMS_LOB.APPEND (res, '<osdm_at:ConstraintDetails>');
           DBMS_LOB.APPEND (res, rec_cl_constraints.c_type);
           DBMS_LOB.APPEND (res, rec_cl_constraints.c_name);
           DBMS_LOB.APPEND (res, rec_cl_constraints.c_details);
           DBMS_LOB.APPEND (res,'</osdm_at:ConstraintDetails>');

          IF (cur_cl_constraints%ROWCOUNT = rec_cl_constraints.total_row_count) THEN
            DBMS_LOB.APPEND (res, '</osdm_at:ColumnLevelConstraintsCollection>');
          END IF;
       END LOOP;

       IF v_cc_created THEN
         DBMS_LOB.APPEND (res,'</osdm_at:ConstraintsCollection>');
       END IF;

       v_cc_created := FALSE;

       -- Foreign Keys Referring To
       FOR rec_fk_referring_to IN cur_fk_referring_to(rec_all_tables.table_ovid) LOOP
          IF (cur_fk_referring_to%ROWCOUNT = 1) THEN
            DBMS_LOB.APPEND (res,'<osdm_at:FKCollection>');
            v_cc_created := TRUE;
          END IF;

           DBMS_LOB.APPEND (res, '<osdm_at:FKDetails>');
           DBMS_LOB.APPEND (res, rec_fk_referring_to.fk_name);
           DBMS_LOB.APPEND (res, rec_fk_referring_to.referring_to);
           DBMS_LOB.APPEND (res, rec_fk_referring_to.referred_from);
           DBMS_LOB.APPEND (res, rec_fk_referring_to.mandatory);
           DBMS_LOB.APPEND (res, rec_fk_referring_to.transferable);
           DBMS_LOB.APPEND (res, rec_fk_referring_to.in_arc);
           DBMS_LOB.APPEND (res, rec_fk_referring_to.col_name);
           DBMS_LOB.APPEND (res,'</osdm_at:FKDetails>');
       
       END LOOP;

       -- Foreign Keys Referring From
       FOR rec_fk_referred_from IN cur_fk_referred_from(rec_all_tables.table_ovid) LOOP
          IF (cur_fk_referred_from%ROWCOUNT = 1) THEN
            IF NOT v_cc_created THEN 
              DBMS_LOB.APPEND (res,'<osdm_at:FKCollection>');
              v_cc_created := TRUE;
            END IF;
          END IF;
         
           DBMS_LOB.APPEND (res, '<osdm_at:FKDetails>');
           DBMS_LOB.APPEND (res, rec_fk_referred_from.fk_name);
           DBMS_LOB.APPEND (res, rec_fk_referred_from.referring_to);
           DBMS_LOB.APPEND (res, rec_fk_referred_from.referred_from);
           DBMS_LOB.APPEND (res, rec_fk_referred_from.mandatory);
           DBMS_LOB.APPEND (res, rec_fk_referred_from.transferable);
           DBMS_LOB.APPEND (res, rec_fk_referred_from.in_arc);
           DBMS_LOB.APPEND (res, rec_fk_referred_from.col_name);
           DBMS_LOB.APPEND (res,'</osdm_at:FKDetails>');
       
       END LOOP;
       
       IF v_cc_created THEN 
          DBMS_LOB.APPEND (res, '</osdm_at:FKCollection>');
       END IF;

      DBMS_LOB.APPEND (res,'</osdm_at:TableDetails>');

      IF (cur_all_tables%ROWCOUNT = rec_all_tables.total_row_count) THEN
          DBMS_LOB.APPEND (res,'</osdm_at:TablesCollection>');
      END IF;

   END LOOP;

  DBMS_LOB.APPEND (res,'</osdm_at:root>');
  
  UTL_FILE.PUT_LINE(log_file, TO_CHAR(SYSDATE,'yy.mm.dd hh:mi:ss') ||' '|| 'Gathering all tables data ended.');
	
RETURN res;
	
 EXCEPTION
  WHEN others THEN
   UTL_FILE.PUT_LINE(log_file, 'Gathering all tables Exception : : ' || SQLERRM);  
   UTL_FILE.PUT_LINE(log_file, 'Gathering all tables Exception : ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  RETURN res;
  
END Gather_AllTables_Data;

FUNCTION Gather_SingleEntity_Data(v_entity_ovid IN VARCHAR2) RETURN CLOB IS 

res               CLOB;
v_notes           CLOB;
v_description     CLOB;
v_rel_total_count INTEGER;
token_value       CLOB;

CURSOR cur_general_data(v_e_ovid IN VARCHAR2) IS
 -- General data
 SELECT XMLElement("osdm_e:DesignName",d.design_name).getClobVal()                                        design_name,
        XMLElement("osdm_e:VersionDate",TO_CHAR(d.date_published,'dd.mm.yyyy hh24:mi:ss')).getClobVal()   version_date,
        d.version_comments                                                                                comments,
        XMLElement("osdm_e:ModelName",m.model_name).getClobVal()                                          model_name
 FROM   dmrs_designs d, 
        dmrs_models m,
        dmrs_entities e
 WHERE  d.design_ovid = m.design_ovid
 AND    e.model_ovid = m.model_ovid
 AND    e.ovid = v_e_ovid;
rec_general_data cur_general_data%ROWTYPE;

CURSOR cur_entity(v_e_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_e:EntityName",e.entity_name).getClobVal()                                                                        entity_name,
        XMLElement("osdm_e:ClassificationTypeName",e.classification_type_name).getClobVal()                                               classification_type_name,
        XMLElement("osdm_e:Abbreviation",e.preferred_abbreviation).getClobVal()                                                           pref_abbreviation, 
        XMLElement("osdm_e:SuperType",(SELECT e1.entity_name FROM  dmrs_entities e1 WHERE e.supertypeentity_ovid = e1.ovid)).getClobVal() super_type,
        XMLElement("osdm_e:Synonyms", e.synonyms).getClobVal()                                                                            table_synonyms,
        XMLElement("osdm_e:ObjectTypeName",e.structured_type_name).getClobVal()                                                           object_type_name,
        XMLElement("osdm_e:NumberOfAttributes",e.number_data_elements).getClobVal()                                                       number_of_attributes, 
        XMLElement("osdm_e:NumberOfRowsMin",e.min_volume).getClobVal()                                                                    number_rows_min, 
        XMLElement("osdm_e:NumberOfRowsMax",e.max_volume).getClobVal()                                                                    number_rows_max, 
        XMLElement("osdm_e:ExpectedNumberOfRows",e.expected_volume).getClobVal()                                                          expected_number_of_rows, 
        XMLElement("osdm_e:ExpectedGrowth",e.growth_rate_percents).getClobVal()                                                           expected_growth,
        XMLElement("osdm_e:GrowthInterval",e.growth_rate_interval).getClobVal()                                                           growth_interval
 FROM   dmrs_entities e
 WHERE  e.ovid = v_e_ovid;
rec_entity cur_entity%ROWTYPE;

CURSOR cur_mapped_tables(v_e_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_e:TableName",t.model_name||'.'||t.table_name).getClobVal() table_name,
        COUNT(t.table_name) over()                                total_row_count
 FROM   dmrs_entities e,
        dmrs_tables t,
        dmrs_mappings m
 WHERE  m.relational_object_ovid = t.ovid
 AND    m.logical_object_ovid = e.ovid
 AND    e.ovid = v_e_ovid;
rec_mapped_tables cur_mapped_tables%ROWTYPE;

CURSOR cur_attributes(v_e_ovid IN VARCHAR2) IS
 SELECT  XMLElement("osdm_e:Sequence",a.sequence).getClobVal()                                                                                             seq, 
         XMLElement("osdm_e:AttributeName",a.attribute_name).getClobVal()                                                                                  attr_name,
         XMLElement("osdm_e:DataTypeKind",DECODE(a.datatype_kind,
                                                 'Domain',         'DOM',
                                                 'Logical Type',   'LT',
                                                 'Distinct Type',  'DT',
                                                 'Ref Struct Type','RST',
                                                 'Structured Type','ST',
                                                 'Collection Type','CT')                                                                                
                   ).getClobVal()                                                                                                                           dt_kind,
         XMLElement("osdm_e:DomainName",DECODE(a.domain_name,'Unknown',null,a.domain_name)).getClobVal()                                                   domain_name,
         XMLElement("osdm_e:DataType", 
            DECODE(a.datatype_kind, 
                  'Domain', a.logical_type_name ||' '||
                           DECODE (NVL(a.t_size,0),0,
                              DECODE(NVL(a.t_scale,0),0,
                                 DECODE(NVL(a.t_precision,0),0,null,'('|| DECODE(NVL(a.t_precision,0),0,null,a.t_precision) ||')'),
                                    '('|| DECODE(NVL(a.t_precision,0),0,null,a.t_precision) || ',' || DECODE(NVL(a.t_scale,0),0,null,a.t_scale)||')'),
                                    '('||TRIM(DECODE(a.t_size,0,null,a.t_size||' '||a.char_units ))||')'),
                   'Logical Type', a.logical_type_name  ||' '|| 
                           DECODE (NVL(a.t_size,0),0,
                               DECODE(NVL(a.t_scale,0),0,
                                  DECODE(NVL(a.t_precision,0),0,null,'('|| DECODE(NVL(a.t_precision,0),0,null,a.t_precision) ||')'),
                                     '('|| DECODE(NVL(a.t_precision,0),0,null,a.t_precision) || ',' || DECODE(NVL(a.t_scale,0),0,null,a.t_scale)||')'),
                                     '('||TRIM(DECODE(a.t_size,0,null,a.t_size||' '||a.char_units ))||')')
            )
          ).getClobVal()                                                                                                                                   data_type,
         XMLElement("osdm_e:PK",a.pk_flag).getClobVal()                                                                                                    pk,
         XMLElement("osdm_e:FK",a.fk_flag).getClobVal()                                                                                                    fk,
         XMLElement("osdm_e:M",DECODE(a.mandatory,'N',' ',a.mandatory)).getClobVal()                                                                       m,
         XMLElement("osdm_e:Formula",DECODE(a.formula,null,a.default_value,a.formula)).getClobVal()                                                        formula,
         XMLElement("osdm_e:AttributeSynonyms",a.synonyms).getClobVal()                                                                                    synonyms,
         XMLElement("osdm_e:PreferredAbbreviation",a.preferred_abbreviation).getClobVal()                                                                  pref_abbr,
         COUNT(a.sequence) over()                                                                                                                           total_row_count
  FROM   dmrs_attributes a
  WHERE  a.container_ovid = v_e_ovid
  ORDER BY a.sequence;
rec_attributes cur_attributes%ROWTYPE;

-- Attributes Comments Data
CURSOR cur_attributes_comments(v_e_ovid IN VARCHAR2) IS
 SELECT a.seq                          seq, 
        a.attribute_name               attribute_name, 
        a.description                  description, 
        a.notes                        notes,
        COUNT(a.attribute_name) over() total_row_count
 FROM (
  SELECT XMLElement("osdm_e:AttributeCommentsSequence",a.sequence).getStringVal()  seq,
         XMLElement("osdm_e:AttributeCommentsName",a.attribute_name).getStringVal()   attribute_name,
         NVL(
        (SELECT t.text comments_in_rdbms
         FROM   dmrs_large_text t
         WHERE  t.ovid = a.ovid
         AND    t.type='Comments'),
        (SELECT t.text comments_in_rdbms
         FROM   dmrs_large_text t
         WHERE  t.ovid = a.ovid
         AND    t.type='CommentsInRDBMS'))  description, 
        (SELECT t.text comments_in_rdbms
         FROM   dmrs_large_text t
         WHERE  t.ovid = a.ovid
         AND    t.type='Note')              notes
  FROM   dmrs_entities e, 
         dmrs_attributes a
  WHERE  e.ovid = a.container_ovid
  and    e.ovid = v_e_ovid
  ORDER BY a.sequence
 ) a
 WHERE DBMS_LOB.getlength(description) > 0 OR DBMS_LOB.getlength(notes) > 0;
rec_attributes_comments cur_attributes_comments%ROWTYPE;

CURSOR cur_identifiers(v_e_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_e:IdentifierName",CASE WHEN ke.sequence>1 THEN ' ' ELSE ke.key_name END).getClobVal()                          nn,
        XMLElement("osdm_e:PrimaryIdentifier",CASE WHEN ke.sequence>1 THEN ' ' ELSE DECODE(k.state,'Primary Key','Y') END).getClobVal() pi, 
        XMLElement("osdm_e:ElementName",ke.element_name).getClobVal()                                                                   element_name,
        XMLElement("osdm_e:ElementType",ke.type).getClobVal()                                                                           type,
        XMLElement("osdm_e:SourceLabel",ke.source_label).getClobVal()                                                                   source_label,
        XMLElement("osdm_e:TargetLabel",ke.target_label).getClobVal()                                                                   target_label,
        COUNT(ke.sequence) over()                                                                                                        total_row_count
 FROM   dmrs_keys          k,
        dmrs_key_elements ke
 WHERE  k.container_ovid = v_e_ovid
 AND   ke.key_ovid = k.ovid
 ORDER BY ke.sequence;
rec_identifiers cur_identifiers%ROWTYPE;

CURSOR cur_relationships(v_e_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_e:SourceName",r.target_entity_name).getClobVal()                                                                  source_name, 
        XMLElement("osdm_e:SourceRole",r.source_label).getClobVal()                                                                        source_role,
        XMLElement("osdm_e:TargetRole",r.target_label).getClobVal()                                                                        target_role,
        XMLElement("osdm_e:InArc",DECODE(r.in_arc,'N','',r.in_arc)).getClobVal()                                                           in_arc,
        XMLElement("osdm_e:Cardinality",
           DECODE(r.source_optional,'Y',0,'1') || '..' || r.sourceto_target_cardinality
           ||':'||
           DECODE(r.target_optional,'Y',0,'1') || '..' || r.targetto_source_cardinality
           ).getClobVal()                                                                                                                  cardinality,
        XMLElement("osdm_e:DominantRole",DECODE(r.dominant_role,'None','')).getClobVal()                                                   dominant_role,
        XMLElement("osdm_e:Identifying",DECODE(r.identifying,'N','',r.identifying)).getClobVal()                                           identifying,
        XMLElement("osdm_e:Transferable",DECODE(r.transferable,'N','',r.transferable)).getClobVal()                                        transferable
 FROM   dmrs_relationships r
 WHERE  r.source_ovid  = v_e_ovid
 UNION ALL
 SELECT XMLElement("osdm_e:SourceName",r.source_entity_name).getClobVal()                                                                  source_name, 
        XMLElement("osdm_e:SourceRole",r.source_label).getClobVal()                                                                        source_role,
        XMLElement("osdm_e:TargetRole",r.target_label).getClobVal()                                                                        target_role,
        XMLElement("osdm_e:InArc",DECODE(r.in_arc,'N','',r.in_arc)).getClobVal()                                                           in_arc,
        XMLElement("osdm_e:Cardinality",
           DECODE(r.source_optional,'Y',0,'1') || '..' || r.sourceto_target_cardinality
           ||':'||
           DECODE(r.target_optional,'Y',0,'1') || '..' || r.targetto_source_cardinality
           ).getClobVal()                                                                                                                  cardinality,
        XMLElement("osdm_e:DominantRole",DECODE(r.dominant_role,'None','')).getClobVal()                                                   dominant_role,
        XMLElement("osdm_e:Identifying",DECODE(r.identifying,'N','',r.identifying)).getClobVal()                                           identifying,
        XMLElement("osdm_e:Transferable",DECODE(r.transferable,'N','',r.transferable)).getClobVal()                                        transferable
 FROM   dmrs_relationships r
 WHERE  r.target_ovid  = v_e_ovid;
rec_relationships cur_relationships%ROWTYPE;

CURSOR cur_incoming_processes(v_e_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_e:IncomingProcessName", NVL(pe.process_name,' ')).getClobVal()  ipr_name,
         XMLElement("osdm_e:IncomingFlowName", NVL(pe.flow_name,' ')).getClobVal()       ipr_flow_name,
         XMLElement("osdm_e:IncomingCRUDCode", NVL(pe.crud_code,' ')).getClobVal()       ipr_crud_code,
         XMLElement("osdm_e:IncomingDFDName", NVL(pe.dfd_name,' ')).getClobVal()         ipr_dfd_name,
         COUNT(pe.process_name) over()                                                    total_row_count
  FROM   dmrs_process_entities pe
  WHERE  pe.entity_ovid = v_e_ovid
  AND    pe.flow_direction = 'IN'
  ORDER BY pe.process_name;
rec_incoming_processes cur_incoming_processes%ROWTYPE;

CURSOR cur_outgoing_processes(v_e_ovid IN VARCHAR2) IS
  SELECT XMLElement("osdm_e:OutgoingProcessName", pe.process_name).getClobVal() opr_name,
         XMLElement("osdm_e:OutgoingFlowName", pe.flow_name).getClobVal()       opr_flow_name,
         XMLElement("osdm_e:OutgoingCRUDCode", pe.crud_code).getClobVal()       opr_crud_code,
         XMLElement("osdm_e:OutgoingDFDName", pe.dfd_name).getClobVal()         opr_dfd_name,
         COUNT(pe.process_name) over()                                           total_row_count
  FROM   dmrs_process_entities pe
  WHERE  pe.entity_ovid = v_e_ovid
  AND    pe.flow_direction = 'OUT'
  ORDER BY pe.process_name;
rec_outgoing_processes cur_outgoing_processes%ROWTYPE;

-- Constraints
CURSOR cur_constraints(v_e_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_e:ContstraintType", CASE WHEN rownum>1 THEN ''
                                              ELSE 'Attribute Level'
                                              END).getClobVal()                                        c_type,
        XMLElement("osdm_e:ALCConstraintName", a.attribute_name || 
                                                DECODE((SELECT DISTINCT(constraint_name)
                                                        FROM dmrs_check_constraints 
                                                        WHERE a.ovid = dataelement_ovid),NULL,'',
                                               ' / '|| (SELECT  DISTINCT(constraint_name) 
                                                        FROM dmrs_check_constraints 
                                                        WHERE a.ovid = dataelement_ovid))).getClobVal() c_name,
        Gather_Constraint_Details_XML(a.ovid, 'osdm_e')                                                 c_details,
        COUNT(a.attribute_name) over()                                                                  total_row_count
 FROM   dmrs_attributes a
 WHERE a.container_ovid = v_e_ovid
 AND  (a.ovid IN (SELECT dataelement_ovid FROM dmrs_avt) OR 
       a.ovid IN (SELECT dataelement_ovid FROM dmrs_value_ranges) OR 
       a.ovid IN (SELECT dataelement_ovid FROM dmrs_check_constraints));
rec_constraints cur_constraints%ROWTYPE;

BEGIN

  UTL_FILE.PUT_LINE(log_file, TO_CHAR(SYSDATE,'yy.mm.dd hh:mi:ss') ||' '|| 'Gathering single entity data started ...');

  DBMS_LOB.CREATETEMPORARY(res, TRUE);

  DBMS_LOB.APPEND (res,'<osdm_e:root xmlns:osdm_e="osdm_e">');

   FOR rec_general_data IN cur_general_data(v_entity_ovid) LOOP
   
      DBMS_LOB.APPEND (res, rec_general_data.design_name);
      DBMS_LOB.APPEND (res, rec_general_data.version_date);
   
      DBMS_LOB.APPEND (res, '<osdm_e:VersionComment>');
      DBMS_LOB.APPEND (res, '<osdm_e:VersionCommentDetails>');
         -- Tokenize rows
        FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(rec_general_data.comments||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                       FROM   dual
                       CONNECT BY REGEXP_INSTR(rec_general_data.comments||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
            SELECT XMLElement("osdm_e:VersionCommentRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
            DBMS_LOB.APPEND (res, token_value);
        END LOOP;
          
        DBMS_LOB.APPEND (res, '</osdm_e:VersionCommentDetails>');
        DBMS_LOB.APPEND (res, '</osdm_e:VersionComment>');       
      
        DBMS_LOB.APPEND (res, rec_general_data.model_name);
   END LOOP;

   -- Mapped tables
   FOR rec_mapped_tables IN cur_mapped_tables(v_entity_ovid) LOOP
      IF (cur_mapped_tables%ROWCOUNT = 1) THEN
        DBMS_LOB.APPEND (res,'<osdm_e:MappedTablesCollection>');
      END IF;

        DBMS_LOB.APPEND (res, '<osdm_e:MappedTablesDetails>');
        DBMS_LOB.APPEND (res, rec_mapped_tables.table_name);
        DBMS_LOB.APPEND (res, '</osdm_e:MappedTablesDetails>');

      IF (cur_mapped_tables%ROWCOUNT = rec_mapped_tables.total_row_count) THEN
        DBMS_LOB.APPEND (res, '</osdm_e:MappedTablesCollection>');
      END IF;
   END LOOP;

   -- Comments
   SELECT NVL(
            (SELECT t.text comments_in_rdbms
             FROM   dmrs_large_text t
             WHERE  t.ovid = v_entity_ovid
             AND    t.type='Comments'),
            (SELECT t.text comments_in_rdbms
             FROM   dmrs_large_text t
             WHERE  t.ovid = v_entity_ovid
             AND    t.type='CommentsInRDBMS'))                      description, 
            (SELECT t.text comments_in_rdbms
             FROM   dmrs_large_text t
             WHERE  t.ovid = v_entity_ovid
            AND    t.type='Note')                                   notes
   INTO   v_description, 
          v_notes
   FROM dual;

   DBMS_LOB.APPEND (res, '<osdm_e:Description>');
   DBMS_LOB.APPEND (res, '<osdm_e:DescriptionDetails>');
   -- Tokenize rows
   FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(v_description||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                  FROM   dual
                  CONNECT BY REGEXP_INSTR(v_description||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
       SELECT XMLElement("osdm_e:DescriptionRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
       DBMS_LOB.APPEND (res, token_value);
   END LOOP;
   DBMS_LOB.APPEND (res, '</osdm_e:DescriptionDetails>');
   DBMS_LOB.APPEND (res, '</osdm_e:Description>');

   DBMS_LOB.APPEND (res, '<osdm_e:Notes>');
   DBMS_LOB.APPEND (res, '<osdm_e:NotesDetails>');
   -- Tokenize rows
   FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(v_notes||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                  FROM   dual
                  CONNECT BY REGEXP_INSTR(v_notes||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
       SELECT XMLElement("osdm_e:NoteRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
       DBMS_LOB.APPEND (res, token_value);
   END LOOP;
   DBMS_LOB.APPEND (res, '</osdm_e:NotesDetails>');
   DBMS_LOB.APPEND (res, '</osdm_e:Notes>');

   FOR rec_entity IN cur_entity(v_entity_ovid) LOOP
      DBMS_LOB.APPEND (res, rec_entity.entity_name);
      DBMS_LOB.APPEND (res, rec_entity.pref_abbreviation);      
      DBMS_LOB.APPEND (res, rec_entity.classification_type_name);
      DBMS_LOB.APPEND (res, rec_entity.object_type_name);
      DBMS_LOB.APPEND (res, rec_entity.super_type);
      DBMS_LOB.APPEND (res, rec_entity.table_synonyms);
      DBMS_LOB.APPEND (res, rec_entity.number_of_attributes);
      DBMS_LOB.APPEND (res, rec_entity.number_rows_min);
      DBMS_LOB.APPEND (res, rec_entity.number_rows_max);
      DBMS_LOB.APPEND (res, rec_entity.expected_number_of_rows);
      DBMS_LOB.APPEND (res, rec_entity.expected_growth);
      DBMS_LOB.APPEND (res, rec_entity.growth_interval);
   END LOOP;

   -- Attributes
   FOR rec_attributes IN cur_attributes(v_entity_ovid) LOOP
      IF (cur_attributes%ROWCOUNT = 1) THEN
        DBMS_LOB.APPEND (res,'<osdm_e:AttributesCollection>');
      END IF;

        DBMS_LOB.APPEND (res, '<osdm_e:AttributeDetails>');
        DBMS_LOB.APPEND (res, rec_attributes.seq);
        DBMS_LOB.APPEND (res, rec_attributes.attr_name);
        DBMS_LOB.APPEND (res, rec_attributes.pk);
        DBMS_LOB.APPEND (res, rec_attributes.fk);
        DBMS_LOB.APPEND (res, rec_attributes.m);
        IF (INSTR(LOWER(rec_attributes.data_type),'unknown') = 0) THEN
           DBMS_LOB.APPEND (res, rec_attributes.data_type);
        ELSE
           SELECT XMLElement("osdm_e:DataType", '').getClobVal() INTO token_value FROM dual;
           DBMS_LOB.APPEND (res, token_value);
        END IF;
        DBMS_LOB.APPEND (res, rec_attributes.dt_kind);
        DBMS_LOB.APPEND (res, rec_attributes.domain_name);
        DBMS_LOB.APPEND (res, rec_attributes.formula);
        DBMS_LOB.APPEND (res, rec_attributes.pref_abbr);
        DBMS_LOB.APPEND (res, rec_attributes.synonyms);
        DBMS_LOB.APPEND (res,'</osdm_e:AttributeDetails>');

      IF (cur_attributes%ROWCOUNT = rec_attributes.total_row_count) THEN
        DBMS_LOB.APPEND (res, '</osdm_e:AttributesCollection>');
      END IF;
   END LOOP;

   -- Attribute Comments
   FOR rec_attributes_comments IN cur_attributes_comments(v_entity_ovid) LOOP
      IF (cur_attributes_comments%ROWCOUNT = 1) THEN
        DBMS_LOB.APPEND (res,'<osdm_e:AttributesCommentsCollection>');
      END IF;

        DBMS_LOB.APPEND (res, '<osdm_e:AttributeCommentsDetails>');
        DBMS_LOB.APPEND (res, rec_attributes_comments.seq);
        DBMS_LOB.APPEND (res, rec_attributes_comments.attribute_name);

        DBMS_LOB.APPEND (res, '<osdm_e:AttributeDescription>');
        DBMS_LOB.APPEND (res, '<osdm_e:AttributeDescriptionDetails>');
        -- Tokenize rows
        FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(rec_attributes_comments.description||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                       FROM   dual
                       CONNECT BY REGEXP_INSTR(rec_attributes_comments.description||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
            SELECT XMLElement("osdm_e:AttributeDescriptionRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
            DBMS_LOB.APPEND (res, token_value);
        END LOOP;
        DBMS_LOB.APPEND (res, '</osdm_e:AttributeDescriptionDetails>');
        DBMS_LOB.APPEND (res, '</osdm_e:AttributeDescription>');

        DBMS_LOB.APPEND (res, '<osdm_e:AttributeNotes>');
        DBMS_LOB.APPEND (res, '<osdm_e:AttributeNotesDetails>');
        -- Tokenize rows
        FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(rec_attributes_comments.notes||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                       FROM   dual
                       CONNECT BY REGEXP_INSTR(rec_attributes_comments.notes||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
                       
            SELECT XMLElement("osdm_e:AttributeNoteRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
            DBMS_LOB.APPEND (res, token_value);
        END LOOP;
        DBMS_LOB.APPEND (res, '</osdm_e:AttributeNotesDetails>');
        DBMS_LOB.APPEND (res, '</osdm_e:AttributeNotes>');

        DBMS_LOB.APPEND (res,'</osdm_e:AttributeCommentsDetails>');

      IF (cur_attributes_comments%ROWCOUNT = rec_attributes_comments.total_row_count) THEN
        DBMS_LOB.APPEND (res, '</osdm_e:AttributesCommentsCollection>');
      END IF;
   END LOOP;

   -- Constraints
   FOR rec_constraints IN cur_constraints(v_entity_ovid) LOOP
      IF (cur_constraints%ROWCOUNT = 1) THEN
         DBMS_LOB.APPEND (res,'<osdm_e:ConstraintsCollection>');
      END IF;

        DBMS_LOB.APPEND (res,'<osdm_e:ConstraintDetails>');
        DBMS_LOB.APPEND (res,rec_constraints.c_type);
        DBMS_LOB.APPEND (res,rec_constraints.c_name);
        DBMS_LOB.APPEND (res,rec_constraints.c_details);
        DBMS_LOB.APPEND (res,'</osdm_e:ConstraintDetails>');

      IF (cur_constraints%ROWCOUNT = rec_constraints.total_row_count) THEN
          DBMS_LOB.APPEND (res,'</osdm_e:ConstraintsCollection>');
      END IF;
   END LOOP;

   -- Identifiers
   FOR rec_identifiers IN cur_identifiers(v_entity_ovid) LOOP
      IF (cur_identifiers%ROWCOUNT = 1) THEN
        DBMS_LOB.APPEND (res, '<osdm_e:IdentifiersCollection>');
      END IF;
     
        DBMS_LOB.APPEND (res, '<osdm_e:IdentifierDetails>');
        DBMS_LOB.APPEND (res, rec_identifiers.nn);
        DBMS_LOB.APPEND (res, rec_identifiers.pi);
        DBMS_LOB.APPEND (res, rec_identifiers.element_name);
        DBMS_LOB.APPEND (res, rec_identifiers.type);
        DBMS_LOB.APPEND (res, rec_identifiers.source_label);
        DBMS_LOB.APPEND (res, rec_identifiers.target_label);
        DBMS_LOB.APPEND (res, '</osdm_e:IdentifierDetails>');

      IF (cur_identifiers%ROWCOUNT = rec_identifiers.total_row_count) THEN
         DBMS_LOB.APPEND (res, '</osdm_e:IdentifiersCollection>');
      END IF;
   END LOOP;

   -- Total count of relationships
   SELECT COUNT(1)
   INTO   v_rel_total_count
   FROM (
    SELECT r.ovid
    FROM   dmrs_relationships r,
           dmrs_entities      e
    WHERE  r.source_ovid  = e.ovid
    AND    e.ovid         = v_entity_ovid
    UNION ALL
    SELECT r.ovid
    FROM   dmrs_relationships r,
           dmrs_entities      e
    WHERE  r.target_ovid  = e.ovid
    AND    e.ovid         = v_entity_ovid);

   -- Relationships
   FOR rec_relationships IN cur_relationships(v_entity_ovid) LOOP
      IF (cur_relationships%ROWCOUNT = 1) THEN
         DBMS_LOB.APPEND (res, '<osdm_e:RelationshipsCollection>');
      END IF;

         DBMS_LOB.APPEND (res, '<osdm_e:RelationshipDetails>');
         DBMS_LOB.APPEND (res, rec_relationships.source_name);
         DBMS_LOB.APPEND (res, rec_relationships.source_role);
         DBMS_LOB.APPEND (res, rec_relationships.target_role);
         DBMS_LOB.APPEND (res, rec_relationships.in_arc);
         DBMS_LOB.APPEND (res, rec_relationships.cardinality);
         DBMS_LOB.APPEND (res, rec_relationships.dominant_role);
         DBMS_LOB.APPEND (res, rec_relationships.identifying);
         DBMS_LOB.APPEND (res, rec_relationships.transferable);
         DBMS_LOB.APPEND (res, '</osdm_e:RelationshipDetails>');

      IF (cur_relationships%ROWCOUNT = v_rel_total_count) THEN
         DBMS_LOB.APPEND (res, '</osdm_e:RelationshipsCollection>');
      END IF;

   END LOOP;

   -- Incoming Processes
   FOR rec_incoming_processes IN cur_incoming_processes(v_entity_ovid) LOOP
      IF (cur_incoming_processes%ROWCOUNT = 1) THEN
        DBMS_LOB.APPEND (res, '<osdm_e:IncomingProcessesCollection>');
      END IF;
        DBMS_LOB.APPEND (res, '<osdm_e:IncomingProcessDetails>');
        DBMS_LOB.APPEND (res, rec_incoming_processes.ipr_name);
        DBMS_LOB.APPEND (res, rec_incoming_processes.ipr_flow_name);
        DBMS_LOB.APPEND (res, rec_incoming_processes.ipr_crud_code);
        DBMS_LOB.APPEND (res, rec_incoming_processes.ipr_dfd_name);
        DBMS_LOB.APPEND (res, '</osdm_e:IncomingProcessDetails>');
      IF (cur_incoming_processes%ROWCOUNT = rec_incoming_processes.total_row_count) THEN
        DBMS_LOB.APPEND (res, '</osdm_e:IncomingProcessesCollection>');
      END IF;
   END LOOP;

   -- Outgoing Processes
   FOR rec_outgoing_processes IN cur_outgoing_processes(v_entity_ovid) LOOP
      IF (cur_outgoing_processes%ROWCOUNT = 1) THEN
        DBMS_LOB.APPEND (res, '<osdm_e:OutgoingProcessesCollection>');
      END IF;
        DBMS_LOB.APPEND (res, '<osdm_e:OugoingProcessDetails>');
        DBMS_LOB.APPEND (res, rec_outgoing_processes.opr_name);
        DBMS_LOB.APPEND (res, rec_outgoing_processes.opr_flow_name);
        DBMS_LOB.APPEND (res, rec_outgoing_processes.opr_crud_code);
        DBMS_LOB.APPEND (res, rec_outgoing_processes.opr_dfd_name);
        DBMS_LOB.APPEND (res, '</osdm_e:OugoingProcessDetails>');
      IF (cur_outgoing_processes%ROWCOUNT = rec_outgoing_processes.total_row_count) THEN
        DBMS_LOB.APPEND (res, '</osdm_e:OutgoingProcessesCollection>');
      END IF;
   END LOOP;

  DBMS_LOB.APPEND (res,'</osdm_e:root>');

  UTL_FILE.PUT_LINE(log_file, TO_CHAR(SYSDATE,'yy.mm.dd hh:mi:ss') ||' '|| 'Gathering single entity data ended');
  
RETURN res;

 EXCEPTION
 WHEN others THEN
  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Gather_SingleEntity_Data Exception : ' || SQLERRM);  
  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Gather_SingleEntity_Data Exception : ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  RETURN res;
 
END Gather_SingleEntity_Data;

FUNCTION Gather_AllEntities_Data(v_model_ovid IN VARCHAR2) RETURN CLOB IS 

res               CLOB;
v_notes           CLOB;
v_description     CLOB;
v_rel_total_count INTEGER;
token_value       CLOB;

CURSOR cur_general_data(v_m_ovid IN VARCHAR2) IS
 -- General data
 SELECT XMLElement("osdm_ae:DesignName",d.design_name).getClobVal()                                        design_name,
        XMLElement("osdm_ae:VersionDate",TO_CHAR(d.date_published,'dd.mm.yyyy hh24:mi:ss')).getClobVal()   version_date,
        d.version_comments                                                                                 comments,
        XMLElement("osdm_ae:ModelName",m.model_name).getClobVal()                                          model_name
 FROM   dmrs_designs d, 
        dmrs_models m
 WHERE  d.design_ovid = m.design_ovid
 AND    m.model_ovid = v_model_ovid;
rec_general_data cur_general_data%ROWTYPE;

CURSOR cur_all_entities(v_m_ovid IN VARCHAR2) IS
 SELECT /*+ index(e ENTITIES_FK_IDXV1) */
        XMLElement("osdm_ae:EntityName",e.entity_name).getClobVal()                                                                        entity_name,
        XMLElement("osdm_ae:ClassificationTypeName",e.classification_type_name).getClobVal()                                               classification_type_name,
        XMLElement("osdm_ae:Abbreviation",e.preferred_abbreviation).getClobVal()                                                           pref_abbreviation, 
        XMLElement("osdm_ae:SuperType",(SELECT e1.entity_name FROM  dmrs_entities e1 WHERE e.supertypeentity_ovid = e1.ovid)).getClobVal() super_type,
        XMLElement("osdm_ae:Synonyms", e.synonyms).getClobVal()                                                                            table_synonyms,
        XMLElement("osdm_ae:ObjectTypeName",e.structured_type_name).getClobVal()                                                           object_type_name,
        XMLElement("osdm_ae:NumberOfAttributes",e.number_data_elements).getClobVal()                                                       number_of_attributes, 
        XMLElement("osdm_ae:NumberOfRowsMin",e.min_volume).getClobVal()                                                                    number_rows_min, 
        XMLElement("osdm_ae:NumberOfRowsMax",e.max_volume).getClobVal()                                                                    number_rows_max, 
        XMLElement("osdm_ae:ExpectedNumberOfRows",e.expected_volume).getClobVal()                                                          expected_number_of_rows, 
        XMLElement("osdm_ae:ExpectedGrowth",e.growth_rate_percents).getClobVal()                                                           expected_growth,
        XMLElement("osdm_ae:GrowthInterval",e.growth_rate_interval).getClobVal()                                                           growth_interval,
        e.ovid                                                                                                                             entity_ovid,
        COUNT(e.entity_name) over() total_row_count
 FROM   dmrs_entities    e
 WHERE  e.model_ovid = v_m_ovid;
rec_all_entities cur_all_entities%ROWTYPE;

CURSOR cur_mapped_tables(v_e_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_ae:TableName",t.model_name||'.'||t.table_name).getClobVal() table_name,
        COUNT(t.table_name) over()                                total_row_count
 FROM   dmrs_entities e,
        dmrs_tables t,
        dmrs_mappings m
 WHERE  m.relational_object_ovid = t.ovid
 AND    m.logical_object_ovid = e.ovid
 AND    e.ovid = v_e_ovid;
rec_mapped_tables cur_mapped_tables%ROWTYPE;

CURSOR cur_attributes(v_e_ovid IN VARCHAR2) IS
 SELECT  XMLElement("osdm_ae:Sequence",a.sequence).getClobVal()                                                                                              seq, 
         XMLElement("osdm_ae:AttributeName",a.attribute_name).getClobVal()                                                                                  attr_name,
         XMLElement("osdm_ae:DataTypeKind",DECODE(a.datatype_kind,
                                                 'Domain',         'DOM',
                                                 'Logical Type',   'LT',
                                                 'Distinct Type',  'DT',
                                                 'Ref Struct Type','RST',
                                                 'Structured Type','ST',
                                                 'Collection Type','CT')                                                                                
                   ).getClobVal()                                                                                                                           dt_kind,
         XMLElement("osdm_ae:DomainName",DECODE(a.domain_name,'Unknown',null,a.domain_name)).getClobVal()                                                   domain_name,
         XMLElement("osdm_ae:DataType", 
            DECODE(a.datatype_kind, 
                  'Domain', a.logical_type_name ||' '||
                           DECODE (NVL(a.t_size,0),0,
                              DECODE(NVL(a.t_scale,0),0,
                                 DECODE(NVL(a.t_precision,0),0,null,'('|| DECODE(NVL(a.t_precision,0),0,null,a.t_precision) ||')'),
                                    '('|| DECODE(NVL(a.t_precision,0),0,null,a.t_precision) || ',' || DECODE(NVL(a.t_scale,0),0,null,a.t_scale)||')'),
                                    '('||TRIM(DECODE(a.t_size,0,null,a.t_size||' '||a.char_units ))||')'),
                   'Logical Type', a.logical_type_name  ||' '|| 
                           DECODE (NVL(a.t_size,0),0,
                               DECODE(NVL(a.t_scale,0),0,
                                  DECODE(NVL(a.t_precision,0),0,null,'('|| DECODE(NVL(a.t_precision,0),0,null,a.t_precision) ||')'),
                                     '('|| DECODE(NVL(a.t_precision,0),0,null,a.t_precision) || ',' || DECODE(NVL(a.t_scale,0),0,null,a.t_scale)||')'),
                                     '('||TRIM(DECODE(a.t_size,0,null,a.t_size||' '||a.char_units ))||')')
            )
          ).getClobVal()                                                                                                                                    data_type,
         XMLElement("osdm_ae:PK",a.pk_flag).getClobVal()                                                                                                    pk,
         XMLElement("osdm_ae:FK",a.fk_flag).getClobVal()                                                                                                    fk,
         XMLElement("osdm_ae:M",DECODE(a.mandatory,'N',' ',a.mandatory)).getClobVal()                                                                       m,
         XMLElement("osdm_ae:Formula",DECODE(a.formula,null,a.default_value,a.formula)).getClobVal()                                                        formula,
         XMLElement("osdm_ae:AttributeSynonyms",a.synonyms).getClobVal()                                                                                    synonyms,
         XMLElement("osdm_ae:PreferredAbbreviation",a.preferred_abbreviation).getClobVal()                                                                  pref_abbr,
         COUNT(a.sequence) over()                                                                                                                           total_row_count
  FROM   dmrs_attributes a
  WHERE  a.container_ovid = v_e_ovid
  ORDER BY a.sequence;
rec_attributes cur_attributes%ROWTYPE;

-- Attributes Comments Data
CURSOR cur_attributes_comments(v_e_ovid IN VARCHAR2) IS
 SELECT a.seq                          seq, 
        a.attribute_name               attribute_name, 
        a.description                  description, 
        a.notes                        notes,
        COUNT(a.attribute_name) over() total_row_count
 FROM (
  SELECT XMLElement("osdm_ae:AttributeCommentsSequence",a.sequence).getStringVal()  seq,
         XMLElement("osdm_ae:AttributeCommentsName",a.attribute_name).getStringVal()   attribute_name,
         NVL(
        (SELECT t.text comments_in_rdbms
         FROM   dmrs_large_text t
         WHERE  t.ovid = a.ovid
         AND    t.type='Comments'),
        (SELECT t.text comments_in_rdbms
         FROM   dmrs_large_text t
         WHERE  t.ovid = a.ovid
         AND    t.type='CommentsInRDBMS'))  description, 
        (SELECT t.text comments_in_rdbms
         FROM   dmrs_large_text t
         WHERE  t.ovid = a.ovid
         AND    t.type='Note')              notes
  FROM   dmrs_entities e, 
         dmrs_attributes a
  WHERE  e.ovid = a.container_ovid
  and    e.ovid = v_e_ovid
  ORDER BY a.sequence
 ) a
 WHERE DBMS_LOB.getlength(description) > 0 OR DBMS_LOB.getlength(notes) > 0;
rec_attributes_comments cur_attributes_comments%ROWTYPE;

CURSOR cur_identifiers(v_e_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_ae:IdentifierName",CASE WHEN ke.sequence>1 THEN ' ' ELSE ke.key_name END).getClobVal()                          nn,
        XMLElement("osdm_ae:PrimaryIdentifier",CASE WHEN ke.sequence>1 THEN ' ' ELSE DECODE(k.state,'Primary Key','Y') END).getClobVal() pi, 
        XMLElement("osdm_ae:ElementName",ke.element_name).getClobVal()                                                                   element_name,
        XMLElement("osdm_ae:ElementType",ke.type).getClobVal()                                                                           type,
        XMLElement("osdm_ae:SourceLabel",ke.source_label).getClobVal()                                                                   source_label,
        XMLElement("osdm_ae:TargetLabel",ke.target_label).getClobVal()                                                                   target_label,
        COUNT(ke.sequence) over()                                                                                                        total_row_count
 FROM   dmrs_keys          k,
        dmrs_key_elements ke
 WHERE  k.container_ovid = v_e_ovid
 AND   ke.key_ovid = k.ovid
 ORDER BY ke.sequence;
rec_identifiers cur_identifiers%ROWTYPE;

CURSOR cur_relationships(v_e_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_ae:SourceName",r.target_entity_name).getClobVal()                                                                  source_name, 
        XMLElement("osdm_ae:SourceRole",r.source_label).getClobVal()                                                                        source_role,
        XMLElement("osdm_ae:TargetRole",r.target_label).getClobVal()                                                                        target_role,
        XMLElement("osdm_ae:InArc",DECODE(r.in_arc,'N','',r.in_arc)).getClobVal()                                                           in_arc,
        XMLElement("osdm_ae:Cardinality",
           DECODE(r.source_optional,'Y',0,'1') || '..' || r.sourceto_target_cardinality
           ||':'||
           DECODE(r.target_optional,'Y',0,'1') || '..' || r.targetto_source_cardinality
           ).getClobVal()                                                                                                                   cardinality,
        XMLElement("osdm_ae:DominantRole",DECODE(r.dominant_role,'None','')).getClobVal()                                                   dominant_role,
        XMLElement("osdm_ae:Identifying",DECODE(r.identifying,'N','',r.identifying)).getClobVal()                                           identifying,
        XMLElement("osdm_ae:Transferable",DECODE(r.transferable,'N','',r.transferable)).getClobVal()                                        transferable
 FROM   dmrs_relationships r
 WHERE  r.source_ovid  = v_e_ovid
 UNION ALL
 SELECT XMLElement("osdm_ae:SourceName",r.source_entity_name).getClobVal()                                                                  source_name, 
        XMLElement("osdm_ae:SourceRole",r.source_label).getClobVal()                                                                        source_role,
        XMLElement("osdm_ae:TargetRole",r.target_label).getClobVal()                                                                        target_role,
        XMLElement("osdm_ae:InArc",DECODE(r.in_arc,'N','',r.in_arc)).getClobVal()                                                           in_arc,
        XMLElement("osdm_ae:Cardinality",
           DECODE(r.source_optional,'Y',0,'1') || '..' || r.sourceto_target_cardinality
           ||':'||
           DECODE(r.target_optional,'Y',0,'1') || '..' || r.targetto_source_cardinality
           ).getClobVal()                                                                                                                   cardinality,
        XMLElement("osdm_ae:DominantRole",DECODE(r.dominant_role,'None','')).getClobVal()                                                   dominant_role,
        XMLElement("osdm_ae:Identifying",DECODE(r.identifying,'N','',r.identifying)).getClobVal()                                           identifying,
        XMLElement("osdm_ae:Transferable",DECODE(r.transferable,'N','',r.transferable)).getClobVal()                                        transferable
 FROM   dmrs_relationships r
 WHERE  r.target_ovid  = v_e_ovid;
rec_relationships cur_relationships%ROWTYPE;

CURSOR cur_incoming_processes(v_e_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_ae:IncomingProcessName", NVL(pe.process_name,' ')).getClobVal()  ipr_name,
         XMLElement("osdm_ae:IncomingFlowName", NVL(pe.flow_name,' ')).getClobVal()       ipr_flow_name,
         XMLElement("osdm_ae:IncomingCRUDCode", NVL(pe.crud_code,' ')).getClobVal()       ipr_crud_code,
         XMLElement("osdm_ae:IncomingDFDName", NVL(pe.dfd_name,' ')).getClobVal()         ipr_dfd_name,
         COUNT(pe.process_name) over()                                                    total_row_count
  FROM   dmrs_process_entities pe
  WHERE  pe.entity_ovid = v_e_ovid
  AND    pe.flow_direction = 'IN'
  ORDER BY pe.process_name;
rec_incoming_processes cur_incoming_processes%ROWTYPE;

CURSOR cur_outgoing_processes(v_e_ovid IN VARCHAR2) IS
  SELECT XMLElement("osdm_ae:OutgoingProcessName", pe.process_name).getClobVal() opr_name,
         XMLElement("osdm_ae:OutgoingFlowName", pe.flow_name).getClobVal()       opr_flow_name,
         XMLElement("osdm_ae:OutgoingCRUDCode", pe.crud_code).getClobVal()       opr_crud_code,
         XMLElement("osdm_ae:OutgoingDFDName", pe.dfd_name).getClobVal()         opr_dfd_name,
         COUNT(pe.process_name) over()                                           total_row_count
  FROM   dmrs_process_entities pe
  WHERE  pe.entity_ovid = v_e_ovid
  AND    pe.flow_direction = 'OUT'
  ORDER BY pe.process_name;
rec_outgoing_processes cur_outgoing_processes%ROWTYPE;

-- Constraints
CURSOR cur_constraints(v_e_ovid IN VARCHAR2) IS
SELECT XMLElement("osdm_ae:ContstraintType", CASE WHEN rownum>1 THEN ''
                                              ELSE 'Attribute Level'
                                              END).getClobVal()                                        c_type,
        XMLElement("osdm_ae:ALCConstraintName", a.attribute_name || 
                                                DECODE((SELECT DISTINCT(constraint_name)
                                                        FROM dmrs_check_constraints 
                                                        WHERE a.ovid = dataelement_ovid),NULL,'',
                                               ' / '|| (SELECT  DISTINCT(constraint_name) 
                                                        FROM dmrs_check_constraints 
                                                        WHERE a.ovid = dataelement_ovid))).getClobVal() c_name,
        Gather_Constraint_Details_XML(a.ovid, 'osdm_ae')                                                c_details,
        COUNT(a.attribute_name) over()                                                                  total_row_count
 FROM   dmrs_attributes a
 WHERE a.container_ovid = v_e_ovid
 AND  (a.ovid IN (SELECT dataelement_ovid FROM dmrs_avt) OR 
       a.ovid IN (SELECT dataelement_ovid FROM dmrs_value_ranges) OR 
       a.ovid IN (SELECT dataelement_ovid FROM dmrs_check_constraints));
rec_constraints cur_constraints%ROWTYPE;

BEGIN

  UTL_FILE.PUT_LINE(log_file, TO_CHAR(SYSDATE,'yy.mm.dd hh:mi:ss') ||' '|| 'Gathering data for all entities started ...');
  
  DBMS_LOB.CREATETEMPORARY(res, TRUE);

  DBMS_LOB.APPEND (res,'<osdm_ae:root xmlns:osdm_ae="osdm_ae">');
  
  FOR rec_general_data IN cur_general_data(v_model_ovid) LOOP

     DBMS_LOB.APPEND (res, rec_general_data.design_name);
     DBMS_LOB.APPEND (res, rec_general_data.version_date);
     
       DBMS_LOB.APPEND (res, '<osdm_ae:VersionComment>');
       DBMS_LOB.APPEND (res, '<osdm_ae:VersionCommentDetails>');
      
       -- Tokenize rows
       FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(rec_general_data.comments||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                      FROM   dual
                      CONNECT BY REGEXP_INSTR(rec_general_data.comments||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
             SELECT XMLElement("osdm_ae:VersionCommentRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
             DBMS_LOB.APPEND (res, token_value);
          END LOOP;
         
       DBMS_LOB.APPEND (res, '</osdm_ae:VersionCommentDetails>');
       DBMS_LOB.APPEND (res, '</osdm_ae:VersionComment>');       
     
     
     DBMS_LOB.APPEND (res, rec_general_data.model_name);
  END LOOP;
 
   FOR rec_all_entities IN cur_all_entities(v_model_ovid) LOOP

      IF (cur_all_entities%ROWCOUNT = 1) THEN
           DBMS_LOB.APPEND (res,'<osdm_ae:EntitiesCollection>');
      END IF;

      DBMS_LOB.APPEND (res,'<osdm_ae:EntityDetails>');

      -- Mapped tables
      FOR rec_mapped_tables IN cur_mapped_tables(rec_all_entities.entity_ovid) LOOP
        IF (cur_mapped_tables%ROWCOUNT = 1) THEN
          DBMS_LOB.APPEND (res,'<osdm_ae:MappedTablesCollection>');
        END IF;

         DBMS_LOB.APPEND (res, '<osdm_ae:MappedTablesDetails>');
         DBMS_LOB.APPEND (res, rec_mapped_tables.table_name);
         DBMS_LOB.APPEND (res, '</osdm_ae:MappedTablesDetails>');

        IF (cur_mapped_tables%ROWCOUNT = rec_mapped_tables.total_row_count) THEN
         DBMS_LOB.APPEND (res, '</osdm_ae:MappedTablesCollection>');
        END IF;
      END LOOP;

      -- Comments
      SELECT NVL(
               (SELECT t.text comments_in_rdbms
                FROM   dmrs_large_text t
                WHERE  t.ovid = rec_all_entities.entity_ovid
                AND    t.type='Comments'),
               (SELECT t.text comments_in_rdbms
                FROM   dmrs_large_text t
                WHERE  t.ovid = rec_all_entities.entity_ovid
                AND    t.type='CommentsInRDBMS'))                      description, 
               (SELECT t.text comments_in_rdbms
                FROM   dmrs_large_text t
                WHERE  t.ovid = rec_all_entities.entity_ovid
               AND    t.type='Note')                                   notes
      INTO   v_description, 
             v_notes
      FROM dual;

      DBMS_LOB.APPEND (res, '<osdm_ae:Description>');
      DBMS_LOB.APPEND (res, '<osdm_ae:DescriptionDetails>');
      -- Tokenize rows
      FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(v_description||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                     FROM   dual
                     CONNECT BY REGEXP_INSTR(v_description||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
          SELECT XMLElement("osdm_ae:DescriptionRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
          DBMS_LOB.APPEND (res, token_value);
      END LOOP;
      DBMS_LOB.APPEND (res, '</osdm_ae:DescriptionDetails>');
      DBMS_LOB.APPEND (res, '</osdm_ae:Description>');

      DBMS_LOB.APPEND (res, '<osdm_ae:Notes>');
      DBMS_LOB.APPEND (res, '<osdm_ae:NotesDetails>');
      -- Tokenize rows
      FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(v_notes||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                     FROM   dual
                     CONNECT BY REGEXP_INSTR(v_notes||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
          SELECT XMLElement("osdm_ae:NoteRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
          DBMS_LOB.APPEND (res, token_value);
      END LOOP;
      DBMS_LOB.APPEND (res, '</osdm_ae:NotesDetails>');
      DBMS_LOB.APPEND (res, '</osdm_ae:Notes>');
      
      DBMS_LOB.APPEND (res, rec_all_entities.entity_name);
      DBMS_LOB.APPEND (res, rec_all_entities.pref_abbreviation);      
      DBMS_LOB.APPEND (res, rec_all_entities.classification_type_name);
      DBMS_LOB.APPEND (res, rec_all_entities.object_type_name);
      DBMS_LOB.APPEND (res, rec_all_entities.super_type);
      DBMS_LOB.APPEND (res, rec_all_entities.table_synonyms);
      DBMS_LOB.APPEND (res, rec_all_entities.number_of_attributes);
      DBMS_LOB.APPEND (res, rec_all_entities.number_rows_min);
      DBMS_LOB.APPEND (res, rec_all_entities.number_rows_max);
      DBMS_LOB.APPEND (res, rec_all_entities.expected_number_of_rows);
      DBMS_LOB.APPEND (res, rec_all_entities.expected_growth);
      DBMS_LOB.APPEND (res, rec_all_entities.growth_interval);

      -- Attributes
      FOR rec_attributes IN cur_attributes(rec_all_entities.entity_ovid) LOOP

         IF (cur_attributes%ROWCOUNT = 1) THEN
           DBMS_LOB.APPEND (res,'<osdm_ae:AttributesCollection>');
         END IF;
  
           DBMS_LOB.APPEND (res, '<osdm_ae:AttributeDetails>');
           DBMS_LOB.APPEND (res, rec_attributes.seq);
           DBMS_LOB.APPEND (res, rec_attributes.attr_name);
           DBMS_LOB.APPEND (res, rec_attributes.pk);
           DBMS_LOB.APPEND (res, rec_attributes.fk);
           DBMS_LOB.APPEND (res, rec_attributes.m);
           IF (INSTR(LOWER(rec_attributes.data_type),'unknown') = 0) THEN
              DBMS_LOB.APPEND (res, rec_attributes.data_type);
           ELSE
              SELECT XMLElement("osdm_ae:DataType", '').getClobVal() INTO token_value FROM dual;
              DBMS_LOB.APPEND (res, token_value);
           END IF;
           DBMS_LOB.APPEND (res, rec_attributes.dt_kind);
           DBMS_LOB.APPEND (res, rec_attributes.domain_name);
           DBMS_LOB.APPEND (res, rec_attributes.formula);
           DBMS_LOB.APPEND (res, rec_attributes.pref_abbr);
           DBMS_LOB.APPEND (res, rec_attributes.synonyms);
           DBMS_LOB.APPEND (res,'</osdm_ae:AttributeDetails>');

         IF (cur_attributes%ROWCOUNT = rec_attributes.total_row_count) THEN
          DBMS_LOB.APPEND (res, '</osdm_ae:AttributesCollection>');
         END IF;
      END LOOP;

      -- Attribute Comments
      FOR rec_attributes_comments IN cur_attributes_comments(rec_all_entities.entity_ovid) LOOP
         IF (cur_attributes_comments%ROWCOUNT = 1) THEN
           DBMS_LOB.APPEND (res,'<osdm_ae:AttributesCommentsCollection>');
         END IF;
      
           DBMS_LOB.APPEND (res, '<osdm_ae:AttributeCommentsDetails>');
           DBMS_LOB.APPEND (res, rec_attributes_comments.seq);
           DBMS_LOB.APPEND (res, rec_attributes_comments.attribute_name);
         
           DBMS_LOB.APPEND (res, '<osdm_ae:AttributeDescription>');
           DBMS_LOB.APPEND (res, '<osdm_ae:AttributeDescriptionDetails>');
           -- Tokenize rows
           FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(rec_attributes_comments.description||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                          FROM   dual
                          CONNECT BY REGEXP_INSTR(rec_attributes_comments.description||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
               SELECT XMLElement("osdm_ae:AttributeDescriptionRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
               DBMS_LOB.APPEND (res, token_value);
           END LOOP;
           DBMS_LOB.APPEND (res, '</osdm_ae:AttributeDescriptionDetails>');
           DBMS_LOB.APPEND (res, '</osdm_ae:AttributeDescription>');

           DBMS_LOB.APPEND (res, '<osdm_ae:AttributeNotes>');
           DBMS_LOB.APPEND (res, '<osdm_ae:AttributeNotesDetails>');
           -- Tokenize rows
           FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(rec_attributes_comments.notes||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                          FROM   dual
                          CONNECT BY REGEXP_INSTR(rec_attributes_comments.notes||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
                          
               SELECT XMLElement("osdm_ae:AttributeNoteRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
               DBMS_LOB.APPEND (res, token_value);
           END LOOP;
           DBMS_LOB.APPEND (res, '</osdm_ae:AttributeNotesDetails>');
           DBMS_LOB.APPEND (res, '</osdm_ae:AttributeNotes>');
  
           DBMS_LOB.APPEND (res,'</osdm_ae:AttributeCommentsDetails>');
  
         IF (cur_attributes_comments%ROWCOUNT = rec_attributes_comments.total_row_count) THEN
           DBMS_LOB.APPEND (res, '</osdm_ae:AttributesCommentsCollection>');
         END IF;
      END LOOP;

      -- Constraints
      FOR rec_constraints IN cur_constraints(rec_all_entities.entity_ovid) LOOP
         IF (cur_constraints%ROWCOUNT = 1) THEN
            DBMS_LOB.APPEND (res,'<osdm_ae:ConstraintsCollection>');
         END IF;

           DBMS_LOB.APPEND (res,'<osdm_ae:ConstraintDetails>');
           DBMS_LOB.APPEND (res,rec_constraints.c_type);
           DBMS_LOB.APPEND (res,rec_constraints.c_name);
           DBMS_LOB.APPEND (res,rec_constraints.c_details);
           DBMS_LOB.APPEND (res,'</osdm_ae:ConstraintDetails>');

         IF (cur_constraints%ROWCOUNT = rec_constraints.total_row_count) THEN
             DBMS_LOB.APPEND (res,'</osdm_ae:ConstraintsCollection>');
         END IF;
      END LOOP;

      -- Identifiers
      FOR rec_identifiers IN cur_identifiers(rec_all_entities.entity_ovid) LOOP
         IF (cur_identifiers%ROWCOUNT = 1) THEN
           DBMS_LOB.APPEND (res, '<osdm_ae:IdentifiersCollection>');
         END IF;
        
           DBMS_LOB.APPEND (res, '<osdm_ae:IdentifierDetails>');
           DBMS_LOB.APPEND (res, rec_identifiers.nn);
           DBMS_LOB.APPEND (res, rec_identifiers.pi);
           DBMS_LOB.APPEND (res, rec_identifiers.element_name);
           DBMS_LOB.APPEND (res, rec_identifiers.type);
           DBMS_LOB.APPEND (res, rec_identifiers.source_label);
           DBMS_LOB.APPEND (res, rec_identifiers.target_label);
           DBMS_LOB.APPEND (res, '</osdm_ae:IdentifierDetails>');

         IF (cur_identifiers%ROWCOUNT = rec_identifiers.total_row_count) THEN
            DBMS_LOB.APPEND (res, '</osdm_ae:IdentifiersCollection>');
         END IF;
      END LOOP;

      -- Total count of relationships
      SELECT COUNT(1)
      INTO   v_rel_total_count
      FROM (
       SELECT r.ovid
       FROM   dmrs_relationships r,
              dmrs_entities      e
       WHERE  r.source_ovid  = e.ovid
       AND    e.ovid         = rec_all_entities.entity_ovid
       UNION ALL
       SELECT r.ovid
       FROM   dmrs_relationships r,
              dmrs_entities      e
       WHERE  r.target_ovid  = e.ovid
       AND    e.ovid         = rec_all_entities.entity_ovid);

      -- Relationships
      FOR rec_relationships IN cur_relationships(rec_all_entities.entity_ovid) LOOP
         IF (cur_relationships%ROWCOUNT = 1) THEN
            DBMS_LOB.APPEND (res, '<osdm_ae:RelationshipsCollection>');
         END IF;

            DBMS_LOB.APPEND (res, '<osdm_ae:RelationshipDetails>');
            DBMS_LOB.APPEND (res, rec_relationships.source_name);
            DBMS_LOB.APPEND (res, rec_relationships.source_role);
            DBMS_LOB.APPEND (res, rec_relationships.target_role);
            DBMS_LOB.APPEND (res, rec_relationships.in_arc);
            DBMS_LOB.APPEND (res, rec_relationships.cardinality);
            DBMS_LOB.APPEND (res, rec_relationships.dominant_role);
            DBMS_LOB.APPEND (res, rec_relationships.identifying);
            DBMS_LOB.APPEND (res, rec_relationships.transferable);
            DBMS_LOB.APPEND (res, '</osdm_ae:RelationshipDetails>');

         IF (cur_relationships%ROWCOUNT = v_rel_total_count) THEN
            DBMS_LOB.APPEND (res, '</osdm_ae:RelationshipsCollection>');
         END IF;

      END LOOP;

      -- Incoming Processes
      FOR rec_incoming_processes IN cur_incoming_processes(rec_all_entities.entity_ovid) LOOP
         IF (cur_incoming_processes%ROWCOUNT = 1) THEN
           DBMS_LOB.APPEND (res, '<osdm_ae:IncomingProcessesCollection>');
         END IF;
           DBMS_LOB.APPEND (res, '<osdm_ae:IncomingProcessDetails>');
           DBMS_LOB.APPEND (res, rec_incoming_processes.ipr_name);
           DBMS_LOB.APPEND (res, rec_incoming_processes.ipr_flow_name);
           DBMS_LOB.APPEND (res, rec_incoming_processes.ipr_crud_code);
           DBMS_LOB.APPEND (res, rec_incoming_processes.ipr_dfd_name);
           DBMS_LOB.APPEND (res, '</osdm_ae:IncomingProcessDetails>');
         IF (cur_incoming_processes%ROWCOUNT = rec_incoming_processes.total_row_count) THEN
           DBMS_LOB.APPEND (res, '</osdm_ae:IncomingProcessesCollection>');
         END IF;
      END LOOP;

      -- Outgoing Processes
      FOR rec_outgoing_processes IN cur_outgoing_processes(rec_all_entities.entity_ovid) LOOP
         IF (cur_outgoing_processes%ROWCOUNT = 1) THEN
           DBMS_LOB.APPEND (res, '<osdm_ae:OutgoingProcessesCollection>');
         END IF;
           DBMS_LOB.APPEND (res, '<osdm_ae:OugoingProcessDetails>');
           DBMS_LOB.APPEND (res, rec_outgoing_processes.opr_name);
           DBMS_LOB.APPEND (res, rec_outgoing_processes.opr_flow_name);
           DBMS_LOB.APPEND (res, rec_outgoing_processes.opr_crud_code);
           DBMS_LOB.APPEND (res, rec_outgoing_processes.opr_dfd_name);
           DBMS_LOB.APPEND (res, '</osdm_ae:OugoingProcessDetails>');
         IF (cur_outgoing_processes%ROWCOUNT = rec_outgoing_processes.total_row_count) THEN
           DBMS_LOB.APPEND (res, '</osdm_ae:OutgoingProcessesCollection>');
         END IF;
      END LOOP;

      DBMS_LOB.APPEND (res,'</osdm_ae:EntityDetails>');

      IF (cur_all_entities%ROWCOUNT = rec_all_entities.total_row_count) THEN
         DBMS_LOB.APPEND (res,'</osdm_ae:EntitiesCollection>');
      END IF;

   END LOOP;

  DBMS_LOB.APPEND (res,'</osdm_ae:root>');

  UTL_FILE.PUT_LINE(log_file, TO_CHAR(SYSDATE,'yy.mm.dd hh:mi:ss') ||' '|| 'Gathering data for all entities ended');  

RETURN res;
  
 EXCEPTION
 WHEN others THEN
  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Gather_AllEntities_Data Exception : ' || SQLERRM);  
  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Gather_AllEntities_Data Exception : ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  RETURN res;
 
END Gather_AllEntities_Data;

FUNCTION Gather_Glossary_Data(v_glossary_ovid IN VARCHAR2) RETURN CLOB IS 

res         CLOB;
token_value CLOB;

CURSOR cur_glossary(v_g_ovid IN VARCHAR2) IS
 SELECT  /*+ index(g GLOSSARIES_OVID_IDX) */
         XMLElement("osdm_g:GlossaryName", g.glossary_name).getClobVal()                                      glossary_name,
         g.description                                                                                        description,
         XMLElement("osdm_g:FileName", g.file_name).getStringVal()                                            file_name,
         XMLElement("osdm_g:IncompleteModifiers", DECODE(g.incomplete_modifiers,'N','','Y')).getStringVal()   inc_modifiers,
         XMLElement("osdm_g:CaseSensitive", DECODE(g.case_sensitive,'N','','Y')).getStringVal()               case_sensitive,
         XMLElement("osdm_g:UniqueAbbreviations", DECODE(g.unique_abbrevs,'N','','Y')).getStringVal()         unique_abbreviations,
         XMLElement("osdm_g:SeparatorType", g.separator_type).getStringVal()                                  separator_type,
         XMLElement("osdm_g:SeparatorChar", g.separator_char).getStringVal()                                  separator_char
 FROM    dmrs_glossaries g
 WHERE   g.glossary_ovid = v_g_ovid;
rec_glossary cur_glossary%ROWTYPE;

CURSOR cur_glossary_words(v_g_ovid IN VARCHAR2) IS
 SELECT /*+ index(g GLOSSARIES_OVID_IDX) */
        XMLElement("osdm_g:TermName", gt.term_name).getClobVal()                            term_name,
        XMLElement("osdm_g:Plural", gt.plural).getClobVal()                                 plural,
        XMLElement("osdm_g:Abbreviation", gt.abbrev).getClobVal()                           abbr,
        XMLElement("osdm_g:AltAbbreviation", gt.alt_abbrev).getClobVal()                    alt_abbr,
        XMLElement("osdm_g:P", DECODE(gt.prime_word,'N','',gt.prime_word)).getClobVal()     p_word,
        XMLElement("osdm_g:C", DECODE(gt.class_word,'N','',gt.class_word)).getClobVal()     c_word,
        XMLElement("osdm_g:M", DECODE(gt.modifier,'N','',gt.modifier)).getClobVal()         modifier,
        XMLElement("osdm_g:Q", DECODE(gt.qualifier,'N','',gt.qualifier)).getClobVal()       qualifier,
        gt.short_description                                                                description,
        COUNT(gt.term_name) over() total_row_count
 FROM   dmrs_glossaries g,
        dmrs_glossary_terms gt
 WHERE  g.glossary_ovid = gt.glossary_ovid
 AND    g.glossary_ovid = v_g_ovid;
rec_glossary_words cur_glossary_words%ROWTYPE;

BEGIN

  UTL_FILE.PUT_LINE(log_file, TO_CHAR(SYSDATE,'yy.mm.dd hh:mi:ss') ||' '|| 'Gathering glossary data started ...');
 
  DBMS_LOB.CREATETEMPORARY(res, TRUE);
  DBMS_LOB.APPEND (res,'<osdm_g:root xmlns:osdm_g="osdm_g">');
  
  FOR rec_glossary IN cur_glossary(v_glossary_ovid) LOOP
  
     DBMS_LOB.APPEND (res, rec_glossary.glossary_name);
  
     DBMS_LOB.APPEND (res, '<osdm_g:Description>');
     DBMS_LOB.APPEND (res, '<osdm_g:DescriptionDetails>');
     -- Tokenize rows
     FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(rec_glossary.description||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                    FROM   dual
                    CONNECT BY REGEXP_INSTR(rec_glossary.description||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
         SELECT XMLElement("osdm_g:DescriptionRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
         DBMS_LOB.APPEND (res, token_value);
     END LOOP;
     DBMS_LOB.APPEND (res, '</osdm_g:DescriptionDetails>');
     DBMS_LOB.APPEND (res, '</osdm_g:Description>');       

     DBMS_LOB.APPEND (res, rec_glossary.file_name);
     DBMS_LOB.APPEND (res, rec_glossary.inc_modifiers);
     DBMS_LOB.APPEND (res, rec_glossary.case_sensitive);
     DBMS_LOB.APPEND (res, rec_glossary.unique_abbreviations);
     DBMS_LOB.APPEND (res, rec_glossary.separator_type);
     DBMS_LOB.APPEND (res, rec_glossary.separator_char);
  END LOOP;

  FOR rec_glossary_words IN cur_glossary_words(v_glossary_ovid) LOOP
     IF (cur_glossary_words%ROWCOUNT = 1) THEN
       DBMS_LOB.APPEND (res, '<osdm_g:GlossaryCollection>');
     END IF;
       DBMS_LOB.APPEND (res, '<osdm_g:GlossaryDetail>');
       DBMS_LOB.APPEND (res, rec_glossary_words.term_name);
       DBMS_LOB.APPEND (res, rec_glossary_words.plural);
       DBMS_LOB.APPEND (res, rec_glossary_words.abbr);
       DBMS_LOB.APPEND (res, rec_glossary_words.alt_abbr);
       DBMS_LOB.APPEND (res, rec_glossary_words.p_word);
       DBMS_LOB.APPEND (res, rec_glossary_words.c_word);
       DBMS_LOB.APPEND (res, rec_glossary_words.modifier);
       DBMS_LOB.APPEND (res, rec_glossary_words.qualifier);

       DBMS_LOB.APPEND (res, '<osdm_g:SDescription>');
       DBMS_LOB.APPEND (res, '<osdm_g:SDescriptionDetails>');
       -- Tokenize rows
       FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(rec_glossary_words.description||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                      FROM   dual
                      CONNECT BY REGEXP_INSTR(rec_glossary_words.description||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
           SELECT XMLElement("osdm_g:SDescriptionRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
           DBMS_LOB.APPEND (res, token_value);
       END LOOP;
       DBMS_LOB.APPEND (res, '</osdm_g:SDescriptionDetails>');
       DBMS_LOB.APPEND (res, '</osdm_g:SDescription>');       

       DBMS_LOB.APPEND (res, '</osdm_g:GlossaryDetail>');
     IF (cur_glossary_words%ROWCOUNT = rec_glossary_words.total_row_count) THEN
          DBMS_LOB.APPEND (res, '</osdm_g:GlossaryCollection>');
     END IF;
  END LOOP;

  DBMS_LOB.APPEND (res, '</osdm_g:root>');
  
  UTL_FILE.PUT_LINE(log_file, TO_CHAR(SYSDATE,'yy.mm.dd hh:mi:ss') ||' '|| 'Gathering glossary data ended');
  
RETURN res;

 EXCEPTION
 WHEN others THEN
  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Gather_Glossary_Data Exception : ' || SQLERRM);  
  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Gather_Glossary_Data Exception : ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  RETURN res;

END Gather_Glossary_Data;

FUNCTION Gather_Constraint_Details_HTML(col_attr_ovid VARCHAR2) RETURN CLOB IS

clob_ CLOB;
clob_constraints CLOB;
clob_ranges CLOB;
clob_vl CLOB;

CURSOR cur_c_constraints(v_ovid IN VARCHAR2) IS
 SELECT constraint_name,
        text,
        database_type
 FROM   dmrs_check_constraints
 WHERE  dataelement_ovid = v_ovid
 ORDER BY sequence;
 rec_c_constraints cur_c_constraints % rowtype;

 CURSOR cur_ranges(v_ovid IN VARCHAR2) IS
 SELECT begin_value,
        end_value,
        short_description
 FROM   dmrs_value_ranges
 WHERE  dataelement_ovid = v_ovid
 ORDER BY sequence;
rec_ranges cur_ranges % rowtype;

CURSOR cur_valuelist_columns(v_ovid IN VARCHAR2) IS
 SELECT av.VALUE,
        av.short_description
 FROM   dmrs_avt av,
        dmrs_columns c
 WHERE  c.ovid = av.dataelement_ovid
 AND    av.dataelement_ovid = v_ovid;
rec_valuelist_columns cur_valuelist_columns % rowtype;

BEGIN

    FOR rec_c_constraints IN cur_c_constraints(col_attr_ovid) LOOP
      clob_constraints := clob_constraints 
                                           || '<tr><td>'
                                           || REPLACE(rec_c_constraints.text, Chr(10), '<br/>')
                                           || '</td><td align="center">' 
                                           || rec_c_constraints.database_type 
                                           || '</td></tr>';
    END LOOP;

    FOR rec_ranges IN cur_ranges(col_attr_ovid) LOOP
      clob_ranges := clob_ranges || '<tr><td align="right">' 
                                 || rec_ranges.begin_value 
                                 || '</td><td align="right">' 
                                 || rec_ranges.end_value 
                                 || '</td><td>' 
                                 || REPLACE(rec_ranges.short_description, Chr(10), '<br/>')
                                 || '</td></tr>';
    END LOOP;

    FOR rec_valuelist_columns IN cur_valuelist_columns(col_attr_ovid) LOOP
      clob_vl := clob_vl || '<tr><td align="right">' 
                         || rec_valuelist_columns.VALUE 
                         || '</td><td>' 
                         || REPLACE(rec_valuelist_columns.short_description, Chr(10), '<br/>')
                         || '</td></tr>';

    END LOOP;

    IF (clob_constraints IS NULL AND clob_ranges IS NULL AND clob_vl IS NULL) THEN
      RETURN '';
    ELSE
        
      clob_ := '<table class="inlineTable">';

      IF clob_constraints IS NOT NULL THEN
        clob_ := clob_ || '<tr><th>';
        clob_ := clob_ || '<table class="inlineTable">';
        clob_ := clob_ || '<tr><th colspan="3">Check Constraint</th></tr>';
        clob_ := clob_ || '<tr><th>Text</th><th>DB Type</th></tr>';
        clob_ := clob_ || clob_constraints;
        clob_ := clob_ || '</table>';
        clob_ := clob_ || '</th></tr>';
      END IF;

      IF clob_ranges IS NOT NULL THEN
        clob_ := clob_ || '<tr><th>';
        clob_ := clob_ || '<table class="inlineTable">';
        clob_ := clob_ || '<tr><th colspan="3">Ranges</th></tr>';
        clob_ := clob_ || '<tr><th>Begin Value</th><th>End Value</th><th>Description</th></tr>';
        clob_ := clob_ || clob_ranges;
        clob_ := clob_ || '</table>';
        clob_ := clob_ || '</th></tr>';
      END IF;

      IF clob_vl IS NOT NULL THEN
        clob_ := clob_ || '<tr><th>';
        clob_ := clob_ || '<table class="inlineTable">';
        clob_ := clob_ || '<tr><th colspan="2">Value List</th></tr>';
        clob_ := clob_ || '<tr><th>Value</th><th>Description</th></tr>';
        clob_ := clob_ || clob_vl;
        clob_ := clob_ || '</table>';
        clob_ := clob_ || '</th></tr>';
      END IF;

      clob_ := clob_ || '</table>';

      RETURN clob_;

    END IF;

EXCEPTION
 WHEN others THEN
  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Gather_Constraint_Details_HTML Exception : ' || SQLERRM);  
  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Gather_Constraint_Details_HTML Exception : ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  RETURN clob_;
  
END Gather_Constraint_Details_HTML;

FUNCTION Gather_Domain_Constraints_HTML (domain_ovid VARCHAR2) RETURN CLOB IS

clob_            CLOB;
clob_constraints CLOB;
clob_ranges      CLOB;
clob_vl          CLOB;

CURSOR cur_c_constraints(v_c_ovid IN VARCHAR2) IS
 SELECT NVL(text,' ')           text,
        NVL(database_type,' ')  database_type
 FROM   dmrs_domain_check_constraints
 WHERE  domain_ovid = v_c_ovid
 ORDER BY sequence;
rec_c_constraints cur_c_constraints%rowtype;

CURSOR cur_ranges(v_c_ovid IN VARCHAR2) IS
 SELECT NVL(begin_value,' ')           begin_value,
        NVL(end_value, ' ')            end_value,
        NVL(short_description,' ')     short_description
 FROM   dmrs_domain_value_ranges
 WHERE  domain_ovid = v_c_ovid
 ORDER BY sequence;
rec_ranges cur_ranges%rowtype;

CURSOR cur_valuelist_columns(v_c_ovid IN VARCHAR2) IS
 SELECT NVL(av.value,' ')             value,
        NVL(av.short_description,' ') short_description
 FROM   dmrs_domain_avt av
 WHERE  av.domain_ovid = v_c_ovid;
rec_valuelist_columns cur_valuelist_columns%rowtype;

BEGIN
    
    DBMS_LOB.CREATETEMPORARY(clob_constraints, TRUE);
    DBMS_LOB.CREATETEMPORARY(clob_ranges, TRUE);
    DBMS_LOB.CREATETEMPORARY(clob_vl, TRUE);
    DBMS_LOB.CREATETEMPORARY(clob_, TRUE);
    
    FOR rec_c_constraints IN cur_c_constraints(domain_ovid) LOOP
        DBMS_LOB.APPEND (clob_constraints, '<tr><td>');
        DBMS_LOB.APPEND (clob_constraints, REPLACE(rec_c_constraints.text, Chr(10), '<br/>'));
        DBMS_LOB.APPEND (clob_constraints, '</td><td align="center">' );
        DBMS_LOB.APPEND (clob_constraints, rec_c_constraints.database_type );
        DBMS_LOB.APPEND (clob_constraints, '</td></tr>');
    END LOOP;

    FOR rec_ranges IN cur_ranges(domain_ovid) LOOP
        DBMS_LOB.APPEND (clob_ranges,'<tr><td align="right">');
        DBMS_LOB.APPEND (clob_ranges, rec_ranges.begin_value);
        DBMS_LOB.APPEND (clob_ranges,'</td><td align="right">');    
        DBMS_LOB.APPEND (clob_ranges, rec_ranges.end_value);
        DBMS_LOB.APPEND (clob_ranges,'</td><td>');
        DBMS_LOB.APPEND (clob_ranges,REPLACE(rec_ranges.short_description, Chr(10), '<br/>'));
        DBMS_LOB.APPEND (clob_ranges,'</td></tr>');
    END LOOP;

    FOR rec_valuelist_columns IN cur_valuelist_columns(domain_ovid) LOOP
        DBMS_LOB.APPEND (clob_vl,'<tr><td align="right">');
        DBMS_LOB.APPEND (clob_vl,rec_valuelist_columns.VALUE);
        DBMS_LOB.APPEND (clob_vl,'</td><td>'); 
        DBMS_LOB.APPEND (clob_vl,REPLACE(rec_valuelist_columns.short_description, Chr(10), '<br/>'));
        DBMS_LOB.APPEND (clob_vl,'</td></tr>');
    END LOOP;

    IF (clob_constraints IS NULL AND clob_ranges IS NULL AND clob_vl IS NULL) THEN
      RETURN '';
    ELSE

      DBMS_LOB.APPEND (clob_, '<table class="inlineTable">');

      IF clob_constraints IS NOT NULL THEN
         DBMS_LOB.APPEND (clob_,'<tr><th>');
         DBMS_LOB.APPEND (clob_,'<table class="inlineTable">');
         DBMS_LOB.APPEND (clob_,'<tr><th colspan="3">Check Constraint</th></tr>');
         DBMS_LOB.APPEND (clob_,'<tr><th>Text</th><th>DB Type</th></tr>');
         DBMS_LOB.APPEND (clob_,clob_constraints);
         DBMS_LOB.APPEND (clob_,'</table>');
         DBMS_LOB.APPEND (clob_,'</th></tr>');
      END IF;

      IF clob_ranges IS NOT NULL THEN
         DBMS_LOB.APPEND (clob_,'<tr><th>');
         DBMS_LOB.APPEND (clob_,'<table class="inlineTable">');
         DBMS_LOB.APPEND (clob_,'<tr><th colspan="3">Ranges</th></tr>');
         DBMS_LOB.APPEND (clob_,'<tr><th>Begin Value</th><th>End Value</th><th>Description</th></tr>');
         DBMS_LOB.APPEND (clob_,clob_ranges);
         DBMS_LOB.APPEND (clob_,'</table>');
         DBMS_LOB.APPEND (clob_,'</th></tr>');
      END IF;

      IF clob_vl IS NOT NULL THEN
         DBMS_LOB.APPEND (clob_,'<tr><th>');
         DBMS_LOB.APPEND (clob_,'<table class="inlineTable">');
         DBMS_LOB.APPEND (clob_,'<tr><th colspan="2">Value List</th></tr>');
         DBMS_LOB.APPEND (clob_,'<tr><th>Value</th><th>Description</th></tr>');
         DBMS_LOB.APPEND (clob_,clob_vl);
         DBMS_LOB.APPEND (clob_,'</table>');
         DBMS_LOB.APPEND (clob_,'</th></tr>');
      END IF;

      DBMS_LOB.APPEND (clob_,'</table>');
    END IF;

 RETURN clob_;
 
EXCEPTION
 WHEN others THEN
  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Gather_Domain_Constraints_HTML Exception : : ' || SQLERRM);  
  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Gather_Domain_Constraints_HTML Exception : ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  RETURN clob_;

END Gather_Domain_Constraints_HTML;

FUNCTION Gather_Domain_Constraints_XML(domain_ovid VARCHAR2) RETURN CLOB IS

res          CLOB;
v_cc_created BOOLEAN := FALSE;

CURSOR cur_c_constraints(v_c_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_ad:Text",d.text).getClobVal()                  text,
        XMLElement("osdm_ad:DatabaseType",d.database_type).getClobVal() database_type,
        COUNT(text) over()                                              total_row_count
 FROM   dmrs_domain_check_constraints d
 WHERE  d.domain_ovid = v_c_ovid
 ORDER BY d.database_type;
rec_c_constraints cur_c_constraints%rowtype;

CURSOR cur_ranges(v_c_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_ad:RangeBeginValue",d.begin_value).getClobVal()             begin_value,
        XMLElement("osdm_ad:RangeEndValue",d.end_value).getClobVal()                 end_value,
        XMLElement("osdm_ad:RangeShortDescription",d.short_description).getClobVal() short_description,
        COUNT(begin_value) over() total_row_count
 FROM   dmrs_domain_value_ranges d
 WHERE  d.domain_ovid = v_c_ovid
 ORDER BY d.begin_value, 
          d.end_value,
          d.short_description;
rec_ranges cur_ranges%rowtype;

CURSOR cur_valuelist_columns(v_c_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_ad:VLValue",av.value).getClobVal()                         v_value, 
        XMLElement("osdm_ad:VLShortDescription",av.short_description).getClobVal()  short_description,
        COUNT(value) over() total_row_count
 FROM   dmrs_domain_avt av
 WHERE  av.domain_ovid = v_c_ovid
 ORDER BY av.value, 
          av.short_description;
rec_valuelist_columns cur_valuelist_columns%rowtype;

BEGIN

    DBMS_LOB.CREATETEMPORARY(res, TRUE);

    FOR rec_ranges IN cur_ranges(domain_ovid) LOOP
       IF (cur_ranges%ROWCOUNT = 1) THEN
          IF NOT v_cc_created THEN 
            DBMS_LOB.APPEND (res, '<osdm_ad:ConstraintsCollection>');
            DBMS_LOB.APPEND (res, '<osdm_ad:ConstraintDetails>');
            v_cc_created := TRUE;
          END IF;
          DBMS_LOB.APPEND (res,'<osdm_ad:RangesCollection>');
       END IF;
          DBMS_LOB.APPEND (res,'<osdm_ad:RangeDetails>');
          DBMS_LOB.APPEND (res,rec_ranges.begin_value);
          DBMS_LOB.APPEND (res,rec_ranges.end_value);
          DBMS_LOB.APPEND (res,rec_ranges.short_description);
          DBMS_LOB.APPEND (res,'</osdm_ad:RangeDetails>');
       IF (cur_ranges%ROWCOUNT = rec_ranges.total_row_count) THEN
          DBMS_LOB.APPEND (res, '</osdm_ad:RangesCollection>');
       END IF;
    END LOOP;

    FOR rec_valuelist_columns IN cur_valuelist_columns(domain_ovid) LOOP
       IF (cur_valuelist_columns%ROWCOUNT = 1) THEN
          IF NOT v_cc_created THEN 
            DBMS_LOB.APPEND (res, '<osdm_ad:ConstraintsCollection>');
            DBMS_LOB.APPEND (res, '<osdm_ad:ConstraintDetails>');
            v_cc_created := TRUE;
          END IF;
          DBMS_LOB.APPEND (res,'<osdm_ad:ValueListsCollection>');
       END IF;
          DBMS_LOB.APPEND (res,'<osdm_ad:ValueListDetails>');
          DBMS_LOB.APPEND (res,rec_valuelist_columns.v_value);
          DBMS_LOB.APPEND (res,rec_valuelist_columns.short_description);
          DBMS_LOB.APPEND (res,'</osdm_ad:ValueListDetails>');
       IF (cur_valuelist_columns%ROWCOUNT = rec_valuelist_columns.total_row_count) THEN
          DBMS_LOB.APPEND (res, '</osdm_ad:ValueListsCollection>');
       END IF;
    END LOOP;
   
    FOR rec_c_constraints IN cur_c_constraints(domain_ovid) LOOP
       IF (cur_c_constraints%ROWCOUNT = 1) THEN
          IF NOT v_cc_created THEN 
            DBMS_LOB.APPEND (res, '<osdm_ad:ConstraintsCollection>');
            DBMS_LOB.APPEND (res, '<osdm_ad:ConstraintDetails>');
            v_cc_created := TRUE;
          END IF;
          DBMS_LOB.APPEND (res,'<osdm_ad:CheckConstraintsCollection>');
       END IF;
       
          DBMS_LOB.APPEND (res,'<osdm_ad:CheckConstraintDetails>');
          DBMS_LOB.APPEND (res,rec_c_constraints.text);
          DBMS_LOB.APPEND (res,rec_c_constraints.database_type);
          DBMS_LOB.APPEND (res,'</osdm_ad:CheckConstraintDetails>');
       IF (cur_c_constraints%ROWCOUNT = rec_c_constraints.total_row_count) THEN
          DBMS_LOB.APPEND (res, '</osdm_ad:CheckConstraintsCollection>');
       END IF;
    END LOOP;

    IF v_cc_created THEN 
       DBMS_LOB.APPEND (res, '</osdm_ad:ConstraintDetails>');
       DBMS_LOB.APPEND (res, '</osdm_ad:ConstraintsCollection>');
    END IF;

  RETURN res;

EXCEPTION
 WHEN others THEN
  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Gather_Domain_Constraints_XML Exception : : ' || SQLERRM);  
  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Gather_Domain_Constraints_XML Exception : ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  RETURN res;
  
END Gather_Domain_Constraints_XML;

FUNCTION Gather_AllDomains_Data(v_obj_ovid IN VARCHAR2) RETURN CLOB IS 

res          CLOB;
token_value  CLOB;

-- Common Data
CURSOR cur_common_data(v_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_ad:DesignName",d.design_name).getClobVal()                                      design_name,
        XMLElement("osdm_ad:VersionDate",TO_CHAR(d.date_published,'dd.mm.yyyy hh24:mi:ss')).getClobVal() version_date,
        d.version_comments                                                                               version_comment
 FROM   dmrs_designs d
 WHERE  d.design_ovid = v_ovid;
rec_common_data cur_common_data%ROWTYPE;

CURSOR cur_all_domains(v_o_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_ad:DomainName", d.domain_name).getClobVal()                        domain_name, 
        XMLElement("osdm_ad:Synonyms", d.synonyms).getClobVal()                             synonyms,
        XMLElement("osdm_ad:DataType", d.native_type  ||' '||
           DECODE (NVL(d.t_size,0),0,
           DECODE(NVL(d.t_scale,0),0,
                DECODE(NVL(d.t_precision,0),0,null,'('|| DECODE(NVL(d.t_precision,0),0,null,d.t_precision) ||')'),
                        '('|| DECODE(NVL(d.t_precision,0),0,null,d.t_precision) || ',' || DECODE(NVL(d.t_scale,0),0,null,d.t_scale)||')'),
       '('||TRIM(DECODE(d.t_size,0,null,d.t_size||' '||d.char_units ))||')')).getClobVal()  data_type,
        XMLElement("osdm_ad:LogicalType", d.lt_name).getClobVal()                           lt_name,
        XMLElement("osdm_ad:UnitOfMeasure", d.unit_of_measure).getClobVal()                 unit_of_measure,
        XMLElement("osdm_ad:DefaultValue", d.default_value).getClobVal()                    default_value,
        Gather_Domain_Constraints_XML(d.ovid)                                               constraint_details,
        d.ovid                                                                              domain_ovid,
        COUNT(d.domain_name) over()                                                         total_row_count
 FROM   dmrs_domains d
 WHERE  d.design_ovid = v_o_ovid
 ORDER BY d. domain_name;
rec_all_domains cur_all_domains%ROWTYPE;

CURSOR cur_description(v_d_ovid IN VARCHAR2) IS
 SELECT lt.text  description
 FROM   dmrs_large_text lt
 WHERE  lt.ovid = v_d_ovid;
rec_description cur_description%ROWTYPE;

CURSOR cur_used_in_tables(v_d_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_ad:ModelName", m.model_name).getClobVal()     model_name,
        XMLElement("osdm_ad:TableName", t.table_name).getClobVal()     table_name,
        XMLElement("osdm_ad:ColumnName", c.column_name).getClobVal()   column_name,
        COUNT(m.model_name) over()                                     total_row_count
 FROM   dmrs_tables t,
        dmrs_columns c,
        dmrs_domains d,
        dmrs_models  m
 WHERE  t.ovid = c.container_ovid
 AND    c.domain_ovid = d.ovid
 AND    m.model_ovid = t.model_ovid
 AND    c.datatype_kind = 'Domain'
 AND    d.ovid = v_d_ovid
 ORDER BY m.model_name,
          t.table_name,
          c.column_name;
rec_used_in_tables cur_used_in_tables%ROWTYPE;

CURSOR cur_used_in_entities(v_d_ovid IN VARCHAR2) IS
 SELECT XMLElement("osdm_ad:EntityName", e.entity_name).getClobVal()        entity_name,
        XMLElement("osdm_ad:AttributeName", a.attribute_name).getClobVal()  attribute_name,
        COUNT(e.entity_name) over()                                         total_row_count
 FROM   dmrs_entities e,
        dmrs_attributes a,
        dmrs_domains d
 WHERE  e.ovid = a.container_ovid
 AND    a.domain_ovid = d.ovid
 AND    a.datatype_kind = 'Domain'
 AND    d.ovid = v_d_ovid
 ORDER BY e.entity_name,
          a.attribute_name;
rec_used_in_entities cur_used_in_entities%ROWTYPE;

BEGIN

  UTL_FILE.PUT_LINE(log_file, TO_CHAR(SYSDATE,'yy.mm.dd hh:mi:ss') ||' '|| 'Gathering all domains data started ...');

  DBMS_LOB.CREATETEMPORARY(res, TRUE);
  DBMS_LOB.APPEND (res,'<osdm_ad:root xmlns:osdm_ad="osdm_ad">');

   -- Common Data
   FOR rec_common_data IN cur_common_data(v_obj_ovid) LOOP

      DBMS_LOB.APPEND (res, rec_common_data.design_name);
      DBMS_LOB.APPEND (res, rec_common_data.version_date);  
        
      DBMS_LOB.APPEND (res, '<osdm_ad:VersionComment>');
      DBMS_LOB.APPEND (res, '<osdm_ad:VersionCommentDetails>');
      -- Tokenize rows
      FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(rec_common_data.version_comment||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                     FROM   dual
                     CONNECT BY REGEXP_INSTR(rec_common_data.version_comment||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP

           SELECT XMLElement("osdm_ad:VersionCommentRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
           DBMS_LOB.APPEND (res, token_value);                   
       END LOOP;
      DBMS_LOB.APPEND (res, '</osdm_ad:VersionCommentDetails>');
      DBMS_LOB.APPEND (res, '</osdm_ad:VersionComment>');
   END LOOP;

   FOR rec_all_domains IN cur_all_domains(v_obj_ovid) LOOP
      IF (cur_all_domains%ROWCOUNT = 1) THEN
        DBMS_LOB.APPEND (res,'<osdm_ad:DomainsCollection>');
      END IF;

        DBMS_LOB.APPEND (res,'<osdm_ad:DomainDetails>');
         
        DBMS_LOB.APPEND (res,rec_all_domains.domain_name);
        DBMS_LOB.APPEND (res,rec_all_domains.synonyms);
        DBMS_LOB.APPEND (res,rec_all_domains.data_type);
        DBMS_LOB.APPEND (res,rec_all_domains.lt_name);
        DBMS_LOB.APPEND (res,rec_all_domains.unit_of_measure);
        DBMS_LOB.APPEND (res,rec_all_domains.default_value);
        
        DBMS_LOB.APPEND (res, '<osdm_ad:DomainComment>');
        DBMS_LOB.APPEND (res, '<osdm_ad:DomainCommentDetails>');

        FOR rec_description IN cur_description(rec_all_domains.domain_ovid) LOOP
           -- Tokenize rows
           FOR token IN ( SELECT REGEXP_REPLACE(REGEXP_SUBSTR(rec_description.description||Chr(10), '(.*'||Chr(10)||')', 1, LEVEL ), Chr(10), '') t
                          FROM   dual
                          CONNECT BY REGEXP_INSTR(rec_description.description||Chr(10), '(.*'||Chr(10)||')',1, LEVEL ) > 0) LOOP
                          
               SELECT XMLElement("osdm_ad:DomainCommentRow", XMLCDATA(token.t)).getClobVal() INTO token_value FROM dual;
               DBMS_LOB.APPEND (res, token_value);                                                                       
           END LOOP;
           
        END LOOP;
        DBMS_LOB.APPEND (res, '</osdm_ad:DomainCommentDetails>');
        DBMS_LOB.APPEND (res, '</osdm_ad:DomainComment>');       
      
        -- Constraints
        DBMS_LOB.APPEND (res,rec_all_domains.constraint_details);

        FOR rec_used_in_tables IN cur_used_in_tables(rec_all_domains.domain_ovid) LOOP
           IF (cur_used_in_tables%ROWCOUNT = 1) THEN
              DBMS_LOB.APPEND (res,'<osdm_ad:TablesCollection>');
           END IF;
              DBMS_LOB.APPEND (res,'<osdm_ad:TableDetails>');
              DBMS_LOB.APPEND (res,rec_used_in_tables.model_name);
              DBMS_LOB.APPEND (res,rec_used_in_tables.table_name);
              DBMS_LOB.APPEND (res,rec_used_in_tables.column_name);
              DBMS_LOB.APPEND (res,'</osdm_ad:TableDetails>');
           IF (cur_used_in_tables%ROWCOUNT = rec_used_in_tables.total_row_count) THEN
              DBMS_LOB.APPEND (res, '</osdm_ad:TablesCollection>');
           END IF;
        END LOOP;

        FOR rec_used_in_entities IN cur_used_in_entities(rec_all_domains.domain_ovid) LOOP
           IF (cur_used_in_entities%ROWCOUNT = 1) THEN
              DBMS_LOB.APPEND (res,'<osdm_ad:EntitiesCollection>');
           END IF;
              DBMS_LOB.APPEND (res,'<osdm_ad:EntityDetails>');
              DBMS_LOB.APPEND (res,rec_used_in_entities.entity_name);
              DBMS_LOB.APPEND (res,rec_used_in_entities.attribute_name);
              DBMS_LOB.APPEND (res,'</osdm_ad:EntityDetails>');
           IF (cur_used_in_entities%ROWCOUNT = rec_used_in_entities.total_row_count) THEN
              DBMS_LOB.APPEND (res, '</osdm_ad:EntitiesCollection>');
           END IF;
        END LOOP;

        DBMS_LOB.APPEND (res,'</osdm_ad:DomainDetails>');

      IF (cur_all_domains%ROWCOUNT = rec_all_domains.total_row_count) THEN
       DBMS_LOB.APPEND (res, '</osdm_ad:DomainsCollection>');
      END IF;
   END LOOP;

  DBMS_LOB.APPEND (res,'</osdm_ad:root>');
  
  UTL_FILE.PUT_LINE(log_file, TO_CHAR(SYSDATE,'yy.mm.dd hh:mi:ss') ||' '|| 'Gathering all domains data ended');

RETURN res;

EXCEPTION
 WHEN others THEN
  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Gather_AllDomains_Data Exception : ' || SQLERRM);  
  UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Gather_AllDomains_Data Exception : ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  RETURN res;
 
END Gather_AllDomains_Data;  

FUNCTION Create_Log_File(v_reports_dir IN VARCHAR2) RETURN NUMBER IS 

insufficient_privileges EXCEPTION;
PRAGMA EXCEPTION_INIT(insufficient_privileges, -01031);

BEGIN

 IF v_reports_dir IS NOT NULL THEN
  EXECUTE IMMEDIATE 'CREATE OR REPLACE DIRECTORY OSDDM_REPORTS_DIR AS '''|| v_reports_dir ||'''';
  EXECUTE IMMEDIATE 'GRANT READ, WRITE ON DIRECTORY OSDDM_REPORTS_DIR TO PUBLIC';
 END IF;

 log_file := UTL_FILE.Fopen('OSDDM_REPORTS_DIR','osddm_reports.log','w', 32767);

RETURN 0;

 EXCEPTION
  WHEN UTL_FILE.Invalid_Path THEN
   RETURN 1;
  WHEN  UTL_FILE.Read_Error OR UTL_FILE.Write_Error OR UTL_FILE.Access_Denied THEN 
   RETURN 2;
  WHEN insufficient_privileges THEN
   RETURN 3;

END Create_Log_File;

PROCEDURE Generate_MSWordML(v_rep_id IN NUMBER, v_obj_ovid IN VARCHAR2, v_mode IN NUMBER, v_reports_dir IN VARCHAR2, v_report_name OUT VARCHAR2, v_bfile OUT BFILE, v_status OUT NUMBER, v_compress IN NUMBER, osddm_reports_dir OUT VARCHAR2) IS

res               CLOB;
v_dest_offset			INTEGER := 1;
v_src_offset			INTEGER := 1;
v_lang_context		NUMBER 	:= DBMS_LOB.Default_Lang_Ctx;
warning						INTEGER;
v_blob						BLOB;
v_p_doc_xml_lngth NUMBER;
db_data_clob      CLOB;
file_name         VARCHAR2(100);
seq               NUMBER := 0;
os_file_name      VARCHAR2(100);
db_version        VARCHAR2(100);
j_status          NUMBER;

BEGIN

    v_status := Create_Log_File(v_reports_dir);
   
    IF (v_status = 0)  THEN

      DBMS_LOB.CREATETEMPORARY(v_blob, TRUE);
      DBMS_LOB.CREATETEMPORARY(db_data_clob, TRUE);
      
      IF v_rep_id = 1 THEN
         db_data_clob := Gather_SingleTable_Data(v_obj_ovid);
         file_name := 'SingleTableDetails.xml';
      ELSIF v_rep_id = 2 THEN
         db_data_clob := Gather_AllTables_Data(v_obj_ovid);
         file_name := 'AllTablesDetails.xml';
      ELSIF v_rep_id = 3 THEN
         db_data_clob := Gather_SingleEntity_Data(v_obj_ovid);
         file_name := 'SingleEntityDetails.xml';
      ELSIF v_rep_id = 4 THEN
         db_data_clob := Gather_AllEntities_Data(v_obj_ovid);
         file_name := 'AllEntitiesDetails.xml';
      ELSIF v_rep_id = 5 THEN
         db_data_clob := Gather_AllDomains_Data(v_obj_ovid);
         file_name := 'AllDomainDetails.xml';
      ELSIF v_rep_id = 6 THEN
         db_data_clob := Gather_Glossary_Data(v_obj_ovid);
         file_name := 'GlossaryDetails.xml';
      END IF;

      -- If there's data at all
      IF (DBMS_LOB.Getlength(db_data_clob) > 100) THEN
      
         SELECT banner
         INTO   db_version
         FROM   v$version
         WHERE  banner LIKE 'Oracle%';
         
         res := Apply_Transformation(v_rep_id, db_data_clob, log_file);      
         
         IF (res IS NOT NULL) THEN

           DBMS_LOB.CONVERTTOBLOB(v_blob,
                                  res,
                                  DBMS_LOB.LOBMAXSIZE,
                                  v_dest_offset,
                                  v_src_offset,
                                  DBMS_LOB.DEFAULT_CSID,
                                  v_lang_context,
                                  warning);
           
            IF (v_mode = 1) THEN
           
               UTL_FILE.PUT_LINE(log_file, TO_CHAR(SYSDATE,'yy.mm.dd hh:mi:ss')||' '|| 'Generating OS file ...');
           
               SELECT reports_seq.nextval INTO seq FROM dual;

               IF v_compress = 0 THEN 
                  os_file_name := SUBSTR(file_name,0,INSTR(file_name,'.')-1)||'_'||seq||'_rs.xml';
               ELSIF v_compress = 1 THEN 
                  os_file_name := SUBSTR(file_name,0,INSTR(file_name,'.')-1)||'_'||seq||'_rs.xml.zip';
               END IF;
               
               Generate_OS_File(v_blob, os_file_name, v_compress);

               UTL_FILE.PUT_LINE(log_file, TO_CHAR(SYSDATE,'yy.mm.dd hh:mi:ss') ||' '|| 'OS file ' || os_file_name || ' generated successfully.');
           
               v_bfile := BFILENAME('OSDDM_REPORTS_DIR', os_file_name);
               v_report_name := os_file_name;
           
               INSERT INTO msword_reports
                 (id,
                 report_file,
                 report_author)
               VALUES
                 (seq,
                  v_bfile,
                  '');
               COMMIT;
               
            ELSIF (v_mode = 2) THEN

               OWA_UTIL.MIME_HEADER('application/msword', FALSE, 'utf-8');
               HTP.P('Content-length: ' || v_p_doc_xml_lngth);
               HTP.P('Content-Disposition: attachment; filename="'||file_name||'"');
               OWA_UTIL.HTTP_HEADER_CLOSE;
               WPG_DOCLOAD.DOWNLOAD_FILE(v_blob);

            END IF;
         END IF;
      ELSE
         temp_file := UTL_FILE.fopen('OSDDM_REPORTS_DIR','empty_report.txt','w', 32767);
         UTL_FILE.PUT_LINE(temp_file, 'According to input parameters there is no data in reporting repository and report can not generated.');
         v_bfile := BFILENAME('OSDDM_REPORTS_DIR', 'empty_report.txt');
         v_report_name := 'empty_report.txt';
         UTL_FILE.fclose(temp_file); 
      END IF;
   
      UTL_FILE.fclose(log_file);

   END IF;

   SELECT directory_path
   INTO   osddm_reports_dir
   FROM   all_directories
   WHERE  directory_name = 'OSDDM_REPORTS_DIR';

EXCEPTION

   WHEN others THEN
     ROLLBACK;
     IF (v_mode = 1) THEN
        UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Generate_MSWordML Exception : ' || SQLERRM);  
        UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Generate_MSWordML Exception : ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
        UTL_FILE.fclose(log_file);
     ELSIF (v_mode = 2) THEN
        htp.p('<br/>');
        htp.p('<br/>');
        htp.p('Error occured during report generation:');
        htp.p('<br/>');
        htp.p('Pkg_Osdm_Utils.Generate_MSWordML Exception:');
        htp.p(sqlerrm);
        htp.p('<br/>');
        htp.p('For more details see the report generation log file in OSDDM_REPORTS_DIR directory.');
        UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Generate_MSWordML Exception : ' || SQLERRM);  
        UTL_FILE.PUT_LINE(log_file, 'Pkg_Osdm_Utils.Generate_MSWordML Exception : ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
     END IF;
     
     IF UTL_FILE.is_open(log_file) THEN
        UTL_FILE.fclose(log_file);
     END IF;
     IF UTL_FILE.is_open(temp_file) THEN
        UTL_FILE.fclose(temp_file);
     END IF;

END Generate_MSWordML;

END PKG_OSDM_UTILS;
/