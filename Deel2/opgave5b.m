%kubisch
x = linspace(0,1,30); %in elk interval moet een x liggen
t = [-0.3 -0.2 -0.1 0 0.1 0.3 0.5 0.8 1 1.1 1.2 1.3]; %n=5
k=3;
z = zeros(k+n, length(x));
n = 5;
for i = 1:k+n
    c = zeros(k+n,1);
    c(i) = 1;
    z(i,1:length(x)) = DeBoor(x,t,c,k);
end
plot(x,z)
