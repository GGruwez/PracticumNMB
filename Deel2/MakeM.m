function [ M ] = MakeM( t, x, k )
% Stel de matrix M op met daarin n+k B-spline functies geevalueerd in de
% abscissen  x.
% t = knooppunten 
% x = abscissen waarin we onze Bsplines willen evalueren
% k = graad van de Bsplines
    
    r = length(x);
    orde = k+1; 
    npk1 = length(t) - k; 
        
    P = zeros(r, 1);
    M = zeros(r, npk1);
    %Form position matrix: P(i) is het interval(+k) waarin x(i) ligt.
    %Bsplines van graad 0 worden ook geinitialiseerd.
    for i = 1:r
        %We werken met een offset van k
        for j = orde:length(t)-orde
            if x(i) >= t(j)
                P(i) = j;
            else
                break;
            end
        end
        M(i,P(i)) = 1;
    end
    
    %Efficiënte evaluatie van Bsplines
    %Voor elke abscis stellen we de driehoek op, zoals meegegeven in de
    %opgave.
    for i = 1:r
        for k = 1:orde-1
            for j = 0:k
                M(i,P(i)+j-k) = ...
                    (x(i) - t(P(i)-k+j)) / (t(P(i)+j) - t(P(i)-k+j))...
                        * M(i,P(i)-k+j) ...
                    + (t(P(i)+j+1) - x(i)) / (t(P(i)+j+1) - t(P(i)-k+j+1))...
                        * M(i,P(i)-k+1+j);
            end
        end
    end
    
    M(:,end) = [];
end
        