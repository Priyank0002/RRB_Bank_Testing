-- drops oracle scheduler objects created by ODMr in all accounts (except SYS and ODMRSYS)
-- that are prefixed with:
--   For CHAINS = ODMR$WFCHAIN 
-- Parameters:
-- 1. Action Flags:
--    R = report only, do not drop any objects
--    D = drop only, displays drop command only
--    DR or RD = drop and report
set serveroutput on
set verify off
DECLARE
w_owner varchar2(30); 
w_object varchar2(30);
action varchar2(30) := '&1';
report BOOLEAN := TRUE;
dropchain BOOLEAN := TRUE; 
countObjects integer := 0;
countObjectsDropped integer := 0;
countObjectsFailedToDrop integer := 0;
sql_text varchar2(256);
Dynamic_Cursor integer; 
v_err_msg  VARCHAR2(4000);


cursor chain_cursor is
select owner, chain_name  from DBA_SCHEDULER_CHAINS
where chain_name like 'ODMR$WFCHAIN%' 
AND owner not in ('SYS','ODMRSYS')
order by owner, chain_name;

BEGIN
 DBMS_OUTPUT.ENABLE(NULL);
  CASE action
    WHEN 'R' THEN report := TRUE;
    WHEN 'DR' THEN report := TRUE;
    WHEN 'RD' THEN report := TRUE;
    ELSE report := FALSE;
  END CASE;

  CASE action
    WHEN 'D' THEN dropchain := TRUE;
    WHEN 'DR' THEN dropchain := TRUE;
    WHEN 'RD' THEN dropchain := TRUE;
    ELSE dropchain := FALSE;
  END CASE;


open chain_cursor;
fetch chain_cursor into w_owner,w_object;
while chain_cursor%FOUND loop
  IF report  THEN
      DBMS_OUTPUT.PUT_LINE('Owner.Object: ' || '"' || w_owner || '"."' ||
        w_object || '"  Object Type: CHAIN ');
  END IF;

BEGIN
   IF dropchain  THEN
        dbms_scheduler.drop_chain
          ( chain_name => '"' ||w_owner || '"."' || w_object || '"',
            force => TRUE );
      DBMS_OUTPUT.PUT_LINE('Dropped: "' ||w_owner || '"."' ||
        w_object ); 
      countObjectsDropped := countObjectsDropped + 1;      
   END IF;
EXCEPTION
WHEN OTHERS THEN
        v_err_msg := SUBSTR(DBMS_UTILITY.FORMAT_ERROR_STACK(), 1, 4000);
        DBMS_OUTPUT.PUT_LINE ('Drop failed: ' || 'Owner.Object: ' || '"' || w_owner || '"."' ||
        w_object || '"  Object Type: CHAIN' || ' Error: ' || v_err_msg );
        countObjectsFailedToDrop := countObjectsFailedToDrop + 1;
END;

   countObjects := countObjects + 1;
fetch chain_cursor into w_owner,w_object;
end loop;
close chain_cursor;

     DBMS_OUTPUT.PUT_LINE
       ('Total Number of Objects: ' || countObjects );  
     DBMS_OUTPUT.PUT_LINE
       ('Total Number of Objects Dropped: ' || countObjectsDropped ); 
     DBMS_OUTPUT.PUT_LINE
       ('Total Number of Objects Failed to Drop: ' || countObjectsFailedToDrop ); 
END;
/