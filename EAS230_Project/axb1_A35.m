% Problem 1 Part a
% axb1_A35

% Test Variables (Will be deleted later)
A = [1 1 -2 1 3 -1;...
           1 3 -3 -1 2 1;...
           2 -1 1 2 1 -3;...
           1 3 -3 -1 2 1;...
           5 2 -1 -1 2 1];
b = [4; -15; 20; -15; -3];
% Test2A = [1 1 -2 1 3 -1;...
%           1 3 -3 -1 2 1;...
%           2 -1 1 2 1 -3;...
%           1 3 -3 -1 2 1;...
%           5 2 -1 -1 2 1;...
%           -1 -1 2 3 1 3];
%  Test2b = [4; -15; 20; -15; -3; 16];

%function [x, k] = axb1_A35(A,b,tol)   % Inputs A, b, and tolerance(e)
                                 % With outputs of solution vector(x) and
                                 % interations(k)
                                 
[num_row, num_col] = size(A);    % Obtain number of Columns and Rows or Matrix
x = zeros(num_row,1);            % Initialize x
syms j;                          % Initialize j 
k = 0;                           % Iteration number

for i = 1:num_row
    x(i) = (1/A(i,i))*((sum(subs(-A(i,j)*x(i-1)),j,1:num_col))+b(i));  % Equation 2
    k = k+1;
end

% Put into loop or seperate loop?
x = sqrt(symsum(x(i)^2,i,1,num_col));
tol > abs((norm(x(k))-norm(x(k-1)))/norm(x(k-1)));  % Equation 4