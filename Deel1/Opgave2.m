n = [8,16,32,64,128,256,512,1024];

E = zeros(1,length(n));

for i = 1:length(n);
    E(i) = MaxError(n(i));
end
E
