function [hsd] = rgb2hmmd(inputI)

% input : input RGB image
% output: hsd - output HMMD image with hue, sum and diff as the

I = rgb2hsv(inputI);
hue = I(:,:,1);% first plane of HMMD
Max = max(inputI,[],3);
Min = min(inputI,[],3);
summ = (Max+Min)/2;%second plane of HMMD
diff = Max-Min;% third plane of HMMD
hsd (:,:,1) = hue;
hsd (:,:,2) = summ;
hsd (:,:,3) = diff;