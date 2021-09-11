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

daughter(X, Y):-parent(Y, X), female(X).
daughter(Y):-daughter(X, Y), write(X).
	
