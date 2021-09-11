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

call_me_daddy(X, Y):-
	male(X), parent(Z, Y), X \= Z, parent(W, X), parent(W, Z).
	
show_me_daddy(X):-
	call_me_daddy(Y, X), write(Y).
	
	
