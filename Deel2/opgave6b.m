x = linspace(-2,2);
t1 = [-2 -1.5 -1 -0.5 0 0.5 1 1.5 2];
k = 3;
t1 = FormKnots(t1,3);
a = @(x) (exp((-x.^2)/(2*(0.5)^2)))/(sqrt(2*pi*(0.5)^2));
f = a(x)';
z1 = kkb_spline(t1,x,f,x,k);
residu1 = f-z1;
figure(1)
plot(x,residu1)


t2 = [-2 -0.75 -0.5 -0.25 0 0.25 0.5 0.75 2];
k = 3;
t2 = FormKnots(t2,3);
z2 = kkb_spline(t2,x,f,x,k);
residu2 = f-z2;
figure(2)
plot(x,residu2)