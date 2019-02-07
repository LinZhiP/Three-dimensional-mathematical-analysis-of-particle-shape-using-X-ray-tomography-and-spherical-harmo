function [R,A]=f2(j,boundary,centroid)%用f1 中R角度做重建中的theta
count=0;
for jj=0:j
count=count+1;
[aj(count),bj(count)]=f1(jj,boundary,centroid);
end
A=f3(aj,bj);%计算面积

%重建
Ror=getR(boundary,centroid);
R=zeros(length(Ror),2);
    for count=1:length(Ror)
R(count,1)=Ror(count,1);
        for jj=0:j
R(count,2)=aj(jj+1)*cos((jj)*Ror(count,1))+bj(jj+1)*sin((jj)*Ror(count,1))+R(count,2);
        end
    end
    
    
% clear A R1 R
% for j=1:12
% [R1,A(j+1)]=f2(j,boundary,centroid);
% R=getR(boundary,centroid);
% t=[ R1(:,2).*sin(R1(:,1)) R1(:,2).*cos(R1(:,1))];
% figure,
% plot(R1(:,2).*sin(R(:,1))+centroid(1),R1(:,2).*cos(R(:,1))+centroid(2),'k.');
% end
% figure,plot([1:12],A(2:13));