
function [aj,bj]=f1(j,boundary,centroid)
R=zeros(length(boundary(:,1)),2);
count=0;
for i=1:10:length(boundary(:,1))%bwboundaries������B��һ����Y�ڶ�����X centroid 1������x 2��y
    count=count+1;
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
    ainted(count)=R(count,2)*cos(j*R(count,1));
    binted(count)=R(count,2)*sin(j*R(count,1));
end
aj=sum(ainted)/(2*pi);
bj=sum(binted)/(2*pi);
% aj=trapz(R(1:10:length(boundary(:,1)),1),ainted(:)')/(2*pi);%��ֵ����
% bj=trapz(R(1:10:length(boundary(:,1)),1),binted(:)')/(2*pi);
% clear aj bj count
% count=0;
% for j=1:40
% count=count+1;
% [aj(count),bj(count)]=f1(j,boundary,centroid);
% end
% figure,plot(1:count,aj,'r-.',1:count,bj,'b-');
