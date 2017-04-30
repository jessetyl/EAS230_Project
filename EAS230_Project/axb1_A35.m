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
if num_row ~= num_col            % Checks to see if matrix is square
    error('Error:  The input matrix must be a square matrix')
    return
end
if det(A) == 0      % Checks for singularity of matrix
    error('Error:  This sytem may have no solution or infinitely many solutions. This function cannot be used to solve this system')
    return
end
x = zeros(num_row,1);  % Initialize x


% Checks for diagonally dominant matrix
for i = 1:num_row
    diag = 0;
    for j = 1:num_col
        if j == i
            continue
        end
        diag = diag + abs(A(i,j));
    end
    if abs(A(i,i)) == diag
        warning('Matrix A is not diagonally dominant. The solution obtained by this function may be incorrect')
        break
    end
end


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
while tol < err      % If error is greater than tolerance, recalculate
    if k > 1000      % If iterations exceed this number, program stops       
        warning('The system has not converged in the allowable number of iterations')
        x = x(:,k);     % Takes only the needed value
        return
    end
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