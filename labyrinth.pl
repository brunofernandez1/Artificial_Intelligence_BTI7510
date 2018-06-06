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
connected(room1, door0).
connected(room1, door1).
connected(room1, door2).
connected(room2, door1).
connected(room3, door10).
connected(room3, door11).
connected(room4, door10).
connected(room4, door9).
connected(room5, door11).
connected(room6, door2).
connected(room6, door3).
connected(room6, door5).
connected(room6, door6).
connected(room7, door8).
connected(room7, door9).
connected(room8, door3).
connected(room8, door4).
connected(room9, door4).
connected(room9, door5).
connected(room10, door6).
connected(room10, door7).
connected(room11, door8).
connected(room12, door7).
connected(room12, door12).
connected(room13, door12).
connected(room13, door13).
connected(room14, door13).
connected(room14, door14).
connected(room15, door14).
connected(room15, door15).
connected(end, door15).
connected(start, door0).


%get all possible moves to go
connected(X, Y) :- room(X).
connected(X, Y) :- door(Y).

%all persons in game
person(agent).
person(guard1).
person(guard2).

%current position of agent
currentPos(agent, room0).
currentPos(guard1, room5).

%function to move arond
move(X, Y, Z) :- room(X), door(Y), room(Z), connected(Z, Y).

giveafuck(X,Z) :- connected(X,Y), connected(Z,Y).













