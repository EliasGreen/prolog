pr:-read(N), read_list(A, N), min(A, El), write(El).
read_list(A, N):-read_list([], A, 0, N).
read_list(A, A, N, N):-!.
read_list(List, A, I, N):- I1 is I+1, read(X), append(List, [X], List1),
    read_list(List1, A, I1, N).

min([X], X):-!.
min([X, Y | R], Min) :-
    X < Y, !,
    min([X | R], Min).
min([_, Y | R], Min) :-
   min([Y | R], Min).