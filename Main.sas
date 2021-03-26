proc import datafile = 'C:\Users\dragak01\OneDrive - StepStone Group\Desktop\Data Mining\Ticket_Control_Analysis\kontrola_biletow.csv'
 out = work.input_data
 dbms = csv
;
run;

data data;
	set input_data;
	day_id = input(doba_komunikacyjna_id, best8.);
	line_id = input(linia_id, best8.);
	course_id = input(kurs_id, best8.);
	stop_id = input(przystanek_id, best8.);
	previous_stop_id = input(poprzedni_przystanek_id, best8.);
	controlled_count = input(ilosc_kontrolowanych, best8.);
	passangers_count = input(ilosc_przewozonych, best8.);
	If _N_ = 1 then delete;
	drop doba_komunikacyjna_id linia_id kurs_id przystanek_id poprzedni_przystanek_id ilosc_kontrolowanych ilosc_przewozonych;
run;

proc means data=data n NMISS median MEAN max min std;
run;