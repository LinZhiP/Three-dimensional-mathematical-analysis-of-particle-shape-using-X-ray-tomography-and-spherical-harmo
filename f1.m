
function [aj,bj]=f1(j,boundary,centroid)
R=zeros(length(boundary(:,1)),2);
count=0;
for i=1:10:length(boundary(:,1))%bwboundaries产生的B第一列是Y第二列是X centroid 1是质心x 2是y
    count=count+1;
    R(count,1)=atan((boundary(count,1)-centroid(2))/(boundary(count,2)-centroid(1)));%theta与x轴的夹角
    if boundary(count,1)<centroid(2)&&boundary(count,2)>centroid(1)%一
        R(count,1)=-R(count,1);
    end
     if boundary(count,1)<=centroid(2)&&boundary(count,2)<centroid(1)%二
             R(count,1)=pi-R(count,1);
     end 
    if boundary(count,1)>centroid(2)&&boundary(count,2)<=centroid(1)%三
            R(count,1)=pi-R(count,1);
            end
   if boundary(count,1)>=centroid(2)&&boundary(count,2)>centroid(1)%四象限
        R(count,1)=2*pi-R(count,1);
        end
    R(count,2)=sqrt((boundary(count,2)-centroid(1))^2+(boundary(count,1)-centroid(2))^2);%Rn到质心的距离
    ainted(count)=R(count,2)*cos(j*R(count,1));
    binted(count)=R(count,2)*sin(j*R(count,1));
end
aj=sum(ainted)/(2*pi);
bj=sum(binted)/(2*pi);
% aj=trapz(R(1:10:length(boundary(:,1)),1),ainted(:)')/(2*pi);%数值积分
% bj=trapz(R(1:10:length(boundary(:,1)),1),binted(:)')/(2*pi);
% clear aj bj count
% count=0;
% for j=1:40
% count=count+1;
% [aj(count),bj(count)]=f1(j,boundary,centroid);
% end
% figure,plot(1:count,aj,'r-.',1:count,bj,'b-');
