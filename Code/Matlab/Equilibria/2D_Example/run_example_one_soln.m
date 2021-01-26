
% Add path for numerics (Newton) code
addpath('../../Numerics')

lambda = 3; % Fix the parameter lambda

% Define a function of x for fixed lambda
g = @(x) f(x, lambda);
Dg = @(x) Df(x, lambda);
% Dg = @(x) JacobianFiniteDifferences(g, x);

% Initial guess for Newton
x0 = [-1; 1];

% Compute the solution
x_bar = ComputeSolution(g, Dg, x0);

disp(' ')
disp('The computed solution is:')
disp(['x_bar = (' num2str(x_bar(1), 16) ', ' num2str(x_bar(2), 16) ')']);
disp(' ')

% Verify the solution
[I, verified] = VerifySolution(g, Dg, x_bar);

% Existence interval
r_minus = I(1);
r_plus = I(2);

if verified == true
  disp('Verification was successful!')
  disp(['The existence interval is I = (' num2str(r_minus, 16) ', ' num2str(r_plus, 16) ')'])
else
  disp('Verification failed!')
end

figure; hold on
PlotEnclosure(x_bar, r_plus)

% Set the axis size
axis([-2.5 2.5 -2.5 2.5])
