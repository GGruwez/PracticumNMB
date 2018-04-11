x = linspace(0,2*pi,20);
t1 = [0 pi/2 pi 3*pi/2 2*pi]; %n=4
a = @(x)sin(x);
f = a(x)';
k = 3;
t1 = FormKnots(t1,3); %voeg k knots toe aan elke kant
y = x;
z1 = kkb_spline( t1, x, f, y, k );
residu1 = f-z1;

x = linspace(0,2*pi,20);
t2 = [0 pi/8 pi 15*pi/8 2*pi]; %n=4
a = @(x)sin(x);
f = a(x)';
k = 3;
t2 = FormKnots(t2,3); %voeg k knots toe aan elke kant
y = x;
z2 = kkb_spline( t2, x, f, y, k );
residu2 = f-z2;


figure(1)
plot(x,residu1)


figure(2)
plot(x,residu2)

figure(3)
plot(x,f)


