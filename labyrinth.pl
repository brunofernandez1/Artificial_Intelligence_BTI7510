%the rooms in the labyrinth
room(room1).
room(room2).
room(room3).
room(room4).
room(room5).
room(room6).
room(room7).
room(room8).
room(room9).
room(room10).
room(room11).
room(room12).
room(room13).
room(room14).
room(room15).
room(start).
room(end).

%the doors in the labyrinth
%to expand with openened  closed
door(door0).
door(door1).
door(door2).
door(door3).
door(door4).
door(door5).
door(door6).
door(door7).
door(door8).
door(door9).
door(door10).
door(door11).
door(door12).
door(door13).
door(door14).
door(door15).


%the connections between doors and rooms
connected(start, door0, room1).
connected(room1, door0, start).
connected(room1, door1, room2).
connected(room2, door1, room1).
connected(room1, door2, room6).
connected(room3, door10, room4).
connected(room3, door11, room5).
connected(room4, door10, room3).
connected(room4, door9, room7).
connected(room5, door11, room3).
connected(room6, door2, room1).
connected(room6, door3, room8).
connected(room6, door5, room9).
connected(room6, door6, room10).
connected(room7, door8, room11).
connected(room7, door9, room4).
connected(room8, door3, room6).
connected(room8, door4, room9).
connected(room9, door4, room8).
connected(room9, door5, room6).
connected(room10, door6, room6).
connected(room10, door7, room12).
connected(room11, door8, room7).
connected(room12, door7, room10).
connected(room12, door12, room13).
connected(room13, door12, room12).
connected(room13, door13, room14).
connected(room14, door13, room13).
connected(room14, door14, room15).
connected(room15, door14, room14).
connected(room15, door15, end).
%connected(end, door15, room15).



%get all possible moves to go
connected(X, Y, Z) :- room(X), door(Y), room(Z).

%all persons in game
person(agent).
person(guard1).
person(guard2).

%current position of agent
currentPos(agent, start).
currentPos(guard1, room5).

%function to move arond
%move(X, Y, Z) :- room(X), door(Y), room(Z), connected(Z, Y).

%fuction to find doors
look(X, Z):- connected(X, Y, Z).

weg(X,Z):-connected(X,Y,Z).
%weg(X,Y):-connected(X,Y,Z),weg(L,Y).

tiefensuche(Start,Ziel,Loesung):-connected(Start,_,Ziel),connected(_,Ziel),
                                 tiefensuche(Start,[Start],Ziel,Loesung).
								 
tiefensuche(Ziel,Pfad,Ziel,Loesung):-Loesung = Pfad,!.
tiefensuche(KnotenA,Pfad,Ziel,Loesung):-connected(KnotenA,KnotenN),
                                        not(member(KnotenN,Pfad)),
                                        append(Pfad,[KnotenN],PfadNeu),
                                        tiefensuche(KnotenN,PfadNeu,Ziel,Loesung).













