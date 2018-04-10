function e = MaxError(N)

% Exacte oplossing V
h = 1/(N+1);
x = 0:h:1;
y = 0:h:1;
[X,Y] = meshgrid(x,y);
size(X);
V = exp(X+Y);

% Benadering
U = PDE(N);

E = ones(N, N);
for i = 1:N
    for j = 1:N
        E(i,j) = abs(U(i,j)-V(i+1,j+1));
    end
end

e = max(max(E));
