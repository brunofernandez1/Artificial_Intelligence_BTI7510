/**
* Prolog project by B. Fernandez and Claudio Polo /// I3p
* 
* Some help from:
* 	http://tcl.sfs.uni-tuebingen.de/~cornell/prolog/Graphs003.html
*	https://www.cpp.edu/~jrfisher/www/prolog_tutorial/2_15.html
*
*	%%%%	-> wall to explode
*	#		-> bomb to collect
*
*
*	--- Map to traverse ---
*	
*	+--------+--------+--------+--------+--------+
*	| START    Room2 #  Room3    Room24   Room4  |
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
*
*	The idea of this project is to find a way from room x to room y.
*	Problems to solve ->
*						-the rooms are bi-directed graphs -> problem of looping
*						-police officer appears randomly in room8, room10, room11 or room12
*						-there is a bomb that can explode a wall (%%%%)
*
*
*
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

%guard can be on one of those rooms:
%L = [1,2,3], random_member(A, L).
police([room11,room8,room12,room10]).
getPolList(X) :- police(Y), random_member(X, Y).


% with a bomb you can blow up a wall between two rooms
% the bomb is located in room2 and with her you can open the way between room10 and room21
bomb(room2,room10,room21).

% if roomx is connected with roomy, roomy is also connected with roomx
connected(X,Y) :- door(X,Y) ; door(Y,X).

% blow the wall between X and Y if you already collected the bomb
blowwall(X,Y,Roomlist):-
        (bomb(B, X, Y); bomb(B, Y, X)),
        member(B,Roomlist), !.

% find all possible ways from X to Y and return them
way(X,Y,Waylist) :-
       walk(X,Y,[X],Z), 
       reverse(Z,Waylist).

% walk through the map recursive
% this is a depth first search
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
	

printtext1 :-
	write('The police caught you!').
printtext2 :-
	write('You have found a way to escape!').

isMember(Policepos, Waylist) :-
	member(Policepos, Waylist).
	
%here runs the main code
%depending on the result you recieve the one or the other message
main(Waylist, Policepos, Cost):-
	getPolList(Policepos),
	shortestPath(start, end, Waylist, Cost),
	\+isMember(Policepos, Waylist),
	printtext2,!.
main(Waylist, Policepos, Cost):-	
	getPolList(Policepos),
	shortestPath(start, end, Waylist, Cost),
	isMember(Policepos, Waylist),
	printtext1.
	
/**
* 
*	Code to run:
*		main(Waylist, Policepos, Cost).
*		way(start,end,L), length(L,N)
*		shortestPath(start, end, S, L).
*
*/



%% commented code, just for history purpose
%( isMember(Policepos, Waylist) = true ->  
%	write('phone found in your search area')
%	; isMember(Policepos, Waylist) = false -> 
%	write('phone not found!')
%).
%isMember(Policepos, Waylist).
%(member(Policepos, Waylist) -> write('bubux'));
%(member(Policepos, Waylist) = true -> write('babax')).
%write('you fucked up').
%-> write('bubux') ; printtext ).
%\+ member(Policepos, Waylist);
%printtext.
%way(start, end, Waylist).
%check if police is in the list
%member2(X, [Y|T]) :- X = Y; member(X, T),!
%threeorfor(X,Y):- member(Y,X).
%member(a,[a,b,c]).