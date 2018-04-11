x = linspace(-1,1,200);
f = sin(20*x)./(100*x.^2 + 5);
f_ruis = f + 0.04*randn(size(x));
k = 3;
j = 200;

N = zeros(j,1);
M = zeros(j,1);
for i = 2:j
   h = 2/(i-1);
   t = -1:h:1;
   t = FormKnots(t,k);
   z = kkb_spline(t,x,f_ruis',x,k);
   N(i) = norm(f'-z);
   M(i) = norm(f_ruis'-z);
end

t = 1:j;

figure()
plot(t,N,t,M)



