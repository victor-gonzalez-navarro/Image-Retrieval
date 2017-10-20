function [M3] = algo2versio3(histim,historig,bins)
%magenta el del lab que ganamos
suma = 0;

for i=1:bins
    suma = suma + (histim(i)-historig(i))^0.5;
    
end
M3 = suma; 

end
