function [ z ] = kkb_spline( t, x, f, y, k )
%KKB_SPLINE Bereken coefficienten voor een B-spline
%kleinstekwadratenbenadering van f. Evalueer deze daarna ook via het
%algoritme van De Boor.
%   t = knooppuntenrij van lengte n voor de B-splines
%   x = r abscissen waarin f geevalueerd is (x elem. van [t(1), t(end)])
%   f = matrix van functiewaarden in de r abscissen van de functies
%   y = vector van lengte N die de punten bevat waarin we de splinefunctie
%   willen evalueren
%   k = de graad van de splinefunctie (orde = k+1)
%   [z] = vector met lengte N met de functiewaarden van de splinebenadering
%   in de punten y


    function [ M ] = bsplines( t, x, k )
        % Stel de matrix M op met daarin n+k B-spline functies geevalueerd in de
        % abscissen  x.
        orde = k+1;
        nplusk = length(t) - k;
        
        % Return kolomvector J met voor elke J(i) het interval waarin x_i
        % zich bevindt.
        J = zeros(length(x), 1);
        for i = 1:length(x)
            %we hebben 2k knooppunten erbij gezet!
            for j = orde:length(t)-orde
               if x(i) >= t(j)
                   J(i) = j;
               else
                   break;
               end
            end
        end
        
        % Initialiseer M met Nj,1(x) = 1
        % Dimensies van M: (r x (n+k))
        M = zeros(length(x), nplusk);
        for i = 1:length(J)
            M(i,J(i)) = 1;
        end
       
        % Pas voor iedere x de 'efficiente evaluatie' van de B-splines toe.
        % Dit is gebaseerd op de recursie-betrekking voor B-splines,
        % het stelt ongeveer het omgekeerde op van de driehoekige tabel van de Boor.
        for i = 1:length(x)
            for k = 1:orde-1
                for l = 0:k
                    M(i,J(i)+l-k) = ...
                        (x(i) - t(J(i)+l-k)) / (t(J(i)+l) - t(J(i)+l-k))...
                            * M(i,J(i)+l-k) ...
                        + (t(J(i)+l+1) - x(i)) / (t(J(i)+l+1) - t(J(i)+l-k+1))...
                            * M(i,J(i)+l-k+1);
                end
            end
        end
    end

    M = bsplines(t, x, k);
    % Los c op uit: f = Mc
    c = M\f;
    
    %Evalueer via DeBoor
    z = DeBoor( t, c, y, k );

end