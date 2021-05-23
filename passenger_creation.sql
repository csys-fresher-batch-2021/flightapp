Create Sequence pass_seq1
start with 100
increment by 1;

SET SERVEROUTPUT ON;

--create procedure for register 
create or replace PROCEDURE reg_pro 
    (p_name	in PASSENGER_TEAM1.PASS_NAME%type,
     p_email in PASSENGER_TEAM1.EMAIL%type,
     p_dob	in PASSENGER_TEAM1.DATE_OF_BIRTH%type,
     p_phone in PASSENGER_TEAM1.PHONE_NUMBER%type)
as
      P_id integer := pass_seq1.nextval;
      DUP_VAL_ON_INDEX EXCEPTION;
BEGIN
     insert into PASSENGER_TEAM1 (PASS_ID, PASS_NAME, email,DATE_OF_BIRTH, PHONE_NUMBER)
     values (P_id, p_name, p_email,p_dob, p_phone); 
     DBMS_output.put_line(p_name || ' ' || p_email || ' ' || p_dob || ' ' || p_phone );
     DBMS_output.put_line( 'successfully registered,' || ' passenger ID is: ' || P_id);
     RAISE DUP_VAL_ON_INDEX; 
EXCEPTION
       WHEN DUP_VAL_ON_INDEX THEN
       DBMS_OUTPUT.PUT_LINE('EMAIL ALREADY EXISTS');
end;     
 -- END reg_pro;


--executing the register procedure 
execute reg_pro ('manny', 'manny@y.com','03-02-14','8876485999');  
execute reg_pro ('hira', 'hira@y.com','01-DEC-14','9798785923');  
execute reg_pro ('sita', 'sita@y.com','03-NOV-16','8686569985');  
execute reg_pro ('mica', 'mica@y.com','05-OCT-17','9755239877');  
execute reg_pro ('elizabeth', 'eliza@y.com','06-AUG-12','8652939898');  
execute reg_pro ('kaushik', 'kaushik@y.com','07-MAY-18','9359826358');  

SELECT * FROM PASSENGER_TEAM1;
DELETE FROM PASSENGER_TEAM1 WHERE PASS_ID >105;
commit;
