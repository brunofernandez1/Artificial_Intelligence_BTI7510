# Artificial_Intelligence_BTI7510
Prolog project for BFH TI "Artifical Intelligence", BTI7510

by Bruno Fernandez & Claudio Polo

## About
The idea of this project is to find a way from room x to room y.
Problems to solve ->
- the maze and rooms are bi-directed graphs -> problem of looping
- police officer appears randomly in room8, room10, room11 or room12
- there is a bomb that can explode a wall (%%%%)

Some help from:
- http://tcl.sfs.uni-tuebingen.de/~cornell/prolog/Graphs003.html
- https://www.cpp.edu/~jrfisher/www/prolog_tutorial/2_15.html

## Labyrinth

```
+--------+--------+--------+--------+--------+
| START    Room2 #  Room3    Room24   Room4  |
+--------+--------+--------+--------+--    --+
| Room5  |                          | Room6  |
+--    --+--------+--------+--------+--    --+
| Room7    Room23   Room22   Room11   Room8  |
+--    --+--------+--------+--    --+--    --+
| Room9  |		   | Room12   Room10 |
+--    --+--------+	   +--------+--%%%%--+
| Room13   Room14 |                 | Room21 |
+--------+--    --+--------+        +--    --+
	 | Room15     End  |        | Room20 |
	 +--    --+--    --+--------+--    --+
	 | Room16 | Room17   Room18   Room19 |
	 +--------+--------+--------+--------+

	%%%%				-> wall to explode
	#				-> bomb to collected
	room8, room10, room11, room12	-> possible rooms the police officer can be located

```

## How to run

To run the code please start the following main method with 3 variables.
For example:
```
main(Waylist, Policepos, Cost)
```

Then it will return the shortest path with the following informations
- Waylist: the list  of the shortestpath
- Policepos: random position of the police officer
- Cost: how much hops you needed to reach the end
- Depending on whether the figure is caught or not, you will recieve one of those messages to the console:
	- You have found a way to escape!
	- The police caught you!
	
Here are two examples:
```
?- main(Waylist, Policepos, Cost).
You have found a way to escape!
Waylist = [start,room2,room3,room24,room4,room6,room8,room10,room21,room20,room19,room18,room17,end],
Policepos = room12,
Cost = 14.
```
```
?- main(Waylist, Policepos, Cost).
The police caught you!
Waylist = [start,room2,room3,room24,room4,room6,room8,room10,room21,room20,room19,room18,room17,end],
Policepos = room10,
Cost = 14
```

Hint: to see the whole list, run the following command on the console
```
set_prolog_flag(answer_write_options,[max_depth(100)]).
```

## Some explanations for the code
A door connects two rooms together. So this is the logical fact or relationship of both rooms.
Here an example for the first room:
```
door(start,room2).
```

## Known errors
Those errors/problems will be resolved in a later release
- Some times it just returns a false message and it can't find any way to the end room
- extend the code to find another way if the police officer is blocking the path
