function F = UpdateF(F,noord, oost, zuid, west)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

F(1,:) = F(1,:)-west;
F(end,:) = F(end, :) - oost;
F(:,1) = F(:,1) - zuid';
F(:,end) = F(:,end) - noord';

end

