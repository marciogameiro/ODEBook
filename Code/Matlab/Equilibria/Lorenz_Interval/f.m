function y = f(x, sigma, rho, beta)
% Lorenz vector field

y = [sigma * (x(2) - x(1));
     rho * x(1) - x(2) - x(1) * x(3);
     -beta * x(3) + x(1) * x(2)];

end
