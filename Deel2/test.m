x = 1:1:10;
r = length(x);
k = 3;
t = 0:1:20; % minstens (n+2k+1) knooppunten nodig!
length(t)
orde = k+1;
n_plus_k = length(t) - k;



J = zeros(length(x), 1);

for i = 1:length(x)
    for j = 1:length(t)
        if x(i) >= t(j)
            J(i) = j;
        else
            break;
        end
    end
end
J

M = zeros(r, n_plus_k);
for i = 1:length(J)
  M(i,J(i)) = 1;
end
M