% Problem 2 Part bii
% truss2_A35

% Parameters
m = 10:10:100;
g = 9.81;
tol = 1e-4;
t = sqrt(2)/2;
A = [-1 -t 0 0 0;...
     0 -t 0 0 0;...
     0 0 -1 -t 0;...
     1 0 0 -t 0;...
     0 t 0 0 -t];
[num_row, num_col] = size(A);
x = zeros(num_row,length(m));
 
for i = 1:length(m)
    b = [0; m(i)*g; 0; 0; 0];
    [x(:,i) k] = axb1_A35(A,b,tol);
end

% Ploting
figure(1)
plot(m,x(1,:),m,x(2,:),m,x(3,:),m,x(4,:),m,x(5,:))
title('Mass vs. Force')
xlabel('Mass (mg/s)')
ylabel('Force (N)')
legend('x1','x2','x3','x4','x5')
 