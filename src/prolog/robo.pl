/** <module> Robo Factory

This module models the Robo Factory game.

@author Daan van Berkel
@license MIT
*/

%! color(-Color) is det.
%
% True if it is one of the colors used in the game.
color(red).
color(yellow).
color(green).
color(blue).

%! different(+A, +B) is det.
%
% True if the A and B are different colors.
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

% The head of a robot can be any color.
head(Color) :- color(Color).

% The torso of a robot can be any color.
torso(Color) :- color(Color).

% The legs of a robot can be any color.
legs(Color) :- color(Color).

% robot is an assignment of colors to head, torso and legs.
robot(X, Y, Z) :- head(X), torso(Y), legs(Z).

%! commonalities(-N:int, +X:robot, +Y:robot) is det.
%! commonalities(+N:int, +X:robot, +Y:robot) is det
%
% True if the number of commonalities between robots X and Y is correct.
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

candidate(C, ((K, X), (L, Y), (M, Z))) :-
  commonalities(K, C, X), commonalities(L, C, Y), commonalities(M, C, Z).
