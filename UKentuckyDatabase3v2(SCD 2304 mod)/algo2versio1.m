function [M1] = algo2versio1(histim,historig,bins)
%red mse
suma = 0;

for i=1:bins
    suma = suma + (histim(i)-historig(i))^2;
    
end
M1 = suma; 

end
