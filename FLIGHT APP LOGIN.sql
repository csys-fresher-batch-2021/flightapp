
SET SERVEROUTPUT ON;
CREATE SEQUENCE LOGIN_NUM_2
START WITH 101
INCREMENT BY 1;
CREATE OR REPLACE PROCEDURE login_flight
(P_NAME PASSENGER_TEAM1.PASS_NAME%TYPE,
P_ID PASSENGER_TEAM1.PASS_ID%TYPE
)
AS
USER_NAME  PASSENGER_TEAM1.PASS_NAME%TYPE;
PASS PASSENGER_TEAM1.PASS_ID%TYPE;
U_EMAIL PASSENGER_TEAM1.EMAIL%TYPE;
U_NUMBER PASSENGER_TEAM1.PHONE_NUMBER%TYPE;
U_DOB PASSENGER_TEAM1.DATE_OF_BIRTH%TYPE;
BEGIN

SELECT PASS_NAME,PASS_ID,EMAIL,PHONE_NUMBER,DATE_OF_BIRTH
INTO USER_NAME,PASS,U_EMAIL,U_NUMBER,U_DOB 
FROM PASSENGER_TEAM1
WHERE PASS_NAME= P_NAME and PASS_ID = P_ID;

IF USER_NAME = P_NAME AND PASS = P_ID THEN
INSERT 
INTO 
LOGIN_DETAILS(LOGIN_ID,PASS_NAME,PASS_ID,LOGIN_DATE,EMAIL)
VALUES(LOGIN_NUM.NEXTVAL,P_NAME,P_ID,SYSDATE,U_EMAIL);
ELSE
NULL;
END IF;
 DBMS_output.put_line('WELCOME TO FLIGHT APP'  || ' ' || USER_NAME );
 
 
 EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('password' || P_ID || 'is not valid');
    DBMS_OUTPUT.PUT_LINE('please varify the password');
    
 END login_flight;

EXEC LOGIN_FLIGHT('hira',101);

SELECT * FROM  LOGIN_DETAILS ;
--------------------------------------------------------------
-- TRACKING THE LOGIN USER

Create Table LOGIN_DETAILS (
LOGIN_ID Number(5),   
PASS_NAME  Varchar2(50)    Not NUll,
PASS_ID     NUMBER   Not NUll,
LOGIN_DATE        TIMESTAMP,  
EMAIL      VARCHAR2(20)    Not Null ,
CONSTRAINT LOGIN_REF PRIMARY KEY(LOGIN_ID));
