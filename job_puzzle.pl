
%	because they all play tennis with megan, 3 different people including her
 jobs(X,chef,lawyer):-!,fail.      
 jobs(X,lawyer,chef):-!,fail.      
 
 %	spouse of chef is tennis player 2 different people	
 jobs(X,tennisPlayer,chef):-!,fail.      
 jobs(X,chef,tennisPlayer):-!,fail.

 /*6 */ 
 jobs(X,J1,J2):- job(X,J1), 
                    job(X,J2). 
					
%	 megan, the chef, and the lawyer meet every week to play tennis					
 job(megan,chef):-!,fail.       /*has to be male */ 
 job(megan,lawyer):-!,fail.    
 
 %   paul did not go to college.
 job(paul,lawyer):-!,fail.       
 job(paul,nurse ):-!,fail.       
 job(paul,teacher):-!,fail.      
 
 %  megan does not do boxing.
 job(megan,boxing):- !,fail.    
 
  %  nurse and acting are for men.
 job(X,nurse):- !,not female(X).        /*has to be male*/ 
 job(X,acting):- !,not female(X).                 /* meaning of acting*/ 
 
 %  The spouse of the chef is the tennis player.
 job(X,tennisPlayer):-!,female(X).        
 
 %that means chef is not female
 job(X,chef ):-!,male(X).     
 
 job(X,Y). 
 male(paul). 
 male(maurice). 
 female(megan).
 female(loretta).

 joblist({chef,guard,nurse,tennisPlayer,lawyer,teacher,acting,boxing}). 
 del(X,{X|T},T). 
 del(X,{Y|T},{Y|T1}) :- del(X,T,T1). 
 
 
 getSolution :-

    Megan = 1,
    Loretta = 2,
    Paul = 3,
    Maurice = 4,

	People = [Megan, Loretta, Paul, Maurice],

	Jobs = [Chef, Guard, Nurse, TennisPlayer, Lawyer, Teacher, Acting, Boxing],
        Jobs ::1..4,

	% Each holds exactly two jobs.
        foreach(I in 1..4,
                count(I, Jobs,#=, 2)
                ),

	 %  Nurse and acting are for men.
        (Nurse #= Paul #\/ Nurse #= Maurice),
	(Acting #= Paul #\/ Acting #= Maurice),

	 %  The spouse of the chef is the tennis player.
        (TennisPlayer #= Megan   #\/ TennisPlayer #= Loretta),
        (Chef  #= Paul #\/ Chef #= Maurice),
        Chef #\= TennisPlayer,

	 %  Megan does not do boxing.
        Megan #\= Boxing,

	 %   Paul did not go to college.
		Paul #\= Teacher,
        Paul #\= Lawyer,
        Paul #\= Nurse,

	 %  Megan, the chef, and the lawyer meet every week to play tennis
	   Chef  #\= Lawyer ,
           Megan #\= Lawyer ,
	   Megan #\= Chef ,


	 % and lastly  the men need a second job
	 (Acting #= Paul #\/ Acting #= Maurice),

	  % search
        labeling(Jobs),

        % output
        write(Jobs),nl,
        ThePeople = ['megan', 'loretta', 'paul', 'maurice'],
        TheJobs    = ['chef', 'guard', 'nurse', 'tennisPlayer', 'lawyer',
                      'teacher', 'acting', 'boxing'],
					  
					  
					  
        foreach((J,JS) in (Jobs,TheJobs),
                (foreach((P,PS) in (People,ThePeople),
                         (P == J ->
                              format('~w is ~w',[PS,JS])
                         ;
                              true
                         )), nl)

               ).
	
	
			   
	
	
	


	
	
	


