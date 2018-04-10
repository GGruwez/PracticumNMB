x = linspace(-1,1,200);
a = @(x) sin(20*x)/(100*x.^2 + 5);
f = a(x)';
f_ruis = f + 0.04*randn(size(x));