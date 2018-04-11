function [ z ] = kkb_spline( t, x, f, y, k )
%KKB_SPLINE Bereken coefficienten voor een B-spline
%kleinstekwadratenbenadering van f. Evalueer deze daarna ook via het
%algoritme van De Boor. 
%   t = knooppuntenrij
%   x = r abscissen waarin de Bsplines geevalueerd zijn. x(i) moet tussen
%   de knooppunten liggen
%   f = matrix van functiewaarden in de r abscissen van de functies
%   y = vector van lengte N die de punten bevat waarin we de splinefunctie
%   willen evalueren
%   k = de graad van de Bsplines (orde = k+1)
%   z = vector met lengte N met de functiewaarden van de splinebenadering
%   in de punten y
    
    
    %Stel M op.
    M = MakeM(t, x, k);
    
    % Los c op uit het overgedetermineerd stelsel (kkb). C bevat de
    % coëfficiënten van de splinefunctie.
    c = M\f;
    
    %Evalueer de splinefunctie in de gegeven y punten.
    z = DeBoor(y, t, c, k);
    
    
    
    
    

end