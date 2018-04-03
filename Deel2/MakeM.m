function [ M ] = MakeM( t, x, k )
% Stel de matrix M op met daarin n+k B-spline functies geevalueerd in de
% abscissen  x.
% t = knooppunten, moet groter zijn dan 2k + r + 1
% x = abscissen
% k = graad

  orde = k+1;
  n_plus_k = length(t) - k;
  r = length(x);      
        
  % Return kolomvector J met voor elke J(i) het interval waarin x_i
  % zich bevindt.
  J = zeros(r, 1);
  for i = 1:r
    for j = 1:length(t)
        if x(i) >= t(j)
            J(i) = j;
        else
            break;
        end
     end
  end
  
  % Initialiseer M met Nj,1(x) = 1
  % Dimensies van M: (r x (n+k))
  M = zeros(r, n_plus_k);
  for i = 1:length(J)
    M(i,J(i)) = 1;
  end
  
 % Pas voor iedere x de efficiënte evaluatie van de B-splines toe
 % Gebaseerd op recursiebetrekking p120
 
 %voor elke x
 for i = 1:r
    for k = 1:orde-1
        %itereer door de driehoek van boven naar onder
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
        