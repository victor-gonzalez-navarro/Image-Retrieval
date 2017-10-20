function [MAD] = algo2MAD(histim,historig, bins)
%color blau
suma = 0;

for i=1:bins
    suma = suma + abs(histim(i)^0.5-historig(i)^0.5);
    %suma = suma + abs(histim(i)-historig(i));

end

MAD = suma/bins; 

end
