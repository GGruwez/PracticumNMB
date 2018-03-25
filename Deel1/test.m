
N = 10;
h = 1/(N+1);
x = 0:h:1;
y = 0:h:1;
[X,Y] = meshgrid(x,y);
f = DefineFunc(X,Y);
F = FormF(f,h);
[noord, oost, zuid, west] = DefineBoundary(x,y)
F = UpdateF(F,noord,oost,zuid,west)



%newF = UpdateF(F,DefineBoundary(x,y))