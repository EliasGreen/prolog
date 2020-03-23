isPentagonal(N):-isPentagonal(N, 1, 2).
isPentagonal(N, N, _):-!.
isPentagonal(N, M, I):- M < N, M1 is ((3 * I * I - I) div 2), I1 is I + 1, isPentagonal(N, M1, I1).
p(N):-p(0, 143, N).
p(_, I, N):- (I1 is I + 1, R1 is I1 * (2 * I1 - 1), isPentagonal(R1) -> N is R1, !;I1 is I + 1, R1 is I1 * (2 * I1 - 1), p(R1, I1, N)).
