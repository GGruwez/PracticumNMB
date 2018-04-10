function f = DefineFunc(x,y)
%Defines the f(x,y) function in the right part of the Poisson equation.
%   If f = constant --> ie: f=0*x+0*y

% OPGAVE 1

% Functie voor randvoorwaarden set 1 & 2
%f = 0*x + 0*y;

% Functie voor randvoorwaarden set 3
%f = 4 + 0*x + 0*y;

% OPGAVE 2
%f = 2*exp(x+y);

% OPGAVE 3
if x >= 0.4 & x <= 0.6 & y >= 0.4 & y <= 0.6
    f = 0*x + 0*y - 100;
else
    f = 0*x + 0*y;
end

end

