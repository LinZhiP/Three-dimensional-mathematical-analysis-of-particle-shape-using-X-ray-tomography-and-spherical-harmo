function [R]=getR(boundary,centroid)
%R 2����
%R 1�Ƕ�
R=zeros(ceil(length(boundary(:,1))/1),2);
% count=0;
for count=1:1:length(boundary(:,1))%bwboundaries������B��һ����Y�ڶ�����X centroid 1������x 2��y �����޸ĳ������
%     count=count+1;
    R(count,1)=atan((boundary(count,1)-centroid(2))/(boundary(count,2)-centroid(1)));%theta��x��ļн�
    if boundary(count,1)<centroid(2)&&boundary(count,2)>centroid(1)%һ
        R(count,1)=-R(count,1);
    end
     if boundary(count,1)<=centroid(2)&&boundary(count,2)<centroid(1)%��
             R(count,1)=pi-R(count,1);
     end 
    if boundary(count,1)>centroid(2)&&boundary(count,2)<=centroid(1)%��
            R(count,1)=pi-R(count,1);
            end
   if boundary(count,1)>=centroid(2)&&boundary(count,2)>centroid(1)%������
        R(count,1)=2*pi-R(count,1);
        end
    R(count,2)=sqrt((boundary(count,2)-centroid(1))^2+(boundary(count,1)-centroid(2))^2);%Rn�����ĵľ���
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
