function j = FindInterval(y,t,k)
%FINDINTERVAL Summary of this function goes here
%   Detailed explanation goes here
%   y moet tussen t(1) en t(end) liggen!

    for j = k+1:length(t)
       if(t(j) <= y && t(j+1) > y)
            break
       elseif(t(j) < y && t(j+1) >= y)
            break
       end
    end



end

