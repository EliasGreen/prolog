parent(pam,arnold).
parent(ivan,arnold).
parent(maria,ekaterina).
parent(arnold,ekaterina).
parent(maria,st).
parent(arnold,st).
parent(ekaterina,andrei).
parent(timoha,maria).
parent(nastya,maria).
parent(timoha,candy).
parent(nastya,candy).

male(ivan).
male(arnold).
male(andrei).
male(timoha).
male(st).

female(pam).
female(maria).
female(ekaterina).
female(nastya).
female(candy).

sameparent(X,Y) :-
   parent(A,X),
   parent(A,Y).

call_me_plemyasha(X, Y):-
	female(Y), parent(Z,Y),
    sameparent(Z,X),
    Z \= X.
	
show_me_plemyasha(X):-
	call_me_plemyasha(X, Y), write(Y).
	
	
