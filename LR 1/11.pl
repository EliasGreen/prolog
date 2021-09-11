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

grand_pa(X, Y):-male(X), parent(Z, Y), parent(X, Z).
grand_neson(X, Y):-female(Y), parent(Z, Y), parent(X, Z).

grand_pa_nesin_moy(X, Y):-grand_pa(X, Y),grand_neson(X, Y);grand_pa(Y, X),grand_neson(Y, X).
	
	
