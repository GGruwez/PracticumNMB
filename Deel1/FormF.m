function F = FormF(f,h,m,n)
%Returns the F matrix. 
%   F(i,j) = f(i,j)*h^2

F = ones(m-2, n-2);

for i = 1:m-2
    for j = 1:n-2
        F(i,j) = f(i,j)*h^2;
    end
end

