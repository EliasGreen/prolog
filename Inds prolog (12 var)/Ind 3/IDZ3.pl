readFromFile(File):-
    open(File,read,Stream),
    get_char(Stream,Char1),
    process_the_stream(Char1,Stream, [], []),
    close(Stream).

% Exit condition
process_the_stream(end_of_file,_,List,_):-
	count_occurrences(List).

process_the_stream(' ', Stream,List, []):-
    get_char(Stream,Char2),
    process_the_stream(Char2,Stream,List, []).

process_the_stream('\n', Stream,List, []):-
    get_char(Stream,Char2),
    process_the_stream(Char2,Stream,List, []).

process_the_stream(' ', Stream,List, Sublist):-
	append(List, [Sublist], List1),
    get_char(Stream,Char2),
    process_the_stream(Char2,Stream,List1, []).
	
process_the_stream('\n', Stream, List, Sublist):-
	append(List, [Sublist], List1),
    get_char(Stream,Char2),
    process_the_stream(Char2,Stream,List1, []).

process_the_stream(Char,Stream,List, Sublist):-
	append(Sublist, [Char], Sublist1),
    get_char(Stream,Char2),
    process_the_stream(Char2,Stream,List, Sublist1).
	
count_occurrences(List):-
    findall([X,L], (bagof(true,member(X,List),Xs), length(Xs,L)), Occ), sort(2, @>=, Occ, OccSrt), list_length(OccSrt, L).
	
list_length(Xs,L) :- list_length(Xs,0,L).
list_length( []     , L , L ):- write(L), !.
list_length( [_|Xs] , T , L ) :-
  T1 is T+1 ,
  list_length(Xs,T1,L)
  .
	
