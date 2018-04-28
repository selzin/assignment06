
%read the image into work space
image0 = imread('road_0.png');
image1 = imread('road_1.png');

%%
% perform the quatree decomposition
S = qtdecomp(image0,.2);%For the first image
block0 = repmat(uint8(0),size(S));

for dim = [256 128 64 32 16 8 4 2 1]  
  numblocks = length(find(S==dim));    
  if (numblocks > 0)        
    values = repmat(uint8(1),[dim dim numblocks]);
    values(2:dim,2:dim,:) = 0;
    block0 = qtsetblk(block0,S,dim,values);
  end
end

block0(end,1:end) = 1;
block0(1:end,end) = 1;

imshow(image0)

figure,imshow(block0,[])
title("Block Image for road0.png");

%%
% perform the quatree decomposition
S = qtdecomp(image1,.2);%for second image
block1 = repmat(uint8(0),size(S));

for dim = [256 128 64 32 16 8 4 2 1]  
  numblocks = length(find(S==dim));    
  if (numblocks > 0)        
    values = repmat(uint8(1),[dim dim numblocks]);
    values(2:dim,2:dim,:) = 0;
    block1 = qtsetblk(block1,S,dim,values);
  end
end

block1(end,1:end) = 1;
block1(1:end,end) = 1;

imshow(image1)

figure,imshow(block1,[]);
title("Block image for road1.png");

%%
%differences between two images

diffImage = abs(double(block0) - double(block1));
figure, imshow(diffImage,[]);
title("Image for block difference");


