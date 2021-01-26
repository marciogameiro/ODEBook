function [I, verified] = VerifySolution(f, Df, x_bar)
% This function uses the radii polynomials approach to verify
% rigorously that there is solution to f(x)=0, near the
% approximate solution x_bar provided.
%
% The function returns verified = true if the method was
% successful in verifying rigorously the existence of a solution.
% In this case it returns the interval I of radii for which the radii
% polynomials are negative. If the rigorous verificatin failed, the
% function returns verified = false and I = [-1, -1];

% Space dimension
n = length(x_bar);

% Compute the matrix A
A = inv(Df(x_bar));
% A = [-0.052 -0.018 0.059; 0.048 -0.018 0.059; -0.012 -0.118 0];

% Compute the Y0 bound using the sup norm
Y0 = norm(A * f(x_bar), Inf);

% Compute the Z0 bound using the sup norm
Z0 = norm(eye(n) - A * Df(x_bar), Inf);

% Compute the Z2 bound using the sup norm
Z2 = 2 * max([abs(A(1,2)) + abs(A(1,3)), abs(A(2,2)) + abs(A(2,3)), abs(A(3,2)) + abs(A(3,3))]);

% Define the radii polynomial
p = [Z2, -(1 - Z0), Y0];

% Compute and sort the roots
r = sort(roots(p));

% Need to decrease the interval
% by a small value delta_r
delta_r = 1e-15;

% Compute the interval I
I = [r(1) + delta_r, r(2) - delta_r];

% Now we need to check if the radii polynomials
% are negative in I.

% Evaluate the raddi polynomials at the end points
r1 = I(1); r2 = I(2);
p1 = Z2 * r1^2 -(1 - Z0) * r1 + Y0;
p2 = Z2 * r2^2 -(1 - Z0) * r2 + Y0;

% If p1 and p2 are negative
if (p1 < 0) && (p2 < 0)
  verified = true;
else % Verification failed, set I = [-1, -1]
  I = [-1, -1];
  verified = false;
end

end
