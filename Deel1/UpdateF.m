function F = UpdateF(F,noord, oost, zuid, west)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

F(1,:) = F(1,:)-west(2:end-1);
F(end,:) = F(end, :) - oost(2:end-1);
F(:,1) = F(:,1) - zuid(2:end-1)';
F(:,end) = F(:,end) - noord(2:end-1)';

end

