
% Add path for numerics (Newton) code
addpath('../../Numerics') 

lambda = 3; % Fix the parameter lambda

% Define a function of x for fixed lambda
g = @(x) f(x, lambda);
Dg = @(x) Df(x, lambda);
% Dg = @(x) JacobianFiniteDifferences(g, x);

% Initial guesses for Newton
% Each row is an initial guess
X0 = [-1 1; 1 1; 1 -1; -1 -1];

%% Compute and verify the solutions

figure; hold on

for k = 1:4
  % Initial guess for Newton
  x0 = X0(k, :)';

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

  % Plot largest existence ball
  PlotEnclosure(x_bar, r_plus);
end

% Set the axis size
axis([-2.5 2.5 -2.5 2.5])

% Save plot to a file
% print('-depsc2', 'enclosures_2d.eps')
