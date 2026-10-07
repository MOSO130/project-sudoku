% Sudoku Solver

% Each cell gets exactly one number from 1 to 4
1 { sudoku(X,Y,N) : N=1..4 } 1 :- X=1..4, Y=1..4.

% Keep the numbers already given
:- initial(X,Y,N), not sudoku(X,Y,N).

% No duplicate numbers in a row
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.

% No duplicate numbers in a column
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.

% Define the four 2x2 subgrids
subgrid(X,Y,1) :- X=1..2, Y=1..2.
subgrid(X,Y,2) :- X=1..2, Y=3..4.
subgrid(X,Y,3) :- X=3..4, Y=1..2.
subgrid(X,Y,4) :- X=3..4, Y=3..4.

% No duplicate numbers within a subgrid
:- subgrid(X1,Y1,G), subgrid(X2,Y2,G),
   sudoku(X1,Y1,N), sudoku(X2,Y2,N),
   X1 != X2.

:- subgrid(X1,Y1,G), subgrid(X2,Y2,G),
   sudoku(X1,Y1,N), sudoku(X2,Y2,N),
   Y1 != Y2.

#show sudoku/3.