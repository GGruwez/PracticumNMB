function [ M ] = MakeM( t, x, k )
% Stel de matrix M op met daarin n+k B-spline functies geevalueerd in de
% abscissen  x.
% t = knooppunten 
% x = abscissen waarin we onze Bsplines willen evalueren
% k = graad van de Bsplines
    
    r = length(x);
    orde = k+1; 
    npk1 = length(t) - k; 
    
        
    %Form position matrix: P(i) is het interval waarin x(i) ligt.
    % Bsplines van graad 0 worden geinitialiseerd. 
    P = zeros(r, 1);
    M = zeros(r, npk1);
    for i = 1:r
        %We werken met een offset van k zodat we het algoritme binnen de 
        %gevraagde dimensies van M kunnen uitvoeren
        for j = orde:length(t)-orde
            if x(i) >= t(j)
                P(i) = j;
            else
                break;
            end
            
        end
        M(i,P(i)) = 1;
    end
    P
    
    %efficiënte evaluatie van Bsplines
    %doorloop alle x'en waarin we Bsplines evalueren
    %gebaseerd op p120 eigenschap 3
    for i = 1:r
        %per rij stellen we nu de driehoekige tabel op zoals op pg 4 vd
        %opgave
        for k = 1:orde-1
            for l = 0:k
                %l
                %[i P(i)+l-k]
                M(i,P(i)+l-k) = ...
                    (x(i) - t(P(i)+l-k)) / (t(P(i)+l) - t(P(i)+l-k))...
                        * M(i,P(i)+l-k) ...
                    + (t(P(i)+l+1) - x(i)) / (t(P(i)+l+1) - t(P(i)+l-k+1))...
                        * M(i,P(i)+l-k+1);
                %M
            end
        end
    end
    
    %npk1-1 --> M = (r x (n+k))
    M(:,end) = []
    
 
end
        