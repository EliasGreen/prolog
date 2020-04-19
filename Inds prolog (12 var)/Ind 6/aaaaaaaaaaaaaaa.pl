node(a,graph).
node(b,graph).
node(c,graph).
node(d,graph).

edge(a,b,graph).
edge(c,b,graph).
edge(d,c,graph).


adjacent(X,Y,Graph) :-
(edge(X,Y,Graph) ; edge(Y,X,Graph)).

pathDealer(A,B,PathSuffix,Path,Graph) :-
adjacent(A,B,Graph),
Path = [B|PathSuffix].

pathDealer(A,B,PathSuffix,Path,Graph) :-
adjacent(A,C,Graph),
not(C == B),
not(member(C,PathSuffix)),
pathDealer(C,B,[C|PathSuffix],Path,Graph).

path(A,B,Path,Graph) :-
pathDealer(A,B,[A],ReversedPath,Graph),
reverse(ReversedPath,Path).

isConnected(Graph) :-
not((node(A,Graph), node(B,Graph), not(path(A,B,_,Graph)))).

notCycled(Graph) :-
node(A,Graph),
node(B,Graph),
path(A,B,[A,_,_|_],Graph).


isConnected(Graph) :-
not((node(A,Graph), node(B,Graph), not(path(A,B,_,Graph)))

isTree(graph):-
	notCycled(graph),
	isConnected(graph).