k = 3
t = [0 1 2]



voorstap = t(2)-t(1);
a = t(1)-k*voorstap:voorstap:t(1)-voorstap
eindstap = t(end) - t(end-1);
b = (t(end)+voorstap):eindstap:t(end)+(k)*voorstap
t = [a t b]