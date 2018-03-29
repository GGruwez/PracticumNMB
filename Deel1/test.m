
N = 10;
h = 1/(N+1);
x = 0:h:1;
y = 0:h:1;
[X,Y] = meshgrid(x,y);
f = DefineFunc(X,Y);
F = FormF(f,h);
[noord, oost, zuid, west] = DefineBoundary(x,y);
F = UpdateF(F,noord,oost,zuid,west);
F_ = dst(F);
[m,n] = size(F);
U_ = CalcU_(F_,m,n,h);
U = idst(U_)


%newF = UpdateF(F,DefineBoundary(x,y))