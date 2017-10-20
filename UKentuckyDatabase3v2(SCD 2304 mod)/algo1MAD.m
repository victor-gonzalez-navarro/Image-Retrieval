function [TSCD] = algo1MAD
%bins normalmente 256
imagefiles = dir('*.jpg'); 
nfiles = length(imagefiles);

for i=1:nfiles
    i
    var = imread(imagefiles(i).name);
    TSCD(i,:)= SCD(var);

end

end