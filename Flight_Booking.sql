FLIGHT BOOKING
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
SET SERVEROUT ON;

CREATE OR REPLACE PROCEDURE FMDB(F_id FLIGHTS_TEAM1.FLIGHT_ID%TYPE,Pass_name BOOKINGS_TEAM1.Pass_Name%TYPE,
GENDER BOOKINGS_TEAM1.GENDER%TYPE,AGE BOOKINGS_TEAM1.AGE%TYPE,PHONE BOOKINGS_TEAM1.PHONE_NUMBER%TYPE)

AS

F_name FLIGHTS_TEAM1.FLIGHT_NAME%TYPE;
F_date FLIGHTS_TEAM1.DATE_AND_TIME%TYPE;
F_source FLIGHTS_TEAM1.FSOURCE%TYPE;
F_destination FLIGHTS_TEAM1.DESTINATION%TYPE; 
F_bid number;
F_pass varchar(20);
F_seat varchar(20);
F_tkt number;

BEGIN

F_bid := BK_SEQ.NEXTVAL;
SELECT 
FLIGHT_NAME, DATE_AND_TIME,FSOURCE, DESTINATION
INTO 
F_name,F_date,F_source,F_destination
FROM FLIGHTS_TEAM1
WHERE FLIGHT_ID = F_ID;
INSERT INTO BOOKINGS_TEAM1
VALUES(FSEQ.NEXTVAL,Pass_name ,GENDER ,AGE , F_SEQ.NEXTVAL,PHONE,
F_date,F_id,F_name,F_bid,F_source,F_destination);
SELECT 
PASS_NAME,SEAT_NO,TICKET_ID 
INTO
F_pass,F_seat,F_tkt FROM BOOKINGS_TEAM1 
WHERE BOOKING_ID=F_bid;
DBMS_OUTPUT.PUT_LINE('***Your Booking is Confirmed***');
DBMS_OUTPUT.PUT_LINE('BOOKING_ID '||F_bid );
DBMS_OUTPUT.PUT_LINE('PASSENGER NAME : '||F_pass);
DBMS_OUTPUT.PUT_LINE('SEAT NO: '|| F_seat);
DBMS_OUTPUT.PUT_LINE('TICKET NO: '|| F_tkt);
DBMS_OUTPUT.PUT_LINE('SOURCE: '|| F_source);
DBMS_OUTPUT.PUT_LINE('DESTINATION: '|| F_destination);
DBMS_OUTPUT.PUT_LINE('DATE AND TIME '||F_date);
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
           DBMS_OUTPUT.PUT_LINE('***Your Booking Is Not Confirmed***');
           DBMS_OUTPUT.PUT_LINE('***Please give valid Flight Id***');
END;


EXEC FMDB('&FLIGHT_ID','&Pass_Name','&Gender',&Age,&Phone_number);



SEQUENCE_CREATION
--------------------------------------------------------------------------------------------------------------------------------
SELECT FSEQ.NEXTVAL
FROM dual;

CREATE SEQUENCE FSEQ
START WITH 1100
INCREMENT BY 1;

CREATE SEQUENCE p_SEQ
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


