clc;
clear all;

ip=input('ip');
t=input('target');
w=[0 0 0];                  %3rd entry is bias
[m n]=size(ip);

for i=1:m
    dw1(i)=ip(i,1)*t(i);
    dw2(i)=ip(i,2)*t(i);
    db(i)=t(i);
end

dw=[dw1' dw2' db'];
for i=1:4
    w(i+1,:)=w(i,:)+dw(i,:);
end
w

I=input('test');
for i=1:4
    O=(w(5,1:2)*I'+w(5,3));
    if O>=0
        O=1;
    else
        O=-1;
    end
end
O
