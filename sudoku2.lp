% Sudoku Solver - 9x9

% Put exactly one number from 1 to 9 in every cell
1 { sudoku(X,Y,N) : N=1..9 } 1 :- X=1..9, Y=1..9.

% Keep all given numbers
:- initial(X,Y,N), not sudoku(X,Y,N).

% No duplicate numbers with the same X coordinate
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.

% No duplicate numbers with the same Y coordinate
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.

% Determine which 3x3 subgrid each cell belongs to
subgrid(X,Y,G) :-
    X=1..9,
    Y=1..9,
    G = 1 + ((X-1)/3)*3 + ((Y-1)/3).

% A number cannot appear twice in the same subgrid
:- subgrid(X1,Y1,G),
   subgrid(X2,Y2,G),
   sudoku(X1,Y1,N),
   sudoku(X2,Y2,N),
   X1*10+Y1 < X2*10+Y2.

#show sudoku/3.