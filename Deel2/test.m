
x = linspace(0,1,10)
t = linspace(0,1,5)
a = @(x) cos(x);
f = a(x);
k = 3;
r = length(x);
J = zeros(r, 1);
n_plus_k = length(t) + k;
orde = k+1;

for i = 1:r
  for j = 1:length(t)
      if x(i) >= t(j)
          J(i) = j;
      else
          break;
      end
   end
end

M = zeros(r, n_plus_k);
for i = 1:length(J)
  M(i,J(i)) = 1;
end

%algoritme enkel voor x1
%for k = 1:orde

for i = 1:r
    for k = 1:orde
        
    

%voor elke rij
for i = 1:r
    i
   for k = 1:orde
       k
       for l = 1:k
           l
            M(i,J(i)+l-k) = ...
            (x(i) - t(J(i)+l-k)) / (t(J(i)+l) - t(J(i)+l-k))...
                * M(i,J(i)+l-k) ...
            + (t(J(i)+l+1) - x(i)) / (t(J(i)+l+1) - t(J(i)+l-k+1))...
                * M(i,J(i)+l-k+1);
        end
   end
end

M

  