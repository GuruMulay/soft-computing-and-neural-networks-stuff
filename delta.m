clc;
clear all;
close all;

n=0.1;
x=[1 -2 0 -1;0 1.5 -0.5 -1;-1 1 0.5 -1];
wt=[1 -1 0 0.5];
t=[-1 -1  1];
epoch=1;
while(epoch<100000)
 for i=1:3
   net(i)=wt*x(i,:)';
   fo(i)=(2/(1+exp(-1*net(i))))-1;
   fod(i)=0.5*(1+fo(i))*(1-fo(i));
   dw=n*(t(i)-fo(i))*fod(i)*x(i,:);
   wt=wt+dw;
 end;
 epoch=epoch+1;
end;
fo

for i=1:3
    net(i)=wt*x(i,:)';
    op(i)=(2/(1+exp(-1*net(i))))-1;
    if(op(i)<0)
        op(i)=-1;
    else
        op(i)=1;
    end;
end;
op
    
