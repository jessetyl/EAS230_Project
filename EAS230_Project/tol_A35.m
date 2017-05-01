% Problem 1 part d
% tol_A35

% Variables
A = [10 -2 0 0;...
     3 -11 1 0;...
     0 0 8 -3;...
     0 2 1 -9;];
b = [3; -2; 0; 1];
tol = [1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8];
[num_row, num_col] = size(A);
x1 = zeros(num_row,length(tol));     % Initialization
x2 = zeros(num_row,length(tol));
k1 = zeros(1,length(tol));
k2 = zeros(1,length(tol));

% Calculations
for i = 1:length(tol)
    [x1(:,i) k1(i)] = axb1_A35(A,b,tol(i));
    [x2(:,i) k2(i)] = axb2_A35(A,b,tol(i));
end

% Graphing
figure(1)
loglog(tol,k1,tol,k2)
title('Tolerance vs. Iterations')
xlabel('Tolerance')
ylabel('Iterations')
legend('axb1','axb2')