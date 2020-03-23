pr:-read(Pos), read(N), read_list(A, N), find_el(A, El, N, Pos), write(El).
read_list(A, N):-read_list([], A, 0, N).
read_list(A, A, N, N):-!.
read_list(List, A, I, N):- I1 is I+1, read(X), append(List, [X], List1),
    read_list(List1, A, I1, N).

sum_list(A, Sum):-sum_list(A, 0, Sum).
sum_list([], Sum, Sum):-!.
sum_list([H|T], S, Sum):- S1 is S+H, sum_list(T, S1, Sum).

find_el(A, El, N, Pos):-find_el(A, El, N, Pos, 0).
find_el(_, _, N, N, _):-!.
find_el([H|_], H, _, Cur, Cur):-!.
find_el([_|T], El, N, Pos, Cur):- Cur1 is Cur+1, find_el(T, El, N, Pos, Cur1).