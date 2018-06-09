# Artificial_Intelligence_BTI7510
Prolog project for BFH TI "Artifical Intelligence", BTI7510

From Bruno Fernandez & Claudio Polo

# About
The idea of this project is to find a way from room x to room y.
Problems to solve ->
- the maze and rooms are bi-directed graphs -> problem of looping
- police officer appears randomly in room8, room10, room11 or room12
- there is a bomb that can explode a wall (%%%%)

Some help from:
- http://tcl.sfs.uni-tuebingen.de/~cornell/prolog/Graphs003.html
- https://www.cpp.edu/~jrfisher/www/prolog_tutorial/2_15.html

	+--------+--------+--------+--------+--------+
	| START    Room2 #  Room3    Room24   Room4  |
	+--------+--------+--------+--------+--    --+
	| Room5  |                          | Room6  |
	+--    --+--------+--------+--------+--    --+
	| Room7    Room23   Room22   Room11   Room8  |
	+--    --+--------+--------+--    --+--    --+
	| Room9  |      	         | Room12   Room10 |
	+--    --+--------+		     +--------+--%%%%--+
	| Room13   Room14 |                 | Room21 |
	+--------+--    --+--------+        +--    --+
			     | Room15   End    |        | Room20 |
           +--    --+--    --+--------+--    --+
			     | Room16 | Room17   Room18   Room19 |
			     +--------+--------+--------+--------+
