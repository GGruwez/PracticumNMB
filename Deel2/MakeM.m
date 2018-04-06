function [ M ] = MakeM( t, x, k )
% Stel de matrix M op met daarin n+k B-spline functies geevalueerd in de
% abscissen  x.
% t = knooppunten, moet groter zijn dan 2k + r + 1
% x = abscissen
% k = graad

    r = length(x)
    orde = k+1; 
    npk = length(t) - k;
        
    % P(i) is het interval waarin x(i) ligt.
    P = zeros(r, 1);
    for i = 1:r
        for j = orde:length(t)-orde
            if x(i) >= t(j)
                P(i) = j;
            else
                break;
            end
        end
    end
        
    % Initialiseer M op de juiste plaatsen met Nj,1(x) = 1
    M = zeros(r, npk);
    for i = 1:length(P)
         M(i,P(i)) = 1;
    end
       
    %efficiënte evaluatie van Bsplines
    for i = 1:r
        for k = 1:orde-1
            for l = 0:k
                M(i,P(i)+l-k) = ...
                    (x(i) - t(P(i)+l-k)) / (t(P(i)+l) - t(P(i)+l-k))...
                        * M(i,P(i)+l-k) ...
                    + (t(P(i)+l+1) - x(i)) / (t(P(i)+l+1) - t(P(i)+l-k+1))...
                        * M(i,P(i)+l-k+1);
            end
        end
    end
 
    
 
end
        