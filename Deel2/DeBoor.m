function [ s ] = DeBoor(y, t, c, k)
%DEBOOR Evalueer de splinefunctie in de gegeven y-abscissen. Het de Boor
%algoritme zoals op pagina 123 in ons handboek is een efficiënt en stabiel
%algoritme.
%  t: de knooppunten
%  c: de n+k spline-coefficienten uit de kkb
%  y: de abscis waarin we de splines evalueren
%  k: de graad van de spline

    s = zeros(length(y),1);
    
    %evaluate every y(i)
    for i = 1:length(y)
        %find which interval n+k y(i) is located in
        for j = k+1:length(t)
            if ((t(j) <= y(i) && t(j+1) > y(i)) || ... 
                (t(j) < y(i) && t(j+1) >= y(i)))
                break
            end
        end
        
        %d bevat de 0e graad coëfficiënten, van hieruit vertrekken we met
        %het algoritme zoals te zien is op pagina 125 in het handboek
        d = c;
        dnew = zeros(length(d),1);
        
        %driehoek opstellen
        for r = 1:k
            for l = (j-k+r):j
                alpha = (y(i) - t(l))/(t(l+k+1-r)-t(l));
                dnew(l) = alpha*d(l) + (1-alpha)*d(l-1);
            end
            d = dnew;
        end
        s(i) = d(j);
    end
end
  


