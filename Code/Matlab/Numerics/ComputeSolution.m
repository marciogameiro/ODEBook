function x = ComputeSolution(f, Df, x0)
% Use Newton's method implemented in the function
% Newton to compute a numerical zero of f.

max_itr = 20;       % Maximum number of Newton iterations
rel_tol = 1.0e-14;  % Relative error tolerance for Newton
abs_tol = 1.0e-14;  % Absolute error tolerance for Newton

% Run Newton's method using x0 as initial guess to compute solution x
[x, ~, converged] = Newton(f, Df, x0, max_itr, rel_tol, abs_tol);
% [x, num_itr, converged] = Newton(f, Df, x0, max_itr, rel_tol, abs_tol);

% Check if Newton failed
if converged == false
  disp('Newton did not convege!');
end

end
