% Problem 2 Part bi
% truss1_A35

% Parameters
m = 50;
g = 9.81;
tol = 1e-4;
t = sqrt(2)/2;
A = [-1 -t 0 0 0;...
     0 -t 0 0 0;...
     0 0 -1 -t 0;...
     1 0 0 -t 0;...
     0 t 0 0 -t];
b = [0; m*g; 0; 0; 0];

[x1 k1] = axb1_A35(A,b,tol);
[x2 k1] = axb2_A35(A,b,tol);

[x1 x2]