function [ noord, oost, zuid, west ] = DefineBoundary(x,y)
%Defines four boundary functions - Dirichlet conditions.
%   Noord is the upper boundary of the square, oost the right, zuid the bottom and west the left boundary.
%   noord(x) - oost(y) - zuid(x) - west(y)

noord = x;
oost = y;
zuid = y;
west = x;

end

