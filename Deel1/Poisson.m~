function [U] = Poisson(N)
%POISSON Summary of this function goes here
%   Detailed explanation goes here


% Initialiseer
h = 1/(N+1);
x = 0:h:1;
y = 0:h:1;
[X,Y] = meshgrid(x,y);
size(X);
f = DefineFunc(X,Y);

% Evalueer F
[m,n] = size(X);
F = FormF(f,h,m,n);

% Update F
[noord, oost, zuid, west] = DefineBoundary(x,y);
F = UpdateF(F, noord, oost, zuid, west);

%Calculate F_
F_ = dst(F);

%Calculate U_
[m,n] = size(F_);
U_ = CalcU_(F_,m,n,h);

%Calculate U
U = idst(U_);

end

