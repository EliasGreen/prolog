count_occurrences(List, Occ):-
    findall([X,L], (bagof(true,member(X,List),Xs), length(Xs,L)), Occ).

delete(X,[X|T],T).
delete(X,[H|T],[H|NT]):-delete(X,T,NT).


varia_rep(0,_,[]).
varia_rep(N,L,[H|RVaria]):-N>0,N1 is N-1,delete(H,L,_),varia_rep(N1,L,RVaria).


member1(H, [H|_]):-!.

member1(X,[H|T]):-
    atomic(H),!,
    member1(X,T).

member1(X,[H|_]):-
    member1(X,H).

member1(X,[_|T]):-
    member1(X,T).

check_count([_|T], K):- [K] == T.

check_A([], _):-fail.
check_A([H|T], K):-member1(a, H) -> check_count(H, K); check_A(T, K).

check_B([], _):-fail.
check_B([H|T], K):-member1(b, H) -> check_count(H, K); check_B(T, K).

check_C([], _):-fail.
check_C([H|T], K):-member1(c, H) -> check_count(H, K); check_C(T, K).

check_D([], _):-fail.
check_D([H|T], K):-member1(d, H) -> check_count(H, K); check_D(T, K).

check_E([], _).
check_E([H|T], K):-member1(e, H) -> check_count(H, K); check_E(T, K).

check_F([], _).
check_F([H|T], K):-member1(f, H) -> check_count(H, K); check_F(T, K).

main_pred(N, MList, K, M, L):- varia_rep(N,MList, L), count_occurrences(L, Occ),
    check_A(Occ, K),
    check_B(Occ, K),
    check_C(Occ, K),
    check_D(Occ, M),
    check_E(Occ, 1),
    check_F(Occ, 1),
    write(L), nl.

loop_through_list([]).
loop_through_list([Head|Tail]) :-
    write(Head),
    loop_through_list(Tail).

write_list_to_file(Filename,List) :-
    tell(Filename),
    loop_through_list(List),
    told.