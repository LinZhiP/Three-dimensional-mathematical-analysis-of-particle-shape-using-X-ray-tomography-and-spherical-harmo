function A=f3(aj,bj)
len=length(aj);
A=pi*aj(1)+pi/2*sum(aj(2:len).^2+bj(2:len).^2);