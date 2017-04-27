% Problem 1 Part a
% axb1_A35

% Test Variables (Will be deleted later)
% A = [10 -2 0 0;...
%      3 -11 1 0;...
%      0 0 8 -3;...
%      0 2 1 -9;];
% b = [3; -2; 0; 1];
% tol = 1e-3;

function [x, k] = axb1_A35(A,b,tol)   % Inputs A, b, and tolerance(e)
                                      % With outputs of solution vector(x) and
                                      % interations(k)
                                 
[num_row, num_col] = size(A);    % Obtain number of Columns and Rows or Matrix
x = zeros(num_row,1);            % Initialize x

% Calculate first iteration
for i = 1:num_row
    for l = 1:num_col
    x(i,1) = x(i,1) + (-A(i,l)*x(i));
    end
    x(i,1) = (x(i,1)+b(i)) * (1/A(i,i));
end
k = 1;    % Iteration number
% Check error     
err = norm(x(:,1));

% Main Loop
while tol < err              % If error is greater than tolerance, recalculate
k = k+1;                       % Adds iteration
x = [x zeros(num_row,1)];      % Initialize new column to zero
    for i = 1:num_row          % For earch x
        for j = 1:num_col      % Calculates one row/summation loop
                if j == i      % If j = i, then skip
                    continue
                end
                x(i,k) = x(i,k) + (-A(i,j)*x(i,k-1));    % Equation 3
         end
         x(i,k) = (x(i,k)+b(i)) * (1/A(i,i));         % More equation 3
    end
    % Recalculate error
    err = abs((norm(x(:,k))-norm(x(:,k-1)))/(norm(x(:,k-1))));
end

x = x(:,k);     % Takes only the needed value
end