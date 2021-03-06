% Problem 2 ai
% reactor_A35

% Parameters
A = [-120 60 0;...
     40 -80 0;...
     80 20 -150];
b = [-1300; 0; -200];
tol = 1e-4;

% Calculation
[x1 k1] = axb1_A35(A,b,tol);
[x2 k2] = axb2_A35(A,b,tol);

[x1 x2]