/* Задаем граф */
node(a,graph).
node(b,graph).
node(c,graph).

edge(a,b,graph).
edge(c,b,graph).

/* Предикат проверки смежности вершин X и Y графа Graph */
adjacent(X,Y,Graph) :-
(edge(X,Y,Graph) ; edge(Y,X,Graph)).

/* Предикат построения пути Path от вершины A до B вершины графа Graph*/
pathDealer(A,B,PathSuffix,Path,Graph) :-
adjacent(A,B,Graph),
Path = [B|PathSuffix].

pathDealer(A,B,PathSuffix,Path,Graph) :-
adjacent(A,C,Graph),
not(C == B),
not(member(C,PathSuffix)),
pathDealer(C,B,[C|PathSuffix],Path,Graph).

/* Предикат получения пути Path от вершины A до B вершины графа Graph*/
path(A,B,Path,Graph) :-
pathDealer(A,B,[A],ReversedPath,Graph),
reverse(ReversedPath,Path).

/* Предикат проверки графа Graph на связность */
isConnected(Graph) :-
not((node(A,Graph), node(B,Graph), not(path(A,B,_,Graph)))).

/* Предикат проверки графа Graph на наличие циклов */
hasCycles(Graph) :-
node(A,Graph),
node(B,Graph),
adjacent(A,B,Graph),
path(A,B,[A,_,_|_],Graph).

/* Предикат проверки графа Graph - является ли он деревом */
isTree(Graph) :-
isConnected(Graph),
not(hasCycles(Graph)).