function J = Df(x, sigma, rho, beta)
% Jacobian matrix of the Lorenz vector field

J = [-sigma, sigma, 0;
     rho - x(3), -1, -x(1);
     x(2), x(1), -beta];

end
