edge(1,2).
edge(1,4).
edge(1,3).
edge(2,3).
edge(2,5).
edge(3,4).
edge(3,5).
edge(4,5).
edge(6,7).

key(2,5,6).

connected(X,Y) :- edge(X,Y) ; edge(Y,X).

connected_by_key(X,Y,Visited):-
        (key(K, X, Y); key(K, Y, Z)),
        member(K,Visited), !.


path(A,B,Path) :-
       travel(A,B,[A],Q), 
       reverse(Q,Path).

travel(A,B,P,[B|P]) :- 
       (connected(A,B);connected_by_key(A,B,P)) .
travel(A,B,Visited,Path) :-
       (connected(A,C);connected_by_key(A,C,Visited)),           
       C \== B,
       \+member(C,Visited),
       travel(C,B,[C|Visited],Path).
