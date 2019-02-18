function [R,A]=f2(j,boundary,centroid)
%funtion is acculate the area and recreate the new object surface 
%j is the value use in the Fourier analysis
count=0;
for jj=0:j
count=count+1;
[aj(count),bj(count)]=f1(jj,boundary,centroid);%get aj and bj of object
end
A=f3(aj,bj);%acculate area

%recreate
Ror=getR(boundary,centroid);%Raw data is used compare
R=zeros(length(Ror),2);%recreate length from center of mass
    for count=1:length(Ror)
R(count,1)=Ror(count,1);
%          for jj=0:j
%  Rn(count,jj+1)=aj(jj+1)*cos((jj)*Ror(count,1))+bj(jj+1)*sin((jj)*Ror(count,1));
%          end
%          R(count,2)=sum(Rn(count,:));
        for jj=0:j
R(count,2)=aj(jj+1)*cos((jj)*Ror(count,1))+bj(jj+1)*sin((jj)*Ror(count,1))+R(count,2);
if abs(R(count,2)-Ror(count,2))<0.09
    break;
end
        end
    end%R is a matrix which recreate from Gaussian quadrature
    a=1;
%     
% clear A R1 R%²âÊÔ³ÌÐòÏÔÊ¾Fig4 5
% for j=1:12
% [R1,A(j+1)]=f2(j,boundary,centroid);
% R=getR(boundary,centroid);
% t=[ceil(R1(:,2).*sin(R1(:,1))+centroid(1)) ceil(R1(:,2).*cos(R1(:,1))+centroid(2))];
% figure,
% plot(centroid(1)+R1(:,2).*sin(R1(:,1)),centroid(2)+R1(:,2).*cos(R1(:,1)),'k.');
% end
% % figure,plot([1:12],A(2:13));
% figure,plot([1:12],A(2:13),'r-',[1:12],area.*ones(1,12))
% for k = 1:length(B)
% boundary = B{k};
% plot(flipud(boundary(:,2)), centroid(2)-flipud(boundary(:,1)), 'k', 'LineWidth', 2)
% end
% hold on
% plot(R(1:2:1058,2).*cos(R(1:2:1058,1))+centroid(1),R(1:2:1058,2).*sin(R(1:2:1058,1)),'b*');
% plot(R1(1:2:1058,2).*cos(R1(1:2:1058,1))+centroid(1),R1(1:2:1058,2).*sin(R1(1:2:1058,1)),'ro');
% hold off