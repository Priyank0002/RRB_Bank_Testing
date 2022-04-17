-- disconnects Data Miner sessions 
-- Parameter:
-- 1. Action Flags:
--    R = report only, do not disconnect any sessions
--    D = disconnect only, displays disconnect  only
--    DR or RD = disconnect and report
-- Example:
-- @disconnectODMRSessions.sql DR

set serveroutput on
set verify off
DECLARE
v_sid  varchar2(100);
v_serial# varchar2(100);
v_username varchar2(30);
v_status varchar2 (100);
v_program varchar2 (100);
v_type varchar2 (100);
v_module varchar2 (100);
action varchar2(30) := '&1';
report BOOLEAN := TRUE;
killSession BOOLEAN := TRUE; 
countSessions integer := 0;
countSessionsDropped integer := 0;
countSessionsFailedToDrop integer := 0;
sql_text varchar2(256);
Dynamic_Cursor integer; 
dummy integer; 
v_err_msg  VARCHAR2(4000);


cursor session_cursor is
select v.sid, v.serial#, v.username, v.status, v.program, v.type , v.module from v$session v, dba_role_privs r
where v.type = 'USER'
AND v.username not in ('SYS', 'sys', 'SYSTEM', 'system')
AND v.username = r.grantee
AND r.granted_role = 'ODMRUSER'
UNION 
select v.sid, v.serial#, v.username, v.status, v.program, v.type , v.module from v$session v
where v.type = 'USER'
and v.username = 'ODMRSYS';


BEGIN
 DBMS_OUTPUT.ENABLE(NULL);
  CASE action
    WHEN 'R' THEN report := TRUE;
    WHEN 'DR' THEN report := TRUE;
    WHEN 'RD' THEN report := TRUE;
    ELSE report := FALSE;
  END CASE;

  CASE action
    WHEN 'D' THEN killSession := TRUE;
    WHEN 'DR' THEN killSession := TRUE;
    WHEN 'RD' THEN killSession := TRUE;
    ELSE killSession := FALSE;
  END CASE;


open session_cursor;
fetch session_cursor into v_sid, v_serial#, v_username, v_status, v_program, v_type, v_module;
while session_cursor%FOUND loop
  IF report  THEN
      DBMS_OUTPUT.PUT_LINE('Session sid: ' || v_sid || ' serial#: ' || v_serial# || ' username: ' || v_username ||
      ' status: ' || v_status ||
      ' program: ' || v_program || ' type: ' || v_type || ' module: ' || v_module);
  END IF;

BEGIN
   IF killSession  THEN
      sql_text := 'ALTER SYSTEM DISCONNECT SESSION ' || '''' || v_sid || ',' || v_serial# || '''' ||
      ' IMMEDIATE ';
      DBMS_OUTPUT.PUT_LINE('Command: ' || sql_text);
      Dynamic_Cursor := dbms_sql.open_cursor;
      dbms_sql.parse(Dynamic_Cursor, sql_text, dbms_sql.native);
      dummy := dbms_sql.execute(Dynamic_Cursor);
      dbms_sql.close_cursor(Dynamic_Cursor);
      DBMS_OUTPUT.PUT_LINE('Session Disconnected: ' ||'sid: ' || v_sid || ' serial#: ' || v_serial# || ' username: ' || v_username ||
      ' status: ' || v_status ||
      ' program: ' || v_program || ' type: ' || v_type || ' module: ' || v_module ); 
      countSessionsDropped := countSessionsDropped + 1;  
   END IF;
EXCEPTION
WHEN OTHERS THEN
        v_err_msg := SUBSTR(DBMS_UTILITY.FORMAT_ERROR_STACK(), 1, 4000);
        DBMS_OUTPUT.PUT_LINE('Session Disconnect Failed: ' || 'sid: ' || v_sid || ' serial#: ' || v_serial# || ' username: ' || v_username ||
        ' status: ' || v_status ||
        ' program: ' || v_program || ' type: ' || v_type || ' module: ' || v_module || ' Error: ' || v_err_msg);        
        countSessionsFailedToDrop := countSessionsFailedToDrop + 1;
END;

   countSessions := countSessions + 1;
fetch session_cursor into v_sid, v_serial#, v_username, v_status, v_program, v_type, v_module;
end loop;
close session_cursor;

     DBMS_OUTPUT.PUT_LINE
       ('Total Number of Sessions: ' || countSessions );  
     DBMS_OUTPUT.PUT_LINE
       ('Total Number of Sessions Disconnected: ' || countSessionsDropped ); 
     DBMS_OUTPUT.PUT_LINE
       ('Total Number of Sessions Failed to Disconnect: ' || countSessionsFailedToDrop ); 
END;
/