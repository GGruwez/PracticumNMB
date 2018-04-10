x = linspace(0,1,20); %r = 20
knots = [0 0.25 0.5 0.75 1]; %n=4
t = FormKnots(knots,3);
k = 3;
n = 4;
y = zeros(1, length(x));
c = zeros(k+n,1);
c(1) = 1;
y(1,1:length(x)) = DeBoor(x,t,c,k);
plot(x,y);