function A=f3(aj,bj)
%function is acculate the area of the recreate area
len=length(aj);
A=pi*aj(1).^2+pi/2*sum(aj(2:len).^2+bj(2:len).^2);