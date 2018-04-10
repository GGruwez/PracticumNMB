x = linspace(0,2,8);
t = [0 1 2 3]; %n=3
a = @(x)exp(x);
f = a(x)';
k = 3;
t = FormKnots(t,3); %voeg k knots toe aan elke kant
y = linspace(0,2,8);
z = kkb_spline( t, x, f, y, k );
residu = f-z;



plot(x,z)

%plot(x,f)
%plot(x,residu)
