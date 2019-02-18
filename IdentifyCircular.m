clear all
clc
RGB = imread('DP-2.tif');
%  RGB=rgb2gray(RGB);
% RGB=imresize(RGB,0.25,'bilinear');
figure,imshow(RGB);
bw = imbinarize(RGB);
figure,imshow(bw);
% remove all object containing fewer than 30 pixels
bw = bwareaopen(bw,30);%目标图像黑色取反

% fill a gap in the pen's cap
se = strel('disk',2);
bw = imclose(bw,se);
figure,
% fill any holes, so that regionprops can be used to estimate
% the area enclosed by each of the boundaries
bw = imfill(bw,'holes');

imshow(bw);
[B,L] = bwboundaries(bw,'noholes');

% Display the label matrix and draw each boundary
imshow(label2rgb(L, @jet, [.5 .5 .5]))
hold on
for k = 1:length(B)
  boundary = B{k};
  plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end
stats = regionprops(L,'Area','Centroid');

threshold = 0.40;

% loop over the boundaries
for k = 1:length(B)

  % obtain (X,Y) boundary coordinates corresponding to label 'k'
  boundary = B{k};

  % compute a simple estimate of the object's perimeter
  delta_sq = diff(boundary).^2;    
  perimeter = sum(sqrt(sum(delta_sq,2)));
  
  % obtain the area calculation corresponding to label 'k'
  area = stats(k).Area;
  
  % compute the roundness metric
  metric = 4*pi*area/perimeter^2;
  
  % display the results
  metric_string = sprintf('%2.2f',metric);

  % mark objects above the threshold with a black circle
  if metric > threshold
    centroid = stats(k).Centroid;
    plot(centroid(1),centroid(2),'ko',boundary(43,2), boundary(34,1), 'ro');
  end
  
  text(boundary(1,2)-35,boundary(1,1)+13,metric_string,'Color','y',...
       'FontSize',14,'FontWeight','bold');
  
end

title(['Metrics closer to 1 indicate that ',...
       'the object is approximately round']);
   
 clear aj bj count%测试程序显示fig3
count=0;
for j=1:40
count=count+1;
[aj(count),bj(count)]=f1(j,boundary,centroid);
end
figure,plot(1:count,aj,'r-.',1:count,bj,'b-');
clear A R1 R%测试程序显示Fig4 5
for j=1:12%j=70:80 perfect
[R1,A(j+1)]=f2(j,boundary,centroid);
R=getR(boundary,centroid);
t=[ceil(R1(:,2).*sin(R1(:,1))+centroid(1)) ceil(R1(:,2).*cos(R1(:,1))+centroid(2))];
figure,
plot(centroid(1)+R1(:,2).*sin(R1(:,1)),centroid(2)+R1(:,2).*cos(R1(:,1)),'k.');
end
figure,plot([1:12],A(2:13),'r-',[1:12],area.*ones(1,12))