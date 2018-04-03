function [ z ] = DeBoor( t, c, y, k )
%DEBOOR Evalueer een splinefunctie met genormaliseerde B spline -
%coefficienten in c, in elke y. Het algoritme van De Boor maakt gebruik van
%de recursieformule op p123.
%  t: de knooppunten
%  c: de spline-coefficienten
%  y: de opgegeven abscissen
%  

    function [ zed ] = db( t, d, x, j, k)
        % Deze functie stelt stap voor stap de driehoekige tabel op, hierbij
        % worden de nieuwe c's (hier d genoemd) over de oude geschreven, zo
        % is er maar een vector nodig van lengte k+1.
        % Omdat we waarden overschrijven moeten we erop letten dat enkel
        % waarden die niet meer gebruikt moeten worden overschreven worden.
        % (Daarom telte l van k+1 naar r+1)
        for r = 1:k
            for l = k+1:-1:r+1
                i = j-4+l;
                alpha = (x - t(i)) / (t(i+k+1-r) - t(i));
                d(l) = alpha * d(l) + (1-alpha) * d(l-1);
            end
        end
        
        zed = d(4);
    end

    % In deze lussen wordt voor elke y-waarde het interval bepaald waarbinnen ze ligt
    % en dan wordt db(t, d, x, j, k) opgeroepen om de bijhorende functiewaarde te vinden.
    z = zeros(size(y,1), size(c,2));
    for w = 1:size(c,2)
        for n = 1:size(y,1)
            for j = 4:length(t)-4
                if y(n) < t(j+1) || (y(n) == t(j+1) && j+1 == length(t)-3)
                    z(n,w) = db(t, c(j-3:j,w), y(n), j, 3);
                    break; 
                end
            end
        end
    end
end
