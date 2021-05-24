SET SERVEROUT ON;
CREATE OR REPLACE PROCEDURE VIEWFL
(p_source  Flights_Team1.FSOURCE%TYPE,
p_dest  Flights_Team1.DESTINATION%TYPE,
p_date  Flights_Team1.DATE_AND_TIME%TYPE,
p_seat  Flights_Team1.AVAILABLE_SEATS%TYPE)
IS 
  f_fnumber     Flights_Team1.FLIGHT_ID%type;
  f_source     	Flights_Team1.FSOURCE%TYPE;
  f_destination	Flights_Team1.DESTINATION%TYPE;
  f_date    	Flights_Team1.DATE_AND_TIME%TYPE;
  f_fare    	Flights_Team1.ticket_cost%TYPE;
  f_num_of_seat Flights_Team1.AVAILABLE_SEATS%TYPE;
  f_name        Flights_Team1.FLIGHT_NAME%TYPE;
  no_fli EXCEPTION;
BEGIN  
    SELECT FLIGHT_ID, FSOURCE, DESTINATION, DATE_AND_TIME, AVAILABLE_SEATS,ticket_cost, FLIGHT_NAME INTO f_fnumber,f_source,f_destination,
    f_date,f_num_of_seat,f_fare,f_name FROM Flights_Team1 WHERE FSOURCE=p_source and DESTINATION=p_dest and DATE_AND_TIME=p_date and AVAILABLE_SEATS>=p_seat;
    dbms_output.put_line('FLIGHT_NAME:' || f_fare || '  FLIGHT_FARE:' ||f_name);
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
            DBMS_OUTPUT.PUT_LINE('No Flights matched');
END VIEWFL;
desc Flights_Team1;
select * from Flights_team1;
execute VIEWFL('Hyderabad','Kolkata','02-JUN-21 12.00.00 PM',3);
commit;
