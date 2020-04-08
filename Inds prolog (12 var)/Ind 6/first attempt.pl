node(a,graph).
node(b,graph).
node(c,graph).
node(d,graph).

edge(a,b,graph).
edge(c,b,graph).
edge(d,c,graph).

notCycled(graph):-.

connected(graph):-.

tree(graph):-
	notCycled(graph),
	connected(graph).
