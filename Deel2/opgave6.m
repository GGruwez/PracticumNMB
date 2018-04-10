x = linspace(0,2*pi,20);
t = [0 pi/2 pi 3*pi/2 2*pi]; %n=4
a = @(x)sin(x);
f = a(x)';
k = 3;
t = FormKnots(t,3); %voeg k knots toe aan elke kant
y = x;
z1 = kkb_spline( t, x, f, y, k );
residu1 = f-z1;

x = linspace(0,2*pi,20);
t = [0 pi/8 2*pi/8 14*pi/8 15*pi/8 2*pi]; %n=4
a = @(x)sin(x);
f = a(x)';
k = 3;
t = FormKnots(t,3); %voeg k knots toe aan elke kant
y = x;
z2 = kkb_spline( t, x, f, y, k );
residu2 = f-z2;


figure(1)
plot(x,residu1)

figure(2)
plot(x,residu2)


