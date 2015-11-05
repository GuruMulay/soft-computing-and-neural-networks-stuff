clc;
clear all;

ip=input('input matrix');
theta=2;

disp('GATES');
disp('1.AND');
disp('2.OR');
disp('3.NAND');
disp('4.NOR');
ch=input('choice');

switch ch
    case 1
        disp('AND');
        W=[1 1];
        B=0;
    case 2
        disp('OR');
        W=[1 1];
        B=1;
    case 3
        disp('NAND');
        W=[-1 -1];
        B=3;
    case 4
        disp('NOR');
        W=[-1 -1];
        B=2;
        
end

net=ip*W'+B;

for i= 1:size(net,1)
    if (net(i)>=theta)
        op(i)=1;
    else
        op(i)=0;
    end
end

disp('ip   op');
disp([ip op']);