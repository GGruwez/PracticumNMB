function [ noord, oost, zuid, west ] = DefineBoundary(x,y)
%Defines four boundary functions - Dirichlet conditions.
%   Noord is the upper boundary of the square, oost the right, zuid the bottom and west the left boundary.
%   noord(x) - oost(y) - zuid(x) - west(y)


% Randvoorwaarden: set 1
%noord = 1 + 0*x;
%oost = 1 + 0*x;
%zuid = 1 + 0*x;
%west = 1 + 0*x;

% Randvoorwaarden: set 2
%noord = 1 + 1*x + 1*1;
%oost = 1 + 1*1 + 1*y;
%zuid = 1 + 1*x + 1*0;
%west = 1 + 1*0 + 1*y;

% Randvoorwaarden: set 3
noord = 1 + 1*x.^2 + 1*1;
oost = 1 + 1*1 + 1*y.^2;
zuid = 1 + 1*x.^2 + 1*0;
west = 1 + 1*0 + 1*y.^2;

end

