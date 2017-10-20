function [IR,IG,IB] = algo1MAD(bins)
%bins normalmente 256
imagefiles = dir('*.jpg'); 
nfiles = length(imagefiles);
IR = zeros(nfiles,bins);
IG = zeros(nfiles,bins);
IB = zeros(nfiles,bins);

for i=1:nfiles
    i
    var = imread(imagefiles(i).name);
    hr = imhist(var(:,:,1), bins);
    hg = imhist(var(:,:,2), bins);
    hb = imhist(var(:,:,3), bins);
    IR(i,:)= hr;
    IG(i,:)= hg;
    IB(i,:)= hb;
end

end