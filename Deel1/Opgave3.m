N=64;
h = 1/(N+1);
x = h:h:1-h;
y = h:h:1-h;
[X,Y] = meshgrid(x,y);
U = PDE(N);
%surf(X,Y,U);
contour(X,Y,U);
