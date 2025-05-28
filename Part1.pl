%1.1 search2
search2(Elem, [Elem, Elem|_]).
search2(Elem, [Head|List]):-Elem\=Head, search2(Elem, List).

%1.2 search_two
search_two(Elem, [Elem, _, Elem| _]).
search_two(Elem, [H | T]):- Elem\=H, search_two(Elem, T).

%1.3 size
size([], 0).
size([_|T], Size):- size(T, S), is(Size, S+1).

%1.4 sum
sum([], 0).
sum([H | T], Size):- sum(T, S), is(Size, S+H).

%1.5 max e min
max([H | T], Max):- max(T, H, Max).
max([H | T], CurrentMax, Max):- H>CurrentMax, max(T, H, Max).
max([H | T], CurrentMax, Max):- H=<CurrentMax, max(T, CurrentMax, Max).
max([], Max, Max).

min([H | T], Min):- min(T, H, Min).
min([H | T], CurrentMin, Min):- H<CurrentMin, min(T, H, Min).
min([H | T], CurremtMin, Min):- H>=CurrentMin, min(T, CurrentMin, Min).
min([], Min, Min).

maxMin(List, Max, Min):-max(List, Max), min(List, Min).

%1.6 sublist
split([], _, [], []).
split(List, Elements, SubList1, SubList2):-split(List, Elements, 1, SubList1, SubList2).
split([H | T], Elements, Counter, S, SubList2):- Counter=<Elements, is(C, Counter+1), split(T, Elements, C, SubList1, SubList2), append([H], SubList1, S).
split([H | T], Elements, Counter, SubList1, S):- Counter>Elements, is(C, Counter+1), split(T, Elements, C, SubList1, SubList2), append([H], SubList2, S).
split([], _, _, [], []).

%1.7 rotate
rotate([], []).
rotate([H|T], Result):- append(T, [H], Result).

%1.8 count_occurrences
count_occurrences(Element, [Element|T], Count):-count_occurrences(Element, T, C), Count is C+1.
count_occurrences(Element, [_|T], Count):-count_occurrences(Element, T, Count).
count_occurrences(Element, [], 0).

%1.9 dice
dice(X):- X is 1.
dice(X):- X is 2.
dice(X):- X is 3.
dice(X):- X is 4.
dice(X):- X is 5.
dice(X):- X is 6.

%1.10 three dice 
three_dice(L):-dice(X), dice(Y), dice(Z), append([X], [Y], T), append([Z], T, L).

%1.11 distinct 
contains([Element|_], Element).
contains([_|T], Element):-contains(T, Element).

notContains([H|T], Element):-H\=Element, notContains(T, Element).
notContains([], _).

distinct([H|T], Result):-distinct(T,R), notContains(R, H), append([H], R, Result), !. %se non è contenuto -> viene aggiunto
distinct([H|T], Result):-distinct(T,Result), !. %se è contenuto, vado avanti
distinct([], []).



