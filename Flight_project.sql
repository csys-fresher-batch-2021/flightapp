CREATE OR REPLACE PROCEDURE FMDB

AS

f_id FLIGHTS_TEAM1.FLIGHT_ID%TYPE;
f_name FLIGHTS_TEAM1.FLIGHT_NAME%TYPE;
f_date FLIGHTS_TEAM1.DATE_AND_TIME%TYPE;
f_source FLIGHTS_TEAM1.FSOURCE%TYPE;
f_destination FLIGHTS_TEAM1.DESTINATION%TYPE; 
f_bid number;
f_pass varchar(20);
f_seat varchar(20);
f_tkt  number;

BEGIN

f_bid := BK_SEQ.NEXTVAL;
SELECT 
FLIGHT_ID, FLIGHT_NAME, DATE_AND_TIME,FSOURCE, DESTINATION
INTO 
f_id,f_name,f_date,f_source,f_destination
FROM FLIGHTS_TEAM1
WHERE FLIGHT_ID ='&FLIGHT_ID';
INSERT INTO BOOKINGS_TEAM1
VALUES(FSEQ.NEXTVAL, '&Pass_Name', '&Gender', &Age, F_SEQ.NEXTVAL,&Phone_number,
f_date,f_id,f_name,f_bid,f_source,f_destination);
SELECT 
PASS_NAME,SEAT_NO,TICKET_ID 
INTO
f_pass,f_seat,f_tkt FROM BOOKINGS_TEAM1 
WHERE BOOKING_ID=f_bid;
DBMS_OUTPUT.PUT_LINE('***Your Booking is Confirmed***');
DBMS_OUTPUT.PUT_LINE('BOOKING_ID '||f_bid );
DBMS_OUTPUT.PUT_LINE('PASSENGER NAME : '||f_pass);
DBMS_OUTPUT.PUT_LINE('SEAT NO: '|| f_seat);
DBMS_OUTPUT.PUT_LINE('TICKET NO: '|| f_tkt);
DBMS_OUTPUT.PUT_LINE('SOURCE: '|| f_source);
DBMS_OUTPUT.PUT_LINE('DESTINATION: '|| f_destination);
DBMS_OUTPUT.PUT_LINE('DATE AND TIME '||f_date);
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
           DBMS_OUTPUT.PUT_LINE('***Your Booking Is Not Confirmed***');
END;
EXEC FMDB;



SEQUENCE_CREATION
------------------------
SELECT FSEQ.NEXTVAL
FROM dual;

CREATE SEQUENCE FSEQ
START WITH 1100
INCREMENT BY 1;

CREATE SEQUENCE F_SEQ
START WITH 100
INCREMENT BY 1;
drop sequence fs_seq;

CREATE SEQUENCE _BKEQ
START WITH 100
INCREMENT BY 1;
drop sequence fs_seq;

Select * From Passenger_Team1;
SELECT * FROM FLIGHTS_TEAM1;
SELECT * FROM Bookings_Team1 ;
COMMIT;
ROLLBACK;