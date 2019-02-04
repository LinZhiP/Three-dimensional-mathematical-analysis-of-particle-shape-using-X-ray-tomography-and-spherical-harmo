function [R,A]=f2(j,boundary,centroid)%用f1 中R角度做重建中的theta
count=0;
for jj=0:j
count=count+1;
[aj(count),bj(count)]=f1(jj,boundary,centroid);
end
A=f3(aj,bj);%计算面积
R=zeros(length(0:0.001:2*pi),2);
count=0;%重建
    for theta=0:0.001:2*pi
        count=count+1;
R(count,1)=theta;
        for jj=1:j+1
R(count,2)=aj(jj)*cos((jj-1)*theta)+bj(jj)*sin((jj-1)*theta)+R(count,2);
        end
    end
    
%     for j=1
% [R,A(j+1)]=f2(j,boundary,centroid);
% t=[ R(:,2).*sin(R(:,1)) R(:,2).*cos(R(:,1))];
% figure,
% plot(R(:,2).*cos(R(:,1))+centroid(1),R(:,2).*sin(R(:,1))+centroid(2),'k.');
% end