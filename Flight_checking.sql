SET SERVEROUT ON;
CREATE OR REPLACE PROCEDURE VIEWFL
(p_source  Flights_Team1.FSOURCE%TYPE,
p_dest  Flights_Team1.DESTINATION%TYPE,
p_date  Flights_Team1.DATE_AND_TIME%TYPE,
p_seat  Flights_Team1.AVAILABLE_SEATS%TYPE)
IS CURSOR CUR1 IS
 SELECT FLIGHT_ID, FSOURCE, DESTINATION, DATE_AND_TIME, AVAILABLE_SEATS,ticket_cost, FLIGHT_NAME
 FROM Flights_Team1 WHERE FSOURCE=p_source and DESTINATION=p_dest and DATE_AND_TIME=p_date and AVAILABLE_SEATS>=p_seat;
  f_fnumber     Flights_Team1.FLIGHT_ID%type;
  f_source     	Flights_Team1.FSOURCE%TYPE;
  f_destination	Flights_Team1.DESTINATION%TYPE;
  f_date    	Flights_Team1.DATE_AND_TIME%TYPE;
  f_fare    	Flights_Team1.ticket_cost%TYPE;
  f_num_of_seat Flights_Team1.AVAILABLE_SEATS%TYPE;
  f_name        Flights_Team1.FLIGHT_NAME%TYPE;
--  no_fli EXCEPTION;
BEGIN  
        OPEN CUR1;
        LOOP
        FETCH CUR1 INTO f_fnumber,f_source,f_destination,f_date,f_num_of_seat,f_fare,f_name;
        EXIT WHEN CUR1%NOTFOUND;
         DBMS_OUTPUT.PUT_LINE('flight id: ' || f_fnumber || ' From:  ' || f_source || ' Destination: ' || f_destination || ' Date_On_Journey: ' || f_date || ' Ticket_Cost ' || f_fare || ' Flight_Name ' || f_name);
        END LOOP;
--         IF CUR1%NOTFOUND THEN
--            RAISE no_fli;
--         END IF;
    CLOSE CUR1;
--    EXCEPTION 
--        WHEN no_fli THEN 
--            DBMS_OUTPUT.PUT_LINE('No Flights matched');
END;
desc Flights_Team1;
select * from Flights_team1;
execute VIEWFL('Hydeabad','Kolkata','02-JUN-21 12.00.00 PM',3);
commit;