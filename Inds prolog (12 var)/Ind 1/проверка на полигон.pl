isPentagonal(N):-isPentagonal(N, 1, 2).
isPentagonal(N, N, _):-!.
isPentagonal(N, M, I):- M < N, M1 is ((3 * I * I - I) div 2), I1 is I + 1, isPentagonal(N, M1, I1).

https://www.mathblog.dk/project-euler-45-next-triangle-pentagonal-hexagonal-number/
