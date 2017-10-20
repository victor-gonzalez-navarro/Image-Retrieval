function algo3MAD(TSCDv2)

fileInput = fopen('input.txt', 'r');
fileOutput = fopen('outputt.txt', 'w');
numimagesinputtxt = 20;
nom = 'ukbench';
extensio = '.jpg';
guardat3 = zeros(10,1);
guardat4 = zeros(10,1);


for j=1:numimagesinputtxt
        j
        A = fscanf(fileInput,'%c',16);
        numimagen = str2num(A(8:12));

        %h = SCD(imread(A));

        for i=1:2000
            MAD = algo2MAD(TSCDv2(i,:), TSCDv2((numimagen+1),:), 2304);
            distance1(i) = MAD;
        end

        [value, index1] = sort(distance1);
        
        %fprintf('MAD\n');
        llistat1(1:10) = index1(1:10);     
        
        fprintf(fileOutput,'Retrieved list for query image ');
        fprintf(fileOutput,'%c', A);
        fprintf(fileOutput,'\n');
        
        figure(j);
        subplot(3,5,1), imshow(A);
        
        for k=1:10
           num = num2str(llistat1(k)-1, '%05i');
            
            imatge = strcat(nom,num,extensio);
            
            subplot(3,5,k+5), imshow(imatge);
            
            fprintf(fileOutput,'%c', imatge);
            fprintf(fileOutput,'\n');
        end

        %numimagen = str2num(A(8:12));
        A = fscanf(fileInput,'%c',1); 
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
        [precisionvectorMAD, aciertosMAD] = precisionvectorfun(numimagen, (llistat1-1));
        recallvectorMAD = aciertosMAD./4;
        
        %Graphic for Precision/Recall
        guardat3 = (guardat3 + precisionvectorMAD);
        guardat4 = (guardat4 + recallvectorMAD);  
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
end

        guardat3 = guardat3/numimagesinputtxt;
        guardat4 = guardat4/numimagesinputtxt;
        limits = [0 1 0 1];
        figure(51), plot(guardat4, guardat3, 'b-*'), xlabel('Recall'), ylabel('Precision'), title('Precision/Recall'),
        grid on, axis equal, axis(limits); 


fclose(fileInput);
fclose(fileOutput);

end