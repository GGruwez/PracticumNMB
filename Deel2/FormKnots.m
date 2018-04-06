function [ t ] = FormKnots(t, k)
%FORMKNOTS Voeg 2k equidistante knopen toe aan beide uiteinden.
%   x = De abscissen waar we onze spline willen evalueren.
%   k = De graad van onze Bsplines.
%   t = De oorspronkelijke knopen

voorstap = t(2)-t(1);
a = t(1)-k*voorstap:voorstap:t(1)-voorstap;
eindstap = t(end) - t(end-1);
b = (t(end)+voorstap):eindstap:t(end)+(k)*voorstap;

t = [a t b];



end

