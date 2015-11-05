clear all;
close all;
clc;

x=[0 0;0 1;1 0;1 1];
tar=[0 0 0 1];
wt=[0 0];
eta=0.15;
epoch=1;
bias=0;
k=1;
mse=1;

while(mse>0.01 && epoch<100)
    for i=1:4
        sum=wt * x(i,:)' + bias;
        e=tar(i)-sum;
        wt= wt + (eta*e*x(i,:));
        bias= bias + (eta*e);
        mse=mse+(e^2);
    end
        mse=mse/4;
        m(k)=mse;
        k=k+1;
        epoch=epoch+1;
end
plot(m);
xlabel('epoch');
ylabel('mse');
title('mse vs epoch');

for i=1:4
    out(i)=wt * x(i,:)'+ bias;
    if out(i)<=0.5 
      out(i)=0;
   else
       out(i)=1;
    end
end
fprintf('Output is:');
disp(out);