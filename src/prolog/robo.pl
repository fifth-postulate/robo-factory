color(red).
color(yellow).
color(green).
color(blue).

different(red, blue).
different(red, yellow).
different(red, green).
different(blue, red).
different(blue, yelllow).
different(blue, green).
different(yellow, red).
different(yellow, blue).
different(yellow, green).
different(green, red).
different(green, blue).
different(green, yellow).

head(Color) :- color(Color).
torso(Color) :- color(Color).
legs(Color) :- color(Color).

robot(X, Y, Z) :- head(X), torso(Y), legs(Z).

commonalities(3, robot(X, Y, Z), robot(X, Y, Z)). 
commonalities(2, X, Y) :-
  X = robot(U, V, W), Y = robot(U, V, T), different(T, W);
  X = robot(U, V, W), Y = robot(U, T, W), different(T, V);
  X = robot(U, V, W), Y = robot(T, V, W), different(T, U).
commonalities(1, X, Y) :-
  X = robot(U, V, W), Y = robot(U, S, T), different(S, V), different(T, W);
  X = robot(U, V, W), Y = robot(S, V, T), different(S, U), different(T, W);
  X = robot(U, V, W), Y = robot(S, T, W), different(S, U), different(T, V).
commonalities(0, X, Y) :-
  X = robot(U, V, W), Y = robot(R, S, T), different(R, U), different(S, V), different(T, W).

candidate(C, ((K, X), (L, Y), (M, Z)))) :-
  commonalities(K, C, X), commonalities(L, C, Y), commonalities(M, C, Z).
  
