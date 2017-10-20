function [imaquant] = quantizationHMMD(ima)

[hsd] = rgb2hmmd(ima);
%ima (:,:,1) = hue;
%ima (:,:,2) = summ;
%ima (:,:,3) = diff;

imaquant = hsd;

for i=1:480
    for j=1:640

        if (hsd(i,j,3)>=0 && hsd(i,j,3)<3)
            imaquant(i,j,1) = 0;
            imaquant(i,j,2) = round((hsd(i,j,2)/255)*(16-1));
            imaquant(i,j,3) = round((hsd(i,j,3)/255)*(9-1));
            
        elseif (hsd(i,j,3)>=3 && hsd(i,j,3)<6)
            imaquant(i,j,1) = round(hsd(i,j,1)*(4-1));
            imaquant(i,j,2) = round((hsd(i,j,2)/255)*(8-1));
            imaquant(i,j,3) = round((hsd(i,j,3)/255)*(9-1));
   
        
        elseif (hsd(i,j,3)>=6 && hsd(i,j,3)<10)
            imaquant(i,j,1) = round(hsd(i,j,1)*(4-1));
            imaquant(i,j,2) = round((hsd(i,j,2)/255)*(8-1));
            imaquant(i,j,3) = round((hsd(i,j,3)/255)*(9-1));

        elseif (hsd(i,j,3)>=10 && hsd(i,j,3)<20)
            imaquant(i,j,1) = round(hsd(i,j,1)*(4-1));
            imaquant(i,j,2) = round((hsd(i,j,2)/255)*(8-1));
            imaquant(i,j,3) = round((hsd(i,j,3)/255)*(9-1));
 
        elseif (hsd(i,j,3)>=20 && hsd(i,j,3)<40)
            imaquant(i,j,1) = round(hsd(i,j,1)*(8-1));
            imaquant(i,j,2) = round((hsd(i,j,2)/255)*(8-1));
            imaquant(i,j,3) = round((hsd(i,j,3)/255)*(9-1));
        
        elseif (hsd(i,j,3)>=40 && hsd(i,j,3)<80)
            imaquant(i,j,1) = round(hsd(i,j,1)*(8-1));
            imaquant(i,j,2) = round((hsd(i,j,2)/255)*(4-1));
            imaquant(i,j,3) = round((hsd(i,j,3)/255)*(9-1));

        elseif (hsd(i,j,3)>=80 && hsd(i,j,3)<110)
            imaquant(i,j,1) = round(hsd(i,j,1)*(8-1));
            imaquant(i,j,2) = round((hsd(i,j,2)/255)*(4-1));
            imaquant(i,j,3) = round((hsd(i,j,3)/255)*(9-1));
            
        elseif (hsd(i,j,3)>=110 && hsd(i,j,3)<=170)
            imaquant(i,j,1) = round(hsd(i,j,1)*(16-1));
            imaquant(i,j,2) = round((hsd(i,j,2)/255)*(4-1));
            imaquant(i,j,3) = round((hsd(i,j,3)/255)*(9-1));
            
        elseif (hsd(i,j,3)>=170 && hsd(i,j,3)<=255)
            imaquant(i,j,1) = round(hsd(i,j,1)*(16-1));
            imaquant(i,j,2) = round((hsd(i,j,2)/255)*(4-1));
            imaquant(i,j,3) = round((hsd(i,j,3)/255)*(9-1));

        end
    end
end   
 