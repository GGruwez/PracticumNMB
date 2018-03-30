function F = FormF(f,h,m,n)
%Returns the F matrix. 
%   F(i,j) = f(i,j)*h^2

F = ones(m);

for i = 1:m
    for j = 1:n
        F(i,j) = f(i,j)*h^2;
    end
end

