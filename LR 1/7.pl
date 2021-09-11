parent(pam,arnold).
parent(ivan,arnold).
parent(maria,ekaterina).
parent(arnold,ekaterina).
parent(maria,st).
parent(arnold,st).
parent(ekaterina,andrei).

male(ivan).
male(arnold).
male(andrei).
male(st).

female(pam).
female(maria).
female(ekaterina).

b_s(X, Y):-parent(Z, X), parent(Z, Y), X\=Y.
b_s(X):-b_s(X, Y), write(Y).
	
