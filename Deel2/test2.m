x = linspace(-1,1,200);
f = sin(20*x)./(100*x.^2 + 5);
size(f)
%f_ruis = f + 0.04*randn(size(x));
%k = 3;