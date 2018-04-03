function [U_] = CalcU_(F_,m,n,h)
%CALCU_ Summary of this function goes here
%   Detailed explanation goes here

U_ = ones(m,n);
for k = 1:m
    for l = 1:n
        U_(k,l) = F_(k,l)/(2*(cos(pi*k*h) + cos(pi*l*h)-2));
    end
end

