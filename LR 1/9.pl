parent(pam,arnold).
parent(ivan,arnold).
parent(maria,ekaterina).
parent(arnold,ekaterina).
parent(maria,st).
parent(arnold,st).
parent(ekaterina,andrei).

parent(nastya,maria).
parent(timoha,maria).

male(ivan).
male(arnold).
male(andrei).
male(st).
male(timoha).

female(pam).
female(maria).
female(ekaterina).
female(nastya).

grand_so(X, Y):-male(X), parent(Z, X), parent(Y, Z).
grand_so(X):-grand_so(Y, X), write(Y).
	
	
