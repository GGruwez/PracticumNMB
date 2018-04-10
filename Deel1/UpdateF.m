function F = UpdateF(F,noord, oost, zuid, west)
% Update F, rekening houdend met de randvoorwaarden

F(1,:) = F(1,:)-west(2:end-1);
F(end,:) = F(end, :) - oost(2:end-1);
F(:,1) = F(:,1) - zuid(2:end-1)';
F(:,end) = F(:,end) - noord(2:end-1)';

end

