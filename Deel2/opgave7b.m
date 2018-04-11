x = linspace(-1,1,200);
f = sin(20*x)./(100*x.^2 + 5);
f_ruis = f + 0.04*randn(size(x));
k = 3;

%16 knooppunten --> ideaal voor f norm
h = 2/15;
t = -1:h:1;
t = FormKnots(t,k);
z = kkb_spline(t,x,f_ruis',x,k);

%200 knooppunten --> ideaal foor f_ruis norm
h2 = 2/199;
t2 = -1:h:1;
t2 = FormKnots(t2,k);
z2 = kkb_spline(t2,x,f_ruis',x,k);

figure(1)
plot(x,z,x,f)

figure(2)
plot(x,z2,x,f)