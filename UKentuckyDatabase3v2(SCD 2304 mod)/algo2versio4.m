function [M4] = algo2versio4(histim,historig,bins)
%blue pensado por mi
suma = 0;

for i=1:bins
    suma = suma + abs(histim(i)^0.5-historig(i)^0.5);
    
end
M4 = suma; 

end
