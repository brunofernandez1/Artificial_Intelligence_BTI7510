mensch(du).
mensch(ich).
mensch(sie).
mensch(es).
liebt(ich, X) :- liebt(X, du), mensch(X).
liebt(sie, du).
liebt(es, du).

textsame(T1, T2) :- T1 == T2.
textnotsame(T1, T2) :- T1 \= T2.