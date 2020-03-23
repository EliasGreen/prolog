count_occurrences(List, Occ):-
    findall([X,L], (bagof(true,member(X,List),Xs), length(Xs,L)), Occ), sort(1, @>=, Occ, OccSrt), write(OccSrt).
