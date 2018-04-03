function [ z ] = kkb_spline( t, x, f, y, k )
%KKB_SPLINE Bereken coefficienten voor een B-spline
%kleinstekwadratenbenadering van f. Evalueer deze daarna ook via het
%algoritme van De Boor. 
%
%
%   t = knooppuntenrij van lengte N voor de B-splines
%   x = r abscissen waarin f geevalueerd is (x elem. van [t(1), t(end)])
%   f = matrix van functiewaarden in de r abscissen van de functies
%   y = vector van lengte N die de punten bevat waarin we de splinefunctie
%   willen evalueren
%   k = de graad van de splinefunctie (orde = k+1)
%   [z] = vector met lengte N met de functiewaarden van de splinebenadering
%   in de punten y


    %Stel M op.
    %Er dient minstens één meetpunt (x) te liggen in het
    %basisgebied van elke B-spline. 
    M = MakeM(t, x, k);
    
    % Los c op uit f = Mc
    % c bevat de n+k coefficienten horend bij elke B spline die de
    % vectorruimte van s(x) vormen
    c = M\f;
    
    %Evalueer via DeBoor
    z = DeBoor( t, c, y, k );

end