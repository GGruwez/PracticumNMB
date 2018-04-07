function [ s ] = DeBoor(y, t, c, k)
%DEBOOR 
%  t: de knooppunten
%  c: de spline-coefficienten
%  y: de abscis waarin we de splines evalueren
%  k: de graad van de spline

    s = zeros(length(y),1);
    for i = 1:length(y)
        j = FindInterval(y(i),t,k);
        d = c;
        dnew = zeros(length(d),1);
        for m = 1:k
            for n = j-k+m:j
                alpha = (y(i) - t(n))/(t(n+k+1-m)-t(n));
                dnew(n) = alpha*d(n) + (1-alpha)*d(n-1);
            end
            d = dnew;
        end
        s(i) = d(j);
    end
end
  


