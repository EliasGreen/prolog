parent(pam,arnold).
parent(ivan,arnold).
parent(maria,ekaterina).
parent(arnold,ekaterina).
parent(ekaterina,andrei).

male(ivan).
male(arnold).
male(andrei).

female(pam).
female(maria).
female(ekaterina).

mother(X, Y):-parent(X, Y), female(X).
mother(X):-mother(Y, X), write(Y).
	
