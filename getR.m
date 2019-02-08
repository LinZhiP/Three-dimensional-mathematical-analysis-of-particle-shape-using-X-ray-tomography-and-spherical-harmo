function [R]=getR(boundary,centroid)
%function R(¦È)={(¦Èn,Rn)} is the length from the center of mass to the
%surface at an angle ¦È£¬Rn is the length of these line segments
%getR first coefficients is theta second is length from the mass centroid
%output R is a n*2 matix which is numerically surface
R=zeros(ceil(length(boundary(:,1))/1),2);
% count=0;
for count=1:1:length(boundary(:,1))
    %boundaries first col is Y second is X centroid first col is X second is  X .
    %we can chang the second coefficient of loop to sample the surface.
%     count=count+1;
    R(count,1)=atan((boundary(count,1)-centroid(2))/(boundary(count,2)-centroid(1)));
    %computed theta is measured counterclockwise from the x-axis.
    if boundary(count,1)<centroid(2)&&boundary(count,2)>centroid(1)%First quadrant
        R(count,1)=-R(count,1);
    end
     if boundary(count,1)<=centroid(2)&&boundary(count,2)<centroid(1)%Second quadrant
             R(count,1)=pi-R(count,1);
     end 
    if boundary(count,1)>centroid(2)&&boundary(count,2)<=centroid(1)%Thrid quadrant
            R(count,1)=pi-R(count,1);
            end
   if boundary(count,1)>=centroid(2)&&boundary(count,2)>centroid(1)%Fourth quadrant
        R(count,1)=2*pi-R(count,1);
        end
    R(count,2)=sqrt((boundary(count,2)-centroid(1))^2+(boundary(count,1)-centroid(2))^2);%Rn length from the center of mass 
end
[m,n]=size(R);%when use sampling need delete zero in the R matrix
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
