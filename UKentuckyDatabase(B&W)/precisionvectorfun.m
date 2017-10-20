function [precisionvector, aciertos] = precisionvectorfun(numimagen, vector)          

        aciertos = zeros(10, 1);
        numero = zeros(10, 1);

        primeravez = true;
        for i=1:10
            numero(i)=i;
  
            if (floor(numimagen/4) == floor(vector(i)/4))
                if (primeravez)
                   aciertos(i) = 1;
                   primeravez = false;
                else
                    aciertos(i) = (aciertos(i-1) + 1);
                end
            elseif (primeravez)
                   aciertos(i) = 0;
            else    
                aciertos(i) = aciertos(i-1);
            end
        end
        
        precisionvector = aciertos./numero;
end