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

husband(X, Y):-male(Y), parent(X, Z), parent(Y, Z).
husband(X):-husband(X, Y), write(Y).
	
