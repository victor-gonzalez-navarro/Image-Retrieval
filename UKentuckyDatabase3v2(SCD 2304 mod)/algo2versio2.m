function [M2] = algo2versio2(histim,historig,bins)
%yellow MAD
suma = 0;

for i=1:bins
    suma = suma + abs(histim(i)-historig(i));
    
end
M2 = suma; 

end
