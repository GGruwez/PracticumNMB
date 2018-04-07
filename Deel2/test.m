x = linspace(0,2,8);
t = [0 1 2];
a = @(x)x;
f = a(x)';
t = FormKnots(t,3);
y = x;
M = MakeM(t,x,3)
M(:,end) = []
c = M\f
z = DeBoor(y, t, c, 3)



  