count_occurrences(List):-
    findall([X,L], (bagof(true,member(X,List),Xs), length(Xs,L)), Occ), sort(2, @>=, Occ, OccSrt), selectech(OccSrt, []).

selectech([], K):- write(K), !.
selectech([[SUBH|SUBT]|T], Final):- SUBT > 0 -> NewVal is SUBT - 1, append(Final,[SUBH], NewFinal), append([SUBH], [NewVal], MiniList), append([MiniList], T, NewList), selectech(NewList, NewFinal), !; selectech(T, Final).
