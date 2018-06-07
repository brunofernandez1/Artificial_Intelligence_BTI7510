/**
* Prolog project by B. Fernandez and Claudio Polo I3p
* 
* Some help from:
* 	http://tcl.sfs.uni-tuebingen.de/~cornell/prolog/Graphs003.html
*	https://www.cpp.edu/~jrfisher/www/prolog_tutorial/2_15.html
*
*
*
*
*
*
*	+--------+--------+--------+--------+--------+
*	| START    Room2    Room3    Room24   Room4  |
*	+--------+--------+--------+--------+--    --+
*	| Room5  |                          | Room6  |
*	+--    --+--------+--------+--------+--    --+
*	| Room7    Room23   Room22   Room11   Room8  |
*	+--    --+--------+--------+--    --+--    --+
*	| Room9  |      	       | Room12   Room10 |
*	+--    --+--------+		   +--------+--%%%%--+
*	| Room13   Room14 |                 | Room21 |
*	+--------+--    --+--------+        +--    --+
*			 | Room15   End    |        | Room20 |
*			 +--    --+--    --+--------+--    --+
*			 | Room16 | Room17   Room18   Room19 |
*			 +--------+--------+--------+--------+
*/

% rooms that are connected to each other by doors
door(start,room2).
door(room2,room3).
door(room3,room24).
door(room24,room4).
door(room4,room6).
door(room6,room8).
door(room8,room10).
door(room8,room11).
door(room10,room12).
door(room11,room12).
door(room11,room22).
door(room22,room23).
door(room23,room7).
door(room7,room5).
door(room7,room9).
door(room9,room13).
door(room13,room14).
door(room14,room15).
door(room15,room16).
door(room15,end).
door(end,room17).
door(room17,room18).
door(room18,room19).
door(room19,room20).
door(room20, room21).


% with a bomb you can blow up a wall between two rooms
% the bomb is located in room2 and with her you can open the way between room10 and room21
bomb(room2,room10,room21).

% if roomx is connected with roomy, roomy is also connected with roomx
connected(X,Y) :- door(X,Y) ; door(Y,X).

% blow the wall between X and Y if you already collected the bomb
blowwall(X,Y,Roomlist):-
        (bomb(B, X, Y); bomb(B, Y, X)),
        member(B,Roomlist), !.


way(X,Y,Waylist) :-
       walk(X,Y,[X],Z), 
       reverse(Z,Waylist).

walk(X,Y,Roomlist,[Y|Roomlist]) :- 
       (connected(X,Y);blowwall(X,Y,Roomlist)) .
walk(X,Y,Roomlist,Path) :-
       (connected(X,Z);blowwall(X,Z,Roomlist)),           
       Z \== Y,
       \+member(Z,Roomlist),
       walk(Z,Y,[Z|Roomlist],Path).
	   
%here we can calculate the shortest path by counting the elements in the list and return it
shortestPath(X, Y, L, N) :-
	length(L, N), 
	way(X, Y, L),!.
	%append(L,N,Z),!.


/**
* 
*	Code to run:
*		way(start,end,L), length(L,N)
*		shortestPath(start, end, S, L).
*
*/
	
	   
