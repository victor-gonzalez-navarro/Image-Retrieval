function [histSCD] = SCD(img)


%Cuantificacion de img
imaquant = quantizationHMMD(img);

%Creación de histograma con el método SCD
histSCD = zeros(2304,1); %2304 9*16*16
histver = zeros(2304,1);


m=1;
for count1=0:472 %480-8+1= 473 veces
    n=1;
    for count2=0:632 %640-8+1 = 633 veces
        Aux1 = imaquant(m:(m+7),n:(n+7),1);
        Aux2 = imaquant(m:(m+7),n:(n+7),2);  
        Aux3 = imaquant(m:(m+7),n:(n+7),3);  
        
            %%%%%%%%%%%%%%%%%%%%%
            for i=1:8
                for j=1:8
                    a = Aux1(i,j);
                    b = Aux2(i,j);
                    c = Aux3(i,j);
                    
                    num = a*16*9 + b*9 + c + 1;
                    
                    if histver(num)==0
                        histSCD(num) = histSCD(num) + 1;
                        histver(num) = 1;
                    end    
                    
                end
            end
            
            histver = zeros(2304,1);
            %%%%%%%%%%%%%%%%%%%%%
        n=n+1;
    end 
    m=m+1;   
end

end