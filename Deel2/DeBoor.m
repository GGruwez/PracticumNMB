function [ s ] = DeBoor(y, t, c, k)
%DEBOOR 
%  t: de knooppunten
%  c: de spline-coefficienten
%  y: de abscis waarin we de splines evalueren
%  k: de graad van de spline

    s = zeros(length(y),1);
    
    %evaluate every y(i)
    for i = 1:length(y)
        %find which interval n y(i) is located in
        for j = k+1:length(t)
            if(t(j) <= y(i) && t(j+1) > y(i))
                break
            elseif(t(j) < y(i) && t(j+1) >= y(i))
                break
            end
        end
        
        %schrijf de oorpsronkelijke c's over
        d = c;
        dnew = zeros(length(d),1);
        
        %de boor triangle
        for m = 1:k
            for n = (j-k+m):j
                alpha = (y(i) - t(n))/(t(n+k+1-m)-t(n));
                dnew(n) = alpha*d(n) + (1-alpha)*d(n-1);
            end
            d = dnew;
        end
        s(i) = d(j);
    end
end
  


