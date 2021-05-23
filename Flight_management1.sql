CREATE TABLE PASSENGER_TEAM1(
PASS_NAME VARCHAR(30),
PASS_ID NUMBER,
EMAIL VARCHAR(30),
PHONE_NUMBER NUMBER,
DATE_OF_BIRTH DATE,
CONSTRAINT PASS_PK PRIMARY KEY(PASS_ID, EMAIL)
);

CREATE TABLE FLIGHTS_TEAM1(
FLIGHT_NAME VARCHAR(20),
FLIGHT_ID VARCHAR(20),
FSOURCE VARCHAR(20),
DESTINATION VARCHAR(20),
DATE_AND_TIME TIMESTAMP,
AVAILABLE_SEATS NUMBER,
TICKET_COST NUMBER(10,2),
CONSTRAINT FLIGHT_PK PRIMARY KEY(FLIGHT_ID)
);

create table Bookings_Team1 
( 
        Booking_id NUMBER, 
        Pass_Name varchar2(30),
        Gender char(1),
        Age Number,
        Seat_no Number ,
        Phone_number Number,
        Date_and_time Timestamp,
        Flight_id varchar(20) , 
        Flight_name Varchar(20),
        CONSTRAINT CON_BS Primary key(Booking_id,Seat_no),
        CONSTRAINT CON_FN foreign key(Flight_id) references Flights_Team1(Flight_id)
); 

INSERT INTO FLIGHTS_TEAM1 VALUES ('Indigo', 'F-001', 'Kolkata', 'Hyderabad', '31/05/2021 11:00:00 AM', 200, 4500);
INSERT INTO FLIGHTS_TEAM1 VALUES ('Spicejet', 'F-002', 'Kolkata', 'Hyderabad', '31/05/2021 01:00:00 PM', 200, 4000);
INSERT INTO FLIGHTS_TEAM1 VALUES ('GoAir', 'F-003', 'Hyderabad','Kolkata', '28/05/2021 12:00:00 PM', 200, 5000);
INSERT INTO FLIGHTS_TEAM1 VALUES ('Airasia India', 'F-004', 'Hyderabad', 'Kolkata', '28/05/2021 01:30:00 PM', 200, 4000);
INSERT INTO FLIGHTS_TEAM1 VALUES ('Trujet', 'F-005', 'Hyderabad', 'Kolkata', '02/06/2021 12:00:00 AM', 200, 6000);
INSERT INTO FLIGHTS_TEAM1 VALUES ('GoAir', 'F-006', 'Hyderabad',  'Kolkata', '02/06/2021 12:00:00 PM', 200, 5500);

INSERT INTO FLIGHTS_TEAM1 VALUES ('Air India', 'F-007', 'Chennai', 'Hyderabad', '31/05/2021 05:30:00 PM', 200, 6000);
INSERT INTO FLIGHTS_TEAM1 VALUES ('Indigo', 'F-008', 'Chennai', 'Hyderabad', '31/05/2021 02:00:00 PM', 200, 6500);
INSERT INTO FLIGHTS_TEAM1 VALUES ('Vistara', 'F-009', 'Chennai', 'Hyderabad', '31/05/2021 08:00:00 AM', 200, 7500);
INSERT INTO FLIGHTS_TEAM1 VALUES ('Alliance Air', 'F-010', 'Hyderabad', 'Chennai', '05/06/2021 07:00:00 AM', 200, 6000);
INSERT INTO FLIGHTS_TEAM1 VALUES ('GoAir', 'F-011', 'Hyderabad', 'Chennai', '05/06/2021 11:30:00 PM', 200, 6500);
INSERT INTO FLIGHTS_TEAM1 VALUES ('Spicejet', 'F-012', 'Hyderabad', 'Chennai', '05/06/2021 03:30:00 PM', 200, 7000);


INSERT INTO FLIGHTS_TEAM1 VALUES('GoAir', 'F-013', 'Bangalore', 'Pune', '02/06/2021 08:30:00 AM', 200, 4000);
INSERT INTO FLIGHTS_TEAM1 VALUES('Spicejet', 'F-014', 'Bangalore', 'Pune', '02/06/2021 07:43:00 PM', 200, 3700);
INSERT INTO FLIGHTS_TEAM1 VALUES('Vistara', 'F-015', 'Bangalore', 'Pune', '02/06/2021 04:50:00 AM', 200, 3500);
INSERT INTO FLIGHTS_TEAM1 VALUES('Air India', 'F-016', 'Pune', 'Bangalore', '01/06/2021 05:30:00 PM', 200, 3900);
INSERT INTO FLIGHTS_TEAM1 VALUES('Indigo', 'F-017', 'Pune', 'Bangalore', '01/06/2021 09:00:00 PM', 200, 3300);
INSERT INTO FLIGHTS_TEAM1 VALUES('Trujet', 'F-018', 'Pune', 'Bangalore', '01/06/2021 06:30:00 AM', 200, 4700);


INSERT INTO FLIGHTS_TEAM1 VALUES('Trujet', 'F-019', 'Pune', 'Kolkata', '02/06/2021 09:30:00 AM', 200, 5700);
INSERT INTO FLIGHTS_TEAM1 VALUES('Vistara', 'F-020', 'Pune', 'Kolkata', '02/06/2021 01:30:00 PM', 200, 6000);
INSERT INTO FLIGHTS_TEAM1 VALUES('GoAir', 'F-021', 'Pune', 'Kolkata', '02/06/2021 12:54:00 PM', 200, 6500);
INSERT INTO FLIGHTS_TEAM1 VALUES('Spicejet', 'F-022', 'Kolkata', 'Pune', '06/06/2021 08:14:00 AM', 200, 4900);
INSERT INTO FLIGHTS_TEAM1 VALUES('Air India', 'F-023', 'Kolkata', 'Pune', '06/06/2021 04:45:00 AM', 200, 6600);
INSERT INTO FLIGHTS_TEAM1 VALUES('Alliance Air', 'F-024', 'Kolkata', 'Pune', '06/06/2021 07:30:00 PM', 200, 5500);

SELECT * FROM PASSENGER_TEAM1;
SELECT * FROM Bookings_Team1;
SELECT * FROM FLIGHTS_TEAM1;














