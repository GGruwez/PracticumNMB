x = linspace(0,2,8);
t = [0 1 2 3]; %n=3
a = @(x)exp(x);
f = a(x)';
k = 3;
t = FormKnots(t,3); %voeg k knots toe aan elke kant
y = linspace(0,2,8);
z = kkb_spline( t, x, f, y, k );
residu = f-z;


figure
subplot(2,2,1) 
plot(x,z)
title('KKB')

subplot(2,2,2)
plot(x,f)
title('Original')

subplot(2,2,3)
plot(x,residu)
title('Residu')