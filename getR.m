function [R]=getR(boundary,centroid)
%R 2距离
%R 1角度
R=zeros(ceil(length(boundary(:,1))/1),2);
% count=0;
for count=1:1:length(boundary(:,1))%bwboundaries产生的B第一列是Y第二列是X centroid 1是质心x 2是y 可以修改抽样间隔
%     count=count+1;
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
end
[m,n]=size(R);
m_cal=[];
mm=1;
for i=1:m
    if sum(R(i,:))==0
        m_cal(mm)=i;
        mm=mm+1;
    end
end
R(m_cal,:)=[];
R=sortrows(R,1);
