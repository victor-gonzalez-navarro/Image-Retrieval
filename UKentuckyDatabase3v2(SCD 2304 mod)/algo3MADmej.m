function algo3MADmej(TSCDv2)

fileInput = fopen('input.txt', 'r');
fileOutput = fopen('output.txt', 'w');
numimagesinputtxt = 20;
nom = 'ukbench';
extensio = '.jpg';
guardat1 = zeros(10,1);
guardat2 = zeros(10,1);
guardat3 = zeros(10,1);
guardat4 = zeros(10,1);
guardat5 = zeros(10,1);
guardat6 = zeros(10,1);
guardat7 = zeros(10,1);
guardat8 = zeros(10,1);


for j=1:numimagesinputtxt
        j
        A = fscanf(fileInput,'%c',16);
        numimagen = str2num(A(8:12));

        %h = SCD(imread(A));


        for i=1:2000
            M1 = algo2versio1(TSCDv2(i,:), TSCDv2((numimagen+1),:), 2304);
            distance1(i) = M1;
            
            M2 = algo2versio2(TSCDv2(i,:), TSCDv2((numimagen+1),:), 2304);
            distance2(i) = M2;
            
            M3 = algo2versio3(TSCDv2(i,:), TSCDv2((numimagen+1),:), 2304);
            distance3(i) = M3;
            
            M4 = algo2versio4(TSCDv2(i,:), TSCDv2((numimagen+1),:), 2304);
            distance4(i) = M4;
        end
        
        [value, index1] = sort(distance1);
        [value, index2] = sort(distance2);
        [value, index3] = sort(distance3);
        [value, index4] = sort(distance4);
        
        llistat1(1:10) = index1(1:10);  
        llistat2(1:10) = index2(1:10); 
        llistat3(1:10) = index3(1:10);  
        llistat4(1:10) = index4(1:10); 
        
        fprintf(fileOutput,'Retrieved list for query image ');
        fprintf(fileOutput,'%c', A);
        fprintf(fileOutput,'\n');
        

        %numimagen = str2num(A(8:12));
        A = fscanf(fileInput,'%c',1); 
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
        [precisionvectorM1, aciertosM1] = precisionvectorfun(numimagen, (llistat1-1));
        recallvectorM1 = aciertosM1./4;
        
        [precisionvectorM2, aciertosM2] = precisionvectorfun(numimagen, (llistat2-1));
        recallvectorM2 = aciertosM2./4;
        
        [precisionvectorM3, aciertosM3] = precisionvectorfun(numimagen, (llistat3-1));
        recallvectorM3 = aciertosM3./4;
        
        [precisionvectorM4, aciertosM4] = precisionvectorfun(numimagen, (llistat4-1));
        recallvectorM4 = aciertosM4./4;
        
        %Graphic for Precision/Recall
        guardat1 = (guardat1 + precisionvectorM1);
        guardat2 = (guardat2 + recallvectorM1); 
        
        guardat3 = (guardat3 + precisionvectorM2);
        guardat4 = (guardat4 + recallvectorM2); 
        
        guardat5 = (guardat5 + precisionvectorM3);
        guardat6 = (guardat6 + recallvectorM3); 
        
        guardat7 = (guardat7 + precisionvectorM4);
        guardat8 = (guardat8 + recallvectorM4); 
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
end

        guardat1 = guardat1/numimagesinputtxt;
        guardat2 = guardat2/numimagesinputtxt;
        guardat3 = guardat3/numimagesinputtxt;
        guardat4 = guardat4/numimagesinputtxt;
        guardat5 = guardat5/numimagesinputtxt;
        guardat6 = guardat6/numimagesinputtxt;
        guardat7 = guardat7/numimagesinputtxt;
        guardat8 = guardat8/numimagesinputtxt;
        
        limits = [0 1 0 1];
        figure(5000), plot(guardat2, guardat1, 'r-*', guardat4, guardat3, 'y-*', guardat6, guardat5, 'm-*', guardat8, guardat7, 'b-*'), xlabel('Recall'), ylabel('Precision'), title('Precision/Recall 2000 images'),
        grid on, axis equal, axis(limits); 
       

fclose(fileInput);
fclose(fileOutput);

end