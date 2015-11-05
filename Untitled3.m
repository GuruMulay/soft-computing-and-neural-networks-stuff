clc;
clear all;
close all;

input=[0 0;0 1;1 0;1 1];
wt=[0.2 0.3];
trgt=[0 0 0 1];
n=0.1;
b=0.1;
epochs=2;

for i=1:epochs
    for j=1:4
         a=hardlim(input(j,:)*wt'+b);
         err=trgt(j)-a;
         wt=wt+n*err*input(j,:);
         b=b+n*err;
    end;
end;
         

for i=1:4
    op(i)=hardlim(input(i,:)*wt'+b);
end
display('input    output');
display([input op']);
