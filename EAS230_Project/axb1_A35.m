% Problem 1 Part a
% axb1_A35

% Temp Variables (Will be deleted later)
A = [1 1 -2 1 3 -1;...
     1 3 -3 -1 2 1;...
     2 -1 1 2 1 -3;...
     1 3 -3 -1 2 1;...
     5 2 -1 -1 2 1];
b = [4; -15; 20; -15; -3];
tol = 1;
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
%syms j;                          % Initialize j 
k = 1;                           % Iteration number
error = 0;                       % Temp error
z = 0;                           % Temp Variable

% Calculate first iteration
for i = 1:num_row
    for l = 1:num_col
    x(i,1) = x(i,1) + (-A(i,l)*x(i));
    end
    x(i,1) = (x(i,1)+b(i)) * (1/A(i,i));
end
% Check error     
error = norm(x(:,1));


while tol < error              % If error is greater than tolerance, recalculate
k = k+1;                       % Adds iteration
x = [x zeros(num_row,1)];      % Initialize column to zero
    for i = 1:num_row          % For earch x
        for j = 1:num_col      % Calculates one row
                if j == i      % If i = l, then skip
                    continue
                end
                x(i,k) = x(i,k) + (-A(i,j)*x(i,k-1));    % Equation 3
         end
         x(i,k) = (x(i,k)+b(i)) * (1/A(i,i));         % More equation 3
    end
    % Recalculate error
     error = abs((norm(x(:,k))-norm(x(:,k-1)))/(norm(x(:,k-1))));
end

x = x(:,k);     % Takes only the needed value

% Doesn't work/too lazy to fix
% x(:,i) = (1/A(i,i))*((symsum(-A(i,j)*x(i,j-1), j, 1, num_col)+b(i)));