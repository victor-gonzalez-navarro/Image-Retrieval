function [I] = algo1MAD(bins)
%bins normalmente 256
imagefiles = dir('*.jpg'); 
nfiles = length(imagefiles);
I = zeros(nfiles,bins);

for i=1:nfiles
    i
    h = imhist(rgb2gray(imread(imagefiles(i).name)), bins);
    I(i,:)= h;
end

end