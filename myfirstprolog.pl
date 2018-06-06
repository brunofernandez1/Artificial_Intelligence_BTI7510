mensch(du).
mensch(ich).
mensch(sie).
mensch(es).
liebt(ich, X) :- liebt(X, du), mensch(X).
liebt(sie, du).
liebt(es, du).

textsame(T1, T2) :- T1 == T2.
textnotsame(T1, T2) :- T1 \= T2.

pfeil(a,b).
pfeil(a,c).
pfeil(a,d).
pfeil(b,c).
pfeil(c,d).
pfeil(c,e).
pfeil(d,e).

weg(X,Y):-pfeil(X,Y).
weg(X,Y):-pfeil(X,Z),weg(Z,Y).