in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

shutit_main([[_|_]|T], A):-shutit_main(T, A).
shutit_main([[H|[S|_]]|_], H):- S == 1.

pravda_main([[_|_]|T], A):-pravda_main(T, A).
pravda_main([[H|[S|_]]|_], H):- S == 0.

podaril([[_|_]|T], A):-podaril(T, A).
podaril([[H|[_|S]]|_], H):- S == [1].

ne_podaril([[_|_]|T], A):-ne_podaril(T, A).
ne_podaril([[H|[_|S]]|_], H):- S == [0].


summa_pravdi([], N):- N == 2.
summa_pravdi([[_|[H|_]]|T], N):- N1 is N + H, summa_pravdi(T, N1).

summa_podaril([], N):- N == 2.
summa_podaril([[_|[_|[H|_]]]|T], N):- N1 is N + H, summa_podaril(T, N1).

pr_guys:- Guys=[_,_,_,_],
		in_list(Guys,[petr,_,_]),
		in_list(Guys,[vova,_,_]),
    	in_list(Guys,[roma,_,_]),
    	in_list(Guys,[andrei,_,_]),
    
    	(
        in_list(Guys,[petr,0,_]), in_list(Guys,[andrei,_,0]),in_list(Guys,[petr,_,0]);
        in_list(Guys,[petr,_,1]), in_list(Guys,[vova,0,_])
        ),
    
    	(
       in_list(Guys,[roma,0,_]), in_list(Guys,[vova,1,_]),in_list(Guys,[petr,1,_]);
        in_list(Guys,[andrei,0,_]), in_list(Guys,[vova,0,_])
        ),
    
    (
       in_list(Guys,[petr,1,_]),
		in_list(Guys,[vova,1,_]),
    	in_list(Guys,[roma,0,_]),
    	in_list(Guys,[andrei,0,_]);
     in_list(Guys,[petr,1,_]),
		in_list(Guys,[vova,0,_]),
    	in_list(Guys,[roma,1,_]),
    	in_list(Guys,[andrei,0,_]);
     in_list(Guys,[petr,1,_]),
		in_list(Guys,[vova,0,_]),
    	in_list(Guys,[roma,0,_]),
    	in_list(Guys,[andrei,1,_]);
     in_list(Guys,[petr,0,_]),
		in_list(Guys,[vova,1,_]),
    	in_list(Guys,[roma,1,_]),
    	in_list(Guys,[andrei,0,_]);
     in_list(Guys,[petr,0,_]),
		in_list(Guys,[vova,1,_]),
    	in_list(Guys,[roma,0,_]),
    	in_list(Guys,[andrei,1,_]);
     in_list(Guys,[petr,0,_]),
		in_list(Guys,[vova,0,_]),
    	in_list(Guys,[roma,1,_]),
    	in_list(Guys,[andrei,1,_])
        ),
  
    	in_list(Guys,[Name,_,1]),
		write(Name).
