% Problem 2 Part aii
% reactor2_A35

% Parameters
A = [60 -40 -80;...
     40 -60 -20;...
     80 20 -150;];
m = [300 500 700 900 1000 1100 1200 1300 1400 1500];
[num_row, num_col] = size(A);
x = zeros(num_row,length(m));
tol = 1e-4;
 
 % Calculation
 for i = length(m)
     b = [-m(i); 0; -200];
     [x(:,i) k] = axb1_A35(A,b,tol);
 end
 
 % Ploting
 figure(1)
 plot(m,x(1,:),m,x(2,:),m,x(3,:))
 title('Mass vs. Concentration')
 xlabel('Mass (mg/s)')
 ylabel('Concentration (mg/m^3)')
 