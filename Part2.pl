%2.1 dropAny
dropAny(X ,[X|T], T).
dropAny(X ,[H|Xs], [H|L]):- dropAny(X, Xs, L).

%2.2 dropFirst occurrence
dropFirst(X ,L, T):- dropAny(X ,L, T), !.

%2.2 dropLast occurrence
dropLast(X ,[H|Xs], [H|L]):- dropLast(X, Xs, L), !. 
dropLast(X ,[X|T], T).

%2.2 dropAll occurrence
equalList([H|T1],[H|T2]):-equalList(T1,T2).
equalList([],[]).

dropAll(X, In, Result):-dropFirst(X, In, Out), dropAll(X, Out, Result), !. %drops the first element of the list matching X
dropAll(X, In, Out):- equalList(In, Out). %if the input and output list are the same, all elements have been dropped.