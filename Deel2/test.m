x = linspace(0,2,6)
t = [-3 -2 -1 0 1 2 3 4 5 ]
a = @(x)x
f = a(x)'
kkb_spline(t,x,f)

  