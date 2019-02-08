
function [aj,bj]=f1(j,boundary,centroid)
    R=getR(boundary,centroid);

    ainted(:)=R(:,2).*cos(j*R(:,1));
    binted(:)=R(:,2).*sin(j*R(:,1));
% aj=sum(ainted)/(2*pi);
% bj=sum(binted)/(2*pi);
aj=trapz(R(1:length(R),1),ainted(:)')/(2*pi);%数值积分
bj=trapz(R(1:length(R),1),binted(:)')/(2*pi);
% clear aj bj count%测试程序显示fig3
% count=0;
% for j=1:40
% count=count+1;
% [aj(count),bj(count)]=f1(j,boundary,centroid);
% end
% figure,plot(1:count,aj,'r-.',1:count,bj,'b-');
