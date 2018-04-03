x = 1:1:10;
length(x)
k = 3;
t = 1:1:10 % minstens (n+2k+1) knooppunten nodig!
orde = k+1;
nplusk = length(t) - k;



J = zeros(length(x), 1);

for i = 1:length(x)
    for j = (k+1):length(t)-k
        if x(i) >= t(j)
            J(i) = j;
        else
            break;
        end
    end
end
J