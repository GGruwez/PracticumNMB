function [ s ] = DeBoor(j, x, t, c, k)
%DEBOOR 
%  t: de knooppunten
%  c: de spline-coefficienten
%  x: de abscis waarin we het DB algoritme uitvoeren
%  k: de graad van de spline
%  j: het interval waarin x ligt

 for r = 1:k+1
    for l = k:-1:r-1
        i = j-4+l;
        alpha = (x - t(l+j-k)) / (t(l+1+j-r) - t(l+j-k))
        c(l) = alpha * c(l) + (1-alpha) * c(l-1);
    end
 end

 s = c(k);
 

end
