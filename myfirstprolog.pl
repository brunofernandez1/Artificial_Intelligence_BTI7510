tuer(a,b).
tuer(b,c).
%tuer(d,e).
tuer(c,d).
tuer(e,f).
tuer(g,e).

key(d,b,e).
keypfeil(X,Y,Z):-key(X,Y,Z).
keypfeil(X,Y,Z):-key(X,Z,Y).

pfeil(X,Y):-tuer(X,Y).
pfeil(X,Y):-tuer(Y,X).

tiefensuche(Start,Ziel,Loesung):-pfeil(Start,_),pfeil(_,Ziel),
                                 tiefensuche(Start,[Start],Ziel,Loesung).

tiefensuche(Ziel,Pfad,Ziel,Loesung):-Loesung = Pfad,!.
tiefensuche(KnotenA,Pfad,Ziel,Loesung):-((pfeil(KnotenA,KnotenN),
                                        not(member(KnotenN,Pfad)));
										(keypfeil(KeyKnoten,KnotenA, KnotenN),
										member(KeyKnoten,Pfad))),
                                        append(Pfad,[KnotenN],PfadNeu),
                                        tiefensuche(KnotenN,PfadNeu,Ziel,Loesung).