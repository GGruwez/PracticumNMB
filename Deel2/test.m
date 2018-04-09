x = linspace(0,2,10);
t = [0 1 2];
a = @(x)x;
f = a(x)';
t = FormKnots(t,3);
y = x;
z = DeBoor(y, t, c, 3)



  